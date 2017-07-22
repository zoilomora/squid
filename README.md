# Anonymous Proxy Squid
## About

The following installer will facilitate the installation of a proxy based on the software squid to be able to make a
completely anonymous navigation.

This installer is based on the following tutorials:
- [Squid Proxy Server On VPS](http://nikhgupta.com/code/installing-squid-proxy-server-on-centos-5-vps/)
- [Anonymous Proxy With Squid](http://nikhgupta.com/code/setting-up-anonymous-proxy-with-squid/)

## Implementation
### Supported Operating Systems

This installer works on the following operating systems:
- Ubuntu 14.04 and 16.04 LTS on i386 and amd64

### How to run it

1) Download the Virtualmin Install Script:
```sh
# wget https://raw.githubusercontent.com/zoilomora/squid/master/install.sh
```

2) Run the Install Script:
```sh
sudo /bin/sh install.sh
```

### Create new users

1) Go to directory ``/etc/squid`` and run ``htpasswd passwd {user}``

2) Restart Squid service by running ``/etc/init.d/squid restart``
