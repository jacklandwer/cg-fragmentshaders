#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    vec4 color = texture(image, model_uv);
    // Scale and translate texture coordinates to range [-1.0, 1.0].
    vec2 texCoord = 2.0 * model_uv - 1.0; 
    float theta = atan(texCoord.y, texCoord.x); 
    float radius = pow(length(texCoord), 1.5);
    // Apply fisheye distortion.
    vec2 fishEyeTexCoord = vec2(radius * cos(theta), radius * sin(theta));
    // Re-scale final texture coordinate to range [0.0, 1.0].
    vec2 finalTexCoord = 0.5 * (fishEyeTexCoord + 1.0);
    FragColor = texture(image, finalTexCoord);
}
