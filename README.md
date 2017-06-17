# Ceylon LWJGL samples

This sample project demonstrates the use of [LWJGL][] in the
[Ceylon programming language][Ceylon]. It also shows the use
of [JFXGL][] which allows you to use JavaFX from within LWJGL.

[LWJGL]: https://www.lwjgl.org/
[JFXGL]: https://bitbucket.org/cuchaz/jfxgl
[Ceylon]: http://ceylon-lang.org

## Requirements

The following software must be installed:

- To compile and run the samples: Java 8 or above
- To play with the samples from within IntelliJ: 
  Ceylon IDE for IntelliJ 1.3.3.

The Ceylon 1.3.3 command line tools are not required, since
the `ceylonb` command is self-installing. However, if you do
already have them installed, you can type `ceylon` instead 
of `./ceylonb` at the command line.

## Compiling and running

To compile the examples, type:

    ./ceylonb compile

To run the examples, type:

    export JAVA_OPTS=-XstartOnFirstThread
    ./ceylonb run eg.lwjgl
    ./ceylonb run eg.jfxgl

## Assembling a fat jar

To assemble a "fat" jar containing the sample and all its
dependencies, type:

    ./ceylonb fat-jar eg.lwjgl
    
To run the resulting jar, type:

    java -XstartOnFirstThread -jar eg.lwjgl-1.0.0.jar

## Packaging a Ceylon assembly archive

To package the example module as a `.cas` assembly archive, 
type:

    ./ceylonb assemble joggly

To run the resulting archive, type:

    ./ceylonb run -a joggly-1.0.0.cas

## Known issues

The JFXGL sample currently crashes on Mac, due to JFXGL 
requiring OpenGL 3 with support for compat profiles, which 
is not available in MacOS.