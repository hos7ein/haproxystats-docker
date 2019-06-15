FROM alpine:3.9
LABEL maintainer="fedorafans.com <hossein.a97@gmail.com>"

# ---------------- #
#   Installation   #
# ---------------- #

# Install all prerequisites
RUN apk add --no-cache gcc g++ python3 py3-pip python3-dev supervisor       &&\
    rm -rf /var/cache/apk/*                                                 &&\
    pip3 install numpy ; pip3 install haproxystats

# Configure haproxystats
RUN mkdir -p                             /etc/haproxystats     /var/lib/haproxy
ADD ./conf_files/haproxystats.conf       /etc/haproxystats



# Configure supervisord
RUN mkdir -p                             /var/log/supervisor
ADD ./conf_files/supervisord.conf        /etc


# -------- #
#   Run!   #
# -------- #

CMD ["/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
