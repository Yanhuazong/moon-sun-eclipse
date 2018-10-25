#version 400            
uniform mat4 PVM;
uniform mat4 M;
uniform mat4 V;

in vec3 pos_attrib; //in object space
out vec2 pos;

void main(void)
{
   //Compute clip-space vertex position
   gl_Position = PVM*vec4(pos_attrib, 1.0); 
     pos = vec2(pos_attrib.x,pos_attrib.y);    //w = 1 becase this is a point
}
