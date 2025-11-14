module aero3::os::win32_types @if(env::WIN32);

import aero3::utils::types;

typedef Pvoid = inline void*;
typedef Handle = inline void*;

typedef Hbitmap = inline Handle;
typedef Hbrush = inline Handle;
typedef Hcursor = inline Handle;
typedef Hdc = inline Handle;
typedef Hfont = inline Handle;
typedef Hgdiobj = inline Handle;
typedef Hicon = inline Handle;
typedef Hinstance = inline Handle;
typedef Hmenu = inline Handle;
typedef Hmodule = inline Handle;
typedef Hpen = inline Handle;
typedef Hwnd = inline Handle;
typedef Hrgn = inline Handle;
typedef Htreeitem = inline Handle;

alias Intptr = iptr;
alias Long = int;
alias Longptr = iptr;
alias Lparam = Longptr;
alias Lpcwstr = Char16*;
alias Lpwstr = Char16*;
alias Lresult = Longptr;
alias Puint = uint*;
alias Uintptr = uptr;
alias Ulongptr = uptr;
alias Wparam = Uintptr;
alias Dword = uint;
alias Dwordptr = Ulongptr;
alias Colorref = Dword;
alias Word = ushort;
alias UInt = uint;
alias Bool = int;
alias Hresult = Long;
const Dword UINT_MAX = 1UL << 32 - 1;
macro Lpcwstr makeIntResource($i) { return (Lpcwstr)(Ulongptr)(Word)$i; }

// Function pointer types
alias Wndproc = fn Lresult(Hwnd, uint, Wparam, Lparam);
alias Subclassproc = fn Lresult(Hwnd, uint, Wparam, Lparam, Uintptr, Dwordptr);
alias OfnHookProc = fn Uintptr(Hwnd, uint, Wparam, Lparam);
alias BrowserCbProc = fn int(Hwnd, uint, Lparam, Lparam);
alias TimerProc = fn Uintptr(Hwnd, uint, Uintptr, Dword);

const double WHEEL_DELTA = 120;

const Dword CS_VREDRAW = 0x0001;
const Dword CS_HREDRAW = 0x0002;
const Dword CS_OWNDC   = 0x0020;

const Wparam WA_ACTIVE		= 1;
const Wparam WA_CLICKACTIVE	= 2;
const Wparam WA_INACTIVE	= 0;

const Dword WS_BORDER           = 0x00800000L;
const Dword WS_CAPTION          = 0x00C00000L;
const Dword WS_CHILD            = 0x40000000L;
const Dword WS_CHILDWINDOW      = 0x40000000L;
const Dword WS_CLIPCHILDREN     = 0x02000000L;
const Dword WS_CLIPSIBLINGS     = 0x04000000L;
const Dword WS_DISABLED         = 0x08000000L;
const Dword WS_DLGFRAME         = 0x00400000L;
const Dword WS_GROUP            = 0x00020000L;
const Dword WS_HSCROLL          = 0x00100000L;
const Dword WS_ICONIC           = 0x20000000L;
const Dword WS_MAXIMIZE         = 0x01000000L;
const Dword WS_MAXIMIZEBOX      = 0x00010000L;
const Dword WS_MINIMIZE         = 0x20000000L;
const Dword WS_MINIMIZEBOX      = 0x00020000L;
const Dword WS_OVERLAPPED       = 0x00000000L;
const Dword WS_OVERLAPPEDWINDOW = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX;
const Dword WS_POPUP            = 0x80000000L;
const Dword WS_POPUPWINDOW      = WS_POPUP | WS_BORDER | WS_SYSMENU;
const Dword WS_SIZEBOX          = 0x00040000L;
const Dword WS_SYSMENU          = 0x00080000L;
const Dword WS_TABSTOP          = 0x00010000L;
const Dword WS_THICKFRAME       = 0x00040000L;
const Dword WS_TILED            = 0x00000000L;
const Dword WS_TILEDWINDOW      = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX;
const Dword WS_VISIBLE          = 0x10000000L;
const Dword WS_VSCROLL          = 0x00200000L;

