shader_type canvas_item;

void fragment() {
	vec4 og_color = texture(TEXTURE, UV);
	float gray_value = 0.2989*og_color.r + 0.5870*og_color.g + 0.1140*og_color.b;
	vec3 gray_color = vec3(gray_value);
	COLOR.rgb = gray_color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
