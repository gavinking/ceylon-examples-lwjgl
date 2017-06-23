import cuchaz.jfxgl {
    JFXGLLauncher,
    JFXGL {
        ...
    },
    calledByEventsThread
}

import java.lang {
    ObjectArray,
    Str=String,
    IllegalStateException,
    RuntimeException,
    System
}

import javafx.application {
    Application
}
import javafx.geometry {
    Pos
}
import javafx.scene {
    Scene
}
import javafx.scene.control {
    Label
}
import javafx.stage {
    Stage
}

import org.lwjgl.glfw {
    GLFW {
        ...
    },
    Callbacks {
        glfwFreeCallbacks
    },
    GLFWErrorCallback
}
import org.lwjgl.opengl {
    GL {
        createCapabilities
    }
}
import org.lwjgl.system {
    MemoryUtil {
        nil=null
    }
}

shared void run() => JFXGLLauncher.launchMain(`Main`, null);

shared class Main {

    static class HelloWorldApp()
            extends Application() {
        shared actual
        calledByEventsThread
        void start(Stage stage) {
            // create the UI
            value label = Label("Hello World!");
            label.alignment = Pos.center;
            stage.setScene(Scene(label));
        }
    }

    shared static void jfxglmain(ObjectArray<Str> args) {
        GLFWErrorCallback.createPrint(System.err).set();

        // create a window using GLFW
        if (!glfwInit()) {
            throw IllegalStateException("Unable to initialize GLFW");
        }


        if (operatingSystem.name=="mac") {
            glfwWindowHint(glfwContextVersionMajor, 3);
            glfwWindowHint(glfwContextVersionMinor, 2);
            glfwWindowHint(glfwOpenglForwardCompat, glfwTrue);
            glfwWindowHint(glfwOpenglProfile, glfwOpenglCoreProfile);
        }

        value window = glfwCreateWindow(300, 169, "JFXGL", nil, nil);
        if (window == nil) {
            throw RuntimeException("Failed to create the GLFW window");
        }

        // init OpenGL
        glfwMakeContextCurrent(window);
        createCapabilities();

        try {
            // start the JavaFX app
            start(window, args, HelloWorldApp());

            // render loop
            while (!glfwWindowShouldClose(window)) {
                // render the JavaFX UI
                render();

                glfwSwapBuffers(window);
                glfwPollEvents();
            }
        }
        finally {
            // cleanup
            terminate();
            glfwFreeCallbacks(window);
            glfwDestroyWindow(window);
            glfwTerminate();
        }
    }

    shared new () {}
}

