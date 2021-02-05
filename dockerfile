FROM ubuntu:18.04
ARG token
ARG concurrent=1
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install curl -y
COPY runner_install.sh /usr/src
COPY runner_configure.sh /usr/src
WORKDIR /usr/src/ 
RUN sh runner_install.sh
RUN sh runner_configure.sh $token $concurrent
ENTRYPOINT gitlab-runner --debug run
