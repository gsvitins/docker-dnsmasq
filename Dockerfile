FROM alpine:3.17.3
RUN apk --no-cache add dnsmasq
COPY healthcheck.sh /
RUN chmod +x /healthcheck.sh
EXPOSE 53/tcp 53/udp 67/udp
HEALTHCHECK --interval=15s --timeout=5s CMD /healthcheck.sh

CMD ["dnsmasq", "-k"]


