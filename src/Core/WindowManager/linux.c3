module aero3::core::linux_window_manager @if(env::LINUX);

import aero3::os::linux_types, aero3::os::linux_ffi;
import aero3::core::events_handler, aero3::window;
import aero3::utils::aero3_errors, aero3::utils::types;

bool quit = false;

struct X11Window {
    Display* display;
    Window window;
    Window root;
	Screen screen;
    ZString title;
	XEvent x_events;
	XWindowAttributes attributes;
    Atom atom_delete_window;
}

fn X11Window? createX11Window(Rect window_size_pos, ZString window_title) {
    Display* display = linux_ffi::x11_XOpenDisplay(null);
    if(display == null) { return aero3_errors::AERO3_X11_COULD_NOT_OPEN_DISPLAY?; }

    Window root = linux_ffi::x11_DefaultRootWindow(display);
    if(display == null) { return aero3_errors::AERO3_X11_COULD_NOT_FIND_ROOT?; }

    Screen screen = linux_ffi::x11_XDefaultScreen(display);

    Window window = linux_ffi::x11_XCreateSimpleWindow(display, 
    root, 
    (Int32)window_size_pos.x, 
    (Int32)window_size_pos.y, 
    (Card64)window_size_pos.w, 
    (Card64)window_size_pos.h, 
    0,
    0,
    0xffffffff);
    if(display == null) { return aero3_errors::AERO3_X11_COULD_NOT_CREATE_WINDOW?; }

    linux_ffi::x11_XMapWindow(display, window);

    Atom wm_delete_window = linux_ffi::x11_XInternAtom(display, linux_types::WM_DELETE_WINDOW, linux_types::FALSE);
    linux_ffi::x11_XSetWMProtocols(display, window, &wm_delete_window, 1);

    XEvent x_events;
    
    XWindowAttributes wind_attributes;
    
    return (X11Window) {
        .display = display,
        .window = window,
        .root = root,
        .screen = screen,
        .title = window_title,
        .x_events = x_events,
        .attributes = wind_attributes,
        .atom_delete_window =wm_delete_window
    };
}

fn void X11Window.checkEventsX11Window(&self, Aero3Event* parent_events) {
    linux_ffi::x11_XNextEvent(self.display, &self.x_events);

    switch(self.x_events.type) {
        case linux_types::KEYPRESS:
        	self.closeX11Window();
            break;
    }
}
fn void X11Window.closeX11Window(&self) {
    linux_ffi::x11_XDestroyWindow(self.display, self.window);
    linux_ffi::x11_XCloseDisplay(self.display);
}
