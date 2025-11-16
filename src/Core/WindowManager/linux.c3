module aero3::core::linux_window_manager @if(env::LINUX);

import aero3::os::x11;
import aero3::core::events_handler, aero3::window;
import aero3::utils::aero3_errors, aero3::utils::types;

bool quit = false;

struct X11Window {
    XDisplay* display;
    XWindow window;
    XWindow root;
	XScreen screen;
    ZString title;
	XEvent x_events;
	XWindowAttributes attributes;
    XAtom atom_delete_window;
}

fn X11Window? createX11Window(Rect window_size_pos, ZString window_title) {
    XDisplay* display = x11::openDisplay(null);
    if(display == null) { return aero3_errors::AERO3_X11_COULD_NOT_OPEN_DISPLAY?; }

    XWindow root = x11::defaultRootWindow(display);
    if((void*)root == null) { return aero3_errors::AERO3_X11_COULD_NOT_FIND_ROOT?; }

    XScreen screen = x11::defaultScreen(display);

    XWindow window = x11::createSimpleWindow(display,
    root, 
    (Int32)window_size_pos.x, 
    (Int32)window_size_pos.y, 
    (Card64)window_size_pos.w, 
    (Card64)window_size_pos.h, 
    0,
    0,
    0xffffffff);
    if((void*)window == null) { return aero3_errors::AERO3_X11_COULD_NOT_CREATE_WINDOW?; }

    XMask event_mask = x11::EXPOSURE_MASK
        | x11::KEY_PRESS_MASK | x11::KEY_RELEASE_MASK
        | x11::BUTTON_PRESS_MASK | x11::BUTTON_RELEASE_MASK;
    x11::selectInput(display, window, event_mask);
    x11::mapWindow(display, window);

    XAtom wm_delete_window = x11::internAtom(display, x11::WM_DELETE_WINDOW, x11::FALSE);
    x11::setWMProtocols(display, window, &wm_delete_window, 1);

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
        .atom_delete_window = wm_delete_window
    };
}

fn void X11Window.checkEventsX11Window(&self, Aero3Event* parent_events) {
    x11::nextEvent(self.display, &self.x_events);

    switch(self.x_events.type) {
        case x11::EXPOSE:
            break;

        case x11::CLIENT_MESSAGE:
            //XAtom wm_protocols = x11::internAtom(self.display, x11::WM_PROTOCOLS, x11::FALSE);
            if ((XAtom)self.x_events.x_client.data.l[0] == self.atom_delete_window) {
                quit = true;
            }
            break;
        case x11::KEY_PRESS:
            parent_events.btn_event.last_key_code = parent_events.btn_event.key_code;

            parent_events.btn_event.key_code = events_handler::apiKeyCodeToAero3Key((long) self.x_events.x_key.keycode);

            parent_events.btn_event.key_up = false;
            parent_events.btn_event.key_down = true;

            parent_events.type = events_handler::KEY_PRESSED;
            break;
        case x11::KEY_RELEASE:
            parent_events.btn_event.last_key_code = parent_events.btn_event.key_code;

            parent_events.btn_event.key_code = events_handler::apiKeyCodeToAero3Key((long) self.x_events.x_key.keycode);

            parent_events.btn_event.key_up = true;
            parent_events.btn_event.key_down = false;

            parent_events.type = events_handler::KEY_RELEASED;
            break;
    }
    if (quit) {
        parent_events.type = events_handler::QUIT;
    }
}
fn void X11Window.closeX11Window(&self) {
    x11::destroyWindow(self.display, self.window);
    x11::closeDisplay(self.display);
}
