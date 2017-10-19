// reflectionMap fragment shader
#version 330

// Some drivers require the following
precision highp float;

uniform samplerCube cubeMap; //I think this is the problem...
uniform sampler2D texMap;

in vec3 ex_WorldNorm;
in vec3 ex_WorldView;
in vec2 cubeTexCoord; //Or this...

out vec4 outColour;

void main(void) {   

	vec3 reflectTexCoord = reflect(-ex_WorldView, normalize(ex_WorldNorm));
	//outColour = texture(cubeMap, reflectTexCoord) * texture(texMap, cubeTexCoord); //Isnt working, shows up blank!
	
	//Debug Outputs
	//outColour = texture(cubeMap, cubeTexCoord); //Fragment shader error!
	outColour = texture(cubeMap, reflectTexCoord); //Displays a reflective cube, reflections MAY be off however, also no underlying metal texture.
	//outColour = vec4(1.0,1.0,1.0,1.0);  //Displays a white cube as expected.
}
