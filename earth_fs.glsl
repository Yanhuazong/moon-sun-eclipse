#version 400

const vec4 La = vec4(0.3, 0.3, 0.3, 1.0);
uniform vec4 kd = vec4(0.8);
uniform vec4 Ld = vec4(1.0);
uniform vec4 ks = vec4(0.5);
uniform vec4 Ls = vec4(1.0);

uniform float alpha = 20.0; //phong specular exponent (shininess)
const vec3 lp = vec3(0.0, 0.0, 0.0); //world space (point light)

uniform sampler2D tex;
uniform samplerCube cubemap;
uniform float slider;
uniform float time;
uniform float f;

out vec4 fragcolor;           
in vec2 tex_coord;

in vec3 normal;   //World-space normal vector
in vec3 p;        //World-space fragment position
in vec3 pm;        //World-space fragment position

in vec3 eye;      //World-space eye position
     
void main(void)
{  vec3 l=normalize(lp-p); 
vec3 lm=normalize(lp-pm);//to the center of the moon
   vec3 n = normalize(normal); // unit normal vector
   vec3 v = normalize(eye-p); // unit view vector
   vec3 r = reflect(-l, n); // unit reflection vector
vec4 diff=vec4(0.0,0.0,0.0,0.0);
vec4 spec=vec4(0.0,0.0,0.0,0.0);
   //compute phong lighting in world space
vec3 rv = reflect(-v, n); // unit reflected view
   //diffuse term
if(pow((1-pow(dot(l,lm), 2)),0.5)*distance(lp,pm)<0.025&&distance(lp,pm)<1.1){
diff=vec4(0.0,0.0,0.0,0.0);}
else{
   diff = Ld*max((dot(n,l) + f)/(1.0+f), 0.0);
}
  
   vec4 amb = La;
      vec4 tex_color = texture(tex, tex_coord);
      diff = tex_color*diff;
     amb = tex_color*amb*0.2;
spec = ks*Ls*texture(cubemap, rv, (alpha-2.0)*0.05);
   //specular term
   //vec4 spec = ks*Ls*pow(max(dot(r,v), 0.0), alpha);
   //vec4 spec = ks*Ls*max(pow(dot(r,v), alpha), 0.0); // incorrect version: do pow after max


   fragcolor =  amb+diff + spec;
   //fragcolor = spec;
   //fragcolor.rgb = p;
}




















