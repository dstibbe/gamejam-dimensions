shader_type spatial;
uniform int depth = 5; 
uniform int z = 2;


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float part = float( z + 2) / 5.0;
	float part_max = part + (1.0/5.0);
	vec2 scaled = UV * vec2(3.0, 2.0);
	if ( scaled.y >= part && scaled.y < part_max ){
		ALBEDO = vec3(0.1, 1, 0.1);
	}else{
		ALBEDO = vec3(1.0, 1.0, 1.0);
	}	
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
