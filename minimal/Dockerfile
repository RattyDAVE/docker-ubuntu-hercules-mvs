FROM rattydave/docker-ubuntu-hercules-mvs:latest as builder


FROM scratch		
		
WORKDIR /opt/		
COPY --from=builder /opt/ .		
		
EXPOSE      3270 8038
WORKDIR     /opt/hercules/tk4/
ENTRYPOINT  ["/opt/hercules/tk4/mvs"]
