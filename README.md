# Aero3 Framework
![Aero3 LOGO]()

A cross-platform window library for creating graphical programs using native OS libs. Written in C3 lang.

# About
Aero3 is a free cross-platform window handler framework for graphical programs modified on top of the RGFW library fo the c programming language.

# Getting started
```rust
module hellowindow_areo3;
import aero3::utils::types, aero3::core::windowhandler;
import std::io;

fn void main(String[] args)
{
    Aero3Window* win = createAero3Window("HelloWindow", (Rect){0, 0, 500, 500}, CENTER);
    defer closeAero3Window(win);

    bool running = true;

    while (running) {
        Aero3Event* events = checkEvent(win);
        if (events != null) {
            io::printfn("event type %d", events.type.ordinal);
            if (events.keyCode == Aero3Key.ESCAPE) running = false;
        }
    }   
}
```

```sh
c3c build
```
