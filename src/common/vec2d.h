#pragma once
#include <math.h>
class Vec2d{
    double x;
    double y;

    public:
    Vec2d(double x, double y);
    static Vec2d fromPolar(double angle, double radius = 1);
    Vec2d rotated(double angle) const;
    Vec2d rotated90() const;
    double getX() const;
    double getY() const;
    Vec2d operator+(const Vec2d& other) const;
    Vec2d operator-(const Vec2d& other) const;
    Vec2d operator*(const double& other) const;
    double operator*(const Vec2d& other) const;
    bool operator==(const Vec2d& other) const;
    bool operator!=(const Vec2d& other) const;
    Vec2d operator-() const;
    double length() const;
    Vec2d normalized() const;
    

};
