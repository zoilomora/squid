FROM ubuntu:16.04

COPY squid.conf /tmp/squid.conf

RUN apt-get update \
    && apt-get install apache2-utils squid -y \
    && echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf \
    && echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf \
    && echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf \
    && sysctl -p \
    && cd /etc/squid/ \
    && mv -i squid.conf squid.conf.bak \
    && mv -i /tmp/squid.conf squid.conf \
    && mkdir list \
    && touch list/not-to-cache.conf \
    && touch passwd \
    && chmod o+r passwd

WORKDIR /etc/squid

EXPOSE 3128/tcp

CMD ["squid", "-f", "/etc/squid/squid.conf", "-NYCd", "1"]
