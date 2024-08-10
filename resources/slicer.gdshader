shader_type spatial;
render_mode cull_disabled;
uniform sampler2D _albedo: source_color;
uniform bool disabled = false;
uniform mat4 cutplane;
varying vec3 world_vtx;
uniform float visible_depth = 2.; 

void vertex() {
	if (!disabled){
		world_vtx = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	}
}

void fragment() {
	if (!disabled){
		
		vec3 planeNormal = normalize(cutplane[1].xyz);
		float planeDist = dot(planeNormal, cutplane[3].xyz);
		float vertexDist = dot(planeNormal, world_vtx);
		
		float dist = vertexDist - planeDist;
		
		if (dist < 0.0)
		{
			discard;
		}else{
			float m =  1. / ( dist + 1. );
			//float m =  max( (visible_depth- dist)/visible_depth, 0.0);
			ALBEDO = texture(_albedo, UV).rgb * m;	
		}
	}else{
		ALBEDO = texture(_albedo, UV).rgb;
	}
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
