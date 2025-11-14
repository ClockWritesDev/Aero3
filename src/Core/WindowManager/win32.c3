module aero3::core::win32_window_manager;

import aero3::os::win32_types, aero3::os::win32_ffi;
import aero3::core::events_handler, aero3::window;
import aero3::utils::aero3_errors, aero3::utils::types;

bool quit = false;

struct Win32Window {
    Hwnd window;
    Hinstance hinstance;
    WndClassEx win_class;
    WString title;
}

fn Lresult windowProcessMessage(Hwnd window, uint msg, Wparam wParam, Lparam lParam) {
    Lresult result;

    switch(msg) {
        case win32_types::WM_CLOSE:
        case win32_types::WM_QUIT:
            quit = true;
            break;

        default:
            result = win32_ffi::win32_DefWindowProc(window, msg, wParam, lParam);
            break;
    }

    return result;
}

fn Win32Window? createWin32Window(Rect window_size_pos, WString class_name) {
    WndClassEx window_class;
    Hinstance instance = win32_ffi::win32_GetModuleHandleA((Lpcwstr)0);

    window_class.cbSize = WndClassEx.sizeof;
    window_class.style = win32_types::CS_HREDRAW | win32_types::CS_VREDRAW;
    window_class.lpfnWndProc = &windowProcessMessage;
    window_class.hInstance = instance;
    window_class.hCursor = win32_ffi::win32_LoadCursor(null, win32_types::IDC_ARROW);
    window_class.hbrBackground = win32_ffi::win32_CreateSolidBrush(0x00FFFFFF); // fundo branco
    window_class.lpszClassName = class_name;

    win32_ffi::win32_RegisterClassEx(&window_class);
    
    Hwnd window_handle = win32_ffi::win32_CreateWindowEx(
        0,
        (Lpcwstr)class_name,
        (Lpcwstr)class_name,
        win32_types::WS_OVERLAPPEDWINDOW | win32_types::WS_VISIBLE,
        window_size_pos.x,
        window_size_pos.y,
        window_size_pos.w,
        window_size_pos.h,
        null,
        null,
        instance,
        null
    );
    if(window_handle == null) { return aero3_errors::AERO3_WIN32_COULD_NOT_CREATE_WINDOW?; }
    
    win32_ffi::win32_ShowWindow(window_handle, win32_types::SW_SHOW);

    return (Win32Window) {
        .window = window_handle,
        .hinstance = instance,
        .win_class = window_class,
        .title = class_name
    };
}

