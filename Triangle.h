#ifndef __TRIANGLE_H__
#define __TRIANGLE_H__

#include <windows.h>
#include <GL/glew.h>

GLuint create_triangle_vbo();
void draw_triangle_vbo(GLuint vbo);

GLuint create_triangle_vao();
void draw_triangle_vao(GLuint vao);

#endif
