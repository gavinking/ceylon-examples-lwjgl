native ("jvm")
module eg.jfxgl "1.0.0" {
    import maven:cuchaz:"jfxgl" "0.4";
    import maven:cuchaz:"jfxgl-jfxrt" "0.4";

    import maven:org.lwjgl:"lwjgl" "3.1.2";
    import maven:org.lwjgl:"lwjgl-glfw" "3.1.2";
    import maven:org.lwjgl:"lwjgl-opengl" "3.1.2";

    import maven:org.lwjgl:"lwjgl":"natives-macos" "3.1.2";
    import maven:org.lwjgl:"lwjgl-glfw":"natives-macos" "3.1.2";
    import maven:org.lwjgl:"lwjgl-opengl":"natives-macos" "3.1.2";

    import maven:org.lwjgl:"lwjgl":"natives-linux" "3.1.2";
    import maven:org.lwjgl:"lwjgl-glfw":"natives-linux" "3.1.2";
    import maven:org.lwjgl:"lwjgl-opengl":"natives-linux" "3.1.2";

    import maven:org.lwjgl:"lwjgl":"natives-windows" "3.1.2";
    import maven:org.lwjgl:"lwjgl-glfw":"natives-windows" "3.1.2";
    import maven:org.lwjgl:"lwjgl-opengl":"natives-windows" "3.1.2";

    shared import java.base "8";
}
