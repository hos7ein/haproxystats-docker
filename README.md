haproxystats-docker
-------------------

### Introduction ###

<a href="https://github.com/unixsurfer/haproxystats" target="_blank">****haproxystats****</a> is a statistics collector for <a href="https://www.haproxy.org/" target="_blank">**HAProxy**</a> load balancer which
processes various statistics and pushes them to graphing systems (Graphite).
It is designed to satisfy the following requirements:

- Fast and configurable processing of HAProxy statistics
- Perform aggregation when HAProxy runs in multiprocess (nbproc > 1)
- Pull statistics at very low intervals (10secs)
- Flexible dispatching of statistics to different systems (Graphite,  kafka)

`haproxystats` is great tool which wrote by <a href="https://github.com/unixsurfer" target="_blank">**Pavlos Parissis**</a>. I am inspired by haproxystats and have dockerized it.


### Build ###

To build `haproxystats-docker`, after clone the project you should run the beneath command, even though this image is published under [my repository on the Docker Hub](https://hub.docker.com/r/hos7ein/haproxystats) and all you need as a prerequisite is having docker on your machine.
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
docker run -it -d --restart always --name hos7ein-haproxystats --hostname=haproxystats -v /opt/haproxystats:/etc/haproxystats -v /var/lib/haproxy:/var/lib/haproxy  hos7ein/haproxystats
```

### Sample shot ###

![grafana](https://raw.githubusercontent.com/hos7ein/haproxystats-docker/master/Pictures/1-grafana.png)


## Contact

**Project website**: https://github.com/hos7ein/haproxystats-docker

**Author**: Hossein Aghaie <hossein.a97@gmail.com>

**Twitter**: <a href="https://twitter.com/hos7ein" target="_blank">****@hos7ein****</a>



## License

haproxystats-docker source code is available under the GPL-3.0 [License](/LICENSE).

