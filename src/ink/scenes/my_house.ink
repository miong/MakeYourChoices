=== my_house_TT(to) ===
#AUDIO: normal_ambiance1
-> save_or_continu_with_arg ("Your house", -> my_house_TT, to)

=== receive_keys ===
You're driving back to the residencial part of the city.\
Your GPS tells that you've arrived. You see a nice house with a floor.\
You park the car, and wait there a bit.
Two minutes later, Steve arrives with the real estate agent.
"This is your new house" said the estate agent. #CLASS: others_speak
"Welcome to Side lake buddy !" #CLASS: steve_speak
"Thanks Steve. Bro, that's good to see you again." #CLASS: you_speak
You hold Steve in your arms.
"Do you want to visit ?" #CLASS: others_speak
"No, the online visit was enougth, thanks" #CLASS: you_speak
"I just want to unload the truck to make the house mine." #CLASS: you_speak
"No problem, then here are the keys." #CLASS: others_speak
The agent gives you the keys.
"I can't stay to help, sorry dude. My wife will kill me if I'm not at home in 10 minutes." #CLASS: steve_speak
"No problem buddy. I don't wanna be responsible for your death." #CLASS: you_speak
"You didn't change David. Always joking. That's good." #CLASS: steve_speak
"I'll come to see you tomorrow. I promise you." #CLASS: steve_speak
"You have to ! Unless you want me to kill you!" #CLASS: you_speak
He takes you in his arms.
"See you tomorrow then. Don't forget to get the beers freezing." #CLASS: steve_speak
"Yeah, come with something to eat then." #CLASS: you_speak
"Yes I will !" #CLASS: steve_speak
Steve gets in his car. You see him leaving while waving at you. You're alone now.
"It's time to settle down !" you sigh.  #CLASS: you_speak
+ [Continue]
-
The house is clean. Furniture is included in the rental.
It took you one hour to unload and install all your stuff.
~ V_CURRENT_TIME += 1.0
Now you feel home. You enjoy the ambient calm.
Your tools are the last things you need to unload.\
You rented the truck for two days, so you decide to return the\
truck tomorrow, and take a break.\
You start to watch the TV, comfy in the couch.
While you're watching a replay of a good football game, you hear the doorbell.
Coming at the door, you see a woman with a pie.
"Hi, I'm you're new neighbor. My name is Rachelle." #CLASS: rachelle_speak
"Hello, nice to meet you. I'm David." #CLASS: you_speak
"I saw you while you were settling down." #CLASS: rachelle_speak
"I decided to come and introduce myself. I also made you this apple pie." #CLASS: rachelle_speak
She is smilling at you and gives you the pie.
"Thank you, that so kind." #CLASS: you_speak
{affect_affinity(YOU,RACHELLE,C_STAT_MEDIUM_UP)}
{affect_affinity(RACHELLE,YOU,C_STAT_LIL_UP)}
+ [Stay silent]
  You're staying silent for a few seconds. #CLASS: choice_made
    "I think you're tired with the road and all the work you've done." #CLASS: rachelle_speak
    "I'll let you rest. If you need anything, do not hesitate." #CLASS: rachelle_speak
+ [Talk with Rachelle]
    ~ V_CURRENT_TIME += 0.15
    {affect_affinity(YOU,RACHELLE,C_STAT_LIL_UP)}
    {affect_affinity(RACHELLE,YOU,C_STAT_MEDIUM_UP)}
    ~ V_KNOW_FOR_THE_CELLAR = true
    You're in the mood to talk.#CLASS: choice_made
    "I'll eat it tonight." #CLASS: you_speak
    "I hope it will help to recover from the work done." #CLASS: rachelle_speak
    "At least it'll help and make a good diner." #CLASS: you_speak
    You're smilling.
    "Oh. Before i leave, the last occupant of this house have been burglarized." #CLASS: rachelle_speak
    "Really ?" #CLASS: you_speak
    "Yeah. If I remember well they entered by the cellar." #CLASS: rachelle_speak
    "And I think that Henry hasn't done any repair work." #CLASS: rachelle_speak
    "Thank you for the information. I'll check the cellar to see what need to be fixed." #CLASS: you_speak
    "No problem. That's the good part of having a curious neighbor." #CLASS: rachelle_speak
    Both of you are laughing.
    "Alright then, Welcome to Lake side !"  #CLASS: rachelle_speak
