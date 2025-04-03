package io.github.polentino.testredacted

import io.github.polentino.redacted.redacted

object main {
  private final case class Test(@redacted email: String, nick: String)


  def main(args: Array[String]): Unit = {
    val test = Test("John", "john@test.com")
    val string = s"$test"
    val expected = "Test(***,john@test.com)"
    if( string == expected) println("SUCCESS!")
    else throw new RuntimeException("REDACTION FAILED!")
  }
}
