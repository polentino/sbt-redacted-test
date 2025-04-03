FROM ubuntu:22.04

ARG JVM_VERSION
ARG SCALA_VERSION
ARG SBT_VERSION

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    openjdk-${JVM_VERSION}-jdk \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install sbt
RUN curl -L https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz | tar -xz -C /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt

# Set Java environment
ENV JAVA_HOME /usr/lib/jvm/java-${JVM_VERSION}-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Set working directory
WORKDIR /app

# Override Scala & Sbt version
RUN echo "ThisBuild / scalaVersion := \"${SCALA_VERSION}\"" > version.sbt
RUN mkdir -p /app/project &&  echo "sbt.version = ${SBT_VERSION}" > ./project/build.properties