const Lresult WM_NULL                   = 0x0000;
const Lresult WM_CREATE                 = 0x0001;
const Lresult WM_DESTROY                = 0x0002;
const Lresult WM_MOVE                   = 0x0003;
const Lresult WM_SIZE                   = 0x0005;
const Lresult WM_ACTIVATE               = 0x0006;
const Lresult WM_SETFOCUS               = 0x0007;
const Lresult WM_KILLFOCUS              = 0x0008;
const Lresult WM_ENABLE                 = 0x000A;
const Lresult WM_SETREDRAW              = 0x000B;
const Lresult WM_SETTEXT                = 0x000C;
const Lresult WM_GETTEXT                = 0x000D;
const Lresult WM_GETTEXTLENGTH          = 0x000E;
const Lresult WM_PAINT                  = 0x000F;
const Lresult WM_CLOSE                  = 0x0010;
const Lresult WM_QUERYENDSESSION        = 0x0011;
const Lresult WM_QUIT                   = 0x0012;
const Lresult WM_QUERYOPEN              = 0x0013;
const Lresult WM_ERASEBKGND             = 0x0014;
const Lresult WM_SYSCOLORCHANGE         = 0x0015;
const Lresult WM_ENDSESSION             = 0x0016;
const Lresult WM_SHOWWINDOW             = 0x0018;
const Lresult WM_WININICHANGE           = 0x001A;
const Lresult WM_SETTINGCHANGE          = WM_WININICHANGE;
const Lresult WM_DEVMODECHANGE          = 0x001B;
const Lresult WM_ACTIVATEAPP            = 0x001C;
const Lresult WM_FONTCHANGE             = 0x001D;
const Lresult WM_TIMECHANGE             = 0x001E;
const Lresult WM_CANCELMODE             = 0x001F;
const Lresult WM_SETCURSOR              = 0x0020;
const Lresult WM_MOUSEACTIVATE          = 0x0021;
const Lresult WM_CHILDACTIVATE          = 0x0022;
const Lresult WM_QUEUESYNC              = 0x0023;
const Lresult WM_GETMINMAXINFO          = 0x0024;
const Lresult WM_PAINTICON              = 0x0026;
const Lresult WM_ICONERASEBKGND         = 0x0027;
const Lresult WM_NEXTDLGCTL             = 0x0028;
const Lresult WM_SPOOLERSTATUS          = 0x002A;
const Lresult WM_DRAWITEM               = 0x002B;
const Lresult WM_MEASUREITEM            = 0x002C;
const Lresult WM_DELETEITEM             = 0x002D;
const Lresult WM_VKEYTOITEM             = 0x002E;
const Lresult WM_CHARTOITEM             = 0x002F;
const Lresult WM_SETFONT                = 0x0030;
const Lresult WM_GETFONT                = 0x0031;
const Lresult WM_SETHOTKEY              = 0x0032;
const Lresult WM_GETHOTKEY              = 0x0033;
const Lresult WM_QUERYDRAGICON          = 0x0037;
const Lresult WM_COMPAREITEM            = 0x0039;
const Lresult WM_GETOBJECT              = 0x003D;
const Lresult WM_COMPACTING             = 0x0041;
const Lresult WM_COMMNOTIFY             = 0x0044;
const Lresult WM_WINDOWPOSCHANGING      = 0x0046;
const Lresult WM_WINDOWPOSCHANGED       = 0x0047;
const Lresult WM_POWER                  = 0x0048;
const Lresult WM_COPYDATA               = 0x004A;
const Lresult WM_CANCELJOURNAL          = 0x004B;
const Lresult WM_NOTIFY                 = 0x004E;
const Lresult WM_INPUTLANGCHANGEREQUEST = 0x0050;
const Lresult WM_INPUTLANGCHANGE        = 0x0051;
const Lresult WM_TCARD                  = 0x0052;
const Lresult WM_HELP                   = 0x0053;
const Lresult WM_USERCHANGED            = 0x0054;
const Lresult WM_NOTIFYFORMAT           = 0x0055;
const Lresult WM_CONTEXTMENU            = 0x007B;
const Lresult WM_STYLECHANGING          = 0x007C;
const Lresult WM_STYLECHANGED           = 0x007D;
const Lresult WM_DISPLAYCHANGE          = 0x007E;
const Lresult WM_GETICON                = 0x007F;
const Lresult WM_SETICON                = 0x0080;
const Lresult WM_NCCREATE               = 0x0081;
const Lresult WM_NCDESTROY              = 0x0082;
const Lresult WM_NCCALCSIZE             = 0x0083;
const Lresult WM_NCHITTEST              = 0x0084;
const Lresult WM_NCPAINT                = 0x0085;
const Lresult WM_NCACTIVATE             = 0x0086;
const Lresult WM_GETDLGCODE             = 0x0087;
const Lresult WM_SYNCPAINT              = 0x0088;

