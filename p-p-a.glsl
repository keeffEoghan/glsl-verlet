/**
 * Verlet integration; using positions (past and current) and acceleration; 1-4
 * dimensions; variable timestep.
 *
 * @see Slide 26 of the second part of Acko's "Animating Your Way to Glory"
 *     http://acko.net/blog/animate-your-way-to-glory/
 * @see "Verlet integration (without velocities)" on
 *     https://en.wikipedia.org/wiki/Verlet_integration#Verlet_integration_(without_velocities)
 *
 * @param {float|vec2|vec3|vec4} `p0` Position, past.
 * @param {float|vec2|vec3|vec4} `p1` Position, now.
 * @param {float|vec2|vec3|vec4} `a` Acceleration.
 * @param {float} `dt0` Time elapsed, past.
 * @param {float} `dt1` Time elapsed, now.
 *
 * @returns {float|vec2|vec3|vec4} The next position.
 */

float verlet(float p0, float p1, float a, float dt0, float dt1) {
    return (2.0*p1)-p0+(a*dt0*dt1);
}

vec2 verlet(vec2 p0, vec2 p1, vec2 a, float dt0, float dt1) {
    return (2.0*p1)-p0+(a*dt0*dt1);
}

vec3 verlet(vec3 p0, vec3 p1, vec3 a, float dt0, float dt1) {
    return (2.0*p1)-p0+(a*dt0*dt1);
}

vec4 verlet(vec4 p0, vec4 p1, vec4 a, float dt0, float dt1) {
    return (2.0*p1)-p0+(a*dt0*dt1);
}

/**
 * Verlet integration; using positions (past and current) and acceleration; 1-4
 * dimensions; constant timestep.
 *
 * @see Slide 26 of the second part of Acko's "Animating Your Way to Glory"
 *     http://acko.net/blog/animate-your-way-to-glory/
 * @see "Verlet integration (without velocities)" on
 *     https://en.wikipedia.org/wiki/Verlet_integration#Verlet_integration_(without_velocities)
 *
 * @param {float|vec2|vec3|vec4} `p0` Position, past.
 * @param {float|vec2|vec3|vec4} `p1` Position, now.
 * @param {float|vec2|vec3|vec4} `a` Acceleration.
 * @param {float} `dt` Time elapsed.
 *
 * @returns {float|vec2|vec3|vec4} The next position.
 */

float verlet(float p0, float p1, float a, float dt) {
    return verlet(p0, p1, a, dt, dt);
}

vec2 verlet(vec2 p0, vec2 p1, vec2 a, float dt) {
    return verlet(p0, p1, a, dt, dt);
}

vec3 verlet(vec3 p0, vec3 p1, vec3 a, float dt) {
    return verlet(p0, p1, a, dt, dt);
}

vec4 verlet(vec4 p0, vec4 p1, vec4 a, float dt) {
    return verlet(p0, p1, a, dt, dt);
}

#pragma glslify: export(verlet)
