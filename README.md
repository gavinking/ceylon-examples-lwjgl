# Ceylon LWJGL samples

This sample project demonstrates the use of [LWJGL][] in the
[Ceylon programming language][Ceylon]. It also shows the use
of [JFXGL][] which allows you to use JavaFX from within LWJGL.

[LWJGL]: https://www.lwjgl.org/
[JFXGL]: https://bitbucket.org/cuchaz/jfxgl
[Ceylon]: http://ceylon-lang.org

## Requirements

The following software must be installed:

- Java 8
- [Ceylon][] 1.3.3 command line tools
- [LWJGL][] native libraries: `liblwjgl.*`, `libglfw.*`, and 
  `liblwjgl_opengl.*` for your operating system
  (`.dll`, `.so`, or `.dylib`)

Note, the LWJGL native libraries come packaged in `.jar` 
files. Extract the libraries from the `.jar`s and place them
in a `natives` directory.

To play with the samples from within IntelliJ, you'll also
need to install Ceylon IDE for IntelliJ.

## Compiling and running

To compile the examples, type:

    ceylon compile

To run the examples, type:

    export JAVA_OPTS="-XstartOnFirstThread -Dorg.lwjgl.librarypath=natives"
    ceylon run eg.lwjgl
    ceylon run eg.jfxgl

Where `natives` is the path to a directory containing the 
LWJGL native libraries (`.dll`, `.so`, or `.dylib`).