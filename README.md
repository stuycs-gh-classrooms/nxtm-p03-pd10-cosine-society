[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/-jWdCFXs)
## Project 00
### NeXTCS
### Period: 10
## Thinker0: Sulakshana Reddy
## Thinker1: Nabiha Islam


---

This project will be completed in phases. The first phase will be to work on this document. Use github-flavoured markdown. (For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) )

All projects will require the following:
- Researching new forces to implement.
- Method for each new force, returning a `PVector`  -- similar to `getGravity` and `getSpring` (using whatever parameters are necessary).
- A distinct demonstration for each individual force (including gravity and the spring force).
- A visual menu at the top providing information about which simulation is currently active and indicating whether movement is on or off.
- The ability to toggle movement on/off
- The ability to toggle bouncing on/off
- The user should be able to switch _between_ simluations using the number keys as follows:
  - `1`: Gravity
  - `2`: Spring Force
  - `3`: Drag
  - `4`: Custom Force
  - `5`: Combination


## Phase 0: Force Selection, Analysis & Plan
---------- 

#### Custom Force: Magnetic Force 

### Custom Force Formula
What is the formula for your force? Including descriptions/definitions for the symbols. (You may include a picture of the formula if it is not easily typed.)

F = k * (q1 * q2) / r^2 * r_u

F = force between two orbs
k = magnetic constant (strength of force)
q1, q2 = charges of the two orbs
r = distance between the two orbs
r_u = unit vector pointing from one orb to the other

If q1 * q2 > 0 → force is repulsive (orbs push apart)
If q1 * q2 < 0 → force is attractive (orbs pull together)


### Custom Force Breakdown
- What information that is already present in the `Orb` or `OrbNode` classes does this force use?
    - center (position of orb)
    - distance between orbs (calculated using positions)

- Does this force require any new constants, if so what are they and what values will you try initially?
  - Yes
  - k = 1.0 (magnetic strength constant, can be adjusted for testing)

- Does this force require any new information to be added to the `Orb` class? If so, what is it and what data type will you use?
  - Yes, float charge
  - This represents whether an orb is positive or negative
  - Example values: +1 or -1

- Does this force interact with other `Orbs`, or is it applied based on the environment?
  - It interacts with other orbs
  - Each orb experiences a force from every other orb

- In order to calculate this force, do you need to perform extra intermediary calculations? If so, what?
  - Yes
  - Calculate distance between two orbs
  - Normalize the direction vector
  - Compute 1 / (r^2)
  - Multiply charges to determine attraction or repulsion

--- 

### Simulation 1: Gravity
Describe how you will attempt to simulate orbital motion.

To simulate orbital motion:

One large orb will act as a central "planet"
A smaller orb will be given an initial sideways velocity

Behavior:

The smaller orb curves around the larger one
If velocity is correct, it will form an orbit
If too slow, it will spiral inward
If too fast, it will fly away

--- 

### Simulation 2: Spring
Describe what your spring simulation will look like. Explain how it will be setup, and how it should behave while running.

Setup:
One orb attached to a fixed point using a spring force

Behavior:

The orb oscillates back and forth around the anchor point
Motion is smooth and periodic
Slight damping may be added to reduce motion over time

--- 

### Simulation 3: Drag
Describe what your drag simulation will look like. Explain how it will be setup, and how it should behave while running.

Setup:

One or more orbs start with high initial velocity

Behavior:

Drag force slows the orbs over time
Motion gradually decreases until they stop
Heavier orbs may slow differently than lighter ones

--- 

### Simulation 4: Custom force
Describe what your Custom force simulation will look like. Explain how it will be setup, and how it should behave while running.

Setup:

Multiple orbs with assigned charges
Some positive (+1)
Some negative (-1)

Behavior:

Opposite charges attract
Same charges repel
Orbs move dynamically:
pulling together
pushing apart
forming clusters or spreading out

--- 

### Simulation 5: Combination
Describe what your combination simulation will look like. Explain how it will be setup, and how it should behave while running.

Setup:

Multiple orbs experiencing:
gravity
drag
spring (optional)
magnetic force

Behavior:

Orbs are affected by multiple forces at once
Motion becomes complex and chaotic
Some orbs may orbit while also attracting or repelling others
Demonstrates interaction between different physical systems
Controls / Features
Press 1 : Gravity simulation
Press 2 : Spring simulation
Press 3 : Drag simulation
Press 4 : Magnetic force simulation
Press 5 : Combination simulation
Press SPACE : Toggle movement on/off
Press B : Toggle bouncing on/off
File Names

Sim.pde
Orb.pde
Forces.pde

Forces included:

getGravity()
getSpring()
getDrag()
getMagneticForce()

