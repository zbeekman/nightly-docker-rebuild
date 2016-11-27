# nightly-docker-rebuild
Use nightli.es to rebuild N docker images on hub.docker.com

## Why?

I use this to rebuild GCC trunk in a docker container on a nightly basis. If you're interested in this take a look at this:
https://hub.docker.com/r/zbeekman/docker-gcc-build/.

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
 7. Get your Docker Hub project end point URL and token from https://hub.docker.com/r/<USER>/<REPO>/~/settings/automated-builds/
 8. `travis env set DH_END_POINT_1 https://registry.hub.docker.com/u/<USER>/<REPO>/trigger/<TOKEN>/` # create encrypted Travis-CI variable to store private end point and token
 9. Repeat for an additional nighly builds you want to setup and increment the number on `DH_END_POINT_<N>`
 10. Go to https://nightli.es and enable `nightly-docker-rebuild`