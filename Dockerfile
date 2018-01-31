FROM jpetazzo/dind

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-get update && apt-get install -y bc software-properties-common python-software-properties debconf-utils fakeroot
RUN apt-add-repository -y ppa:webupd8team/java
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo bash 
RUN apt-get update && apt-get install -y oracle-java8-installer sbt nodejs openssh-client
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn
RUN export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xss2M -Duser.timezone=GMT"
RUN export SBT_OPTS="${SBT_OPTS} -Dsbt.jse.engineType=Node -Dsbt.jse.command=$(which node)"

VOLUME ["/root/.ivy2", "/var/lib/docker"]
ENTRYPOINT ["wrapdocker"]
