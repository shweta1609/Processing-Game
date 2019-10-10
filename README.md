# Processing-Game

It’s time for Halloween and my character needs to collect 21 candies to win a bet with his
friends. 
</br>
The goal of this game is to help this character collect 21 candies; 6 in first stage, 7 in
second stage and 8 in final stage overcoming any possible hurdles on the way. The character
has a total of 3 lives/chances to complete all 3 stages. He has to collect all the candies; no
candies should be left on the way. Moving on to next stage is not possible until all the candies
are collected in the present stage.
</br></br>

During the entire course of the game, current stage will be displayed on the top-left of the
screen, Life available will be displayed on the top-center of the screen and score will be
displayed on the top-right of the screen.
After the game is completed or it’s over, final screen will display the status of the game and the
score. You can start the game again if you click on the screen.
</br>
# Stage one 
It is the easiest stage. Character starts from the left of the screen and has to collect all
the 6 candies before he can see the door to move to stage 2. There are no hurdles and the
ground are smooth. Character can jump, go forward and go backwards to collect candy. As soon
as character collects all 6 candies, they will see the door to move to stage 2.
</br>
# Stage two 
It is a little more interesting, with 2 danger-hurdles on the way. Danger hurdles are the
triangular flashy things on the ground. If the character hits any of the hurdle, he loses one life.
Be careful while catching candies which are right above those hurdles. Candies displace by up to
10 pixel-points so character may wait until they move a little away from the hurdle (they might
or might not, be clever while jumping and make sure to use LEFT/RIGHT keys to avoid hitting
the hurdles)
</br>
# Stage three 
It is the final one and is a little more difficult as it has 4 danger hurdles across the way. If
any life is lost in stage two, only the remaining number of lives will be available in stage three.
So be careful when you start stage 3. If the character loses all 3 lives before collecting all the
candies, it will be dead, and the game will be over.

</br>
# Scoring:
For each candy, you get one point. So, at the end, maximum score will be 21.</br>
If at any stage you hit the hurdle, all the candy points score in that stage will be lost and you
have to restart the stage. The score of the previous stage will remain unchanged.
</br>
# Graphics:

1. Character in the game is designed by me and has 2 different animations (may not be as
evident in the game). It has two leg and hand movements which are displayed
alternatively while it moves, to give a simple effect of animation. When it jumps, it
moves its one hand upwards to give a simple effect of jumping up. There is no separate
animation/flipping of character when it moves to right though.

2. Candies are small blinkering objects, which displaces its position by 10 points randomly
to make it possible for character to catch the candies when it is right above the hurdle.

3. Ground is the green and brown graphical image at the bottom of the screen. It is also
designed in the Processing tool, captured as an image and imported in the game to fulfill
the image requirement of the project.

4. Hurdles are the shining triangular objects on the ground. They display random light
colors to display a shiny effect.
</br>

# Music:

There are 5 music files, one each for game start, game end, candy collected, hitting the hurdle
(losing one life) and moving to next stage. 
Music taken from Mario game.

# Limitations:

1. No different graphics for left movement. Tried pushMatrix, scale and popMatrix but it
did not work for my character.
2. There are sometimes overlap in the sound effect as the previous melody isn’t finished
until next one starts.
