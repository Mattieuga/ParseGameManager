# Parse Game Manager

## About

A simple Parse module for matching two user in a two player game (à la Draw Something).

To use in your app just clone the code in make sure to remove my keys. Parse keys have not been removed from this repo to make it easier to update. The associtated app will be deleted so please do not use them. 


## How to use

Uses the default Parse `_User` class and a custom `Match` class for managing the games. The following fields are used for the matching:

- `gameLock` : the number of users who have attempted to join the game. This is used to make sure no race conditions happen between user. It is incremented using the atomic operation `increment` and if the number is 3 after trying to join, the user will know this game is no longer available.
- `player1` : the creator of the match.
- `player2` : the player who joined the match.
- `gameStatus` : shows the state of the game. Progresses as follows: 
  1. `waiting` : somone created the game but no player have joined it yet.
  2. `in_progress` : a player has joined the `waiting` game and so it has started.
  3. `finished` : the game has been player and is completed.
  4. `cancelled` : the game was cancelled by either player.
- `turn` : either `player_1` or `player_2` depending on who'se turn it is.

Only 1 method is currently available:

1. `joinAnonymousGame`: join a randomly matched game.



Mattieu Gamache-Asselin