#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
#REMOVEME? pkg_dependencies="acl build-essential libcairo2 libjpeg62-turbo-dev libpng-dev libtool-bin libossp-uuid-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev freerdp2-dev libpango1.0-dev libssh2-1-dev libtelnet-dev libvncserver-dev libwebsockets-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev tomcat9"

#=================================================
# PERSONAL HELPERS
#=================================================

function setup_sources {
	guacamole_verson="1.5.1"

	ynh_setup_source --source_id="server" --dest_dir="$install_dir/.guacd-src"

	tomcat_guac_dir="$path"
	if [ "$path" == "/" -o -z "$path" ]; then
		tomcat_guac_dir="ROOT"
	fi

	ynh_setup_source --source_id="client" --dest_dir="$install_dir/var/lib/tomcat9/webapps/$tomcat_guac_dir"

	ynh_setup_source --source_id="auth-ldap" --dest_dir="$install_dir/etc/guacamole/extensions/ldap"
	mv "$install_dir/etc/guacamole/extensions/ldap/guacamole-auth-ldap-$guacamole_verson.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-ldap.jar"
#REMOVEME? 	ynh_secure_remove --file="$install_dir/etc/guacamole/extensions/ldap"

	ynh_setup_source --source_id="auth-header" --dest_dir="$install_dir/etc/guacamole/extensions/header"
	mv "$install_dir/etc/guacamole/extensions/header/guacamole-auth-header-$guacamole_verson.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-header.jar"
#REMOVEME? 	ynh_secure_remove --file="$install_dir/etc/guacamole/extensions/header"

	ynh_setup_source --source_id="auth-jdbc" --dest_dir="$install_dir/etc/guacamole/extensions/jdbc"
	mv "$install_dir/etc/guacamole/extensions/jdbc/mysql/guacamole-auth-jdbc-mysql-$guacamole_verson.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-jdbc-mysql.jar"
	mv "$install_dir/etc/guacamole/extensions/jdbc/mysql/schema" "$install_dir/etc/guacamole/extensions/mysql-schema"
#REMOVEME? 	ynh_secure_remove --file="$install_dir/etc/guacamole/extensions/jdbc"

	ynh_setup_source --source_id="mariadb-java-client" --dest_dir="$install_dir/etc/guacamole/lib/"

	ynh_setup_source --source_id="tomcat9_deb" --dest_dir="$install_dir/"

	pushd "$install_dir" || ynh_die
	ar x "$install_dir/tomcat9.deb" "data.tar.xz"
	popd || ynh_die

#REMOVEME? 	ynh_secure_remove --file="$install_dir/tomcat9.deb"
	mkdir -p "$install_dir/tomcat9-data"
	tar -C "$install_dir/tomcat9-data" -xJf "$install_dir/data.tar.xz"
	cp -r "$install_dir/tomcat9-data/usr/share/tomcat9/etc" -T "$install_dir/etc/tomcat9/"
	cp -r "$install_dir/tomcat9-data/etc/tomcat9/" -T "$install_dir/etc/tomcat9/"
#REMOVEME? 	ynh_secure_remove --file="$install_dir/data.tar.xz"
#REMOVEME? 	ynh_secure_remove --file="$install_dir/tomcat9-data"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
