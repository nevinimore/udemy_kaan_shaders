shader_type canvas_item;

uniform sampler2D noise_tex;
uniform float dissolve_pct: hint_range(0.0, 1.0, 0.01) = 0.;

void fragment() {
	vec4 noise = texture(noise_tex, UV);
	vec4 og_color = texture(TEXTURE, UV);
	vec4 final_color = og_color;

	float noise_gray_value = (noise.r+noise.g+noise.b)/3.;

	if(dissolve_pct >= noise_gray_value){
		final_color.a = 0.;
	}

	COLOR = final_color;

}
