/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Varrying text via loops
 - Functions
 
 In the assignment:
 - A story with at least 6 knots
 - Vary some text via a loop
 - Create a function that serves as a timer. (This is shown in the video)
*/



VAR time = 0 // 0 Morning, 1 Noon, 2 Night
VAR loopCount = 0

-> seashore

== seashore ==
You are sitting on the beach.  

It is { advance_time() }.  

+[Go to the ocean] -> ocean  
+[Go to the cliff] -> cliffs  

-> DONE

== ocean ==
You stand at the edge of the water.  

It is { advance_time() }.  

The waves look inviting.  

+ [Go for a swim] -> swim  
+ [Stroll back up the beach] -> seashore  

== swim ==
You dive into the cool water and swim farther out.  
Off in the distance, you spot a wrecked ship leaning against the cliffs.  

+ [Swim toward the ship] -> ship_deck  
+ [Swim back to the beach] -> seashore  

== ship_deck ==
You climb aboard the ship’s tilted deck.  

+ [Go up to the driving area] -> ship_bridge  
+ [Go down into the stomach of the ship] -> ship_hold  
+ [Jump back into the water] -> swim  

== ship_bridge ==
You climb to the driving area of the ship.  
There, you find the captain slumped over the wheel — dead.  

+ [Climb back down] -> ship_deck  

== ship_hold ==
You go below deck into the stomach of the ship.  
In the shadows, you discover an old **treasure map** tucked inside a chest.  

-> map_scene

== map_scene ==
Clutching the map, you swim back to the beach.  

It is { advance_time() }.  

You unroll the map on the sand and study it carefully.  
The faded lines show an **X** marked **between two trees on the beach**.  

+ [Head toward the trees to investigate] -> beach_treasure  
+ [Stay on the beach and rest] -> seashore

== beach_treasure ==
You walk carefully toward the two trees.  
The sand between them looks slightly disturbed… could there be something buried here?  

+ [Start digging] -> treasure_found  
+ [Step back and think] -> seashore

== treasure_found ==
You dig into the sand and uncover a small chest!  
Inside, you find **gold coins and a glittering jewel**.  

+ [Return to the beach] -> seashore

== cliffs ==
The cliffs rise steeply over the sea.  

It is { advance_time() }.  

+ [Climb the cliffs] -> top_cliffs  
+ [Return to the seashore] -> seashore  

== top_cliffs ==
From the top of the cliffs, the view stretches endlessly.  

{ loopCount:  
    - loopCount == 0: "The waves look calm."  
    - loopCount == 1: "Now the waves seem rougher."  
    - loopCount == 2: "They crash loudly against the rocks."  
    - loopCount > 2: "The waves repeat their endless rhythm again and again."  
}  

~ loopCount = loopCount + 1  

From up here, you get the urge to leap into the sea below.  

+ [Jump down into the water] -> jump_into_water  
+ [Climb back down safely] -> cliffs  

== jump_into_water ==
You leap from the cliffs into the sea with a huge splash.  

As you sink under the surface, the water grows dark — and then you spot a **shark** circling nearby.  

+ [Swim up] -> shark_death
+ [Start swimming under the water] -> shark_escape

== shark_death ==
You try to swim up quickly, but the shark darts straight toward you.  
Before you can escape, its jaws close around you.  
-> DONE

== shark_escape ==
You stay calm and start swimming under the water with all your strength.  
The shark circles below but doesn’t attack.  

You surface a short distance away and gasp for air.  
Off in the distance, you spot a **wrecked ship leaning against the cliffs**.  

+ [Swim back to the beach] -> seashore  
+ [Swim toward the ship] -> swim


== function advance_time ==
    ~ time = time + 1
    { - time > 2:
        ~ time = 0
    }

    { 
        - time == 0: ~ return "Morning"
        - time == 1: ~ return "Noon"
        - time == 2: ~ return "Night"
    }
