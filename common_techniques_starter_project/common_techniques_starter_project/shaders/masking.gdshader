shader_type canvas_item;

uniform sampler2D mask_texture;

void fragment() {
	vec4 og_colors = texture(TEXTURE, UV);
	vec4 mask_colors = texture(mask_texture, UV+vec2(0.0, 0.0));
	mask_colors = vec4(1.) - mask_colors;
	
	//COLOR = og_colors*mask_colors;
	
	float mask_gray_value = (mask_colors.r+mask_colors.g+mask_colors.b)/3.;

	COLOR.a *= mask_gray_value;
	
}
