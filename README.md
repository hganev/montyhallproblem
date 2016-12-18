# Monty Hall Problem 

Wikipedia: https://en.wikipedia.org/wiki/Monty_Hall_problem

The frontend will be in HTML/JS and will show 3 closed doors. In each new visit to the webpage, the items in the doors are randomly shuffled, 2 are goats, 1 is a car.

There are two steps.

1. The user picks a door, (it is simply highlighted, not yet opened)
2. The webpage(i.e. the host) opens one of the other doors (which has a goat) and asks you if you want to switch your choice.
3. based on your decision, you win the car or you lose.

The backend will record/persist in a simple database whether the user switched or not and whether the user won or not. The webpage will show the current probability calculation of winning if one switches, thus verifying the Monty Hall hypothesis empirically.

The data of the location of the car/goats is only known by the backend, as it is trivial to read the request on the frontend. Thus each click should call the backend and react to the response processed by the backend.


* The solution was implemented with Ruby on Rails framework. The UI is a simple HTML/JS, no fancy frameworks

