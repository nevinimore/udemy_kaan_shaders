shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture, filter_nearest;

void fragment() {
	vec4 screen_color = texture(screen_texture, SCREEN_UV);
	
	float gray_value = 0.2989*screen_color.r + 0.5870*screen_color.g + 0.1140*screen_color.b;
	
	screen_color.rgb = vec3(gray_value);
	COLOR = screen_color;
}
