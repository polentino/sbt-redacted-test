#!/bin/bash

set -e  # Exit immediately if any command fails

SBT_REDACTED_VERSION="0.1.0-SNAPSHOT"

JVM_VERSIONS=("8" "11" "17")
SBT_VERSIONS=("1.5.8" "1.9.7" "1.10.11")
SCALA_VERSIONS=("2.12.20" "2.13.16" "3.1.3")

for jvm in "${JVM_VERSIONS[@]}"; do
  for sbt in "${SBT_VERSIONS[@]}"; do
    for scala in "${SCALA_VERSIONS[@]}"; do
      echo "=============[JDK:$jvm][Sbt:$sbt][Scala:$scala]============="

      export JVM_VERSION=$jvm
      export SBT_VERSION=$sbt
      export SCALA_VERSION=$scala
      export SBT_REDACTED_PLUGIN_VERSION=$SBT_REDACTED_VERSION

      docker-compose up --build --abort-on-container-exit --exit-code-from sbt_runner

      # Stop and clean up containers after each run
      docker-compose down
    done
  done
done
