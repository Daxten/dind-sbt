FROM jpetazzo/dind

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-get update && apt-get install -y software-properties-common python-software-properties debconf-utils fakeroot
RUN apt-add-repository -y ppa:webupd8team/java \
    echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN apt-get update && apt-get install -y oracle-java8-installer sbt
RUN export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xss2M -Duser.timezone=GMT"

VOLUME ["/root/.ivy2", "/var/lib/docker"]
ENTRYPOINT ["wrapdocker"]