shader_type canvas_item;

uniform vec4 flash_color: source_color = vec4(1.0);
uniform float flash_pct: hint_range(0.0, 1.0, 0.02);

uniform bool is_flashing = false;
uniform float time_flash = 0.15;

//void reset_time_flash(){
	//time_begin_flashi = TIME;
//}
//
void fragment() {
	
	vec4 original_color = texture(TEXTURE, UV);
	vec4 this_color = mix(original_color, flash_color, flash_pct);
	
	COLOR.rgb = this_color.rgb;
	COLOR.a = this_color.a*original_color.a;
	
	//// make flash
	//if(is_flashing){
		//
		//vec4 original_color = texture(TEXTURE, UV);
		//float p = .5 + 2.0*sin(((TIME)/PI)*10./time_flash);
		//p = clamp(p, 0., 1.);
		//vec4 this_color = mix(original_color, flash_color, p);
		//
		//COLOR.rgb = this_color.rgb;
		//COLOR.a = this_color.a*original_color.a;
	//}
}
