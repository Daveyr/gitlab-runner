FROM ubuntu:18.04
ARG token
ENV DEBIAN_FRONTEND=noninteractive
COPY runner_install.sh /usr/src
COPY runner_configure.sh /usr/src
RUN apt update
RUN apt install curl -y
WORKDIR /usr/src/ 
RUN sh runner_install.sh
RUN sh runner_configure.sh $token
ENTRYPOINT gitlab-runner --debug run
