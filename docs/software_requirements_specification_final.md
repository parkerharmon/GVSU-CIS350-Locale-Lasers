# Overview
<Describe the purpose of this document in 1 paragraph of less ... hint: it isyour SRS>
# Software Requirements
<Describe the structure of this section>
## Functional Requirements
### Player Character | ID | Requirement |
| :-------------: |:----------: |
| FR1 | The character shall have a health system starting from 100 and when it goes to 0 the game ends. |
| FR2 | The player shall be able to pick up XP after killing an enemy that levels up the character after a certain amount is acquired. |
| FR3 | The player shall have multiple attacks which are able to be used at varying levels such as: spear projectile(right-click) at level 1, bear trap(e) at level 3, and fireball(auto) at level 5. |
| FR4 | The player character shall be able to move using WASD and have corresponding animations associated with the movements. |
| FR5 | The player shall not be able to move through enemies or walls. |

### Enemy Characters | ID | Requirement |
| :-------------: | :----------: |
| FR6 | The enemy characters shall have a health bar and get deleted upon health hitting 0. |
| FR7 | Enemy characters shall damage the player upon collision with the damage varying on enemy type. |
| FR8 | Enemy Characters shall chase the player character after they spawn into the map |
| FR9 | Enemy characters shall spawn surrounding the player with an even distribution of spawning positions(above, below, left, right of player character). |
| FR10 | Enemy characters shall spawn at increased rates the longer the game session is creating increasing difficulty for the player. |

### UI Elements	| ID | Requirement |
| :-------------: | :----------: |
| FR11 | The main menu shall have a start button that brings the player into the main game. |
| FR12 | The end and main menu shall have an exit button that closes the game when pressed. |
| FR13 | The end screen shall have a retry button that brings the player back into the main game when pressed. |
| FR14 | The options in the menu shall be navigated by using the ‘W’ and ‘S’ keys on the keyboard and ‘Space’ to select. |
| FR15 | Player level, health, and time of the game shall be visible at all times throughout the run time of the game. |

## Non-Functional Requirements
### Performance of Game | ID | Requirement |
| :-------------: | :----------: |
| NFR1 | The game shall maintain a frames per second count above 30. |
| NFR2 | The game shall run smoothly with no freezes or lag. |
| NFR3 | New scenes of the game shall load in at most 5 seconds. |
| NFR4 | The game shall be executable on an average quality system. |
| NFR5 | The game shall not crash due to game elements. |

### User Friendliness | ID | Requirement |
| :-------------: | :----------: |
| NFR6 | The game shall have simple controls that are intuitive. |
| NFR7 | The game menu shall be clear and concise on each of the option’s functions. |
| NFR8 | The health bar shall be easily identifiable and readable. |
| NFR9 | The player’s level shall be easily identifiable and readable. |
| NFR10 | The objective of the game shall be obvious. |

### Scalability | ID | Requirement |
| :-------------: | :----------: |
| NFR11 | The game shall have class separation in order to allow features to be added seamlessly. |
| NFR12 | The game shall have no hard coded classes in order to allow easy changes and class cohesion. |
| NFR13 | The game shall have a spawner object that is easily customizable to allow for future mobs to be added. |
| NFR14 | The game shall have generic classes that can be used for other classes that require the same functionality such as hitboxes and hurtboxes. |
| NFR15 | The games folders shall have clear organization that help programmers to find important files. |
