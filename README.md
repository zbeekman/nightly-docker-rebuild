<div align="center">

:moon: :whale: :hammer_and_wrench: nightly-docker-rebuild :package: :whale2: :sparkles:
=======================================================================================

Use [nightli.es] to rebuild N docker images on [hub.docker.com],
[setup] takes less than two minutes! :zap:

[![Build Status][build badge]][latest build]
[![Maintained?][maintained badge]][commit history]
[![GitHub forks][forks badge]][do fork]
[![GitHub stars][stars badge]][home]
[![GitHub watchers][watchers badge]][home]
[![Twitter URL][twitter badge]][do tweet]

[![Whale spout launcher animation][whale gif]][travis builds]

</div>

Why
---

I use this to rebuild
[GCC trunk in a docker container][GH GCC trunk in docker] on a nightly
basis. If you're interested, please take a look at
[my automated docker hub setup][Dhub GCC trunk in docker].

[Travis-CI.org](https://travis-ci.org) is great but long builds can
time out, which is a giant PITA. Docker to the rescue!  By using
[docker with Travis-CI](https://docs.travis-ci.com/user/docker/) you
get to skip long builds for dependencies.  While Travis-CI itself can
be used to build docker images, some will time out before the build
can complete. However, [Docker Hub][hub.docker.com] can be used to
rebuild docker images (and it's harder to time out here) *BUT*
[nightli.es] can only be used to trigger Travis-CI builds.... hmmmmm
:thinking: what to do?  [Nightly-docker-rebuild][home] to the rescue!
:tada:

How
---

 1. [Fork][do fork]
 1. Clone: `git clone
    https://github.com/<your_username>/nightly-docker-rebuild && cd
    nightly-docker-rebuild`
 1. Enable and setup Travis-CI.org (through the online UI or by
    following the following steps)
 1. `[sudo] gem install travis`
 1. `travis login`
 1. `travis enable`
 1. Get your Docker Hub project end point URL and token from
    `https://hub.docker.com/r/<USER>/<REPO>/~/settings/automated-builds/`
 1. create encrypted Travis-CI variable to store private end point and
    token: `travis env set DH_END_POINT_1
    https://registry.hub.docker.com/u/<USER>/<REPO>/trigger/<TOKEN>/`
 1. Repeat for an additional nighly builds you want to setup and
    increment the number on `DH_END_POINT_<N>`
 1. Go to [nightli.es] and enable `nightly-docker-rebuild` after
    [logging in][nightli.es login]

---

<div align="center">

[![GitHub followers][GH followers badge]][GH profile]
[![Twitter Follow][twitter followers badge]][do follow me on twitter]

</div>

[nightli.es]: https://nightli.es
[nightli.es login]: https://nightli.es/login
[hub.docker.com]: https://hub.docker.com
[GH GCC trunk in docker]: https://github.com/zbeekman/nightly-gcc-trunk-docker-image
[setup]: #how
[whale gif]: http://i.giphy.com/4AC11GmQzFVKg.gif "Whale spout launcher animation"
[travis builds]: https://travis-ci.org/zbeekman/nightly-docker-rebuild/builds "history of builds on Travis-CI"
[build badge]: https://api.travis-ci.org/zbeekman/nightly-docker-rebuild.svg?branch=master
[latest build]: https://travis-ci.org/zbeekman/nightly-docker-rebuild
[maintained badge]: https://img.shields.io/maintenance/yes/2018.svg
[commit history]: https://github.com/zbeekman/nightly-docker-rebuild/commits/master
[forks badge]: https://img.shields.io/github/forks/zbeekman/nightly-docker-rebuild.svg?style=social&label=Fork
[do fork]: https://github.com/zbeekman/nightly-docker-rebuild/fork
[stars badge]: https://img.shields.io/github/stars/zbeekman/nightly-docker-rebuild.svg?style=social&label=Star
[home]: https://github.com/zbeekman/nightly-docker-rebuild
[watchers badge]: https://img.shields.io/github/watchers/zbeekman/nightly-docker-rebuild.svg?style=social&label=Watch
[twitter badge]: https://img.shields.io/twitter/url/http/shields.io.svg?style=social
[do tweet]: https://twitter.com/intent/tweet?hashtags=nightly%2Cdocker%2Cbuild&related=docker%2Ctravisci&text=Rebuild%20your%20docker%20images%20on%20a%20nightly%20basis%21&url=https%3A//github.com/zbeekman/nightly-docker-rebuild&via=zbeekman
[GH followers badge]: https://img.shields.io/github/followers/zbeekman.svg?style=social&label=Follow
[GH profile]: https://github.com/zbeekman
[twitter followers badge]: https://img.shields.io/twitter/follow/zbeekman.svg?style=social&label=Follow
[do follow me on twitter]: https://twitter.com/intent/follow?screen_name=zbeekman
[Dhub GCC trunk in docker]: https://hub.docker.com/r/zbeekman/nightly-gcc-trunk-docker-image/
