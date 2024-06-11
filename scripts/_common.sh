#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

guacamole_version="1.5.4"

if [ "$debian_maj_version" -eq 11 ] ; then
    tomcat_version="tomcat9"
elif [ "$debian_maj_version" -eq 12 ] ; then
    tomcat_version="tomcat10"
fi

#=================================================
# PERSONAL HELPERS
#=================================================

function setup_sources {
	ynh_setup_source --source_id="server" --dest_dir="$install_dir/.guacd-src"

	tomcat_guac_dir="$path"
	if [ "$path" == "/" -o -z "$path" ]; then
		tomcat_guac_dir="ROOT"
	fi

	ynh_setup_source --source_id="$tomcat_version_deb" --dest_dir="$install_dir/downloads/$tomcat_version"
	pushd "$install_dir/downloads/$tomcat_version" || ynh_die
		ar x "$tomcat_version.deb" "data.tar.xz"
		tar xJf data.tar.xz
	popd || ynh_die
	mkdir -p "$install_dir/etc"
	cp -r "$install_dir/downloads/$tomcat_version/usr/share/$tomcat_version/etc" -T "$install_dir/etc/$tomcat_version/"
	cp -r "$install_dir/downloads/$tomcat_version/etc/$tomcat_version/" -T "$install_dir/etc/$tomcat_version/"

	ynh_setup_source --source_id="client" --dest_dir="$install_dir/downloads"
	mkdir -p "$install_dir/var/lib/$tomcat_version/webapps"
	mv "$install_dir/downloads/guacamole.war" "$install_dir/var/lib/$tomcat_version/webapps/$tomcat_guac_dir.war"

	mkdir -p "$install_dir/etc/guacamole/extensions"

	ynh_setup_source --source_id="auth-ldap" --dest_dir="$install_dir/downloads/auth-ldap"
	mv "$install_dir/downloads/auth-ldap/guacamole-auth-ldap-$guacamole_version.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-ldap.jar"

	ynh_setup_source --source_id="auth-header" --dest_dir="$install_dir/downloads/auth-header"
	mv "$install_dir/downloads/auth-header/guacamole-auth-header-$guacamole_version.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-header.jar"

	ynh_setup_source --source_id="auth-jdbc" --dest_dir="$install_dir/downloads/auth-jdbc"
	mv "$install_dir/downloads/auth-jdbc/mysql/guacamole-auth-jdbc-mysql-$guacamole_version.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-jdbc-mysql.jar"
	mv "$install_dir/downloads/auth-jdbc/mysql/schema" "$install_dir/etc/guacamole/extensions/mysql-schema"

	ynh_setup_source --source_id="mariadb-java-client" --dest_dir="$install_dir/etc/guacamole/lib/"

	ynh_secure_remove --file="$install_dir/downloads/"
}

function _set_permissions() {
	# Set permissions  to app files
	chown -R "$app:$app" "$install_dir"
	chmod -R g+rwX,o-rwx "$install_dir"
	setfacl -n -R -m "user:$app-guacd:rx" -m "default:user:$app-guacd:rx" "$install_dir"
	setfacl -n -R -m "user:$app-tomcat:rx" -m "default:user:$app-tomcat:rx" "$install_dir"

	# chown -R nobody:$app-tomcat "$install_dir/etc/$tomcat_version/" "$install_dir/etc/guacamole/"
	chown -R "$app-tomcat":"$app-tomcat" "$install_dir/var/lib/$tomcat_version/webapps"
	setfacl -n -R -m "user:$app-guacd:-" -m "default:user:$app-guacd:-" \
		"$install_dir/var/lib/$tomcat_version/" "$install_dir/etc/guacamole/" "$install_dir/etc/$tomcat_version/"

	chown -R "$app-guacd:$app-guacd" "/var/log/$app/guacd/"
	chown -R "$app-tomcat:$app-tomcat" "/var/log/$app/tomcat/"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
