FROM gitlab/dind:latest

RUN echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-add-repository ppa:webupd8team/java
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN apt-get update
RUN apt-get install -y oracle-java8-installer sbt

VOLUME ["/root/.ivy2"]
