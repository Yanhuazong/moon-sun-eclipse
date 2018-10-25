#version 400
uniform float moonposition;
uniform sampler2D tex;
out vec4 fragcolor;           
in vec2 pos;

     
void main(void)
{
  if (moonposition>=171.886&&moonposition<=176.599)
   {fragcolor = vec4(0.26,0.33,0.96,1.0)*(moonposition-176.599)/(171.886-176.599);
   return;
   }
   else if (moonposition>=176.599&&moonposition<=183.468)
   {fragcolor = vec4(0.0,0.0,0.0,1.0);
    return;
   }
   else if(moonposition>=183.468&&moonposition<=188.249)
   {fragcolor = vec4(0.26,0.33,0.96,1.0)*(moonposition-183.468)/(188.249-183.468);
    return;
   }
   else {fragcolor = vec4(0.26,0.33,0.96,1.0);
    return;
   }
   
  /*
   vec4 tex_color = texture(tex, pos);
   if (moonposition>=171.886&&moonposition<=176.599)
   {fragcolor = tex_color*(moonposition-176.599)/(171.886-176.599);
   return;
   }
   else if (moonposition>=176.599&&moonposition<=183.468)
   {fragcolor = vec4(0.0,0.0,0.0,1.0);
    return;
   }
   else if(moonposition>=183.468&&moonposition<=188.249)
   {fragcolor = tex_color*(moonposition-183.468)/(188.249-183.468);
    return;
   }
   else {fragcolor = tex_color;
    return;
   }*/
}



