-
"Thank you, Rachelle. I'll tell you how tasty was the pie next time we meet." #CLASS: you_speak
"I'm waiting for your reviews, David." #CLASS: rachelle_speak
She's going back to her house.\
You see she's your left neighbor.
Looking at your smartphone you see it's {print_current_time()}.
You decide to finish to unload the truck.\
You take all the tools to put them in the cellar.
// TIME : 
{
    - V_KNOW_FOR_THE_CELLAR:
        You take a look at the cellar doors leading to the back yard of the house.\
        The door doesn't seem to be damaged.
        But the locket is bent.
        You think you can fix it.\
        Searching in the tools for a hammer, you found out you don't own one.
        "Maybe i could buy one at the shopping center" you think. #CLASS: you_speak
        + [Go at the shoping center]
            You decided to go to the center. #CLASS: choice_made
            ++ Continue
                -> lake_stuff_TT(-> comming_to_buy_hammer_first_day)
        + [Stay home]
            You'll look for it later. #CLASS: choice_made
            -> staying_home
    - else:
        -> staying_home
}

=== come_back_from_the_center ===
You're back home.
-> first_night

=== staying_home ===
You come back to the living room.
-> first_night

=== first_night ===
You spend the rest of the day watching TV.
~ V_CURRENT_TIME = 23.0
It's now {print_current_time()}.
You're upstairs, in your bed room.
Before you go to bed, you're thinking of your first day in Lake side by the window.
The window overlooks the back yard.
You're thinking about the people you met, about the job you'll start.
+ [At this moment...]
    #AUDIO: horror_ambiance1
    At this moment, a strange mouvement catches your eyes.\
    And there, near a tree and the fence, you see a silhouette.\
    It seems to be a man standing there.\
    Unfortunatly, the light was so dim as the\
    night was falling that you couldn't see his face.
    "Hey ! It's a private property !" you shout out, pissed off. #CLASS: you_speak
    The man is nor moving, neither responding.
    You're thinking about what you can do.
    ++ [Call the cops]
        You decided to call the cops. #CLASS: choice_made
        ~ V_CALLED_THE_COPS = true
        "I'll call the cops" you scream. #CLASS: you_speak
        You take you phone and call the cops while going down stairs.
        "911, what's your emergency ?" #CLASS: others_speak
        "There is a stranger in my garden!" #CLASS: you_speak
        "What's your address ?" #CLASS: others_speak
        "114 third street, Lake side." #CLASS: you_speak
        "Stay inside, we are sending a car to your address." #CLASS: others_speak
        You hang up.
        You look at the kitchen window.
        The man has vanished.
    ++ [Go in the back yard]
        You decided to go in the back yard. #CLASS: choice_made
        You run into the stairs.
        Once at the doors, you hesitate.
        Maybe that guy have a knife or a gun !
        You take a quick look around you. Nothing can help.
        You quickly go in the kitchen and grab a knife.
        Then you open the doors, and see no one in the garden.
-
You go to the fence. Still no one.
Looking around, everything looks normal.
Maybe you've just imagined the silhouette.
+ [Continue]
{
    - V_CALLED_THE_COPS :
        -> call_the_cops
    - else:
        -> rest_of_the_nigth
}

=== call_the_cops ===
#AUDIO: normal_ambiance1
You're thinking about what you've seen.
About 5 minutes later, you hear a car in front of your house.
Opening the door, you see the cops.
"We received a call for an intrusion. Was it you mister ?" #CLASS: others_speak
"David, David Jensen. And yes it was me." #CLASS: you_speak
"There was a man in my back yard. But he disappered." #CLASS: you_speak
"Ok, we will look if we can see something. Shall we enter ?" #CLASS: others_speak
You let the two cops enter and guide them to the garden.
One of them searches in the garden and the other comes to you.
"Could you descibe the person you saw ?" #CLASS: others_speak
+ [It was too dark]
    "No sorry, it was too dark to see him." #CLASS: choice_made
+ [I think it was a man]
    #DBG_SAME_STATE
    "I think it was a man but i'm not sure." #CLASS: choice_made
