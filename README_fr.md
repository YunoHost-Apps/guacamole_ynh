# Apache Guacamole pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/guacamole.svg)](https://dash.yunohost.org/appci/app/guacamole) ![](https://ci-apps.yunohost.org/ci/badges/guacamole.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/guacamole.maintain.svg)  
[![Installer guacamole avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=guacamole)

*[Read this readme in english.](./README.md)* 

> *Ce package vous permet d'installer guacamole rapidement et simplement sur un serveur YunoHost.  
Si vous n'avez pas YunoHost, consultez [le guide](https://yunohost.org/#/install) pour apprendre comment l'installer.*

## Vue d'ensemble
Apache Guacamole est un service de bureau à distance sans client. Vous pouvez l'ulitiser pour accéder à votre serveur, ou d'autres machines, via des protocoles comme VNC, RDP, SSH, et SFTP. Apache Guacamole fonctionne avec plusierus utilisateurs, et vous pouvez choisir quels utilisateurs peuvent accéder à quelles connections.

**Version incluse :** 1.3.0

## Captures d'écran

![](https://guacamole.apache.org/images/demo-thumbnail.jpg)

## Configuration

L'utilisateur choisi come admin durant le processus d'installation aura accès au paramétres d'administration dans le menu de configuration de l'application (sous le menu utilisateur). Le ficiers de configuration sont dans `/opt/yunohost/guacamole/etc/guacamole` (pour la première installation).

## Documentation

 * Documentation officielle : https://guacamole.apache.org/doc/gug/

#### Support multi-utilisateur

* L'authentification LDAP et HTTP est-elle prise en charge ? **Oui**
* L'application peut-elle être utilisée par plusieurs utilisateurs ? **Oui**

#### Architectures supportées

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/guacamole%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/guacamole/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/guacamole%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/guacamole/)


## Liens

 * Signaler un bug : https://github.com/YunoHost-Apps/guacamole_ynh/issues
 * Site de l'application : Lien vers le site officiel de cette application.
 * Dépôt de l'application principale : Lien vers le dépôt officiel de l'application principale.
 * Site web YunoHost : https://yunohost.org/

---

## Informations pour les développeurs

**Seulement si vous voulez utiliser une branche de test pour le codage, au lieu de fusionner directement dans la banche principale.**
Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/guacamole_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/guacamole_ynh/tree/testing --debug
ou
sudo yunohost app upgrade guacamole -u https://github.com/YunoHost-Apps/guacamole_ynh/tree/testing --debug
```
