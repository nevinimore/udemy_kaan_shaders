shader_type canvas_item;

uniform sampler2D gradient_texture;

void fragment() {
	vec4 og_color = texture(TEXTURE, UV);
	float gray_value = 0.2989*og_color.r + 0.5870*og_color.g + 0.1140*og_color.b;
	vec3 gray_color = vec3(gray_value);
	
	
	vec4 gradient_color = texture(gradient_texture, vec2(gray_value, 0.0));
	
	COLOR.rgb = gradient_color.rgb;
	
	
	
}

