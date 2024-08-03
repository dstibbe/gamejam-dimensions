shader_type spatial;
render_mode cull_disabled;
uniform sampler2D _albedo: source_color;
uniform mat4 cutplane;
varying vec3 world_vtx; 

void vertex() {
	world_vtx = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
}

void fragment() {
	
	vec3 planeNormal = normalize(cutplane[1].xyz);
	float planeDist = dot(planeNormal, cutplane[3].xyz);
	float vertexDist = dot(planeNormal, world_vtx);
	
	float dist = vertexDist - planeDist;
	
	if (dist < 0.0) discard;
	
	ALBEDO = texture(_albedo, UV).rgb;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
