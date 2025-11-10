module aero3;

import aero3::core::win32_window_manager @norecurse;
import aero3::core::linux_window_manager @norecurse;
import aero3::core::events_handler, aero3::inputs;
import aero3::utils::types, aero3::utils::aero3_errors;
import aero3::math::collections;
import aero3::logger, aero3::logger::registry;

import std::io;
import std::thread;

const TRANSPARENT_WINDOW = (1L<<9);
const NO_BORDER = (1L<<3);
const NO_RESIZE = (1L<<4);
const ALLOW_DND = (1L<<5);
const HIDE_MOUSE = (1L<<6);
const FULLSCREEN = (1L<<8);

const CENTER = (1L<<10);
const OPENGL_SOFTWARE = (1L<<11);

const SCALE_TO_MONITOR = (1L<<13);

struct Aero3Window {
	X11Window src @if(env::LINUX);
    Win32Window src @if(env::WIN32);
	WString title @if(env::WIN32);
	ZString title @if(env::LINUX);
	Aero3Monitor current_monitor;
    Aero3Event events;
    Rect window_size_pos;
	LogRegistries window_registry;
}
struct Aero3Monitor {
	String monitor_name;
	Rect monitor_size_pos;
	float sizeX;
	float sizeY;
	float realW;
	float realH;
}
struct Aero3Icon {
	char* data;

}
struct Aero3Image {
	char* data;
	Vec2 size;
	float rotation;
}

fn Aero3Window? createWindow(String title, Rect window_size_pos) {
	LogRegistries window_registry = registry::newRegistry(registry::CAT_WINDOW);
    Aero3Monitor current_monitor;
	Aero3Event event;

    $if $defined(env::WIN32):
        WString title_win_style = String.to_wstring(title, allocator::mem)!!;
        Win32Window? src = win32_window_manager::createWin32Window(window_size_pos, title_win_style);
		if (catch src) {
			window_registry.registerLog("WIN32 Window Could Not Be Created", registry::REG_FATAL);
			window_registry.log();
			return aero3_errors::AERO3_WIN32_COULD_NOT_CREATE_WINDOW?;
		}

		window_registry.registerLog("Creating WIN32 Window");
        window_registry.log();

        return (Aero3Window) {src, title_win_style, current_monitor, event, window_size_pos, window_registry};
    $endif
    $if $defined(env::LINUX):

    $endif
}

fn void Aero3Window.updateWindow(&self) {
    $if $defined(env::WIN32):
        self.src.updateWin32Window(&self.events);
    $endif
    $if $defined(env::LINUX):

    $endif
}
fn void Aero3Window.closeWindow(&self) {
	self.window_registry.registerLog("Closing & Deleting Window");
	defer self.window_registry.log();

    $if $defined(env::WIN32):
        self.src.closeWin32Window();
    $endif
    $if $defined(env::LINUX):

    $endif
}

fn bool Aero3Window.windowShouldClose(&self) {
    return (self.events.type == events_handler::QUIT);
}
fn void Aero3Window.setShouldClose(&self) {
	self.events.type = events_handler::QUIT;
}

fn void Aero3Window.swapBuffers(&self) {}
fn void Aero3Window.setVsync(&self, bool vSync) {}
fn void Aero3Window.sleep(&self, int secs) { thread::sleep_ms((ulong)secs/1000); }

fn void Aero3Window.moveWindow(&self, Vec2 new_pos) {}
fn void Aero3Window.moveWindowToMonitor(&self, Aero3Monitor monitor) {}
fn void Aero3Window.resizeWindow(&self, Area area) {}
fn void Aero3Window.setWindowMinSize(&self, Area area) {}
fn void Aero3Window.setWindowMaxSize(&self, Area area) {}
fn void Aero3Window.maximizeWindow(&self) {}
fn void Aero3Window.minimizeWindow(&self) {}
fn void Aero3Window.restoreWindow(&self) {}
fn void Aero3Window.setWindowBorder(&self, bool border) {}
fn void Aero3Window.setWindowName(&self, String new_name) {}
fn void Aero3Window.setWindowIcon(&self, Aero3Icon icon, Area area, int channels) {}
fn void Aero3Window.hideWindow(&self) {}
fn void Aero3Window.showWindow(&self) {}

