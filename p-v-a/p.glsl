/**
 * Verlet integration of position; 1-4 dimensions; variable timestep.
 * AKA: Velocity Verlet.
 *
 * @see "Velocity Verlet" on
 *     https://en.wikipedia.org/wiki/Verlet_integration#Velocity_Verlet
 *
 * @param {float|vec2|vec3|vec4} `p` Position.
 * @param {float|vec2|vec3|vec4} `v` Velocity.
 * @param {float|vec2|vec3|vec4} `a` Acceleration.
 * @param {float} `dt0` Time elapsed, past.
 * @param {float} `dt1` Time elapsed, now.
 *
 * @returns {float|vec2|vec3|vec4} The next position.
 */

float verlet(float p, float v, float a, float dt0, float dt1) {
    return p+(v*dt1)+(a*dt0*dt1*0.5);
}

vec2 verlet(vec2 p, vec2 v, vec2 a, float dt0, float dt1) {
    return p+(v*dt1)+(a*dt0*dt1*0.5);
}

vec3 verlet(vec3 p, vec3 v, vec3 a, float dt0, float dt1) {
    return p+(v*dt1)+(a*dt0*dt1*0.5);
}

vec4 verlet(vec4 p, vec4 v, vec4 a, float dt0, float dt1) {
    return p+(v*dt1)+(a*dt0*dt1*0.5);
}

/**
 * Verlet integration of position; 1-4 dimensions; constant timestep.
 * AKA: Velocity Verlet.
 *
 * @see "Velocity Verlet" on
 *     https://en.wikipedia.org/wiki/Verlet_integration#Velocity_Verlet
 *
 * @param {float|vec2|vec3|vec4} `p` Position.
 * @param {float|vec2|vec3|vec4} `v` Velocity.
 * @param {float|vec2|vec3|vec4} `a` Acceleration.
 * @param {float} `dt` Time elapsed.
 *
 * @returns {float|vec2|vec3|vec4} The next position.
 */

float verlet(float p, float v, float a, float dt) {
    return verlet(p, v, a, dt, dt);
}

vec2 verlet(vec2 p, vec2 v, vec2 a, float dt) {
    return verlet(p, v, a, dt, dt);
}

vec3 verlet(vec3 p, vec3 v, vec3 a, float dt) {
    return verlet(p, v, a, dt, dt);
}

vec4 verlet(vec4 p, vec4 v, vec4 a, float dt) {
    return verlet(p, v, a, dt, dt);
}

#pragma glslify: export(verlet)
