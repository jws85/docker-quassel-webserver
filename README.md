This dockerizes [quassel-webserver](https://github.com/magne4000/quassel-webserver).

Notes
---

The server will come up on port 64000 inside the container.

By default, the server will use plain HTTP.  My own use-case is to use this
behind a firewall.  I would highly recommend using HTTPS if you expose this to
the public Internet.

Example
---

Copy `settings.js` to `settings-user.js`, edit the latter, then:

```bash
docker run -p 8888:64000 -v $(pwd)/settings-user.js:/opt/quassel-webserver/settings-user.js quassel-webserver
```

This will start quassel-webserver and expose it on port 8888, only accessible
to localhost.  To make it accessible to the rest of your network, change the
ports to something like `0.0.0.0:8888:64000`.
