FROM java:openjdk-8-jdk

LABEL CREATER="Barnett@goodrain" 

RUN cd ~ && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/4.1.1/mule-standalone-4.1.1.tar.gz && echo "09aa1448536c9273562eded1a9236609 mule-standalone-4.1.1.tar.gz" | md5sum -c

RUN cd /opt && tar xvzf ~/mule-standalone-4.1.1.tar.gz && rm ~/mule-standalone-4.1.1.tar.gz && ln -s /opt/mule-standalone-4.1.1 /opt/mule

# Define environment variables.
ENV MULE_HOME /opt/mule

# Define mount points.
VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains"]

# Define working directory.
WORKDIR /opt/mule

CMD [ "/opt/mule/bin/mule" ]

# Default http port
EXPOSE 8081
