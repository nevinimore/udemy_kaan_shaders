shader_type canvas_item;

uniform sampler2D noise_texture1: repeat_enable;
uniform sampler2D noise_texture2: repeat_enable;

uniform float distortion_strenght: hint_range(-1.0, 1.0, 0.001) = 0.01;
uniform float distortion_velocity: hint_range(0.0, 4.0, 0.1) = 0.5;

uniform sampler2D screen_texture: hint_screen_texture, filter_nearest, repeat_enable;

uniform vec2 offset1 = vec2(0.1);
uniform vec2 offset2 = vec2(0.1);

void fragment() {
	vec4 noise_color1 = texture(noise_texture1, UV+offset1*TIME*(2.*distortion_velocity)*cos(TIME*0.00001));
	vec4 noise_color2 = texture(noise_texture2, UV+offset2*TIME*(1.*distortion_velocity)*cos(TIME*0.00001));
	
	float final_noise1 = (noise_color1.r+noise_color2.r)/2.;
	float final_noise2 = noise_color1.r*noise_color2.r;
	
	vec2 screen_size = TEXTURE_PIXEL_SIZE;
	vec4 final_color = texture(screen_texture, SCREEN_UV+vec2(final_noise2*distortion_strenght));
	
	COLOR.rgb = vec3(1.);
	//COLOR.a = final_noise1;
	COLOR = final_color;
}
