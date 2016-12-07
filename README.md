[![Build Status](https://travis-ci.org/zbeekman/nightly-docker-rebuild.svg?branch=master)](https://travis-ci.org/zbeekman/nightly-docker-rebuild)
[![Maintenance](https://img.shields.io/maintenance/yes/2017.svg)]()
[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?hashtags=nightly%2Cdocker%2Cbuild&related=docker%2Ctravisci&text=Rebuild%20your%20docker%20images%20on%20a%20nightly%20basis%21&url=https%3A//github.com/zbeekman/nightly-docker-rebuild&via=zbeekman)
[![Twitter Follow](https://img.shields.io/twitter/follow/zbeekman.svg?style=social&label=Follow)](https://twitter.com/intent/follow?screen_name=zbeekman)
[![GitHub forks](https://img.shields.io/github/forks/zbeekman/nightly-docker-rebuild.svg?style=social&label=Fork)](https://github.com/zbeekman/nightly-docker-rebuild/fork)
[![GitHub stars](https://img.shields.io/github/stars/zbeekman/nightly-docker-rebuild.svg?style=social&label=Star)](https://github.com/zbeekman/nightly-docker-rebuild)
[![GitHub stars](https://img.shields.io/github/watchers/zbeekman/nightly-docker-rebuild.svg?style=social&label=Watch)](https://github.com/zbeekman/nightly-docker-rebuild)

# :moon: :whale: :hammer_and_wrench: nightly-docker-rebuild :package: :whale2: :sparkles:
Use [nightli.es] to rebuild N docker images on [hub.docker.com]

## Why?

I use this to rebuild [GCC trunk in a docker container] on a nightly basis. If you're interested, take a look at this:
https://hub.docker.com/r/zbeekman/nightly-gcc-trunk-docker-image/.

[Travis-CI.org](https://travis-ci.org) is great but long builds can time out, which is a giant PITA. Docker to the rescue!
By using [docker with Travis-CI](https://docs.travis-ci.com/user/docker/) you get to skip long builds for dependencies.
While Travis-CI itself can be used to build docker images, some will time out before the build can complete. However,
[Docker Hub](https://hub.docker.com) can be used to rebuild docker images (and it's harder to time out here) *BUT*
[nightli.es](https://nightli.es) can only be used to trigger Travis-CI builds.... hmmmmm :thinking: what to do?
[Nightly-docker-rebuild](https://github.com/zbeekman/nightly-docker-rebuild) to the rescue! :tada:

## How?

 1. [Fork](https://github.com/zbeekman/nightly-docker-rebuild/fork)
 2. Clone: `git clone https://github.com/<your_username>/nightly-docker-rebuild && cd nightly-docker-rebuild`
 3. Enable and setup Travis-CI.org (through the online UI or by following the following steps)
 4. `[sudo] gem install travis`
 5. `travis login`
 6. `travis enable`
 7. Get your Docker Hub project end point URL and token from `https://hub.docker.com/r/<USER>/<REPO>/~/settings/automated-builds/`
 8. create encrypted Travis-CI variable to store private end point and token: `travis env set DH_END_POINT_1 https://registry.hub.docker.com/u/<USER>/<REPO>/trigger/<TOKEN>/`
 9. Repeat for an additional nighly builds you want to setup and increment the number on `DH_END_POINT_<N>`
 10. Go to https://nightli.es and enable `nightly-docker-rebuild` after [logging in]:[nightli.es]

[nightli.es]: https://nightli.es/login
[hub.docker.com]: https://hub.docker.com
[GCC trunk in a docker container]: https://github.com/zbeekman/nightly-gcc-trunk-docker-image
