#version 400

const vec4 La = vec4(0.3, 0.3, 0.3, 1.0);
uniform vec4 kd = vec4(0.8);
uniform vec4 Ld = vec4(1.0);
uniform vec4 ks = vec4(0.5);
uniform vec4 Ls = vec4(1.0);

uniform float alpha = 20.0; //phong specular exponent (shininess)

const vec3 lp = vec3(0.0, 0.0, 0.0); //world space (directional light)

uniform sampler2D tex;
uniform samplerCube cubemap;
uniform float slider;
uniform float time;
uniform float f;

out vec4 fragcolor;           
in vec2 tex_coord;

in vec3 normal;   //World-space normal vector
in vec3 p;        //World-space fragment position
in vec3 pe;       //Earth position
in vec3 pm;       //Moon position
in vec3 eye;      //World-space eye position
     
void main(void)
{  vec3 l=-normalize(lp-p); 
vec3 ls=normalize(p-pe);
vec3 le=normalize(pm-pe);
   vec3 n = normalize(normal); // unit normal vector
   vec3 v = normalize(eye-p); // unit view vector
   vec3 r = reflect(-l, n); // unit reflection vector

   //compute phong lighting in world space

   //diffuse term
   vec4 diff=vec4(0.0,0.0,0.0,0.0);
   if(pow((1-pow(dot(ls,le), 2)),0.5)*distance(pe,pm)<0.05&&distance(lp,pe)<distance(p,pe)){
diff=vec4(0.0,0.0,0.0,0.0);} 
else {
   diff = Ld*max((dot(n,l) + f)/(1.0+f), 0.0);
   }
   vec4 amb = La;
   
      vec4 tex_color = texture(tex, tex_coord);
     diff = vec4(0.96,0.97,0.56,1.0)*diff;
   // diff = tex_color*diff;
      amb = tex_color*amb*0.05;


   vec3 rv = reflect(-v, n); // unit reflected view
   vec4 spec = ks*Ls*texture(cubemap, rv, (alpha-2.0)*0.05);

   fragcolor =  amb + diff + 10*spec;

}




















