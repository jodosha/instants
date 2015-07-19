# Instants

Lotus experiment with HTTP/2 Push Promise

## Requirements

  * Ruby 2+ (with Bundler)
  * nghttp2
  * Instagram API key and secret

## Import Instagram Pictures

Edit `.env` like this:

```
INSTAGRAM_CLIENT_ID="..."
INSTAGRAM_CLIENT_SECRET="..."
```

Then run:

```shell
% bin/import <instagram-username>
```

## HTTP/1 Mode

Just start Lotus server

```shell
% bundle exec lotus server
```

Then visit http://localhost:2300

## HTTP/2 Mode

Keep Lotus server running and start `nghttp2`

```shell
% nghttpx -s -f0.0.0.0,8443 -b 127.0.0.1,2300 config/key.pem config/cert.pem
```

Then visit https://localhost:8443
