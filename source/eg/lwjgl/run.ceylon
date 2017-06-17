import java.lang {
    System,
    IllegalStateException,
    RuntimeException
}

import org.lwjgl {
    Version
}
import org.lwjgl.glfw {
    Callbacks {
        ...
    },
    GLFW {
        ...
    },
    GLFWErrorCallback
}
import org.lwjgl.opengl {
    GL {
        ...
    },
    GL11 {
        ...
    }
}
import org.lwjgl.system {
    MemoryStack,
    MemoryUtil {
        nil=null
    }
}

variable Integer window = 0;

shared void run() {
    print("Hello LWJGL ``Version.version``!");
    init();
    loop();
    glfwFreeCallbacks(window);
    glfwDestroyWindow(window);
    glfwTerminate();
    glfwSetErrorCallback(null).free();
}

void init() {
    GLFWErrorCallback.createPrint(System.err).set();
    if (!glfwInit()) {
        throw IllegalStateException("Unable to initialize GLFW");
    }
    glfwDefaultWindowHints();
    glfwWindowHint(glfwVisible, glfwFalse);
    glfwWindowHint(glfwResizable, glfwTrue);
    window = glfwCreateWindow(300, 300, "Hello World!", nil, nil);
    if (window == nil) {
        throw RuntimeException("Failed to create the GLFW window");
    }
    glfwSetKeyCallback(window,
            (window, key, scancode, action, mods) {
                if (key == glfwKeyEscape,
                    action == glfwRelease) {
                    glfwSetWindowShouldClose(window, true);
                }
            });
    try (stack = MemoryStack.stackPush()) {
        value pWidth = stack.mallocInt(1);
        value pHeight = stack.mallocInt(1);
        glfwGetWindowSize(window, pWidth, pHeight);
        value vidmode = glfwGetVideoMode(glfwGetPrimaryMonitor());
        glfwSetWindowPos(window,
            (vidmode.width() -pWidth.get(0)) / 2,
            (vidmode.height() -pHeight.get(0)) / 2);
    }
    glfwMakeContextCurrent(window);
    glfwSwapInterval(1);
    glfwShowWindow(window);
}

void loop() {
    createCapabilities();
    glClearColor(1.0, 0.0, 0.0, 0.0);
    while (!glfwWindowShouldClose(window)) {
        glClear(glColorBufferBit.or(glDepthBufferBit));
        glfwSwapBuffers(window);
        glfwPollEvents();
    }
}

