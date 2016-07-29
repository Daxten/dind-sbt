FROM gitlab/dind:latest

RUN echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties debconf-utils
RUN apt-add-repository -y ppa:webupd8team/java
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN apt-get update
RUN apt-get install -y oracle-java8-installer sbt

VOLUME ["/root/.ivy2"]
