import cuchaz.jfxgl {
    JFXGLLauncher,
    JFXGL,
    calledByEventsThread
}

import java.lang {
    ObjectArray,
    Str=String
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
    Callbacks
}
import org.lwjgl.opengl {
    GL
}
import org.lwjgl.system {
    MemoryUtil
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
        // create a window using GLFW
        GLFW.glfwInit();
        value hwnd
                = GLFW.glfwCreateWindow(300, 169, "JFXGL",
                        MemoryUtil.null, MemoryUtil.null);

        // init OpenGL
        GLFW.glfwMakeContextCurrent(hwnd);
        GL.createCapabilities();

        try {
            // start the JavaFX app
            JFXGL.start(hwnd, args, HelloWorldApp());

            // render loop
            while (!GLFW.glfwWindowShouldClose(hwnd)) {
                // render the JavaFX UI
                JFXGL.render();

                GLFW.glfwSwapBuffers(hwnd);
                GLFW.glfwPollEvents();
            }
        }
        finally {
            // cleanup
            JFXGL.terminate();
            Callbacks.glfwFreeCallbacks(hwnd);
            GLFW.glfwDestroyWindow(hwnd);
            GLFW.glfwTerminate();
        }
    }

    shared new () {}
}

