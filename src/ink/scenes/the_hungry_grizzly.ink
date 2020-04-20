=== the_hungry_grizzly_TT(-> to) ===
#AUDIO: normal_ambiance1
-> save_or_continu("The hungry grizzly", -> the_hungry_grizzly_TT, to)

// When we arrive to lake side

=== hungry_driver_and_sweet_waitress ===
You approach the diner's doors.
A sign indicates that service ends at {print_time(14.0)}.
It's {print_current_time()}.
{V_CURRENT_TIME >= 14.0 : -> hungry_and_late }
{V_CURRENT_TIME < 14.0  : -> hungry_and_at_time} 

=== hungry_and_late ===
~ affect_affinity(YOU,VANESSA,C_STAT_HUGE_UP)
~ affect_affinity(VANESSA,YOU,C_STAT_LIL_UP)
It's too late.
You're turning back to your car when you hear a voice.
"Hi, can I help you sir ?" #CLASS: vanessa_speak
Looking at the doors, you see a pretty young waitress who's smilling at you.
You come closer without taking your eyes of her.
"Hello, sorry to bother you, I wanted to eat there but apparently it's too late." #CLASS: you_speak
"Effectively, the service is ended. But it's seems that you've done a lot of road. #CLASS: vanessa_speak
You're not from here mister ?" #CLASS: vanessa_speak
"Well, I'm new here. My name is David. You're the fisrt person I meet from Lake side." #CLASS: you_speak
She looks at you intensivly for a few seconds then she says :
"Then welcome to Lake side David. I'm Vannesa." #CLASS: vanessa_speak
She takes a look inside.
"I will not let you hungry for you arrival. You'll need to gain strength and to relax a bit." #CLASS: vanessa_speak
You feel a bit embarrassed annoying the waitress after her service.
"No, i'll find somewhere else to eat..." #CLASS: you_speak
"A {V_CURRENT_DAY}, at {print_current_time()}. Everything is closed, David." #CLASS: vanessa_speak
"Come on, please enter while i'll make you a sandwich" she said with a little wink. #CLASS: vanessa_speak
You enter the diner.
She shows you the bar where you have a seat.
She goes into the kitchen and comes back with some bread, ham and cheese.
"So what bring you to Lake side David ?" she says while making the sandwich.#CLASS: vanessa_speak
"Taking control of my life. Starting a new job."  #CLASS: you_speak
"Oh. And where do you work ?" #CLASS: vanessa_speak
"At telecom 2000. But i've not started yet." #CLASS: you_speak
"That's Steve's compagny. You'll be well there" #CLASS: vanessa_speak
"You know Steve ?" #CLASS: you_speak
"Hell yeah ! He's one of my loyal customers and one of my best friends." #CLASS: vanessa_speak
"What about you ? How do you know him ?" #CLASS: vanessa_speak
"He was my buddy when we was in engineering school." #CLASS: you_speak
"What a coincidence ! Then we share a good friend." #CLASS: vanessa_speak
She gives you the sandwich that looks yummy.
+ [Stay to eat the sandwich and talk with Vanessa]
    ~ V_CURRENT_TIME += 0.75
    You take the sandwich and stay in front of her. #CLASS: choice_made
    "Thanks for the sandwich." #CLASS: you_speak
    "You're welcome my dear." #CLASS: vanessa_speak
    "Can you tell me more about Lake side ?" #CLASS: you_speak
    "It's a small, calm and humble city. Everyone knows each other here." #CLASS: vanessa_speak
    "Seems a good place to live as you describe it." #CLASS: you_speak
    "Yes, but there isn't a lot of work available here unfortunately." #CLASS: vanessa_speak
    "But you already got one so that not a problem." #CLASS: vanessa_speak
    "Yes, I'll see about it with Steve later." #CLASS: you_speak
    Staring at her, you see that she is looking at you the same way you're looking at her.
    ++ [Try something more intimate]
        +++ [Ask her number]
            {affect_affinity(VANESSA,YOU,C_STAT_LIL_DOWN)}
            {affect_affinity(YOU,VANESSA,C_STAT_MEDIUM_UP)}
            You try to ask her number. #CLASS: choice_made
            "I feel that you're a good guy but i don't know you yet enough David." #CLASS: vanessa_speak
            "I understand. I hope with time you'll trust me." #CLASS: you_speak
            "Maybe. I hope."  #CLASS: vanessa_speak
            She said no, but she winks and smiles.
        +++ [Talk about seeing her tonight]
            {affect_affinity(YOU,VANESSA,C_STAT_LIL_DOWN)}
            {affect_affinity(VANESSA,YOU,C_STAT_HUGE_DOWN)}
            You tell her you'll come again tonight. #CLASS: choice_made
            "I'm not that kind of girl, David." #CLASS: vanessa_speak
            She's upset.
            "Oh... that was not what I meant..." #CLASS: you_speak
            "Sorry, I was just talking of eating here in your compagny." #CLASS: you_speak
            "Humm." she sighs. #CLASS: vanessa_speak
            "Okey, I forgive you." #CLASS: vanessa_speak
            You feel unconfortable about the situation.
            "You saved me with that sandwich. Thank you Vanessa." #CLASS: you_speak
            "That was nothing. Really." #CLASS: vanessa_speak
            "Maybe but I think you're so kind." #CLASS: you_speak
            The tension drops down.
            "Thank you. I think you're not too bad either." #CLASS: vanessa_speak
            She is smiling again.
        +++ [Ask her when you could see her again]
            {affect_affinity(YOU,VANESSA,C_STAT_MEDIUM_UP)}
            {affect_affinity(VANESSA,YOU,C_STAT_MEDIUM_UP)}
            You asked her when uou could see her again. #CLASS: choice_made
            "We are exeptionnaly closed tonight." #CLASS: vanessa_speak
            "But tomorrow, if you come to eat, I'll be there." #CLASS: vanessa_speak
            "Unfortunately, tomorrow, I have to finish to settle the house and to return the truck." #CLASS: you_speak
            "But, maybe Steve and I will come to eat there {V_CURRENT_DAY+2}." #CLASS: you_speak
            "A wonderful idea. Then I'll wait for you two." #CLASS: vanessa_speak
    ++ [Stay friendly]
        {affect_affinity(VANESSA,YOU,C_STAT_LIL_UP)}
        You think is too early to try something. #CLASS: choice_made
        "I hope everyone will be as friendly as you." #CLASS: you_speak
        "Hey sweety, everybody isn't like me." #CLASS: vanessa_speak
        "That's too bad then." #CLASS: you_speak
        "Don't worry, if you feel lonely you can always come here to see me." #CLASS: vanessa_speak
        "I will for sure, Vanessa". #CLASS: you_speak
