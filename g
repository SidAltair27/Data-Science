#define GL_SILENCE_DEPRECATION
#include <GLUT/glut.h>
#include <GLFW/glfw3.h>
#include <GLUT/GLUT.h>
#include <stdio.h>
#include <iostream>
#include <cmath>
//void initializer();
//have to draw an ice cream using bresenham and mid point circle drawing
int windowWidth = 800;
int windowHeight = 800;
int r = 100;
int centerX = 400;
int centerY = 400;

void draw_line(int x1, int y1, int x2, int y2) {
    int dx = abs(x2 - x1);
    int dy = abs(y2 - y1);
    int sx = (x1 < x2) ? 1 : -1;
    int sy = (y1 < y2) ? 1 : -1;
    int err = dx - dy;

    while (true) {
        glBegin(GL_POINTS);
        glVertex2i(x1, y1);
        glEnd();

        if (x1 == x2 && y1 == y2) {
            break;
        }

        int e2 = 2 * err;
        if (e2 > -dy) {
            err -= dy;
            x1 += sx;
        }
        if (e2 < dx) {
            err += dx;
            y1 += sy;
        }
    }
}


void display()
{
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(1, 0.5, 0.5);
    glBegin(GL_POINTS);

    int x=0;
    int y=r;
    int d = 5/4 -r;
    
    while(x<=y)
    {
        glVertex2i(centerX + x, centerY + y);
        glVertex2i(centerX + y, centerY + x);
        glVertex2i(centerX - x, centerY + y);
        glVertex2i(centerX - y, centerY + x);
        glVertex2i(centerX + x, centerY - y);
        glVertex2i(centerX + y, centerY - x);
        glVertex2i(centerX - x, centerY - y);
        glVertex2i(centerX - y, centerY - x);
        if(d<0)
        {
            d+=2*x+1;
        }else{
            d+=2*(x-y)+1;
            y--;
        }
        x++;
    }
    //circle drawn
    //now making lines
    //we will use bresenham line drawing algo
    glEnd();
    glBegin(GL_POINTS);
    int x1=300;
    int y1=400;
    int x2=500;
    int y2=400;
    int x3=400;
    int y3=0;
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(0.5, 1, 1);
    draw_line(x1, y1, x3, y3);
    draw_line(x2, y2, x3, y3);
//    //line 1 the left one
//    int dx = x1-x3;
//    int dy = y1-y3;
//    int d1=2*dy-dx;
//    while(y1>y3)
//    {
//        glVertex2i(x3, y3);
//        if(d1<0)
//        {
//            d1+=2*dy;
//        }else{
//            x3--;
//            d1+=2*dy-2*dx;
//        }
//        y3++;
//    }
//    glVertex2i(300,400);
//    glVertex2i(400,0);
//    glVertex2i(500,400);
//    glVertex2i(400,0);
    glEnd();
    glFlush();
}

int main(int argc, char** argv) {
    glutInit(&argc, argv);
    glutCreateWindow("question 1 ice cream");
    glClearColor(0.0, 0.0, 0.0, 1.0);
    glMatrixMode(GL_PROJECTION);
    gluOrtho2D(0.0, 800, 0.0, 800);
    glutDisplayFunc(display);
    glutMainLoop();
}
