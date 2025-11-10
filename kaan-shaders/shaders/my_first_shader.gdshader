shader_type canvas_item;

uniform float velocity_potency: hint_range(-10.0, 10.0, 0.1) = 1.;

group_uniforms FirstColours;
uniform vec4 color1: source_color;
uniform vec4 color2: source_color;
group_uniforms;

group_uniforms SecondColours;
uniform vec4 color3: source_color;
uniform vec4 color4: source_color;
group_uniforms;

uniform vec4 sprite_color: source_color;

void vertex() {
	if(VERTEX.y < 0.){
		VERTEX += vec2(40., 30.*cos(TIME*pow(2, velocity_potency) ));
	}
}

void fragment() {
	
	float velocity = pow(2, velocity_potency);
	
	float factor = (cos(TIME*velocity)+1.)*0.5;
	float factor_c = (cos(TIME*velocity)+1.)*0.5;
	float factor_s = (sin(TIME*velocity+PI*1.5)+1.)*0.5;
	
	vec4 result_color = mix(color1, color2, factor);
	
	//COLOR = vec4(result_color.rbg, COLOR.a);
	
	//COLOR = texture(TEXTURE, UV+vec2(.5, .0));
	
	//COLOR *= vec4(UV.x*factor_c, UV.y*factor_s, .0, 1.);
	
	//vec4 colora = vec4(0.);
	//vec4 colorb = vec4(0.);
	//
	//if(cos(TIME*velocity/2.) > 0.){
		//colora = color1;
	//}else{
		//colora = color3;
	//}
	//if(sin(TIME*velocity/2.) > 0.){
		//colorb = color2;
	//}else{
		//colorb = color4;
	//}
	//vec4 this_color = UV.x*colora*factor_c + UV.y*colorb*factor_s;
	//COLOR *= vec4(this_color.rgb, 1.0);
	
	vec4 this_colour = texture(TEXTURE, UV);
	float this_grey_value = this_colour.r*.2126 + this_colour.g*.7152 + this_colour.b*.0722;
	vec3 this_grey_colour = vec3(this_grey_value);
	
	COLOR = vec4(this_grey_colour*sprite_color.rgb, COLOR.a);
	
	
	
}
