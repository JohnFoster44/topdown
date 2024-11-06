# Player Notes

## Overview

This document provides an overview of the scripts related to the player's state machine and input handling in the game.

## Scripts

### `player.gd`

This script defines the `Player` class, which extends `CharacterBody2D`. It includes an exported variable `current_attack` to track the player's current attack state and a variable `player_direction` to store the player's movement direction.

### `idle_state.gd`

This script defines the `IdleState` class, which extends `NodeState`. It handles the player's behavior when in the idle state. It plays the appropriate idle animation based on the player's direction and transitions to the walk or attack state based on input.

### `walk_state.gd`

This script defines the `WalkState` class, which extends `NodeState`. It handles the player's behavior when in the walk state. It plays the appropriate walk animation based on the player's direction, updates the player's direction and velocity, and transitions to the idle state if there is no movement input.

### `attack_state.gd`

This script defines the `AttackState` class, which extends `NodeState`. It handles the player's behavior when in the attack state. It plays the attack animation based on the player's direction and transitions to the idle state once the attack animation is complete.

---

### `game_input_events.gd`

This script defines the `GameInputEvents` class, which handles player input. It includes static methods to get movement input and check if there is any movement input.

### `node_state_machine.gd`

This script defines the `NodeStateMachine` class, which manages the state transitions for the player. It initializes the state machine, handles state transitions, and delegates process and physics process calls to the current state.