const Lresult WM_KEYFIRST               = 0x0100;
const Lresult WM_KEYDOWN                = 0x0100;
const Lresult WM_KEYUP                  = 0x0101;
const Lresult WM_CHAR                   = 0x0102;
const Lresult WM_DEADCHAR               = 0x0103;
const Lresult WM_SYSKEYDOWN             = 0x0104;
const Lresult WM_SYSKEYUP               = 0x0105;
const Lresult WM_SYSCHAR                = 0x0106;
const Lresult WM_SYSDEADCHAR            = 0x0107;
const Lresult WM_UNICHAR                = 0x0109;
const Lresult WM_KEYLAST                = 0x0109;

const Lresult WM_COMMAND                = 0x0111;
const Lresult WM_SYSCOMMAND             = 0x0112;
const Lresult WM_TIMER                  = 0x0113;
const Lresult WM_HSCROLL                = 0x0114;
const Lresult WM_VSCROLL                = 0x0115;
const Lresult WM_INITMENU               = 0x0116;
const Lresult WM_INITMENUPOPUP          = 0x0117;
const Lresult WM_MENUSELECT             = 0x011F;
const Lresult WM_MENUCHAR               = 0x0120;
const Lresult WM_ENTERIDLE              = 0x0121;

const Lresult WM_MOUSEFIRST             = 0x0200;
const Lresult WM_MOUSEMOVE              = 0x0200;
const Lresult WM_LBUTTONDOWN            = 0x0201;
const Lresult WM_LBUTTONUP              = 0x0202;
const Lresult WM_LBUTTONDBLCLK          = 0x0203;
const Lresult WM_RBUTTONDOWN            = 0x0204;
const Lresult WM_RBUTTONUP              = 0x0205;
const Lresult WM_RBUTTONDBLCLK          = 0x0206;
const Lresult WM_MBUTTONDOWN            = 0x0207;
const Lresult WM_MBUTTONUP              = 0x0208;
const Lresult WM_MBUTTONDBLCLK          = 0x0209;
const Lresult WM_MOUSEWHEEL             = 0x020A;
const Lresult WM_XBUTTONDOWN            = 0x020B;
const Lresult WM_XBUTTONUP              = 0x020C;
const Lresult WM_XBUTTONDBLCLK          = 0x020D;
const Lresult WM_MOUSEHWHEEL            = 0x020E;
const Lresult WM_MOUSELAST              = 0x020E;
const Lresult WM_MOUSEHOVER             = 0x02A1;
const Lresult WM_MOUSELEAVE             = 0x02A3;

const Lresult WM_ENTERSIZEMOVE          = 0x0231;
const Lresult WM_EXITSIZEMOVE           = 0x0232;
const Lresult WM_SIZING                 = 0x0214;
const Lresult WM_MOVING                 = 0x0216;

const Lresult WM_NCPOINTERUPDATE        = 0x0241;
const Lresult WM_NCPOINTERDOWN          = 0x0242;
const Lresult WM_NCPOINTERUP            = 0x0243;
const Lresult WM_POINTERUPDATE          = 0x0245;
const Lresult WM_POINTERDOWN            = 0x0246;
const Lresult WM_POINTERUP              = 0x0247;
const Lresult WM_POINTERENTER           = 0x0249;
const Lresult WM_POINTERLEAVE           = 0x024A;
const Lresult WM_POINTERACTIVATE        = 0x024B;
const Lresult WM_POINTERCAPTURECHANGED  = 0x024C;
const Lresult WM_TOUCHHITTESTING        = 0x024D;
const Lresult WM_POINTERWHEEL           = 0x024E;
const Lresult WM_POINTERHWHEEL          = 0x024F;

