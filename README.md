# A docker container containing a fully running MVS 3.8j

Use https://github.com/RattyDAVE/docker-ubuntu-hercules-mvs/issues to send feedback, issues, comments and general chat.

# Part of the retro mini and mainframe series.

* https://hub.docker.com/r//rattydave/docker-ubuntu-hercules-vm370 - vm370 Emulator with Robert O'Hara's Six Pack
* https://hub.docker.com/r/rattydave/docker-ubuntu-hercules-mvs - Fully running MVS 3.8j Tur(n)key 4- System. IBM Mainframe.
* https://hub.docker.com/r/rattydave/alpine-simh/ - AT&T, Data General, DEC PDPs and VAXen, Honeywell, HP and others. All with OSs.

## Thank you to the following.
* TK3 created by Volker Bandke       vbandke@bsp-gmbh.com http://www.bsp-gmbh.com/turnkey
* TK4- update by Juergen Winkelmann  winkelmann@id.ethz.ch http://wotho.ethz.ch/tk4-/

## Usage

```
docker run --name tk4- \
           -p 3270:3270 -p 8038:8038 \
           rattydave/docker-ubuntu-hercules-mvs:latest
```

Connect a 3270 terminal to port 3270 on the docker host.
To get the http://docker.host:8038 for the Hercules console.

Or

```
docker run --name tk4- rattydave/docker-ubuntu-hercules-mvs:latest

docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' tk4-
```

Then connect a 3270 terminal to the container ip address on port 3270.

```
x3270 ipaddress:3270
```

Optionally you can connect to the CONSOLE session.

```
x3270 CONS@ipaddress:3270
```

If you need a development system with x3270 pre installed then have a look at https://hub.docker.com/r/rattydave/docker-ubuntu-xrdp-mate-custom/ and pull rattydave/docker-ubuntu-xrdp-mate-custom:v2-tools

For more information see http://wotho.ethz.ch/tk4-/MVS_TK4-_v1.00_Users_Manual.pdf

### Users

- HERC01 is a fully authorized user with full access to the RAKF users and profiles
tables. The logon password is CUL8TR.
- HERC02 is a fully authorized user without access to the RAKF users and profiles
tables. The logon password is CUL8TR.
- HERC03 is a regular user. The logon password is PASS4U.
- HERC04 is a regular user. The logon password is PASS4U.
- IBMUSER is a fully authorized user without access to the RAKF users and profiles
tables. The logon password is IBMPASS. This account is meant to be used for
recovery purposes only.

## Documentation

Brief documentation is included in /opt/hercules/tk4/doc 

The http://www.bsp-gmbh.com/turnkey/cookbook/index.html is your best starting point.

## Getting started notes

PFKEYS

* F3 - Exit
* F7 - Page Back
* F8 - Page Forward

## About the Hardware
The MVS 3.8j Tur(n)key 4- System runs on an IBM 3033 mainframe emulated by the Hercules System/370, ESA/390, and z/Architecture emulator which is Copyrighted (c) by Roger Bowler and others.

Hercules is licensed and distributed under the terms of the Q Public License Version 1.0. See http://www.hercules-390.eu/herclic.html for license details. According to the terms of the license an unmodified copy of the license is available as file /opt/hercules/tk4/hercules/httproot/herclic.html and all patches applied to Hercules to adapt it to the needs of TK4- have been placed in folder /opt/hercules/tk4/hercules/patches of the MVS 3.8j Tur(n)key 4- distribution.

## About the Operating System
For the present implementation IBM's OS/VS2 (MVS) operating system (Program-Number 5752-VS2, Release 3.8j, Service Level approx. 8505) was chosen, which is in the public domain.

## About the MVS 3.8j Tur(n)key 4- Distribution
The MVS 3.8j Tur(n)key 4- distribution itself is put into the public domain without claiming any copyright by the author as far as no third party copyrights are affected.
