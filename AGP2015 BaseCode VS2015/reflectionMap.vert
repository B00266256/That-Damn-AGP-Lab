// reflectionMap.vert
// Vertex shader for reflective enviroment mapping using a skybox.
#version 330

uniform mat4 modelview;
uniform mat4 projection;
uniform mat4 modelMatrix;
uniform vec3 cameraPos;

out vec3 ex_WorldNorm;
out vec3 ex_WorldView;
out vec2 cubeTexCoord;

in vec3 in_Position;
in vec3 in_Normal;
in vec2 in_TexCoord;

//multiply each vertex position by the modelview projection
void main(void) {
	// vertex into eye coordinates
	vec4 vertexPosition = modelview * vec4(in_Position,1.0);
    gl_Position = projection * vertexPosition;

	cubeTexCoord = in_TexCoord;

	//cubeTexCoord = normalize(in_Position);

	vec3 worldPos = (modelMatrix * vec4(in_Position,1.0)).xyz;
	mat3 normalworldmatrix=transpose(inverse(mat3(modelMatrix)));

	ex_WorldNorm = normalworldmatrix * in_Normal;
	ex_WorldView = cameraPos - worldPos;
}