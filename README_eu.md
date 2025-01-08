<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# Guacamole YunoHost-erako

[![Integrazio maila](https://apps.yunohost.org/badge/integration/guacamole)](https://ci-apps.yunohost.org/ci/apps/guacamole/)
![Funtzionamendu egoera](https://apps.yunohost.org/badge/state/guacamole)
![Mantentze egoera](https://apps.yunohost.org/badge/maintained/guacamole)

[![Instalatu Guacamole YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=guacamole)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek Guacamole YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

Guacamole is a clientless remote desktop gateway. It supports standard protocols like VNC, RDP, and SSH

**Paketatutako bertsioa:** 1.5.5~ynh1

## Pantaila-argazkiak

![Guacamole(r)en pantaila-argazkia](./doc/screenshots/screenshot1.jpg)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://guacamole.apache.org/>
- Administratzaileen dokumentazio ofiziala: <https://guacamole.apache.org/doc/gug/>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/apache/guacamole-server>
- YunoHost Denda: <https://apps.yunohost.org/app/guacamole>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/guacamole_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/guacamole_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/guacamole_ynh/tree/testing --debug
edo
sudo yunohost app upgrade guacamole -u https://github.com/YunoHost-Apps/guacamole_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
