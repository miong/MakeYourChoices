=== road_to_LS_TT ===
#AUDIO: normal_ambiance2
-> save_or_continu("Road to Lake side", -> road_to_LS_TT, -> driving_to_LS_part_one)

=== driving_to_LS_part_one ===
Leaving the neighbourhood, you remember all the bad things that happened to you in the last few months.\
Your girlfriend who left you because you were taking things too seriously.
"And that the better thing that happened to me lately..." you sigh #CLASS: you_speak
You thought she was cheating on you but without evidence. But damn, she was beautiful and lovely.\
That's why you haven't broke up with her before she did.
However, what really hurt was the lost of your job.\
Even if there were less customers for the compagny since months, why fire the head of the electronics division ?
"David, i'm sorry about that but we have to reduce the wage bill...", Thibault said when he summoned you in his office.
"Fuck off Thibault!" you shout out. #CLASS: you_speak #CLASS: scream
Single and Jobless at 28 years old, that's not a reason to depress.
That's why you packed your stuff, and decided to join Steve, a good friend from engineering school, who had offered you a job into his start-up.\
Looking at the landscape, lost in your thoughts, you're driving on the highway without paying attention to the passing of time.
+ [When suddendly...]
-> hungry_on_the_road

=== hungry_on_the_road ===
~ V_CURRENT_TIME += 2.25
~ V_IS_HUNGRY = true
#CLASS: choice_made 
When suddendly the sound of your stomach takes you out of your thoughts. 
Realising it's {print_current_time()}, you're thinking that you hadn't search a place to eat during the trip planning.
-> choose_where_to_eat_intro

=== choose_where_to_eat_intro ===
Looking at the GPS, you see that it remains one hour before you enter Lake side.\
There is also a fast food named "The driver's kitchen" on the next rest area that is 10 minutes away.
-> choose_where_to_eat(true)

=== choose_where_to_eat(x) ===
+ {x} [Search "The driver's kitchen" on your smartphone]
    #DBG_SAME_STATE
    You decide to search the restaurant on your smartphone #CLASS : choice_made
    The driver's kitchen is a 3 starts rated fast food, serving burgers.
    -> choose_where_to_eat(false)
+ [Go to The driver's kitchen]
    You're too hungry to wait. #CLASS : choice_made
    -> the_drivers_kitchen
+ [You'll find something to eat in Lake side directly]
    One hour is not that much. You'll find something to eat once in Lake side. #CLASS : choice_made
    -> stay_on_the_road

=== the_drivers_kitchen ===
The next 10 minutes, you're driving thinking of what you'll eat.
+ [Continue]
    -> drivers_kitchen_TT

=== stay_on_the_road ===
~ V_CURRENT_TIME += 1.0
You continue to drive since you see the welcome sign to Lake side.
+ [Continue]
    -> arrive_to_lake_side_TT
