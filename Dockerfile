FROM    alpine
RUN     apk add --no-cache openvpn iptables ip6tables bash curl && \
	curl -OL https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.6/EasyRSA-unix-v3.0.6.tgz && \
	apk del curl
COPY    server.conf /etc/openvpn/server.conf
COPY    entrypoint.sh /usr/bin/
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD     ["tail", "-f", "/var/log/openvpn.log"]

