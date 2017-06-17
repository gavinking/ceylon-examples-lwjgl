# Ceylon LWJGL samples

This sample project demonstrates the use of [LWJGL][] in the
[Ceylon programming language][Ceylon]. It also shows the use
of [JFXGL][] which allows you to use JavaFX from within LWJGL.

[LWJGL]: https://www.lwjgl.org/
[JFXGL]: https://bitbucket.org/cuchaz/jfxgl
[Ceylon]: http://ceylon-lang.org

## Requirements

The following software must be installed:

- Java 8 or above
- [LWJGL][] native libraries: `liblwjgl.*`, `libglfw.*`, and 
  `liblwjgl_opengl.*` for your operating system
  (`.dll`, `.so`, or `.dylib`)

The LWJGL native libraries come packaged in `.jar` files. 
Extract the libraries from the `.jar`s and place them in a 
`natives` directory.

To play with the samples from within IntelliJ, you'll also
need to install Ceylon IDE for IntelliJ 1.3.2.

The Ceylon 1.3.2 command line tools are not required, since
the `ceylonb` command is self-installing. However, if you do
already have them installed, you can type `ceylon` instead 
of `./ceylonb` at the command line.

## Compiling and running

To compile the examples, type:

    ./ceylonb compile

To run the examples, type:

    export JAVA_OPTS="-XstartOnFirstThread -Dorg.lwjgl.librarypath=natives"
    ./ceylonb run eg.lwjgl
    ./ceylonb run eg.jfxgl

Where `natives` is the path to a directory containing the 
LWJGL native libraries (`.dll`, `.so`, or `.dylib`).

## Known issues

The JFXGL sample currently crashes on Mac, due to JFXGL 
requiring OpenGL 3 with support for compat profiles, which 
is not available in MacOS.