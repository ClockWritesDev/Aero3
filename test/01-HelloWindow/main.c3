module hellowindow_aero3;

import aero3::window;
import aero3::utils::types, aero3::inputs;

fn void main(String[] args)
{
    Aero3Window win = window::createWindow("Hello World", (Rect){100, 100, 640, 320})!!;

    while (!win.windowShouldClose()) {
        win.updateWindow();
        if (win.isKeyPressed(inputs::Aero3Key.ESCAPE)) {
            win.setShouldClose();
        }
    }
    win.closeWindow();
}