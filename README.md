# README
A runner is a server that is able to execute a CI/CD pipeline. These pipelines contain one or more jobs that check a version controlled repository for build errors, code style, etc. This repository contains a dockerfile and bash scripts to make a Gitlab runner. It is intended to be used with a Gitlab repository that has a CI/CD pipeline configured according to a `.gitlab-ci.yml` file in the parent directory. 

As long as the base image in your .gitlab-ci.yml file is compatible with arm architecture, this runner will work on a Raspberry Pi. If the base image isn't compatible then you will have the same experience as [this](https://www.talvbansal.me/blog/maximising-gitlab-ci-s-free-tier/). Of course, you can build this image on an x86 machine and it will work with most base images a CI file is likely to contain.

*Note* that this currently does not work when building the image on windows systems, unless possibly if you use [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10). It is verified working on x86 Ubuntu 20 and arm Raspbian.

## To build

Instructions from https://www.devils-heaven.com/gitlab-runner-finally-use-your-raspberry-pi/. Note that you should copy the token that is located on your gitlab account, found under the project menu:
Settings> CI / CD> Runners>Specific Runners

```
docker build -t gitlab-runner --build-arg token=<TOKEN> .
```

## To run

From https://itnext.io/docker-in-docker-521958d34efd. Note we need to mount a volume as we run the container. This is because the runner depends on Docker. Running Docker in a Docker container is tricky so the easiest method is to "borrow" the host Docker service instead, which we do by mounting its .sock file.

```
docker run -v /var/run/docker.sock:/var/run/docker.sock gitlab-runner
```