fn void Aero3Window.setMouse(&self, Aero3Image image, Area area, int channels) {}
fn void Aero3Window.setMouseStandard(&self, char mouse) {}
fn void Aero3Window.setMouseDefault(&self) {}
fn void Aero3Window.windowMouseHold(&self, Area area) {}
fn void Aero3Window.windowMouseUnhold(&self) {}
fn Point Aero3Window.getGlobalMousePoint(&self) {

	return (Point) {};
}
fn Point Aero3Window.getMousePoint(&self) {
	
	return (Point) {};
}
fn void Aero3Window.showMouse(&self, bool show) {}
fn void Aero3Window.moveMouse(&self, Vec2 pos) {}

fn bool Aero3Window.isFullscreen(&self) {
	return true;
}
fn bool Aero3Window.isHidden(&self) {
	return true;
}
fn bool Aero3Window.isMinimized(&self) {	return true;}
fn bool Aero3Window.isMaximized(&self) {	return true;}
fn void Aero3Window.scaleToMonitor(&self) {}
fn Aero3Monitor Aero3Window.getMonitor(&self) {return (Aero3Monitor){};}
fn void Aero3Window.makeCurrent(&self) {}
fn bool Aero3Window.isKeyPressed(&self, Aero3Key key) {
    $if $defined(env::WIN32):
		if (self.events.btn_event.key_down == true && self.events.btn_event.key_code == key) {
			return true;
		} else {
			return false;
		}
    $endif
    $if $defined(env::LINUX):

    $endif
}
fn bool Aero3Window.isKeyHeld(&self, Aero3Key key) {
	return true;
}
fn bool Aero3Window.isKeyReleased(&self, Aero3Key key) {
	return true;
}
fn bool Aero3Window.wasKeyPressed(&self, Aero3Key key) {
	return true;
}
fn bool Aero3Window.isKeyClicked(&self, Aero3Key key) {	return true;}
fn bool Aero3Window.isMousePressed(&self, MouseEvent button) {	return true;}
fn bool Aero3Window.isMouseHeld(&self, MouseEvent button) {	return true;}
fn bool Aero3Window.isMouseReleased(&self, MouseEvent button) {	return true;}
fn bool Aero3Window.wasMousePressed(&self, MouseEvent button) {	return true;}


/*
Some functions to add based on RGFW window Functions patterns

	#ifndef RGFW_NO_PASSTHROUGH
	RGFWDEF void RGFW_window_setMousePassthrough(RGFW_window* win, b8 passthrough); /* turn on / off mouse passthrough */
	#endif

