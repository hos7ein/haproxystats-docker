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
docker run -d --restart always --name [container_name] --hostname=[container_hostname] -v [path_of_haproxystats_config_file]:/etc/haproxystats/haproxystats.conf -v [path_of_haproxy_socket_files]:[path_of_socket-dir]  hos7ein/haproxystats
```
Notes:

- `[container_name]`: The name of the container which you can choose as you wish.
- `[container_hostname]`: The hostname of the container which you can choose as you wish.
- `[path_of_haproxystats_config_file]`: The path to your haproxystats configuration file.
- `[path_of_haproxy_socket_files]`: The path to your haproxy socket files.
- `[path_of_socket-dir]`: The path of the haproxy socket files inside of container that you have set in the haproxystats.conf file.


For example:
```
docker run -d --restart always --name hos7ein-haproxystats --hostname=haproxystats -v /opt/haproxystats/haproxystats.conf:/etc/haproxystats/haproxystats.conf -v /var/lib/haproxy:/run/haproxy  hos7ein/haproxystats
```

### Sample shot ###

![grafana](https://raw.githubusercontent.com/hos7ein/haproxystats-docker/master/Pictures/1-grafana.png)


## Contact

**Project website**: https://github.com/hos7ein/haproxystats-docker

**Author**: Hossein Aghaie <hossein.a97@gmail.com>

**Twitter**: Hossein Aghaie [@hos7ein](https://twitter.com/hos7ein)


## License

haproxystats-docker source code is available under the GPL-3.0 [License](/LICENSE).
