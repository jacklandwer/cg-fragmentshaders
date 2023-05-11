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
    // Round each color component to one of 5 levels (0.0, 0.25, 0.5, 0.75, 1.0).
    color.rgb = round(color.rgb * 4.0) / 4.0;
    FragColor = color;
}
