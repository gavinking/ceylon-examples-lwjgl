import cuchaz.jfxgl {
    JFXGLLauncher,
    JFXGL,
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
    GLFW,
    Callbacks,
    GLFWErrorCallback
}
import org.lwjgl.opengl {
    GL
}
import org.lwjgl.system {
    MemoryUtil {
        nil=null
    }
}

shared void run() {
//    System.setProperty(
//            Configuration.libraryPath.property,
//            "natives");
    JFXGLLauncher.launchMain(`Main`, null);
}

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
        if (!GLFW.glfwInit()) {
            throw IllegalStateException("Unable to initialize GLFW");
        }

        value window
                = GLFW.glfwCreateWindow(300, 169, "JFXGL", nil, nil);
        if (window == nil) {
            throw RuntimeException("Failed to create the GLFW window");
        }

        // init OpenGL
        GLFW.glfwMakeContextCurrent(window);
        GL.createCapabilities();

        try {
            // start the JavaFX app
            JFXGL.start(window, args, HelloWorldApp());

            // render loop
            while (!GLFW.glfwWindowShouldClose(window)) {
                // render the JavaFX UI
                JFXGL.render();

                GLFW.glfwSwapBuffers(window);
                GLFW.glfwPollEvents();
            }
        }
        finally {
            // cleanup
            JFXGL.terminate();
            Callbacks.glfwFreeCallbacks(window);
            GLFW.glfwDestroyWindow(window);
            GLFW.glfwTerminate();
        }
    }

    shared new () {}
}