/*! clipboard functions*/
	RGFWDEF char* RGFW_readClipboard(size_t* size); /*!< read clipboard data */
	RGFWDEF void RGFW_clipboardFree(char* str); /* the string returned from RGFW_readClipboard must be freed */

	RGFWDEF void RGFW_writeClipboard(const char* text, u32 textLen); /*!< write text to the clipboard */

	/*


		Event callbacks,
		these are completely optional, you can use the normal
		RGFW_checkEvent() method if you prefer that

	*/

	/* RGFW_windowMoved, the window and its new rect value  */
	typedef void (* RGFW_windowmovefunc)(RGFW_window* win, RGFW_rect r);
	/* RGFW_windowResized, the window and its new rect value  */
	typedef void (* RGFW_windowresizefunc)(RGFW_window* win, RGFW_rect r);
	/* RGFW_quit, the window that was closed */
	typedef void (* RGFW_windowquitfunc)(RGFW_window* win);
	/* RGFW_focusIn / RGFW_focusOut, the window who's focus has changed and if its inFocus */
	typedef void (* RGFW_focusfunc)(RGFW_window* win, b8 inFocus);
	/* RGFW_mouseEnter / RGFW_mouseLeave, the window that changed, the point of the mouse (enter only) and if the mouse has entered */
	typedef void (* RGFW_mouseNotifyfunc)(RGFW_window* win, RGFW_vector point, b8 status);
	/* RGFW_mousePosChanged, the window that the move happened on and the new point of the mouse  */
	typedef void (* RGFW_mouseposfunc)(RGFW_window* win, RGFW_vector point);
	/* RGFW_dnd_init, the window, the point of the drop on the windows */
	typedef void (* RGFW_dndInitfunc)(RGFW_window* win, RGFW_vector point);
	/* RGFW_windowRefresh, the window that needs to be refreshed */
	typedef void (* RGFW_windowrefreshfunc)(RGFW_window* win);
	/* RGFW_keyPressed / RGFW_keyReleased, the window that got the event, the keycode, the string version, the state of mod keys, if it was a press (else it's a release) */
	typedef void (* RGFW_keyfunc)(RGFW_window* win, u32 keycode, char keyName[16], u8 lockState, b8 pressed);
	/* RGFW_mouseButtonPressed / RGFW_mouseButtonReleased, the window that got the event, the button that was pressed, the scroll value, if it was a press (else it's a release)  */
	typedef void (* RGFW_mousebuttonfunc)(RGFW_window* win, u8 button, double scroll, b8 pressed);
	/* RGFW_jsButtonPressed / RGFW_jsButtonReleased, the window that got the event, the button that was pressed, the scroll value, if it was a press (else it's a release) */
	typedef void (* RGFW_jsButtonfunc)(RGFW_window* win, u16 joystick, u8 button, b8 pressed);
	/* RGFW_jsAxisMove, the window that got the event, the joystick in question, the axis values and the amount of axises */
	typedef void (* RGFW_jsAxisfunc)(RGFW_window* win, u16 joystick, RGFW_vector axis[2], u8 axisesCount);

	/*  RGFW_dnd, the window that had the drop, the drop data and the amount files dropped */
	#ifdef RGFW_ALLOC_DROPFILES
	typedef void (* RGFW_dndfunc)(RGFW_window* win, char** droppedFiles, u32 droppedFilesCount);
	#else
	typedef void (* RGFW_dndfunc)(RGFW_window* win, char droppedFiles[RGFW_MAX_DROPS][RGFW_MAX_PATH], u32 droppedFilesCount);
	#endif

	RGFWDEF void RGFW_setWindowMoveCallback(RGFW_windowmovefunc func);
	RGFWDEF void RGFW_setWindowResizeCallback(RGFW_windowresizefunc func);
	RGFWDEF void RGFW_setWindowQuitCallback(RGFW_windowquitfunc func);
	RGFWDEF void RGFW_setMousePosCallback(RGFW_mouseposfunc func);
	RGFWDEF void RGFW_setWindowRefreshCallback(RGFW_windowrefreshfunc func);
	RGFWDEF void RGFW_setFocusCallback(RGFW_focusfunc func);
	RGFWDEF void RGFW_setMouseNotifyCallBack(RGFW_mouseNotifyfunc func);
	RGFWDEF void RGFW_setDndCallback(RGFW_dndfunc func);
	RGFWDEF void RGFW_setDndInitCallback(RGFW_dndInitfunc func);
	RGFWDEF void RGFW_setKeyCallback(RGFW_keyfunc func);
	RGFWDEF void RGFW_setMouseButtonCallback(RGFW_mousebuttonfunc func);
	RGFWDEF void RGFW_setjsButtonCallback(RGFW_jsButtonfunc func);
	RGFWDEF void RGFW_setjsAxisCallback(RGFW_jsAxisfunc func);


#ifndef RGFW_NO_THREADS
	/*! threading functions*/

	/*! NOTE! (for X11/linux) : if you define a window in a thread, it must be run after the original thread's window is created or else there will be a memory error */
	/*
		I'd suggest you use sili's threading functions instead
		if you're going to use sili
		which is a good idea generally
	*/

	#if defined(__unix__) || defined(__APPLE__)
	typedef void* (* RGFW_threadFunc_ptr)(void*);
	#else
	typedef DWORD (__stdcall *RGFW_threadFunc_ptr) (LPVOID lpThreadParameter);
	#endif

	RGFWDEF RGFW_thread RGFW_createThread(RGFW_threadFunc_ptr ptr, void* args); /*!< create a thread*/
	RGFWDEF void RGFW_cancelThread(RGFW_thread thread); /*!< cancels a thread*/
	RGFWDEF void RGFW_joinThread(RGFW_thread thread); /*!< join thread to current thread */
	RGFWDEF void RGFW_setThreadPriority(RGFW_thread thread, u8 priority); /*!< sets the priority priority  */
