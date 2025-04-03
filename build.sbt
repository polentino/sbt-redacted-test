ThisBuild / version := "0.1.0-SNAPSHOT"

lazy val root = (project in file("."))
  .enablePlugins(RedactedPlugin)
  .settings(
    name := "sbt-redacted-test",
    redactedVersion := "0.7.1"
  )
