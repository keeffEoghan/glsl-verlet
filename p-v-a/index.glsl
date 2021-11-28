#pragma glslify: verletP = require(./p)
#pragma glslify: verletV = require(./v)

/**
 * Verlet integration; using position, velocity, acceleration; 1-4 dimensions;
 * variable timestep; constant acceleration.
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
 * @returns {float|vec2|vec3|vec4} The next position; the given position and
 *     velocity are also updated via `inout`.
 */

float verlet(inout float p, inout float v, float a, float dt0, float dt1) {
    p = verletP(p, v, a, dt0, dt1);
    v = verletV(v, a, a, dt1);

    return p;
}

vec2 verlet(inout vec2 p, inout vec2 v, vec2 a, float dt0, float dt1) {
    p = verletP(p, v, a, dt0, dt1);
    v = verletV(v, a, a, dt1);

    return p;
}

vec3 verlet(inout vec3 p, inout vec3 v, vec3 a, float dt0, float dt1) {
    p = verletP(p, v, a, dt0, dt1);
    v = verletV(v, a, a, dt1);

    return p;
}

vec4 verlet(inout vec4 p, inout vec4 v, vec4 a, float dt0, float dt1) {
    p = verletP(p, v, a, dt0, dt1);
    v = verletV(v, a, a, dt1);

    return p;
}

/**
 * Verlet integration; using position, velocity, acceleration; 1-4 dimensions;
 * variable timestep; variable acceleration.
 * AKA: Velocity Verlet.
 *
 * @see "Velocity Verlet" on
 *     https://en.wikipedia.org/wiki/Verlet_integration#Velocity_Verlet
 *
 * @see GLSLify "Passing references between modules"
 *     https://github.com/glslify/glslify#passing-references-between-modules
 *
 * @param {float|vec2|vec3|vec4} `p` Position.
 * @param {float|vec2|vec3|vec4} `v` Velocity.
 * @param {float|vec2|vec3|vec4} `a` Acceleration.
 * @param {float} `dt0` Time elapsed, past.
 * @param {float} `dt1` Time elapsed, now.
 * @param {int} `f` Flag, update acceleration via external `forces` callback.
 *
 * @returns {float|vec2|vec3|vec4} The next position; the given position,
 *     velocity, and acceleration are also updated via `inout`.
 */

float verlet(inout float p, inout float v, inout float a, float dt0, float dt1,
        int f) {
    float p1 = verletP(p, v, a, dt0, dt1);
    float a1 = forces(p, p1, v, a, dt0, dt1, f);

    v = verletV(v, a, a1, dt1);
    a = a1;

    return (p = p1);
}

vec2 verlet(inout vec2 p, inout vec2 v, inout vec2 a, float dt0, float dt1,
        int f) {
    vec2 p1 = verletP(p, v, a, dt0, dt1);
    vec2 a1 = forces(p, p1, v, a, dt0, dt1, f);

    v = verletV(v, a, a1, dt1);
    a = a1;

    return (p = p1);
}

vec3 verlet(inout vec3 p, inout vec3 v, inout vec3 a, float dt0, float dt1,
        int f) {
    vec3 p1 = verletP(p, v, a, dt0, dt1);
    vec3 a1 = forces(p, p1, v, a, dt0, dt1, f);

    v = verletV(v, a, a1, dt1);
    a = a1;

    return (p = p1);
}

vec4 verlet(inout vec4 p, inout vec4 v, inout vec4 a, float dt0, float dt1,
        int f) {
    vec4 p1 = verletP(p, v, a, dt0, dt1);
    vec4 a1 = forces(p, p1, v, a, dt0, dt1, f);

    v = verletV(v, a, a1, dt1);
    a = a1;

    return (p = p1);
}

/**
 * Verlet integration; using position, velocity, acceleration; 1-4 dimensions;
 * constant timestep; constant acceleration.
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
 * @returns {float|vec2|vec3|vec4} The next position; the given position and
 *     velocity are also updated via `inout`.
 */

float verlet(inout float p, inout float v, float a, float dt) {
    return verlet(p, v, a, dt, dt);
}

vec2 verlet(inout vec2 p, inout vec2 v, vec2 a, float dt) {
    return verlet(p, v, a, dt, dt);
}

vec3 verlet(inout vec3 p, inout vec3 v, vec3 a, float dt) {
    return verlet(p, v, a, dt, dt);
}

vec4 verlet(inout vec4 p, inout vec4 v, vec4 a, float dt) {
    return verlet(p, v, a, dt, dt);
}

/**
 * Verlet integration; using position, velocity, acceleration; 1-4 dimensions;
 * constant timestep; variable acceleration.
 * AKA: Velocity Verlet.
 *
 * @see "Velocity Verlet" on
 *     https://en.wikipedia.org/wiki/Verlet_integration#Velocity_Verlet
 *
 * @see GLSLify "Passing references between modules"
 *     https://github.com/glslify/glslify#passing-references-between-modules
 *
 * @param {float|vec2|vec3|vec4} `p` Position.
 * @param {float|vec2|vec3|vec4} `v` Velocity.
 * @param {float|vec2|vec3|vec4} `a` Acceleration.
 * @param {float} `dt` Time elapsed.
 * @param {int} `f` Flag, update acceleration via external `forces` callback.
 *
 * @returns {float|vec2|vec3|vec4} The next position; the given position,
 *     velocity, and acceleration are also updated via `inout`.
 */

float verlet(inout float p, inout float v, inout float a, float dt, int f) {
    return verlet(p, v, a, dt, dt, f);
}

vec2 verlet(inout vec2 p, inout vec2 v, inout vec2 a, float dt, int f) {
    return verlet(p, v, a, dt, dt, f);
}

vec3 verlet(inout vec3 p, inout vec3 v, inout vec3 a, float dt, int f) {
    return verlet(p, v, a, dt, dt, f);
}

vec4 verlet(inout vec4 p, inout vec4 v, inout vec4 a, float dt, int f) {
    return verlet(p, v, a, dt, dt, f);
}

/**
 * Callback, apply forces to new acceleration.
 * Defined externally, can be passed to this module using GLSLify's
 * reference-passing feature upon `require`.
 *
 * @see GLSLify "Passing references between modules"
 *     https://github.com/glslify/glslify#passing-references-between-modules
 *
 * @callback forces
 * @param {float|vec2|vec3|vec4} `p0` Position, past.
 * @param {float|vec2|vec3|vec4} `p1` Position, next.
 * @param {float|vec2|vec3|vec4} `v` Velocity.
 * @param {float|vec2|vec3|vec4} `a` Acceleration.
 * @param {float} `dt0` Time elapsed, past.
 * @param {float} `dt1` Time elapsed, now.
 * @param {int} `f` Flag, update acceleration via this callback, as given.
 *
 * @returns {float|vec2|vec3|vec4} The next acceleration.
 */
float forces(float p0, float p1, float v, float a, float dt0, float dt1, int f);
vec2 forces(vec2 p0, vec2 p1, vec2 v, vec2 a, float dt0, float dt1, int f);
vec3 forces(vec3 p0, vec3 p1, vec3 v, vec3 a, float dt0, float dt1, int f);
vec4 forces(vec4 p0, vec4 p1, vec4 v, vec4 a, float dt0, float dt1, int f);

#pragma glslify: export(verlet)
