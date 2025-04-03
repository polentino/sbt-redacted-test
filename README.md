# sbt-redacted-test

Just a simple stress-test suite to ensure that a Scala project
using [sbt-redacted](https://github.com/polentino/sbt-redacted) plugin
and [@redacted](https://github.com/polentino/redacted) annotation works for a combination of different JVM, Sbt and
Scala versions.

## Usage

Open `run_test.sh` and set the version of the plugin that you'd like to test, like so

```shell
SBT_REDACTED_VERSION="x.y.z.-SNAPSHOT"
```

Save the file, and then you can run `./run_test.sh` to run the sample project across all jmv/sbt/scala versions in the
compatibility matrix

## Compatibility Matrix

| JVM  |    Sbt    |   Scala   |
|:----:|:---------:|:---------:|
| `8`  |  `1.5.8`  | `2.12.20` |
| `11` |  `1.9.7`  | `2.13.16` |
| `17` | `1.10.11` |  `3.1.3`  |