-
"Did he say anything ?" #CLASS: others_speak
+ [I haven't heard anything]
    "I haven't heard anything." #CLASS: choice_made
+ [He said nothing]
    #DBG_SAME_STATE
    "He said nothing. He was just standing there." #CLASS: choice_made
-
"So, if I understand, there was a man in your garden just standing there." #CLASS: others_speak
"Exactly." #CLASS: you_speak
"And he left without saying anything." #CLASS: others_speak
"Yes, when i told that i was calling the cops." #CLASS: you_speak
"Is there anything broken or missing ?" #CLASS: others_speak
"No. You're tthinking i'm crazy..." #CLASS: you_speak
"No mister Jensen. I'll do a report." #CLASS: others_speak
The second cops comes back from the garden.
"Have you found anything interesting ?" #CLASS: others_speak
His coworker says no with his head.
"Mister Jensen, we will leave because you're not in danger right now." #CLASS: others_speak
"But if anything strange happens in the next days, please call us." #CLASS: others_speak
"You'll leave without doing anything ?" #CLASS: you_speak
"We have no clue, and the person hasn't stolen anything, mister Jensen." #CLASS: others_speak
"The report will say that a lapper was seen in the neighbourhood." #CLASS: others_speak
"We will increase the number of patrols. Don't worry." #CLASS: others_speak
"If there is someone, we will catch him." #CLASS: others_speak
"Alright. Thank you officer." #CLASS: you_speak
You see the cops leaving to their car.
-> rest_of_the_nigth

=== rest_of_the_nigth ===
#AUDIO: normal_ambiance1
You're confused.
The day was long enough.
You go back to bed.
You're sure that you saw a silhouette.
But there is nothing.
You decide to sleep.
Maybe thing will get clearer tomorrow.
Afer a few minutes, you fall asleep.
-> my_house_TT(-> morning_day2)

=== morning_day2 ===
{next_day()}
~ V_CURRENT_TIME = 8.0
{V_CURRENT_DAY} #CLASS: day
You wake up at {print_current_time()}. \
Everything about last nigth is confused in you mind. \
It feels like you had a nightmare. \
After you took a shower, you decide to do a jogging to change you mind.
Before leaving the house, you take a breakfast. \
A few eggs and sausage. \
A large glass of orange juice.
You feel like refilling.
You put on your sportswear and running shoes.
While opening the door, you see clear weather. \
You start enjoying your day.
~ V_CURRENT_TIME = 9.0
+ [Continue]
    -> jogging_TT
    
=== back_from_jogging ===
You open the door and go ahead to the bathroom. \
A warm shower to eliminate all the sweat. \
You put your clothes in the washing machine and start it. \
You go back in the living room and start the TV. \
There is nothing really interesting.
{ 
    - V_HAVE_THE_HAMMER:
        You remember that you've got to repare the cave's latch.
        ~ V_LOCKET_FIXED = true
        You're going to the cave.
        The place is a bit creepy. \
        You open the door to the back yard to let some light in.
        The latch is really bended. \
        With the new hammer, you straighten it. \
        But it seems to be brittle. \
        You try to harden it with some wire and nails.
        Now you feel safe with this latch repaired.
        You go back in the living room.
        You start to feel hungry.
    - else:
        You start zapping until you're hungry.
}
+ [Continue]
-
-> eat_with_steve

=== eat_with_steve ===
~ V_CURRENT_TIME = 11.91
It's {print_current_time()}. \
You text Steve to know if he is still comming.
[You] Hey buddy! I start to feel really hungry. Are you on your way ? #CLASS: you_speak
[Steve] Hey bro! I'll be there in 5 minutes. #CLASS: steve_speak
[Steve] I hope the beers are fresh. #CLASS: steve_speak
[You] Yeah ! I'm waiting for you. #CLASS: you_speak
Steve arrives at you door. \
You let him in and both of you go in the kitchen. \
Steve put a bag on the table. \
He opens it, and he gets meat out of it.
I'll take the portable barbecue in my car trunk. #CLASS: steve_speak
A Few minutes later, both of you are grilling the meat in the backyard.
The conversations are full of school memories and jokes. \
The time goes and after a good lunch, both of you enjoy the good weather.
After a silence, you talk about what happened last night.
{
    - V_CALLED_THE_COPS:
        You called the cops. That was the right thing to do. #CLASS: steve_speak
    - else:
        You should have called the cops. That was the right thing to do. #CLASS: steve_speak
}
Yeah. I know. #CLASS: you_speak
And don't worry about it. We are in Lake Side. This city is too calm for this kind of shit. #CLASS: steve_speak
What do you mean ? #CLASS: you_speak
Hum. In more then 10 years that I have been here, only one burglary has been signaled. #CLASS: steve_speak
Rachelle, the neighbor, told me. #CLASS: you_speak
Oh, you already know Rachelle ? #CLASS: steve_speak
I met her yesterday, yes. #CLASS: you_speak
The conversation continues about you and the way that you easily meet people. \
It has always be the same. \
People come to you and become your friends.
~ V_CURRENT_TIME = 15.00
Near {print_current_time()}, Steve leaves. \
You start cleanning the dishes. \
Then you put the clothes to dry. \
And finally, you vacuum the living room.
+ [Continue]
-
-> second_night

=== second_night ===
~ V_CURRENT_TIME = 22.00
At {print_current_time()}, you're in front of the TV. \
You remember that tomorrow, you'll start your new job.
+ [Go to sleep]
    You feel tired. #CLASS: choice_made
    You prepare everything for your first day at telecom 2000. \
    Then you go to sleep.
    ~ kill(RACHELLE)
    #GO TO DAY 3.
    -> MYC_WIP 
+ [Keep watching TV]
    You're not tired yet. #CLASS: choice_made
    And one hour later, you're still watching TV. \
    "That's not responsible" you're thinking. # you_speak
    You stand up and turn off the TV and the living room ligths. \
    You start walking in the stairs, heading to the bed room.
    I need to be ready for tomorrow. I got to make a good impression. # you_speak
    ++ [You hear some noise in the garden]
    --
    You hear some noise in the garden.
    -> terror_in_the_backyard
    
=== terror_in_the_backyard ===
#AUDIO: horror_ambiance1
~ temp NEXT_STEP = -> MYC_WIP
You turn back. \
You go into the kitchen. \
Once there, you see that a man had jumped the fence again.
He looks at your bedroom window. \
This time, there is no lights on. \
You see him comming closer to the house door. \
But half-way, he stops.
"He is Looking at Rachelle's house" you say in your mind. #CLASS: you_speak
The man starts his way to the fence between the two houses.
I think he haven't noticed me. #CLASS: you_speak
{
    - V_CALLED_THE_COPS:
        Last time I called the cops, and they have done nothing.
}
This time, you decide you'll not let this guy fly away.
+ [Turn the lights on]
    ~ V_LIGHTS_ON = true
    You turn the lights on #CLASS: choice_made
+ [Keep the lights off]
    ~ V_LIGHTS_ON = false
    You keep the lights off #CLASS: choice_made
-
You open the door and stand up in the garden.
{   
    - V_LIGHTS_ON:
        The man is in front of you and he is looking at you. \
        The ligths made him look at your house. \
        And now you're in a face to face with him. \
        For the first time, you can see him. \
        He wears a black sweater and a camouflage pants. \
        His face is covered with a white mask.
        What are you doing in my garden ?! #CLASS: you_speak #CLASS: scream
        The sound of his breath is the only response you get from him.
        But he starts walking to you. \
        You step back and hit the closed door behind you. \
        There is only few meters between both of you. \
        You feel the fear of dying increases little by little. \
        You scream as he jump onto you.
        But it was too late. \
        Now, you feel his knife penetrating your belly. \
        Again and again. \
        His hand over your mouth, you can't call for help.
        Your blood runs along your body. \
        You fall on the floor.
        You were in my way. #CLASS: faceless_speak
        That's the last words you hear before you collapse.
        ~ kill(YOU)
        ~ V_CURRENT_STORY_ENDING = -> YOU_DIE
        ~ NEXT_STEP = -> GAME_END
    - else:
        The man is in front of you but he is looking at Rachelle house. \
        It seems he hasn't noticed you. \
        He wears a black sweater and a camouflage pants.
        From his back, in the shadow of the night, you can't see more.
        What are you doing in my garden ?! #CLASS: you_speak #CLASS: scream
        Surprised, he quickly turns back, and seeing you, he steps back. \
        His face is covered with a white mask.
        I've called the COPS. They will be here in a minute. #CLASS: you_speak #CLASS: scream
        You lied. But he can't know that.
        This tall man, whithout face, stay calm. Impassive. \
        But now, he slowly starts coming closer. \
        You step back to the door. \
        You hear him breathing louder.
        At this moment, Rachelle turns on her backyard ligths.
        What's going on here ? I'm trying to sleep. #CLASS: others_speak
        That's the other neighbor that turn his ligths on too.
        But you're too affraid to anwser. \
        Luckily, these distractions gave you the time to reach the door handle. \
        You hurry yourself to open it. \
        You get safe inside and turn arround to close the door behind you.
        And there is no one in the garden.
        Just like nothing happened. \
        The man has vanished.
}
+ {!V_LIGHTS_ON} [Continue]
-
~ V_LIGHTS_ON = false
-> NEXT_STEP