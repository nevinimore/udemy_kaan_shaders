shader_type canvas_item;

uniform sampler2D noise_texture1: repeat_enable;
uniform sampler2D noise_texture2: repeat_enable;

uniform float smoke_density: hint_range(0.01, 1.0, 0.01) = 0.2;

uniform sampler2D screen_texture: hint_screen_texture, repeat_enable, filter_nearest;

void fragment() {
	
	vec4 screen_color = texture(screen_texture, SCREEN_UV);
	
	vec2 noise1_vel = vec2(0.06);
	vec2 noise2_vel = vec2(0.12);
	
	vec4 noise_color1 = texture(noise_texture1, UV+TIME*noise1_vel);
	vec4 noise_color2 = texture(noise_texture2, UV+TIME*noise2_vel);
	
	
	
	vec4 final_noise_color = noise_color1*noise_color2;
	
	final_noise_color = pow(final_noise_color, vec4(1./smoke_density));
	
	COLOR = screen_color + final_noise_color;
	
}

