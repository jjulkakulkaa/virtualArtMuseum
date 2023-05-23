#version 330

//Zmienne jednorodne
uniform mat4 P;
uniform mat4 V;
uniform mat4 M;
uniform vec3 cameraPosition;


//Atrybuty
layout (location=0) in vec4 vertex; //wspolrzedne wierzcholka w przestrzeni modelu


//Zmienne interpolowane
out vec4 clipSpace;
out vec2 textureCoords;
out vec3 toCameraVector;

const float tiling = 6.0;

void main(void) {

    vec4 worldPosition = M*vertex;

    clipSpace = P*V*worldPosition;
    gl_Position=clipSpace;
    textureCoords = vec2(vertex.x/2.0 + 0.5, vertex.z/2.0 + 0.5) * tiling;
    toCameraVector = cameraPosition - worldPosition.xyz;
}
