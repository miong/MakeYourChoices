=== my_house_TT(to) ===
#AUDIO: normal_ambiance1
-> save_or_continu("Your house", -> my_house_TT, to)

=== receive_keys ===
You're drving back to the residencial part of the city.
Your GPS tells that you've arrived. You see a nice house with a floor.
You park the car, and wait there a bit.
Two minutes later, Steve arrives with the real estate agent.
"This is your new house" said the estate agent. #CLASS: others_speak
"Welcome to Side lake buddy !" #CLASS: steve_speak
"Thanks Steve. Bro, that's good to see you again." #CLASS: you_speak
You hold Steve in your arms.
"Do you want to visit ?" #CLASS: others_speak
"No, the online visit was enought, thanks" #CLASS: you_speak
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
Steve get in his car. You see him leaving while waving at you. You're alone now.
"It's time to settle down !" you sigh.  #CLASS: you_speak
The house is clean. Furniture is included in the rental.
It took you one hour to unload and install all your stuff.
~ V_CURRENT_TIME += 1.0
Now you feel home. You enjoy the ambient calm.
Your tools are the last thinks you need to unload.
You'll return the truck tomorrow, so you decide to take a break.
You start to watch the TV.
While you're watching a replay of a good football game, you hear the doorbell.
Comming at the door, you see a woman with a pie.
"Hi, I'm you're new neighbor. My name is Rachelle." #CLASS: rachelle_speak
"Hello, nice to meet you. I'm David." #CLASS: you_speak
"I saw you while you were settling down." #CLASS: rachelle_speak
"I decided to come and introduce myself. I also made you this apple pie." #CLASS: rachelle_speak
She is smilling at you and gives you the pie.
"Thank you, that so kind." #CLASS: you_speak
{affect_affinity(YOU,RACHELLE,C_STAT_MEDIUM_UP)}
{affect_affinity(RACHELLE,YOU,C_STAT_LIL_UP)}
+ [Stay silent]
  You're staying silent for a few seconds.
    "I think you're tired with the road and all the work you've done." #CLASS: rachelle_speak
    "I'll let you rest. If you need anything, do not hesitate." #CLASS: rachelle_speak
+ [Talk with Rachelle]
    ~ V_CURRENT_TIME += 0.15
    {affect_affinity(YOU,RACHELLE,C_STAT_LIL_UP)}
    {affect_affinity(RACHELLE,YOU,C_STAT_MEDIUM_UP)}
    ~ V_KNOW_FOR_THE_CELLAR = true
    "I'll eat it tonight." #CLASS: you_speak
    "I hope it will help to recover from the work done." #CLASS: rachelle_speak
    "At least it'll help and make a good diner." #CLASS: you_speak
    You're smilling.
    "Oh. before i leave, the last occupant of this house have been burglarized." #CLASS: rachelle_speak
    "Really ?" #CLASS: you_speak
    "Yeah. If I remember well they entered by the cellar." #CLASS: rachelle_speak
    "And I think that Henry hasn't done any repair work." #CLASS: rachelle_speak
    "Thank you for the information. I'll check the cellar to see what need to be fixed." #CLASS: you_speak
    "No problem. That the good part of having a curious neighbor." #CLASS: rachelle_speak
    Both of you are laughing.
    "Then welcome to Lake side."  #CLASS: rachelle_speak
-
"Thank you Rachelle. I'll tell you how tasty was the pie next time we meet." #CLASS: you_speak
"I'm waiting for your reviews, David." #CLASS: rachelle_speak
She's going back to her house.
You see she's your left neighbor.
Looking at your smartphone you see it's {print_current_time()}.
You decide to finish to unload the truck.
You take all the tools to put them in the cellar.
// TIME : 
{
    - V_KNOW_FOR_THE_CELLAR:
        You take a look at the cellar doors leading to the back yard of the house.
        The door doesn't seem to be damaged.
        But the locket is bent.
        You thnk you can fix it.
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
You're up stairs, in your bed room.
Before you go to bed, you're thinking of your fisrt day in Lake side by the window.
The window overlooks the back yard.
You're thinking about the people you met, about the job you'll start.
+ [At this moment...]
    #AUDIO: horror_ambiance1
    At this moment, a strange mouvement catches your eyes.
    And there, near to a tree and the fence, you see a silhouette.
    It seems to be a man standing there.
    His face is covered by the night.
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
        Maybe the guy have a knife or a gun.
        You take a quick look arround you. Nothing can help.
        You go quickly in the kitchen to take a knife.
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
    "I think it was a man but i'm not sure." #CLASS: choice_made
-
"Did he say anything ?" #CLASS: others_speak
+ [I haven't heard anything]
    "I haven't heard anything." #CLASS: choice_made
+ [He said nothing]
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
"The report will say that a lapper was seen in the neighborhood." #CLASS: others_speak
"We will increase the number of patrols. Don't worry." #CLASS: others_speak
"If there is someone, we will catch him." #CLASS: others_speak
"All rigth. Thank you officer." #CLASS: you_speak
You see the cops leaving to their car.
-> rest_of_the_nigth

=== rest_of_the_nigth ===
#AUDIO: normal_ambiance1
You're confused.
The day was long enough.
You go back to your bed.
You're sure that you saw a silhouette.
But there is nothing.
You decide to sleep.
Maybe thing will get clearer tomorrow.
-> MYC_WIP