const Lresult WM_CUT                    = 0x0300;
const Lresult WM_COPY                   = 0x0301;
const Lresult WM_PASTE                  = 0x0302;
const Lresult WM_CLEAR                  = 0x0303;
const Lresult WM_UNDO                   = 0x0304;
const Lresult WM_RENDERFORMAT           = 0x0305;
const Lresult WM_RENDERALLFORMATS       = 0x0306;
const Lresult WM_DESTROYCLIPBOARD       = 0x0307;
const Lresult WM_DRAWCLIPBOARD          = 0x0308;
const Lresult WM_PAINTCLIPBOARD         = 0x0309;
const Lresult WM_VSCROLLCLIPBOARD       = 0x030A;
const Lresult WM_SIZECLIPBOARD          = 0x030B;
const Lresult WM_ASKCBFORMATNAME        = 0x030C;
const Lresult WM_CHANGECBCHAIN          = 0x030D;
const Lresult WM_HSCROLLCLIPBOARD       = 0x030E;
const Lresult WM_QUERYNEWPALETTE        = 0x030F;
const Lresult WM_PALETTEISCHANGING      = 0x0310;
const Lresult WM_PALETTECHANGED         = 0x0311;
const Lresult WM_HOTKEY                 = 0x0312;

const Lresult WM_THEMECHANGED           = 0x031A;
const Lresult WM_APP                    = 0x8000;

const UInt MB_OK                = 0x00000000;
const UInt MB_OKCANCEL          = 0x00000001;
const UInt MB_ABORTRETRYIGNORE  = 0x00000002;
const UInt MB_YESNOCANCEL       = 0x00000003;
const UInt MB_YESNO             = 0x00000004;
const UInt MB_RETRYCANCEL       = 0x00000005;
const UInt MB_CANCELTRYCONTINUE = 0x00000006;
const UInt MB_ICONHAND          = 0x00000010;
const UInt MB_ICONQUESTION      = 0x00000020;
const UInt MB_ICONEXCLAMATION   = 0x00000030;
const UInt MB_ICONASTERISK      = 0x00000040;
const UInt MB_USERICON          = 0x00000080;
const UInt MB_ICONWARNING       = MB_ICONEXCLAMATION;
const UInt MB_ICONERROR         = MB_ICONHAND;
const UInt MB_ICONINFORMATION   = MB_ICONASTERISK;
const UInt MB_ICONSTOP          = MB_ICONHAND;

const UInt PM_NOREMOVE = 0x0000;
const UInt PM_REMOVE   = 0x0001;	 
const UInt PM_NOYIELD  = 0x0002;

const CInt SW_HIDE            = 0;
const CInt SW_SHOWNORMAL      = 1;
const CInt SW_NORMAL          = 1;
const CInt SW_SHOWMINIMIZED   = 2;
const CInt SW_SHOWMAXIMIZED   = 3;
const CInt SW_MAXIMIZE        = 3;
const CInt SW_SHOWNOACTIVATE  = 4;
const CInt SW_SHOW            = 5;
const CInt SW_MINIMIZE        = 6;
const CInt SW_SHOWMINNOACTIVE = 7;
const CInt SW_SHOWNA          = 8;
const CInt SW_RESTORE         = 9;
const CInt SW_SHOWDEFAULT     = 10;
const CInt SW_FORCEMINIMIZE   = 10;

const Lpcwstr IDI_APPLICATION = makeIntResource(32512);
const Lpcwstr IDI_ERROR       = makeIntResource(32513);
const Lpcwstr IDI_QUESTION    = makeIntResource(32514);
const Lpcwstr IDI_WARNING     = makeIntResource(32515);
const Lpcwstr IDI_INFORMATION = makeIntResource(32516);
const Lpcwstr IDI_WINLOGO     = makeIntResource(32517);
const Lpcwstr IDI_SHIELD      = makeIntResource(32518);

const Lpcwstr IDC_ARROW       = makeIntResource(32512);
const Lpcwstr IDC_IBEAM       = makeIntResource(32513);
const Lpcwstr IDC_WAIT        = makeIntResource(32514);
const Lpcwstr IDC_CROSS       = makeIntResource(32515);
const Lpcwstr IDC_UPARROW     = makeIntResource(32516);
const Lpcwstr IDC_SIZENWSE    = makeIntResource(32642);
const Lpcwstr IDC_SIZENESW    = makeIntResource(32643);
const Lpcwstr IDC_SIZEWE      = makeIntResource(32644);
const Lpcwstr IDC_SIZENS      = makeIntResource(32645);
const Lpcwstr IDC_SIZEALL     = makeIntResource(32646);
const Lpcwstr IDC_NO          = makeIntResource(32648);
const Lpcwstr IDC_HAND        = makeIntResource(32649);
const Lpcwstr IDC_APPSTARTING = makeIntResource(32650);
const Lpcwstr IDC_HELP        = makeIntResource(32651);
const Lpcwstr IDC_PIN         = makeIntResource(32671);
const Lpcwstr IDC_PERSON      = makeIntResource(32672);

