# Apache Guacamole pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/guacamole.svg)](https://dash.yunohost.org/appci/app/guacamole) ![](https://ci-apps.yunohost.org/ci/badges/guacamole.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/guacamole.maintain.svg)  
[![Installer Apache Guacamole avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=guacamole)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer Apache Guacamole rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

Service de bureau à distance sans client. Fonctionne avec des protocoles standard comme VNC, RDP, et SSH.

**Version incluse :** 1.4.0~ynh1



## Captures d'écran

![](./doc/screenshots/screenshot1.jpg)

## Avertissements / informations importantes

## Configuration

L'utilisateur choisi comme admin durant le processus d'installation aura accès au paramétres d'administration dans le menu de configuration de l'application (sous le menu utilisateur). Le fichiers de configuration sont dans `/opt/yunohost/guacamole/etc/guacamole` (pour la première installation).

## Documentations et ressources

* Site officiel de l'app : https://guacamole.apache.org/
* Documentation officielle de l'admin : https://guacamole.apache.org/doc/gug/
* Dépôt de code officiel de l'app : https://github.com/search?utf8=%E2%9C%93&q=repo%3Aapache%2Fguacamole-server+repo%3Aapache%2Fguacamole-client+repo%3Aapache%2Fguacamole-website&type=Repositories&ref=searchresults
* Documentation YunoHost pour cette app : https://yunohost.org/app_guacamole
* Signaler un bug : https://github.com/YunoHost-Apps/guacamole_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/guacamole_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/guacamole_ynh/tree/testing --debug
ou
sudo yunohost app upgrade guacamole -u https://github.com/YunoHost-Apps/guacamole_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps