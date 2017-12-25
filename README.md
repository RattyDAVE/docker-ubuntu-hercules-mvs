# A docker container containing a fully running MVS 3.8j

## Thank you to the following.
TK3 created by Volker Bandke       vbandke@bsp-gmbh.com http://www.bsp-gmbh.com/turnkey

TK4- update by Juergen Winkelmann  winkelmann@id.ethz.ch http://wotho.ethz.ch/tk4-/

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

F1 - Help
F7 - Page Back
F8 - Page Forward

STARTING

At the "==>" prompt enter "TSO". You will be asked for a user ID, enter "IBMUSER". You will then be asked for the password, enter "SYS1".
Press enter when you see ispf.

Getting the network working.

From the ISPF menu type "3.4"
	Replace "IBMUSER" with "DUZA" and press enter.
	Find "DUZA.TCPPARMS" on the next screen, press F8 for more.
	On the same line at the beginning type "E" and press enter.
	 TO "PROFILE" TYPE THE LETTER "E" AND HIT ENTER	
	PAGE DOWN TO LINE 90 WHICH WILL LOOK LIKE THIS:

		000090 DEVICE LCS1   LCS           E20
		000091 LINK ETH1  ETHERNET  0  LCS1
		000092
		000093 HOME
		000094    10.0.1.20    ETH1
		000095
		000096 GATEWAY
		000097    10.0.1.100 = ETH1 1500 HOST
		000098
		000099 DEFAULTNET 10.0.1.100 ETH1 1500 0

	MAKE IT LOOK LIKE THIS:

		000090 DEVICE CTCA1 CTC e20
		000091 LINK CTC1 CTC 1 CTCA1
		000092
		000093 HOME
		000094    192.168.0.210  CTC1
		000095
		000096 GATEWAY
		000097    192.168.0.1  = CTC1 1492 HOST
		000098
		000099 DEFAULTNET 192.168.0.5 CTC1 1492 0

	*****SPECIAL NOTE***** IF YOURE NOT ON A 192.168.0.* NETWORK JUST MATCH UP THE FIRST IP ADDRESS TO BE THE ONE YOU SET IN THE .CONF FILE. THE SECOND IS YOUR ROUTER IP ADDRESS AND THE THIRD IS THE IP ADDRESS OF THE HERCULES HOST MACHINE

	WHEN DONE ON THE 'Command ===>' LINE TYPE "SAVE" AND THEN "END"
	GO BACK TO THE OTHER c3270 WINDOW AND TYPE "STOP TCPIP" AND THEN "START TCPIP"

	IN LINUX IN A NEW TERMINAL WINDOW RUN THE FOLLOWING AS ROOT:
		echo "1"  > /proc/sys/net/ipv4/conf/all/proxy_arp 
		echo "1"  > /proc/sys/net/ipv4/conf/all/forwarding 



## About the Hardware
The MVS 3.8j Tur(n)key 4- System runs on an IBM 3033 mainframe emulated by the Hercules System/370, ESA/390, and z/Architecture emulator which is Copyrighted (c) by Roger Bowler and others.

Hercules is licensed and distributed under the terms of the Q Public License Version 1.0. See http://www.hercules-390.eu/herclic.html for license details. According to the terms of the license an unmodified copy of the license is available as file /opt/hercules/tk4/hercules/httproot/herclic.html and all patches applied to Hercules to adapt it to the needs of TK4- have been placed in folder /opt/hercules/tk4/hercules/patches of the MVS 3.8j Tur(n)key 4- distribution.

## About the Operating System
For the present implementation IBM's OS/VS2 (MVS) operating system (Program-Number 5752-VS2, Release 3.8j, Service Level approx. 8505) was chosen, which is in the public domain.

## About the MVS 3.8j Tur(n)key 4- Distribution
The MVS 3.8j Tur(n)key 4- distribution itself is put into the public domain without claiming any copyright by the author as far as no third party copyrights are affected.
