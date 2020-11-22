/**
 * GLSL Verlet integration in 1-3 dimensions.
 * See slide 26 of the second part of Acko's Animating Your Way to Glory.
 * @see http://acko.net/blog/animate-your-way-to-glory/
 *
 * @todo Use macro to repeat calculation in any dimension?
 *
 * @param {float|vec2|vec3} a Acceleration.
 * @param {float|vec2|vec3} p0 Last position.
 * @param {float|vec2|vec3} p1 Current position.
 * @param {float} dt0 Time elapsed in the last frame.
 * @param {float} dt1 Time elapsed in the current frame.
 *
 * @returns {float|vec2|vec3} The new position.
 */

float verlet(in float a, in float p0, in float p1, in float dt0, in float dt1) {
    return (2.0*p1)-p0+(a*dt0*dt1);
}

vec2 verlet(in vec2 a, in vec2 p0, in vec2 p1, in float dt0, in float dt1) {
    return (2.0*p1)-p0+(a*dt0*dt1);
}

vec3 verlet(in vec3 a, in vec3 p0, in vec3 p1, in float dt0, in float dt1) {
    return (2.0*p1)-p0+(a*dt0*dt1);
}

/**
 * Constant time-step versions.
 *
 * @param {float|vec2|vec3} a Acceleration.
 * @param {float|vec2|vec3} p0 Last position.
 * @param {float|vec2|vec3} p1 Current position.
 * @param {float} dt Time elapsed.
 *
 * @returns {float|vec2|vec3} The new position.
 */

float verlet(in float a, in float p0, in float p1, in float dt) {
    return verlet(a, p0, p1, dt, dt);
}

vec2 verlet(in vec2 a, in vec2 p0, in vec2 p1, in float dt) {
    return verlet(a, p0, p1, dt, dt);
}

vec3 verlet(in vec3 a, in vec3 p0, in vec3 p1, in float dt) {
    return verlet(a, p0, p1, dt, dt);
}


#pragma glslify: export(verlet);
