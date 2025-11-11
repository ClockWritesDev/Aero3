# Aero3 Framework
<div style="flex-direction=row;">
<img src="./Aero3_Logo.svg" width="20%" style="margin=auto;">
A cross-platform window library for creating graphical programs using native OS libs. Written in C3 lang.
<div>
<br>

# About
Aero3 is a free cross-platform window handler framework for graphical programs modified on top of the RGFW library from C programming language.
Credits for the RGFW inspiration: Copyright (C) 2022-2025 Riley Mabb (@ColleagueRiley)

# Getting started
```rust
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
```

# Building Aero3 Lib Dependency
```sh
c3c build Aero3 --trust=true
```

# Building Aero3 Hello World Window Test
```sh
// Linux
c3c build Linux-HelloWorld-Aero3

// Windows
c3c build Windows-HelloWorld-Aero3
```