struct Size {
    int cx;
    int cy;
}

alias LpRect = Rect*;
alias LpPoint = Point*;
alias LpSize = Size*;

struct WndClassEx {
	CUInt cbSize;
	CUInt style;
	Wndproc lpfnWndProc;
	CInt cbClsExtra;
	CInt cbWndExtra;
	Hinstance hInstance;
	Hicon hIcon;
	Hcursor hCursor;
	Hbrush hbrBackground;
	Lpcwstr lpszMenuName;
	Lpcwstr lpszClassName;
	Hicon hIconSm;
}

struct Msg {
	Hwnd hwnd;
	CUInt message;
	Wparam wParam;
	Lparam lParam;
	Dword time;
	Point pt;
	Dword lPrivate;
}
alias LpMsg = Msg*;

const int LF_FACESIZE = 32;
struct LogFont {
	Long  lfHeight;
	Long  lfWidth;
	Long  lfEscapement;
	Long  lfOrientation;
	Long  lfWeight;
	char  lfItalic;
	char  lfUnderline;
	char  lfStrikeOut;
	char  lfCharSet;
	char  lfOutPrecision;
	char  lfClipPrecision;
	char  lfQuality;
	char  lfPitchAndFamily;
	Char16[LF_FACESIZE] lfFaceName;
}

struct InitCommonControls {
	Dword dwSize;
	Dword dwICC;
}

struct TrackMOUSEEVENT {
  Dword cbSize;
  Dword dwFlags;
  Hwnd  hwndTrack;
  Dword dwHoverTime;
}

struct NMHdr {
  Hwnd hwndFrom;
  Uintptr idFrom;
  CUInt code;
}

struct NMCustomDraw {
	NMHdr     hdr;
	Dword     dwDrawStage;
	Hdc       hdc;
	Rect      rc;
	Dwordptr  dwItemSpec;
	CUInt      uItemState;
	Lparam    lItemlParam;
}

struct ComboBoxInfo {
	Dword cbSize;
	Rect  rcItem;
	Rect  rcButton;
	Dword stateButton;
	Hwnd  hwndCombo;
	Hwnd  hwndItem;
	Hwnd  hwndList;
}

struct PaintStruct {
	Hdc  hdc;
	Bool fErase;
	Rect rcPaint;
	Bool fRestore;
	Bool fIncUpdate;
	ichar[32] rgbReserved;
}

struct SystemTime {
	Word wYear;
	Word wMonth;
	Word wDayOfWeek;
	Word wDay;
	Word wHour;
	Word wMinute;
	Word wSecond;
	Word wMilliseconds;
}

struct NMDateTimeString {
	NMHdr      	nmhdr;
  	Lpcwstr   	pszUserString;
  	SystemTime 	st;
  	Dword      	dwFlags;
}

struct NMDateTimeChange {
	NMHdr nmhdr;
	Dword dwFlags;
	SystemTime st;
}

struct NMUpdown {
	NMHdr hdr;
  	int   iPos;
  	int   iDelta;
}

struct NMSelchange {
	NMHdr      nmhdr;
  	SystemTime stSelStart;
  	SystemTime stSelEnd;
}
struct NMViewChange {
	NMHdr nmhdr;
  	Dword dwOldView;
  	Dword dwNewView;
}

struct TVItemEx {
	uint      mask;
	Htreeitem hItem;
	uint      state;
	uint      stateMask;
	Lpcwstr    pszText;
	int       cchTextMax;
	int       iImage;
	int       iSelectedImage;
	int       cChildren;
	Lparam    lParam;
	int       iIntegral;
	uint      uStateEx;
	Hwnd      hwnd;
	int       iExpandedImage;
	int       iReserved;
}

struct TVInsertStruct {
	Htreeitem hParent;
	Htreeitem hInsertAfter;
	TVItemEx itemex;
}

struct LVColumn {
	uint   mask;
	int    fmt;
	int    cx;
	Lpcwstr pszText;
	int    cchTextMax;
	int    iSubItem;
	int    iImage;
	int    iOrder;
	int    cxMin;
	int    cxDefault;
	int    cxIdeal;
}

struct LVItem {
	uint   mask;
	int    iItem;
	int    iSubItem;
	uint   state;
	uint   stateMask;
	Lpcwstr pszText;
	int    cchTextMax;
	int    iImage;
	Lparam lParam;
	int    iIndent;
	int    iGroupId;
	uint   cColumns;
	uint*  puColumns;
	int*    piColFmt;
	int    iGroup;
}

