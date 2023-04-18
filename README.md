# gsvitins/dnsmasq
Simple dnsmasq image based on Alpine 3.17.3  
Source: [https://github.com/gsvitins/docker-dnsmasq/](https://github.com/gsvitins/docker-dnsmasq/)

## Usage

Run image using `docker`:  
```shell
docker run --name dnsmasq -d -p 53:53/udp -v ./dnsmasq.conf:/etc/dnsmasq.conf gsvitins/dnsmasq:latest
```
For  `docker compose` use this `docker-compose.yaml` file:  
```shell
version: '2'
services:
  dnsmasq:
    restart: always
    container_name: dnsmasq
    image: gsvitins/dnsmasq:latest
    command: --log-queries --log-facility=/var/log/dnsmasq.log
    volumes:
      - ./dnsmasq.conf:/etc/dnsmasq.conf
      - ./logs/:/var/log/
    ports:
      - "53:53/tcp"
      - "53:53/udp"
      - "67:67/udp"
```
Sample `dnsmasq.conf` config:  
```shell
strict-order
no-resolv
no-poll
no-dhcp-interface=
log-queries
conf-dir=/etc/dnsmasq.d
server=1.1.1.1
server=1.0.0.1
```
