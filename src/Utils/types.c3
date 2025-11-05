module aero3::utils::types;

struct Point {
    int x;
    int y;
}

struct Rect {
    int x;
    int y;
    int w;
    int h; 
}

struct Area {
    int w;
    int h; 
}

fn Point newPoint(int x, int y) {
    return (Point) {x, y};
}

fn Rect newRect(int x, int y, int w, int h) {
    return (Rect) {x, y, w, h};
}

fn Area newArea(int w, int h) {
    return (Area) {w, h};
}

