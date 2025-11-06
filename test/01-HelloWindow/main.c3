module hellowindow_aero3;
import aero3::core::window;
import aero3::utils::types;
import std::io;

fn void main(String[] args)
{
    Aero3Window win = window::createWindow("Hello World", (Rect){100, 100, 640, 320})!!;

    while (!win.windowShouldClose()) {
        win.updateWindow();
    }
    win.closeWindow();
}