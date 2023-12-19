#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="acl build-essential libcairo2 libjpeg62-turbo-dev libpng-dev libtool-bin libossp-uuid-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev freerdp2-dev libpango1.0-dev libssh2-1-dev libtelnet-dev libvncserver-dev libwebsockets-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev tomcat9"

#=================================================
# PERSONAL HELPERS
#=================================================

function setup_sources {
	guacamole_version="1.5.4"

	ynh_setup_source --source_id="server" --dest_dir="$final_path/.guacd-src"

	tomcat_guac_dir="$path_url"
	if [ "$path_url" == "/" -o -z "$path_url" ]; then
		tomcat_guac_dir="ROOT"
	fi

	ynh_setup_source --source_id="client" --dest_dir="$final_path/var/lib/tomcat9/webapps/$tomcat_guac_dir"

	ynh_setup_source --source_id="auth-ldap" --dest_dir="$final_path/etc/guacamole/extensions/ldap"
	mv "$final_path/etc/guacamole/extensions/ldap/guacamole-auth-ldap-$guacamole_version.jar" "$final_path/etc/guacamole/extensions/guacamole-auth-ldap.jar"
	ynh_secure_remove --file="$final_path/etc/guacamole/extensions/ldap"

	ynh_setup_source --source_id="auth-header" --dest_dir="$final_path/etc/guacamole/extensions/header"
	mv "$final_path/etc/guacamole/extensions/header/guacamole-auth-header-$guacamole_version.jar" "$final_path/etc/guacamole/extensions/guacamole-auth-header.jar"
	ynh_secure_remove --file="$final_path/etc/guacamole/extensions/header"

	ynh_setup_source --source_id="auth-jdbc" --dest_dir="$final_path/etc/guacamole/extensions/jdbc"
	mv "$final_path/etc/guacamole/extensions/jdbc/mysql/guacamole-auth-jdbc-mysql-$guacamole_version.jar" "$final_path/etc/guacamole/extensions/guacamole-auth-jdbc-mysql.jar"
	mv "$final_path/etc/guacamole/extensions/jdbc/mysql/schema" "$final_path/etc/guacamole/extensions/mysql-schema"
	ynh_secure_remove --file="$final_path/etc/guacamole/extensions/jdbc"

	ynh_setup_source --source_id="mariadb-java-client" --dest_dir="$final_path/etc/guacamole/lib/"

	ynh_setup_source --source_id="tomcat9_deb" --dest_dir="$final_path/"

	pushd "$final_path" || ynh_die
	ar x "$final_path/tomcat9.deb" "data.tar.xz"
	popd || ynh_die

	ynh_secure_remove --file="$final_path/tomcat9.deb"
	mkdir -p "$final_path/tomcat9-data"
	tar -C "$final_path/tomcat9-data" -xJf "$final_path/data.tar.xz"
	cp -r "$final_path/tomcat9-data/usr/share/tomcat9/etc" -T "$final_path/etc/tomcat9/"
	cp -r "$final_path/tomcat9-data/etc/tomcat9/" -T "$final_path/etc/tomcat9/"
	ynh_secure_remove --file="$final_path/data.tar.xz"
	ynh_secure_remove --file="$final_path/tomcat9-data"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