#endif

	/*! gamepad/joystick functions (linux-only currently) */

	/*! joystick count starts at 0*/
	/*!< register joystick to window based on a number (the number is based on when it was connected eg. /dev/js0)*/
	RGFWDEF u16 RGFW_registerJoystick(RGFW_window* win, i32 jsNumber);
	RGFWDEF u16 RGFW_registerJoystickF(RGFW_window* win, char* file);

	RGFWDEF u32 RGFW_isPressedJS(RGFW_window* win, u16 controller, u8 button);

	/*! native opengl functions */
#ifdef RGFW_OPENGL
/*! Get max OpenGL version */
	RGFWDEF u8* RGFW_getMaxGLVersion(void);
	/* OpenGL init hints */
	RGFWDEF void RGFW_setGLStencil(i32 stencil); /* set stencil buffer bit size (8 by default) */
	RGFWDEF void RGFW_setGLSamples(i32 samples); /* set number of sampiling buffers (4 by default) */
	RGFWDEF void RGFW_setGLStereo(i32 stereo); /* use GL_STEREO (GL_FALSE by default) */
	RGFWDEF void RGFW_setGLAuxBuffers(i32 auxBuffers); /* number of aux buffers (0 by default) */

	/*! Set OpenGL version hint */
	RGFWDEF void RGFW_setGLVersion(i32 major, i32 minor);
	RGFWDEF void* RGFW_getProcAddress(const char* procname); /* get native opengl proc address */
	RGFWDEF void RGFW_window_makeCurrent_OpenGL(RGFW_window* win); /* to be called by RGFW_window_makeCurrent */
#endif
	/* supports openGL, directX, OSMesa, EGL and software rendering */
	RGFWDEF void RGFW_window_swapBuffers(RGFW_window* win); /* swap the rendering buffer */
	RGFWDEF void RGFW_window_swapInterval(RGFW_window* win, i32 swapInterval);
/*
	#ifndef RGFW_NO_MONITOR
	typedef struct RGFW_monitor {
		char name[128];  /* monitor name */
		RGFW_rect rect; /* monitor Workarea */
		float scaleX, scaleY; /* monitor content scale*/
		float physW, physH; /* monitor physical size */
	} RGFW_monitor;

	/*
	NOTE : Monitor functions should be ran only as many times as needed (not in a loop)
	*/

	/* get an array of all the monitors (max 6) */
	RGFWDEF RGFW_monitor* RGFW_getMonitors(void);
	/* get the primary monitor */
	RGFWDEF RGFW_monitor RGFW_getPrimaryMonitor(void);
fn bool Window.buttonIsPressed(&self, EventType value) {
    return false;
} //@extern("RGFW_isPressed");

fn Event* checkEvent(Window* win) {
    
}// @extern("RGFW_window_checkEvent");



