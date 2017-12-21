# A docker container containing a fully running MVS 3.8j
Please see the http://wotho.ethz.ch/tk4-/ for details.

# Thank you to the following.
TK3 created by Volker Bandke       vbandke@bsp-gmbh.com

TK4- update by Juergen Winkelmann  winkelmann@id.ethz.ch http://wotho.ethz.ch/tk4-/

# Usage

```
docker run --name tk4- \
           -p 3270:3270 \
           rattydave/docker-ubuntu-hercules-mvs:latest
```

Connect a 3270 terminal to port 3270.

## Users

- HERC01 is a fully authorized user with full access to the RAKF users and profiles
tables. The logon password is CUL8TR.
- HERC02 is a fully authorized user without access to the RAKF users and profiles
tables. The logon password is CUL8TR.
- HERC03 is a regular user. The logon password is PASS4U.
- HERC04 is a regular user. The logon password is PASS4U.
- IBMUSER is a fully authorized user without access to the RAKF users and profiles
tables. The logon password is IBMPASS. This account is meant to be used for
recovery purposes only.

# About the Hardware
The MVS 3.8j Tur(n)key 4- System runs on an IBM 3033 mainframe emulated by the Hercules System/370, ESA/390, and z/Architecture emulator which is Copyrighted (c) by Roger Bowler and others.

Hercules is licensed and distributed under the terms of the Q Public License Version 1.0. See http://www.hercules-390.eu/herclic.html for license details. According to the terms of the license an unmodified copy of the license is available as file /opt/hercules/tk4/hercules/httproot/herclic.html and all patches applied to Hercules to adapt it to the needs of TK4- have been placed in folder /opt/hercules/tk4/hercules/patches of the MVS 3.8j Tur(n)key 4- distribution.

# About the Operating System
For the present implementation IBM's OS/VS2 (MVS) operating system (Program-Number 5752-VS2, Release 3.8j, Service Level approx. 8505) was chosen, which is in the public domain.

# About the MVS 3.8j Tur(n)key 4- Distribution
The MVS 3.8j Tur(n)key 4- distribution itself is put into the public domain without claiming any copyright by the author as far as no third party copyrights are affected.
