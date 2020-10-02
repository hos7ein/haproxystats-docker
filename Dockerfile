FROM alpine:3.12
LABEL maintainer="https://fedorafans.com <hossein.a97@gmail.com>"

# ---------------- #
#   Installation   #
# ---------------- #

# Install and setup all prerequisites
RUN apk add --no-cache gcc g++ python3 py3-pip python3-dev supervisor              &&\
    rm -rf /var/cache/apk/*                                                        &&\
    pip3 install numpy                                                             &&\
    pip3 install haproxystats                                                      &&\
    mkdir -p  /etc/haproxystats  /var/lib/haproxy  /var/log/supervisor             &&\
    echo    -e "\
    [program:haproxystats-pull]                                                    \n\                                     
    command = /usr/bin/haproxystats-pull -f /etc/haproxystats/haproxystats.conf    \n\
    stdout_logfile = /var/log/supervisor/%(program_name)s.log                      \n\    
    stderr_logfile = /var/log/supervisor/%(program_name)s.log                      \n\
    autorestart = true                                                             \n\
    [program:haproxystats-process]                                                 \n\
    command = /usr/bin/haproxystats-process -f /etc/haproxystats/haproxystats.conf \n\
    stdout_logfile = /var/log/supervisor/%(program_name)s.log                      \n\            
    stderr_logfile = /var/log/supervisor/%(program_name)s.log                      \n\
    autorestart = true                                                             \
    " > /etc/supervisord.conf

# Configure haproxystats
###ADD ./conf_files/haproxystats.conf       /etc/haproxystats

# Configure supervisord
###ADD ./conf_files/supervisord.conf        /etc




# -------- #
#   Run!   #
# -------- #

CMD ["/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
