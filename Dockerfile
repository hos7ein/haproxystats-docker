FROM alpine:3.8
MAINTAINER hos7ein <hossein.a97@gmail.com>

# ---------------- #
#   Installation   #
# ---------------- #

# Install all prerequisites
RUN apk add --no-cache gcc g++ python3 py3-pip python3-dev supervisor       &&\
    rm -rf /var/cache/apk/*				                                         	&&\
    pip3 install haproxystats

# Configure haproxystats
RUN mkdir -p                  /etc/haproxystats   /var/lib/haproxy
ADD ./haproxystats.conf       /etc/haproxystats



# Configure supervisord
RUN mkdir -p                 /var/log/supervisor
ADD ./supervisord.conf       /etc


# -------- #
#   Run!   #
# -------- #

CMD ["/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
