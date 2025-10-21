FROM instrumentisto/coturn

ENV LISTENING_PORT=3478
ENV RELAY_PORT=49152-65535
ENV TURN_USERNAME=zingmini
ENV TURN_PASSWORD=zingmini123
ENV REALM=zingmini.onrender.com

EXPOSE 3478/udp
EXPOSE 3478/tcp
EXPOSE 49152-65535/udp

CMD ["turnserver", "-a", "-v", "-L", "0.0.0.0", "-E", "0.0.0.0",
     "--lt-cred-mech", "--no-dtls", "--no-tls",
     "--realm", "zingmini.onrender.com",
     "--user", "zingmini:zingmini123",
     "--external-ip", "$(curl -s https://api.ipify.org)",
     "--min-port", "49152", "--max-port", "65535"]
