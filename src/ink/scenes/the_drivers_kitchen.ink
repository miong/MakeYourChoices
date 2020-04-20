=== drivers_kitchen_TT ===
#AUDIO: normal_ambiance1
-> save_or_continu("The driver's kitchen", -> drivers_kitchen_TT, -> going_to_drivers_kitchen)

=== going_to_drivers_kitchen ===
You're taking the exit to the rest area.
Once parked, you look at the restaurant.
Nothing special at first glance.
-> entering_drivers_kitchen

=== entering_drivers_kitchen ===
You open the door, and discover an almost empty place.
A waitress comes to welcome you.
"Welcome to The driver's kitchen, please take a seat. I'll be back in a few seconds.", she said smilling. #CLASS: others_speak
You sit next to the entrance.
Few seconds later, the waitress comes to you.
"What would you like mister ?" #CLASS: others_speak
You take a look at the menu.
+ [I'll take a double cheese buger and a diet coke]
    I'll take a double cheese buger and a diet coke. #CLASS: you_speak
    No problem, i bring you that in a minute. #CLASS: others_speak
    -> eating_at_drivers_kitchen
+ [Can i have a bacon burger and some water]
    Can i have a bacon burger and some water. #CLASS: you_speak
    Ok, i bring you that as soon as possible. #CLASS: others_speak
    -> eating_at_drivers_kitchen

=== eating_at_drivers_kitchen ===
~ V_IS_HUNGRY = false
More than 30 minutes after, she comes back with your meal.
You're eating...
The burger is pretty burned and the fries seem to be raw.
Maybe that was a mistake to eat there...
-> leaving_drivers_kitchen

=== leaving_drivers_kitchen ===
You leave the fast food, a bit bloated, but that's ok.
Starting the engine, you think "it's time to go to my new house".
~ V_CURRENT_TIME += 1.0
Your watch indicates {print_current_time()}.
-> stay_on_the_road