//
// Simple fragment shader that turns color values to white while preserving alpha
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
float alpha_threshhold = 0.0;

uniform vec3 bleach_color;

void main()
{
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if (alpha > alpha_threshhold) gl_FragColor.rgb = bleach_color;
}
