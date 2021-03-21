# Apache Guacamole for YunoHost

[![Integration level](https://dash.yunohost.org/integration/guacamole.svg)](https://dash.yunohost.org/appci/app/guacamole) ![](https://ci-apps.yunohost.org/ci/badges/guacamole.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/guacamole.maintain.svg)  
[![Install guacamole with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=guacamole)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install guacamole quickly and simply on a YunoHost server.  
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview
Apache Guacamole is a clientless remote desktop gateway. You can use it to access your server, or other machines, via protocols like VNC, RDP, SSH, and SFTP. It supports multiple users, and you can configure which useres are allowed to access what connections.

**Shipped version:** 1.3.0

## Screenshots

![](https://guacamole.apache.org/images/demo-thumbnail.jpg)

## Configuration

The user that is configured as admin during install will have access to admin settings in the settings menu of the app (under the user menu). Configuration files are in `/opt/yunohost/guacamole/etc/guacamole` (for the first install).
## Documentation

 * Official documentation: https://guacamole.apache.org/doc/gug/

#### Multi-user support

Are LDAP and HTTP auth supported? **Yes**
Can the app be used by multiple users? **Yes**

#### Supported architectures

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/guacamole%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/guacamole/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/guacamole%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/guacamole/)

## Links

 * Report a bug: https://github.com/YunoHost-Apps/guacamole_ynh/issues
 * App website: Link to the official website of this app.
 * Upstream app repository: Link to the official repository of the upstream app.
 * YunoHost website: https://yunohost.org/

---

## Developer info

**Only if you want to use a testing branch for coding, instead of merging directly into master.**
Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/guacamole_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/guacamole_ynh/tree/testing --debug
or
sudo yunohost app upgrade guacamole -u https://github.com/YunoHost-Apps/guacamole_ynh/tree/testing --debug
```
