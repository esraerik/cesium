uniform sampler2D u_texture;

varying vec2 v_textureCoordinates;

// TODO: Make agi_ function.
// From http://stackoverflow.com/questions/4200224/random-noise-functions-for-glsl
float rand(vec2 co)
{
    return fract(sin(dot(co.xy ,vec2(12.9898, 78.233))) * 43758.5453);
}

void main(void)
{
    float noiseValue = rand(v_textureCoordinates + sin(agi_time)) * 0.1;
    vec3 rgb = texture2D(u_texture, v_textureCoordinates).rgb;
    vec3 green = vec3(0.0, 1.0, 0.0);

    gl_FragColor = vec4((noiseValue + rgb) * green, 1.0);
}