fn void Win32Window.checkEventsWin32Window(&self, Aero3Event* parent_events) {
    Msg msg;

    if (win32_ffi::win32_PeekMessageA(&msg, self.window, 0, 0, win32_types::PM_REMOVE)) {
        switch (msg.message) {
            case win32_types::WM_ACTIVATE:
                parent_events.inFocus = msg.wParam == win32_types::WA_INACTIVE;

                if (parent_events.inFocus) {
                    parent_events.type = events_handler::FOCUS_IN;
                }
                else {
                    parent_events.type = events_handler::FOCUS_OUT;
                }
                break;

            case win32_types::WM_WINDOWPOSCHANGED:
                break;
            
            case win32_types::WM_KEYUP:
                parent_events.btn_event.last_key_code = parent_events.btn_event.key_code;

                parent_events.btn_event.key_code = events_handler::apiKeyCodeToAero3Key((long) msg.wParam);

                parent_events.btn_event.key_up = true;
                parent_events.btn_event.key_down = false;

                parent_events.type = events_handler::KEY_RELEASED;
                break;
            case win32_types::WM_KEYDOWN:
                parent_events.btn_event.last_key_code = parent_events.btn_event.key_code;

                parent_events.btn_event.key_code = events_handler::apiKeyCodeToAero3Key((long) msg.wParam);

                parent_events.btn_event.key_up = false;
                parent_events.btn_event.key_down = true;

                parent_events.type = events_handler::KEY_PRESSED;
                break;
            /*
            case WM_MOUSELEAVE:
                win->event.type = RGFW_mouseLeave;
                win->src.winArgs |= RGFW_MOUSE_LEFT;
                RGFW_mouseNotifyCallBack(win, win->event.point, 0);
                break;
            case WM_MOUSEMOVE:
                win->event.type = RGFW_mousePosChanged;

                win->event.point.x = GET_X_LPARAM(msg.lParam);
                win->event.point.y = GET_Y_LPARAM(msg.lParam);

                RGFW_mousePosCallback(win, win->event.point);

                if (win->src.winArgs & RGFW_MOUSE_LEFT) {
                    win->src.winArgs ^= RGFW_MOUSE_LEFT;
                    win->event.type = RGFW_mouseEnter;
                    RGFW_mouseNotifyCallBack(win, win->event.point, 1);
                }

                break;

            case WM_LBUTTONDOWN:
                win->event.button = RGFW_mouseLeft;
                RGFW_mouseButtons_prev[win->event.button] = RGFW_mouseButtons[win->event.button];
                RGFW_mouseButtons[win->event.button] = 1;
                win->event.type = RGFW_mouseButtonPressed;
                RGFW_mouseButtonCallback(win, win->event.button, win->event.scroll, 1);
                break;
            case WM_RBUTTONDOWN:
                win->event.button = RGFW_mouseRight;
                win->event.type = RGFW_mouseButtonPressed;
                RGFW_mouseButtons_prev[win->event.button] = RGFW_mouseButtons[win->event.button];
                RGFW_mouseButtons[win->event.button] = 1;
                RGFW_mouseButtonCallback(win, win->event.button, win->event.scroll, 1);
                break;
            case WM_MBUTTONDOWN:
                win->event.button = RGFW_mouseMiddle;
                win->event.type = RGFW_mouseButtonPressed;
                RGFW_mouseButtons_prev[win->event.button] = RGFW_mouseButtons[win->event.button];
                RGFW_mouseButtons[win->event.button] = 1;
                RGFW_mouseButtonCallback(win, win->event.button, win->event.scroll, 1);
                break;*/

            case win32_types::WM_MOUSEWHEEL:
                parent_events.mouse_event.last_mouse_code = parent_events.mouse_event.mouse_code;
                if (msg.wParam > 0) {
                    parent_events.mouse_event.mouse_code = events_handler::MOUSE_SCROLL_UP;
                } else {
                    parent_events.mouse_event.mouse_code = events_handler::MOUSE_SCROLL_DOWN;
                }

                parent_events.mouse_event.scroll = (double) msg.wParam / win32_types::WHEEL_DELTA;

                parent_events.type = events_handler::MOUSE_PRESSED;
               // RGFW_mouseButtonCallback(win, win->event.button, win->event.scroll, 1);
                break;

            case win32_types::WM_LBUTTONUP:
                parent_events.mouse_event.last_mouse_code = parent_events.mouse_event.mouse_code;
                parent_events.mouse_event.mouse_code = events_handler::LEFT_MOUSE;
                parent_events.type = events_handler::MOUSE_RELEASED;

                //RGFW_mouseButtonCallback(win, win->event.button, win->event.scroll, 0);
                break;
            case win32_types::WM_RBUTTONUP:
                parent_events.mouse_event.last_mouse_code = parent_events.mouse_event.mouse_code;
                parent_events.mouse_event.mouse_code = events_handler::RIGHT_MOUSE;
                parent_events.type = events_handler::MOUSE_RELEASED;

                //RGFW_mouseButtonCallback(win, win->event.button, win->event.scroll, 0);
                break;
            case win32_types::WM_MBUTTONUP:
                parent_events.mouse_event.last_mouse_code = parent_events.mouse_event.mouse_code;
                parent_events.mouse_event.mouse_code = events_handler::MIDDLE_MOUSE;
                parent_events.type = events_handler::MOUSE_RELEASED;

                //RGFW_mouseButtonCallback(win, win->event.button, win->event.scroll, 0);
                break;
            default:
                //Default Mouse Idle Event
                parent_events.mouse_event.last_mouse_code = parent_events.mouse_event.mouse_code;
                parent_events.mouse_event.mouse_code = events_handler::MOUSE_IDLE;
                parent_events.mouse_event.clicked = false;
                
                //Default Button Idle Event
                parent_events.btn_event.last_key_code = parent_events.btn_event.key_code;
                parent_events.btn_event.key_code = events_handler::apiKeyCodeToAero3Key(0x0000);
                parent_events.btn_event.key_up = false;
                parent_events.btn_event.key_down = false;

                parent_events.type = events_handler::EVENT_IDLE;
                break;
        }

        if (quit) {
            parent_events.type = events_handler::QUIT;
        }

        win32_ffi::win32_TranslateMessage(&msg);
        win32_ffi::win32_DispatchMessage(&msg);
    }
}
fn void Win32Window.closeWin32Window(&self) {
    win32_ffi::win32_DestroyWindow(self.window);
    win32_ffi::win32_PostQuitMessage(0);
}