+ [Take the sandwich away]
    ~ V_CURRENT_TIME += 0.5
    You thanks her for the welcome and the sandwich. #CLASS: choice_made
-
-> leaving_to_your_house

=== hungry_and_at_time ===
~ V_CURRENT_TIME += 1.0
{affect_affinity(YOU,VANESSA,C_STAT_LIL_UP)}
{affect_affinity(VANESSA,YOU,C_STAT_LIL_UP)}
You open the doors.
There is only two guys at the bar.
"Welcome to The hungry grizzly" says the waitress. #CLASS: vanessa_speak
You see this beautiful women comming to you.
"Please take a seat, I'll take care of you." #CLASS: vanessa_speak
"Thanks." #CLASS: you_speak
She accompanies you to a seat and gives you the menu.
"I let you choose your meal. Let me know when you're ready." #CLASS: vanessa_speak
You're looking at her. She's going to the bar and talk with the other customers.
"Danm, she's sweet as honey" you're thinking.
You look at the menu, but she's still on your mind.
You wave at her and she comes.
"You have choosen, mister ?" #CLASS: vanessa_speak
"Yes, I'll take a cheese burger and a diet coke please." #CLASS: you_speak
"Oh, I'm sorry but there is no cheese burger left." she said smilling. #CLASS: vanessa_speak
"Too bad, then I'll..." #CLASS: you_speak
"No, I was joking. The cheese burger is our speciality." #CLASS: vanessa_speak
"Hum... ok... Then i'll try it." #CLASS: you_speak
"You're not from Lake side ?" #CLASS: vanessa_speak
"Effectively, I'm new here." #CLASS: you_speak
"My name is Vanessa." #CLASS: vanessa_speak
"Nice to meet you Vanessa, I'm David." #CLASS: you_speak
"The pleasure is mine. I'll ask the kitchen for your burger." #CLASS: vanessa_speak
And she vanishes behind the bar.
The guys at the bar stand up.
"Vanessa, we're leaving. Thanks for the meal sweet heart." #CLASS: others_speak
"See you soon Marc." #CLASS: vanessa_speak
As the guys are leaving the room, you see Vanessa coming back with your plate.
She disposes it on the table.
The burger seems yummy.
"Thank you, Vanessa." #CLASS: you_speak
"No problem my dear." #CLASS: vanessa_speak
And you see her going back at the bar.
You're eating and that really tastes good.
When you've had finished, she comes to you.
"So, how was our speciality ?" #CLASS: vanessa_speak
"Tasty !" #CLASS: you_speak
She winks at you and then smiles.
+ [Leave the restaurant]
    You want to leave the diner. #CLASS: choice_made
+ [Talk a bit with Vanessa]
    You're looking at her.
    "So what brings you to Lake side ?" she says after a few seconds. #CLASS: vanessa_speak
    "Taking control of my life. Starting a new job."  #CLASS: you_speak
    "Oh. And where do you work ?" #CLASS: vanessa_speak
    "At telecom 2000. But i've not started yet." #CLASS: you_speak
    "That's Steve's compagny. You'll be well there" #CLASS: vanessa_speak
    "You know Steve ?" #CLASS: you_speak
    "Hell yeah ! He's one of my loyal customers and one of my best friends." #CLASS: vanessa_speak
    "What about you ? How do you know him ?" #CLASS: vanessa_speak
    "He was my buddy when we was in engineering school." #CLASS: you_speak
    "What a coincidence ! Then we share a good friend" #CLASS: vanessa_speak
    You hear the cooker telling her that the service is ended and he's leaving.
    {affect_affinity(YOU,VANESSA,C_STAT_MEDIUM_UP)}
    {affect_affinity(VANESSA,YOU,C_STAT_MEDIUM_UP)}
-
-> leaving_to_your_house

=== leaving_to_your_house ===
You stand up.
"You gotta leave {get_affinity(VANESSA,YOU) >= 65 : already }?" #CLASS: vanessa_speak
"Yeah, i got to receive the keys of my new house." #CLASS: you_speak
"Then, maybe i'll see you again with Steve." #CLASS: vanessa_speak
"I hope so" you said smilling. #CLASS: you_speak
You leave the hungry grizzly, jump in the car and head for your house.
While driving, you text Steve to tell him you arrive home in 15 minutes.
~V_CURRENT_TIME += 0.25
+ [Continue]
    -> my_house_TT(-> receive_keys)

// Eat with Steve


