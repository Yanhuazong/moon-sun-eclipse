#version 400            
uniform mat4 PVM;
uniform float time;

//Attributeless rendering. Note that there are no "in" variables.
//Position is set based on built-in variables, like gl_VertexID,
//and uniforms, like time.

void main(void)
{
   float id = 2.0*3.141592*0.001*float(gl_VertexID);
   float r = 1.1;

   //Compute clip-space vertex position
   gl_Position = PVM*vec4(r*cos(id), r*sin(id),0.0,  1.0);  //w = 1 becase this is a point
   
 //  gl_PointSize = 1.0;
}


//Note, you could also draw a quad with attributeless rendering like this:
/*
const vec2 quad[4] = vec2[]
(
  vec2(-1.0,  1.0),
  vec2(-1.0, -1.0),
  vec2( 1.0,  1.0),
  vec2( 1.0, -1.0)
);
 
void main()
{
  gl_Position = vec4( quad[ gl_VertexID ], 0.0, 1.0);
}
*/