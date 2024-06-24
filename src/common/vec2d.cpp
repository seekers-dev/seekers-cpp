#include "vec2d.h"
#include <doctest.h>

Vec2d::Vec2d(double x, double y) :x(x), y(y){};

Vec2d Vec2d::fromPolar(double angle, double radius) {
    return Vec2d(cos(angle), sin(angle))*radius;
}

double Vec2d::getX() const{
    return x;
}

double Vec2d::getY() const{
    return y;
}

Vec2d Vec2d::rotated90() const{
    return Vec2d(-y,x);
}

Vec2d Vec2d::operator+(const Vec2d& other) const{
    return Vec2d(x+other.getX(), y + other.getY());
}
Vec2d Vec2d::operator-(const Vec2d& other) const{
    return Vec2d(x-other.getX(), y+ other.getY());
}
Vec2d Vec2d::operator*(const double& other) const{
    return Vec2d(x*other, y*other);
}
double Vec2d::operator*(const Vec2d& other) const{
    return x*other.getX() + y*other.getY();
}
bool Vec2d::operator==(const Vec2d& other) const{
    return (x == other.getX() && y == other.getY());
}
bool Vec2d::operator!=(const Vec2d& other) const{
    return !(*this == other);
}
Vec2d Vec2d::operator-() const{
    return Vec2d(-x,-y);
}

TEST_CASE("Check vector"){
    Vec2d v(1,1);
    SUBCASE("equality"){
        CHECK(Vec2d(1,1) == v);
    }
    SUBCASE("addition"){
        CHECK(v + v == Vec2d(2,2));
    }
}
