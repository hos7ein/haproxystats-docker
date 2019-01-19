haproxystats-docker
-------------------

### Introduction ###

<a href="https://github.com/unixsurfer/haproxystats" target="_blank">****haproxystats****</a> is a statistics collector for <a href="https://www.haproxy.org/" target="_blank">**HAProxy**</a> load balancer which
processes various statistics and pushes them to graphing systems (Graphite).
It is designed to satisfy the following requirements:

1. Fast and configurable processing of HAProxy statistics
2. Perform aggregation when HAProxy runs in multiprocess (nbproc > 1)
3. Pull statistics at very low intervals (10secs)
4. Flexible dispatching of statistics to different systems (Graphite,  kafka)

`haproxystats` is great tool which wrote by <a href="https://github.com/unixsurfer" target="_blank">**Pavlos Parissis**</a>. I am inspired by haproxystats and have dockerized it.


### Build ###

To build haproxystats-docker, after clone the project you should run the beneath command:
```
docker build --tag hos7ein/haproxystats  .
```

### Launch a container ###

To launch a container you can use this instruction:

```
docker run -it -d --restart always --name [container-name] --hostname=[container-Hostanme] -v [path-of-haproxystats-config-file]:/etc/haproxystats -v [path-of-haproxy-sock-files]:/var/lib/haproxy  hos7ein/haproxystats
```

For example:
```
docker run -it -d --restart always --name hos7ein-haproxystats --hostname=haproxy1 -v /root/haproxystats:/etc/haproxystats -v /var/lib/haproxy:/var/lib/haproxy  hos7ein/haproxystats
```
