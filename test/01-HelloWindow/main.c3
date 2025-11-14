module hellowindow_aero3;

import aero3::window;
import aero3::utils::types, aero3::inputs;

import std::io;

fn void main(String[] args)
{
    Aero3Window win = window::createWindow("Hello World", (Rect){100, 100, 640, 320})!!;

    while (!win.windowShouldClose()) {
        win.checkEvents();
        if (win.isKeyPressed(inputs::Aero3Key.ESCAPE)) {
            win.setShouldClose();
        }
        io::printfn("%s", win.getKeyPressed());
    }
    win.closeWindow();
}