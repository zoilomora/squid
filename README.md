# Anonymous Proxy Squid
## About

The following installer will facilitate the installation of a proxy based on the software squid to be able to make a
completely anonymous navigation.

This installer is based on the following tutorials:
- [Squid Proxy Server On VPS](http://nikhgupta.com/code/installing-squid-proxy-server-on-centos-5-vps/)
- [Anonymous Proxy With Squid](http://nikhgupta.com/code/setting-up-anonymous-proxy-with-squid/)
- [How to Disable IPv6 in Ubuntu 16.04 Xenial Xerus](http://www.neuraldump.com/2016/11/how-to-disable-ipv6-in-ubuntu-16-04-xenial-xerus/)

## Docker

1) Create the container:
```sh
docker run -d -p 3128:3128 --name proxy -h proxy zoilomora/proxy
```

2) Register new users:
```sh
docker exec -it proxy htpasswd passwd {user}
```

## Manual Installation
### Supported Operating Systems

This installer works on the following operating systems:
- Ubuntu 14.04 and 16.04 LTS on i386 and amd64.

### How to run it

1) Download the Install Script:
```sh
$ wget https://raw.githubusercontent.com/zoilomora/squid/master/install.sh
```

2) Run the Install Script:
```sh
$ sudo /bin/bash install.sh
```

### Create new users

1) Go to directory ``/etc/squid`` and run ``htpasswd passwd {user}``.

2) Restart Squid service by running ``/etc/init.d/squid restart``.
