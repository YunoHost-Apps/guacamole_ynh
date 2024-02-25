#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

guacamole_version="1.5.4"

#=================================================
# PERSONAL HELPERS
#=================================================

function setup_sources {
	ynh_setup_source --source_id="server" --dest_dir="$install_dir/.guacd-src"

	tomcat_guac_dir="$path"
	if [ "$path" == "/" -o -z "$path" ]; then
		tomcat_guac_dir="ROOT"
	fi

	ynh_setup_source --source_id="client" --dest_dir="$install_dir/downloads"
	ynh_exec_warn ls -lah "$install_dir/var/lib/tomcat9"
	mv "$install_dir/downloads/guacamole.war" "$install_dir/var/lib/tomcat9/webapps/$tomcat_guac_dir.war"

	mkdir -p "$install_dir/etc/guacamole/extensions"

	ynh_setup_source --source_id="auth-ldap" --dest_dir="$install_dir/downloads/auth-ldap"
	mv "$install_dir/downloads/auth-ldap/guacamole-auth-ldap-$guacamole_version.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-ldap.jar"

	ynh_setup_source --source_id="auth-header" --dest_dir="$install_dir/downloads/auth-header"
	mv "$install_dir/downloads/auth-header/guacamole-auth-header-$guacamole_version.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-header.jar"

	ynh_setup_source --source_id="auth-jdbc" --dest_dir="$install_dir/downloads/auth-jdbc"
	mv "$install_dir/downloads/auth-jdbc/mysql/guacamole-auth-jdbc-mysql-$guacamole_version.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-jdbc-mysql.jar"
	mv "$install_dir/downloads/auth-jdbc/mysql/schema" "$install_dir/etc/guacamole/extensions/mysql-schema"

	ynh_setup_source --source_id="mariadb-java-client" --dest_dir="$install_dir/etc/guacamole/lib/"

	ynh_setup_source --source_id="tomcat9_deb" --dest_dir="$install_dir/downloads/tomcat9"
	pushd "$install_dir/downloads/tomcat9" || ynh_die
		ar x "tomcat9.deb" "data.tar.xz"
		tar xJf data.tar.xz
	popd || ynh_die
	cp -r "$install_dir/downloads/tomcat9/usr/share/tomcat9/etc" -T "$install_dir/etc/tomcat9/"
	cp -r "$install_dir/downloads/tomcat9/etc/tomcat9/" -T "$install_dir/etc/tomcat9/"

	ynh_secure_remove --file="$install_dir/downloads/"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
