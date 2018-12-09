#FROM	ubuntu:16.04
FROM	ubuntu:18.04

RUN	apt-get update && \
      apt-get install -y  unzip wget && \
      cd /opt && \
      mkdir hercules && \
      cd hercules && \
      mkdir tk4 && \
      cd tk4 && \
      wget http://wotho.ethz.ch/tk4-/tk4-_v1.00_current.zip && \
      unzip tk4-_v1.00_current.zip && \
      rm  tk4-_v1.00_current.zip && \
      #echo 0010 3270 CONS >> /opt/hercules/tk4/conf/intcons.cnf && \
      apt-get -y purge wget unzip && \
      apt-get -y autoclean && apt-get -y autoremove && \
      apt-get -y purge $(dpkg --get-selections | grep deinstall | sed s/deinstall//g) && \
      rm -rf /var/lib/apt/lists/*

EXPOSE      3270 8038
WORKDIR     /opt/hercules/tk4/
ENTRYPOINT  ["/opt/hercules/tk4/mvs"]

