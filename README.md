[azukiapp/erlang](http://images.azk.io/#/erlang)
==================

Base docker image to run **Erlang** applications in [`azk`](http://azk.io)

Versions (tags)
---

- [`latest`, `1`, `1.0`](https://github.com/azukiapp/docker-erlang/blob/master/Dockerfile)

Image content:
---

- Ubuntu 14.04
- Git
- VIM

Database:

- Erlang

### Usage with `azk`

Example of using this image with [azk](http://azk.io):

```js
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */
 
// Adds the systems that shape your system
systems({
  "my-app": {
    // Dependent systems
    depends: [], // postgres, mysql, mongodb ...
    // More images:  http://images.azk.io
    image: {"docker": "azukiapp/erlang"},
    // Steps to execute before running instances
    provision: [
    ],
    workdir: "/azk/#{manifest.dir}",
    shell: "/bin/bash",
    command: "# command to run app. i.g.: `./start`",
    wait: {"retry": 20, "timeout": 1000},
    mounts: {
      '/azk/#{manifest.dir}': path("."),
    },
    scalable: {"default": 2},
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

### Usage with `docker`

To create the image `azukiapp/erlang`, execute the following command on the erlang folder:

```sh
$ docker build -t azukiapp/erlang .
```

Logs
---

```sh
# with azk
$ azk logs my-app

# with docker
$ docker logs <CONTAINER_ID>
```

## License

Azuki Dockerfiles distributed under the [Apache License](https://github.com/azukiapp/dockerfiles/blob/master/LICENSE).
