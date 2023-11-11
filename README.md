# VR Mech Combat Game Prototype

## Project Overview

This project is a prototype for a Mech Combat game designed for virtual reality (VR). We aim to create an immersive experience where the player controls a mech, with the mech's movements following the player's actions. The development is done using the Godot Engine, leveraging its powerful and user-friendly capabilities to simulate realistic VR interactions.

## Features

### VR Simulation Mode

- **Head Tracking Simulation**: Implemented a simulation mode where the player's head movements are simulated using mouse movements. This feature allows for testing without the need for constantly wearing the VR headset.
  
  - Middle mouse button activates the head tracking mode.
  - Mouse movement translates to head rotation within the VR environment.
  
- **Hand Thrust Simulation**: Simulated the mech's hand movements to correspond with the player's actions, using mouse clicks to mimic the thrust of the mech's hands.

  - Left mouse click simulates a left-hand thrust.
  - Right mouse click simulates a right-hand thrust.
  
### Error Handling and Debugging

- Addressed and corrected errors related to node pathing and property access, ensuring that the hand nodes are recognized and manipulated correctly within the Godot engine.
- Resolved type mismatch errors in the `lerp` function to enable smooth interpolation for hand reset positions.

## Development Setup

- **Godot Version**: The project is developed using Godot 4, which introduces significant syntax changes and enhancements over previous versions.
- **Scene Structure**: The VR controllers are child nodes of the player's `Head` node, which in turn is a child of the `Player` node. This hierarchy is crucial for the proper functioning of the simulation scripts.

## Usage

- To simulate head tracking, press and hold the middle mouse button and move the mouse around.
- To simulate mech hand thrusts, use the left and right mouse buttons to thrust the corresponding mech hands.

## Future Work

- Integrate the simulation mode with more complex VR interactions.
- Develop environment interactions and mech dynamics.
- Expand the prototype into a full-featured VR Mech Combat game.

## Contributing

We welcome contributions and ideas from other VR enthusiasts and game developers. Feel free to fork the project, create issues, and submit pull requests. Let's build an exciting VR experience together at some point!

