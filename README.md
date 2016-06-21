[azukiapp/erlang](http://images.azk.io/#/erlang)
==================

Base docker image to run **Erlang** applications in [azk.io][azk]

[![Circle CI][circleci-badge]][circleci]
[![][imagelayers-badge]][imagelayers]

Erlang Versions (tags)
---

<versions>
- [`latest`, `18`, `18.3`](https://github.com/azukiapp/docker-erlang/blob/v18/18/Dockerfile)
-                 [`18.1`](https://github.com/azukiapp/docker-erlang/blob/v18.1/18/Dockerfile)
</versions>

Image content use http://images.azk.io/#/alpine

### Usage with `azk`

Example of using that image with [azk][azk]:

```js
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */

// Adds the systems that shape your system
systems({
  "my-app": {
    // More info about erlang image: http://images.azk.io/#/erlang?from=images-azkfile-erlang
    image: {"docker": "azukiapp/erlang:18"},
    // Steps to execute before running instances
    provision: [
    ],
    workdir: "/azk/#{manifest.dir}",
    shell: "/bin/bash",
    // command: "erl ...",
    wait: {"retry": 20, "timeout": 1000},
    mounts: {
      '/azk/#{manifest.dir}': path("."),
    },
    scalable: {"default": 1},
    http: {
      domains: [ "#{system.name}.#{azk.default_domain}" ]
    },
    ports: {
      // http: "8080"
    },
    envs: {
      // set instances variables
      EXAMPLE: "value",
    },
  },
});
```

## Extend image with `Dockerfile`

Install more packages:

```dockerfile
# Dockerfile
FROM azukiapp/erlang:18

# install postgressql-client
RUN  apk add --update postgresql-client \
  && rm -rf /var/cache/apk/* /var/tmp/* \

CMD ["erl"]
```

To build the image:

```sh
$ docker build -t azukiapp/erlang:18
```

To more packages, access [alpine packages][alpine-packages]

### Usage with `docker`

To create the image `azukiapp/erlang`, execute the following command on the erlang folder:

```sh
$ docker build -t azukiapp/erlang:18 18
```

To run erl console:

```sh
$ docker run -d -t -i azukiapp/erlang:18 erl
```

### Tests

Obs: Very slow process

```
$ make test
```

### Logs

```sh
# with azk
$ azk logs my-app

# with docker
$ docker logs <CONTAINER_ID>
```

## License

Azuki Dockerfiles distributed under the [Apache License][license].

[azk]: http://azk.io
[alpine-packages]: http://pkgs.alpinelinux.org/

[issues]: https://github.com/azukiapp/docker-erlang/issues

[circleci]: https://circleci.com/gh/azukiapp/docker-erlang
[circleci-badge]: https://circleci.com/gh/azukiapp/docker-erlang.svg?style=svg

[imagelayers]: https://imagelayers.io/?images=azukiapp/erlang:latest,azukiapp/erlang:18,azukiapp/erlang:18.1
[imagelayers-badge]: https://imagelayers.io/badge/azukiapp/erlang:latest.svg

[license]: https://github.com/azukiapp/docker-erlang/blob/master/LICENSE
