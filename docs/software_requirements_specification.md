# Overview

This document's purpose serves to display the requirements we intend to take on with our project. By having clear requirements, we are able to stay organized and have a clear goal oriented approach to our programming. 

# Functional Requirements

1. Player Character
    1. The character shall have a health system starting from 100 and when it goes to 0 the game ends. 
    2. The player shall be able to pick up XP after killing an enemy that levels up the character after a certain amount is acquired. 
    3. The player shall have multiple attacks which are able to be used at varying levels such as: spear projectile(right-click) at level 1, bear trap(e) at level 3, and fireball(auto) at level 5.
    4. The player character shall be able to move using WASD and have corresponding animations associated with the movements.
    5. The player shall not be able to move through enemies or walls.
2. Enemy Characters
    1. The enemy characters shall have a health bar and get deleted upon health hitting 0.
    2. Enemy characters shall damage the player upon collision with the damage varying on enemy type.
    3. Enemy Characters shall chase the player character after they spawn into the map.
    4. Enemy characters shall spawn surrounding the player with an even distribution of spawning positions(above, below, left, right of player character).
    5. Enemy characters shall spawn at increased rates the longer the game session is creating increasing difficulty for the player
3. UI Elements
    1. The main menu shall have a start button that brings the player into the main game.
    2. The end and main menu shall have an exit button that closes the game when pressed.
    3. The end screen shall have a retry button that brings the player back into the main game when pressed.
    4. The options in the menu shall be navigated by using the ‘W’ and ‘S’ keys on the keyboard and ‘Space’ to select.
    5. Player level, health, and time of the game shall be visible at all times throughout the run time of the game.
   
# Non-Functional Requirements

1. Performance of Game
    1. The game shall maintain a frames per second count above 30.
    2. The game shall run smoothly with no freezes or lag.
    3. New scenes of the game shall load in at most 5 seconds.
    4. The game shall be executable on an average quality system.
    5. The game shall not crash due to game elements.
2. User Friendliness
    1. The game shall have simple controls that are intuitive.
    2. The game menu shall be clear and concise on each of the option’s functions.
    3. The health bar shall be easily identifiable and readable.
    4. The player’s level shall be easily identifiable and readable.
    5. The objective of the game shall be obvious.
3. Future Scalability
    1. The game shall have class separation in order to allow features to be added seamlessly.
    2. The game shall have no hard coded classes in order to allow easy changes and class cohesion.
    3. The game shall have a spawner object that is easily customizable to allow for future mobs to be added.
    4. The game shall have generic classes that can be used for other classes that require the same functionality such as hitboxes and hurtboxes.
    5. The games folders shall have clear organization that help programmers to find important files. 




