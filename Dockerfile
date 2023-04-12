FROM alpine:3.17.3
COPY healthcheck.sh /
RUN apk --no-cache add dnsmasq && chmod +x /healthcheck.sh
EXPOSE 53/tcp 53/udp 67/udp
HEALTHCHECK --interval=15s --timeout=5s CMD /healthcheck.sh

ENTRYPOINT ["dnsmasq", "-k"]
