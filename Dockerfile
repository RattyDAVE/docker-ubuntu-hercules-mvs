ARG IMAGE="ubuntu:23.04"
FROM ${IMAGE}

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt upgrade -y \
    && apt install -y unzip wget binutils \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/hercules/tk4
WORKDIR /opt/hercules/tk4/

RUN wget --no-check-certificate https://wotho.ethz.ch/tk4-/tk4-_v1.00_current.zip -O tk4.zip && \
      unzip tk4.zip && \
      rm -v tk4.zip
# RUN echo 0010 3270 CONS >> /opt/hercules/tk4/conf/intcons.cnf

EXPOSE 3270 8038

CMD ["/opt/hercules/tk4/mvs"]
