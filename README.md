Connect Four
============

### by Tina Zheng, Nanxi Wang, Casey Takeda, Justin Ma, Melissa Ly

Demo Link
----------
http://tinyurl.com/connect4rr


Website
--------
https://connect4rails.herokuapp.com/


Idea
----
An online platform that allows users to create accounts (or login using an existing Facebook account) and play Connect Four against each other. This platform stores all game play data for the current user, such as: wins, losses, win-to-lose ratio, and total games played. Badges are earned when the user achieves a certain amount of wins or losses.


How to play Connect Four: Two-person required game where each player tries to connect four of their pieces in a row - vertically, horizontally, or diagonally - and prevent their opponent from doing the same.


Models and Description
-----------------------
###### User
* has one unique account and many games to play

###### Badge
* has achievements for a user (a user can have many badges)

###### Game
* has game states for two users (a user can have many game states)

Features
--------
* Users can log in via Facebook account 
* Gems introduced: `omniauth`, `koala`
* Includes a personal portfolio page for users 
* Any two users can start a game of connect four
* Connect Four game states can be saved

Division of Labor
-----------------
1. Tina: created user, views, and the skeleton for Connect Four
2. Casey: frontend development (customization through CSS), created FB login database
3. Melissa: frontend profile development, created win state 
4. Nanxi: created game states, debugged
5. Justin: created badges for the game, debugged