RGFW_Event* RGFW_window_checkEvent(RGFW_window* win) {
		assert(win != NULL);

		if (win->event.type == RGFW_quit) {
			return NULL;
		}

		MSG msg;

		if (RGFW_eventWindow.src.window == win->src.window) {
			if (RGFW_eventWindow.r.x != -1) {
				win->r.x = RGFW_eventWindow.r.x;
				win->r.y = RGFW_eventWindow.r.y;
				win->event.type = RGFW_windowMoved;
				RGFW_windowMoveCallback(win, win->r);
			}

			if (RGFW_eventWindow.r.w != -1) {
				win->r.w = RGFW_eventWindow.r.w;
				win->r.h = RGFW_eventWindow.r.h;
				win->event.type = RGFW_windowResized;
				RGFW_windowResizeCallback(win, win->r);
			}

			RGFW_eventWindow.src.window = NULL;
			RGFW_eventWindow.r = RGFW_RECT(-1, -1, -1, -1);

			return &win->event;
		}


		static HDROP drop;
		
		if (win->event.type == RGFW_dnd_init) {
			if (win->event.droppedFilesCount) {
				u32 i;
				for (i = 0; i < win->event.droppedFilesCount; i++)
					win->event.droppedFiles[i][0] = '\0';
			}

			win->event.droppedFilesCount = 0;
			win->event.droppedFilesCount = DragQueryFileW(drop, 0xffffffff, NULL, 0);
			//win->event.droppedFiles = (char**)RGFW_CALLOC(win->event.droppedFilesCount, sizeof(char*));

			u32 i;
			for (i = 0; i < win->event.droppedFilesCount; i++) {
				const UINT length = DragQueryFileW(drop, i, NULL, 0);
				WCHAR* buffer = (WCHAR*) RGFW_CALLOC((size_t) length + 1, sizeof(WCHAR));

				DragQueryFileW(drop, i, buffer, length + 1);
				strncpy(win->event.droppedFiles[i], createUTF8FromWideStringWin32(buffer), RGFW_MAX_PATH);
				win->event.droppedFiles[i][RGFW_MAX_PATH - 1] = '\0';
				RGFW_FREE(buffer);
			}

			DragFinish(drop);
			RGFW_dndCallback(win, win->event.droppedFiles, win->event.droppedFilesCount);
			
			win->event.type = RGFW_dnd;
			return &win->event;
		}

		win->event.inFocus = (GetForegroundWindow() == win->src.window);

		if (RGFW_checkXInput(win, &win->event))
			return &win->event;

		static BYTE keyboardState[256];

		if (PeekMessageA(&msg, win->src.window, 0u, 0u, PM_REMOVE)) {
			switch (msg.message) {
			case WM_CLOSE:
			case WM_QUIT:
				RGFW_windowQuitCallback(win);
				win->event.type = RGFW_quit;
				break;

			case WM_ACTIVATE:
				win->event.inFocus = (LOWORD(msg.wParam) == WA_INACTIVE);

				if (win->event.inFocus) {
					win->event.type = RGFW_focusIn;
					RGFW_focusCallback(win, 1);
				}
				else {
					win->event.type = RGFW_focusOut;
					RGFW_focusCallback(win, 0);
				}

				break;
			
			case WM_PAINT:
				win->event.type = RGFW_windowRefresh;
				RGFW_windowRefreshCallback(win);
				break;
			
			case WM_MOUSELEAVE:
				win->event.type = RGFW_mouseLeave;
				win->src.winArgs |= RGFW_MOUSE_LEFT;
				RGFW_mouseNotifyCallBack(win, win->event.point, 0);
				break;
			
			case WM_KEYUP: {
				win->event.keyCode = RGFW_apiKeyCodeToRGFW((u32) msg.wParam);
								
				RGFW_keyboard[win->event.keyCode].prev = RGFW_isPressed(win, win->event.keyCode);

				static char keyName[16];
				
				{
					GetKeyNameTextA((LONG) msg.lParam, keyName, 16);

					if ((!(GetKeyState(VK_CAPITAL) & 0x0001) && !(GetKeyState(VK_SHIFT) & 0x8000)) ||
						((GetKeyState(VK_CAPITAL) & 0x0001) && (GetKeyState(VK_SHIFT) & 0x8000))) {
						CharLowerBuffA(keyName, 16);
					}
				}

				RGFW_updateLockState(win, (GetKeyState(VK_CAPITAL) & 0x0001), (GetKeyState(VK_NUMLOCK) & 0x0001));

				strncpy(win->event.keyName, keyName, 16);

				if (RGFW_isPressed(win, RGFW_ShiftL)) {
					ToAscii((UINT) msg.wParam, MapVirtualKey((UINT) msg.wParam, MAPVK_VK_TO_CHAR),
						keyboardState, (LPWORD) win->event.keyName, 0);
				}

				win->event.type = RGFW_keyReleased;
				RGFW_keyboard[win->event.keyCode].current = 0;
				RGFW_keyCallback(win, win->event.keyCode, win->event.keyName, win->event.lockState, 0);
				break;
			}
			case WM_KEYDOWN: {
				win->event.keyCode = RGFW_apiKeyCodeToRGFW((u32) msg.wParam);

				RGFW_keyboard[win->event.keyCode].prev = RGFW_isPressed(win, win->event.keyCode);

				static char keyName[16];
				
				{
					GetKeyNameTextA((LONG) msg.lParam, keyName, 16);

					if ((!(GetKeyState(VK_CAPITAL) & 0x0001) && !(GetKeyState(VK_SHIFT) & 0x8000)) ||
						((GetKeyState(VK_CAPITAL) & 0x0001) && (GetKeyState(VK_SHIFT) & 0x8000))) {
						CharLowerBuffA(keyName, 16);
					}
				}
								
				RGFW_updateLockState(win, (GetKeyState(VK_CAPITAL) & 0x0001), (GetKeyState(VK_NUMLOCK) & 0x0001));

				strncpy(win->event.keyName, keyName, 16);

				if (RGFW_isPressed(win, RGFW_ShiftL) & 0x8000) {
					ToAscii((UINT) msg.wParam, MapVirtualKey((UINT) msg.wParam, MAPVK_VK_TO_CHAR),
						keyboardState, (LPWORD) win->event.keyName, 0);
				}

				win->event.type = RGFW_keyPressed;
				RGFW_keyboard[win->event.keyCode].current = 1;
				RGFW_keyCallback(win, win->event.keyCode, win->event.keyName, win->event.lockState, 1);
				break;
			}

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
				break;

			case WM_MOUSEWHEEL:
				if (msg.wParam > 0)
					win->event.button = RGFW_mouseScrollUp;
				else
					win->event.button = RGFW_mouseScrollDown;

				RGFW_mouseButtons_prev[win->event.button] = RGFW_mouseButtons[win->event.button];
				RGFW_mouseButtons[win->event.button] = 1;

				win->event.scroll = (SHORT) HIWORD(msg.wParam) / (double) WHEEL_DELTA;

				win->event.type = RGFW_mouseButtonPressed;
				RGFW_mouseButtonCallback(win, win->event.button, win->event.scroll, 1);
				break;

			case WM_LBUTTONUP:
			
				win->event.button = RGFW_mouseLeft;
				win->event.type = RGFW_mouseButtonReleased;

				RGFW_mouseButtons_prev[win->event.button] = RGFW_mouseButtons[win->event.button];
				RGFW_mouseButtons[win->event.button] = 0;
				RGFW_mouseButtonCallback(win, win->event.button, win->event.scroll, 0);
				break;
			case WM_RBUTTONUP:
				win->event.button = RGFW_mouseRight;
				win->event.type = RGFW_mouseButtonReleased;

				RGFW_mouseButtons_prev[win->event.button] = RGFW_mouseButtons[win->event.button];
				RGFW_mouseButtons[win->event.button] = 0;
				RGFW_mouseButtonCallback(win, win->event.button, win->event.scroll, 0);
				break;
			case WM_MBUTTONUP:
				win->event.button = RGFW_mouseMiddle;
				win->event.type = RGFW_mouseButtonReleased;

				RGFW_mouseButtons_prev[win->event.button] = RGFW_mouseButtons[win->event.button];
				RGFW_mouseButtons[win->event.button] = 0;
				RGFW_mouseButtonCallback(win, win->event.button, win->event.scroll, 0);
				break;

				/*
					much of this event is source from glfw
				*/
			case WM_DROPFILES: {				
				win->event.type = RGFW_dnd_init;

				drop = (HDROP) msg.wParam;
				POINT pt;

				/* Move the mouse to the position of the drop */
				DragQueryPoint(drop, &pt);

				win->event.point.x = pt.x;
				win->event.point.y = pt.y;

				RGFW_dndInitCallback(win, win->event.point);
			}
				break;
			case WM_GETMINMAXINFO:
			{
				if (win->src.maxSize.w == 0 && win->src.maxSize.h == 0)
					break;

				MINMAXINFO* mmi = (MINMAXINFO*) msg.lParam;
				mmi->ptMinTrackSize.x = win->src.minSize.w;
				mmi->ptMinTrackSize.y = win->src.minSize.h;
				mmi->ptMaxTrackSize.x = win->src.maxSize.w;
				mmi->ptMaxTrackSize.y = win->src.maxSize.h;
				return 0;
			}
			default:
				win->event.type = 0;
				break;
			}

			TranslateMessage(&msg);
			DispatchMessageA(&msg);
		}

		else
			win->event.type = 0;

		if (!IsWindow(win->src.window)) {
			win->event.type = RGFW_quit;
			RGFW_windowQuitCallback(win);
		}

		if (win->event.type)
			return &win->event;
		else
			return NULL;
	}*/