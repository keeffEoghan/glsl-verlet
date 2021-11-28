/**
 * Verlet integration of velocity; 1-4 dimensions.
 * AKA: Velocity Verlet.
 *
 * @see "Velocity Verlet" on
 *     https://en.wikipedia.org/wiki/Verlet_integration#Velocity_Verlet
 *
 * @param {float|vec2|vec3|vec4} `v` Velocity.
 * @param {float|vec2|vec3|vec4} `a` Acceleration, past.
 * @param {float|vec2|vec3|vec4} `a` Acceleration, next.
 * @param {float} `dt` Time elapsed.
 *
 * @returns {float|vec2|vec3|vec4} The next velocity.
 */

float verlet(float v, float a0, float a1, float dt) {
    return v+((a0+a1)*dt*0.5);
}

vec2 verlet(vec2 v, vec2 a0, vec2 a1, float dt) { return v+((a0+a1)*dt*0.5); }
vec3 verlet(vec3 v, vec3 a0, vec3 a1, float dt) { return v+((a0+a1)*dt*0.5); }
vec4 verlet(vec4 v, vec4 a0, vec4 a1, float dt) { return v+((a0+a1)*dt*0.5); }

#pragma glslify: export(verlet)