struct NMItemActivate {
  NMHdr  hdr;
  int    iItem;
  int    iSubItem;
  uint   uNewState;
  uint   uOldState;
  uint   uChanged;
  Point  ptAction;
  Lparam lParam;
  uint   uKeyFlags;
}

struct LVNMListView {
  NMHdr  hdr;
  int    iItem;
  int    iSubItem;
  uint   uNewState;
  uint   uOldState;
  uint   uChanged;
  Point  ptAction;
  Lparam lParam;
}

struct NMLVCustomDraw {
  NMCustomDraw nmcd;
  Colorref     clrText;
  Colorref     clrTextBk;
  int          iSubItem;
  Dword        dwItemType;
  Colorref     clrFace;
  int          iIconEffect;
  int          iIconPhase;
  int          iPartId;
  int          iStateId;
  Rect         rcText;
  uint         uAlign;
} 

struct HDHitTestInfo {
	Point pt;
  	uint  flags;
  	int   iItem;
}

struct WindowPos {
	Hwnd hwnd;
	Hwnd hwndInsertAfter;
	int  x;
	int  y;
	int  cx;
	int  cy;
	uint flags;
}

struct HdLayout {
	Rect*      prc;
	WindowPos* pwpos;
}

struct MenuItemInfoW {
	uint      cbSize;
	uint      fMask;
	uint      fType;
	uint      fState;
	uint      wID;
	Hmenu     hSubMenu;
	Hbitmap   hbmpChecked;
	Hbitmap   hbmpUnchecked;
	Ulongptr dwItemData;
	Lpcwstr    dwTypeData;
	uint      cch;
	Hbitmap   hbmpItem;
}

struct MeasureItemStruct {
	uint      ctlType;
	uint      ctlID;
	uint      itemID;
	uint      itemWidth;
	uint      itemHeight;
	Ulongptr itemData;
}

struct DrawItemStruct {
	uint      ctlType;
	uint      ctlID;
	uint      itemID;
	uint      itemAction;
	uint      itemState;
	Hwnd      hwndItem;
	Hdc       hDC;
	Rect      rcItem;
	Ulongptr itemData;
}

struct OpenFileNameW {
	Dword         lStructSize;
	Hwnd          hwndOwner;
	Hinstance     hInstance;
	Lpcwstr       lpstrFilter;
	Lpwstr        lpstrCustomFilter;
	Dword         nMaxCustFilter;
	Dword         nFilterIndex;
	Lpwstr        lpstrFile;
	Dword         nMaxFile;
	Lpwstr        lpstrFileTitle;
	Dword         nMaxFileTitle;
	Lpcwstr       lpstrInitialDir;
	Lpcwstr       lpstrTitle;
	Dword         flags;
	Word          nFileOffset;
	Word          nFileExtension;
	Lpcwstr       lpstrDefExt;
	Lparam        lCustData;
	OfnHookProc lpfnHook;
	Lpcwstr       lpTemplateName;
	void          *pvReserved;
	Dword         dwReserved;
	Dword         flagsEx;
}

struct ShItemID {
	ushort cb;
	char[1] abID;
}

struct ItemIdList { ShItemID mkid; }
alias LpItemIdList = ItemIdList*;
alias ItemIdList_Absolute = ItemIdList;
alias PcIdList_Absolute = ItemIdList_Absolute*;
alias PidList_Absolute = ItemIdList_Absolute*;

struct BrowseInfoW {
	Hwnd              hwndOwner;
	PcIdList_Absolute pidlRoot;
	Lpwstr            pszDisplayName;
	Lpcwstr           lpszTitle;
	uint              ulFlags;
	BrowserCbProc       lpfn;
	Lparam            lParam;
	int               iImage;
}

struct Guid 
{
    ulong  data1;
    ushort data2;
    ushort data3;
    char[8] data4;
} 

 struct NotifyIconData 
 {
	Dword cbSize;
	Hwnd  hWnd;
	uint  uID;
	uint  uFlags;
	uint  uCallbackMessage;
	Hicon hIcon;
	Char16[128] toolTipText;
	Dword dwState;
	Dword dwStateMask;
	Char16[256] balloonText;
	uint uVersionOrTimeout;
	Char16[64] balloonTitle;
	Dword dwInfoFlags;
	// Guid guidItem;
	// Hicon hBalloonIcon;
}