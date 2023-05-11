#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // computes the inverse of the colors.
    vec4 color = texture(image, model_uv);
    color.rgb = 1.0 - color.rgb;
    FragColor = color;
}
