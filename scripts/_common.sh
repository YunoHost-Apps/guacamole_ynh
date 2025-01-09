#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================
tomcat_version="tomcat9"

install_tomcat() {
    ynh_setup_source --full_replace --source_id="$tomcat_version" --dest_dir="$install_dir/$tomcat_version"
}

_create_home() {
    # Hack because useradd is called without --create-home by helper
    owner=$1
    dir=$2
    if [ ! -d "$dir" ]; then
        mkdir --mode=700 "$dir"
        chown "$owner" "$dir"
    fi
}

tomcat_path_for_path() {
    the_path="$1"
    if [ "$the_path" == "/" ]; then
        echo "ROOT"
    else
        echo "$path"
    fi
}

setup_sources() {
    tomcat_guac_dir="$(tomcat_path_for_path "$path")"

    ynh_setup_source --full_replace --source_id="client" --dest_dir="$install_dir/downloads"
    mv "$install_dir/downloads/guacamole.war" "$install_dir/$tomcat_version/webapps/$tomcat_guac_dir.war"

    mkdir -p "$install_dir/etc/guacamole/extensions"

    guacamole_version="$(ynh_app_upstream_version)"
    ynh_setup_source --full_replace --source_id="auth-ldap" --dest_dir="$install_dir/downloads/auth-ldap"
    mv "$install_dir/downloads/auth-ldap/guacamole-auth-ldap-$guacamole_version.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-ldap.jar"

    ynh_setup_source --full_replace --source_id="auth-header" --dest_dir="$install_dir/downloads/auth-header"
    mv "$install_dir/downloads/auth-header/guacamole-auth-header-$guacamole_version.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-header.jar"

    ynh_setup_source --full_replace --source_id="auth-jdbc" --dest_dir="$install_dir/downloads/auth-jdbc"
    mv "$install_dir/downloads/auth-jdbc/mysql/guacamole-auth-jdbc-mysql-$guacamole_version.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-jdbc-mysql.jar"
    mv "$install_dir/downloads/auth-jdbc/mysql/schema" "$install_dir/etc/guacamole/extensions/mysql-schema"

    ynh_setup_source --full_replace --source_id="mariadb-java-client" --dest_dir="$install_dir/etc/guacamole/lib/"

    ynh_safe_rm "$install_dir/downloads/"
}

build_server() {
    ynh_safe_rm "$install_dir/server"
    ynh_setup_source --full_replace --source_id="server" --dest_dir="$install_dir/server_sources"
    pushd "$install_dir/server_sources"
        LDFLAGS="-lrt" ./configure --enable-allow-freerdp-snapshots \
            --prefix="$install_dir/server" \
            --datadir="$install_dir/server" \
            --with-freerdp-plugin-dir="$install_dir/server/lib/x86_64-linux-gnu/freerdp2"
        ynh_hide_warnings make -j "$(nproc)"
        ynh_hide_warnings make install
    popd
    ynh_safe_rm "$install_dir/server_sources"
}

function _set_permissions() {
    # Set permissions to app files (Services are run as different users)
    chown -R "$app:$app" "$install_dir"
    chmod -R g+rwX,o-rwx "$install_dir"

    # setfacl -n -R -m "user:$app-guacd:rx" -m "default:user:$app-guacd:rx" "$install_dir"
    # setfacl -n -R -m "user:$app-tomcat:rx" -m "default:user:$app-tomcat:rx" "$install_dir"

    # chown -R nobody:$app-tomcat "$install_dir/etc/$tomcat_version/" "$install_dir/etc/guacamole/"
    # chown -R "$app-tomcat:$app-tomcat" "$install_dir/$tomcat_version/webapps"
    # setfacl -n -R -m "user:$app-guacd:-" -m "default:user:$app-guacd:-" \
        # "$install_dir/$tomcat_version/" "$install_dir/etc/guacamole/"
}
