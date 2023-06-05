#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================

function setup_sources {
	guacamole_version="1.5.2"

	ynh_setup_source --source_id="server" --dest_dir="$install_dir/.guacd-src"

	tomcat_guac_dir="$path"
	if [ "$path" == "/" -o -z "$path" ]; then
		tomcat_guac_dir="ROOT"
	fi

	ynh_setup_source --source_id="client" --dest_dir="$install_dir/var/lib/tomcat9/webapps/$tomcat_guac_dir"

	ynh_setup_source --source_id="auth-ldap" --dest_dir="$install_dir/etc/guacamole/extensions/ldap"
	mv "$install_dir/etc/guacamole/extensions/ldap/guacamole-auth-ldap-$guacamole_version.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-ldap.jar"
	ynh_secure_remove --file="$install_dir/etc/guacamole/extensions/ldap"

	ynh_setup_source --source_id="auth-header" --dest_dir="$install_dir/etc/guacamole/extensions/header"
	mv "$install_dir/etc/guacamole/extensions/header/guacamole-auth-header-$guacamole_version.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-header.jar"
	ynh_secure_remove --file="$install_dir/etc/guacamole/extensions/header"

	ynh_setup_source --source_id="auth-jdbc" --dest_dir="$install_dir/etc/guacamole/extensions/jdbc"
	mv "$install_dir/etc/guacamole/extensions/jdbc/mysql/guacamole-auth-jdbc-mysql-$guacamole_version.jar" "$install_dir/etc/guacamole/extensions/guacamole-auth-jdbc-mysql.jar"
	mv "$install_dir/etc/guacamole/extensions/jdbc/mysql/schema" "$install_dir/etc/guacamole/extensions/mysql-schema"
	ynh_secure_remove --file="$install_dir/etc/guacamole/extensions/jdbc"

	ynh_setup_source --source_id="mariadb-java-client" --dest_dir="$install_dir/etc/guacamole/lib/"

	ynh_setup_source --source_id="tomcat9_deb" --dest_dir="$install_dir/"

	pushd "$install_dir" || ynh_die
	ar x "$install_dir/tomcat9.deb" "data.tar.xz"
	popd || ynh_die

	ynh_secure_remove --file="$install_dir/tomcat9.deb"
	mkdir -p "$install_dir/tomcat9-data"
	tar -C "$install_dir/tomcat9-data" -xJf "$install_dir/data.tar.xz"
	cp -r "$install_dir/tomcat9-data/usr/share/tomcat9/etc" -T "$install_dir/etc/tomcat9/"
	cp -r "$install_dir/tomcat9-data/etc/tomcat9/" -T "$install_dir/etc/tomcat9/"
	ynh_secure_remove --file="$install_dir/data.tar.xz"
	ynh_secure_remove --file="$install_dir/tomcat9-data"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
