FROM	ubuntu:16.04

RUN	apt-get update && \
      apt-get install -y  unzip wget screen && \
      cd /opt && \
      mkdir hercules && \
      cd hercules && \
      mkdir tk4 && \
      cd tk4 && \
      wget http://wotho.ethz.ch/tk4-/tk4-_v1.00_current.zip && \
      unzip tk4-_v1.00_current.zip && \
      rm  tk4-_v1.00_current.zip && \
      echo 0010 3270 CONS >> /opt/hercules/tk4/conf/intcons.cnf && \
      echo "#!/bin/bash" > start_mvs.sh && \
      echo "cd /opt/hercules/tss"  >> start_mvs.sh && \
      echo "/usr/bin/screen -dm -S herc /opt/hercules/tk4/mvs"  >> start_mvs.sh && \
      echo "/bin/sh" >> start_mvs.sh && \
      chmod 755 start_mvs.sh && \
      apt-get -y autoclean && apt-get -y autoremove && \
      apt-get -y purge $(dpkg --get-selections | grep deinstall | sed s/deinstall//g) && \
      rm -rf /var/lib/apt/lists/*

EXPOSE      3270 8038
WORKDIR     /opt/hercules/tk4/
#ENTRYPOINT  ["/opt/hercules/tk4/mvs"]
#ENTRYPOINT  ["/usr/bin/screen","-dm","-S","herc","./mvs"]
ENTRYPOINT  ["./start_mvs.sh"]
