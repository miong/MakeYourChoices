=== arrive_to_lake_side_TT ===
#AUDIO: normal_ambiance2
-> save_or_continu("Lake Side", -> arrive_to_lake_side_TT, -> arrive_to_lake_side)

=== arrive_to_lake_side ===
You arrive to Lake Side.\
It's a small town, with something like 100 inhabitants.
You pass the entrance of the city.
Driving on main road, you see several small houses which form an allotment in a very rural landscape.\
When you enter in the heart of the city, you notice the town hall, and next to it the police station, a small clinic and a small car workshop.\
A bit further, appears "Lake stuff", the town shopping center.\
You can see that if you continue on this road, you'll enter the industrial zone where Steve's compagny stands.
{V_IS_HUNGRY: And there it is|You also see}, just before the industries, the town diner named The hungry grizzly.
You park the truck. It's {print_current_time()}.
-> WYD_After_first_visite (true,true)

=== WYD_After_first_visite (x,y) ===
+ {V_IS_HUNGRY} [Go to eat at the diner]
    You head for the diner. #CLASS : choice_made
    ++ [Continue]
        -> the_hungry_grizzly_TT(-> hungry_driver_and_sweet_waitress)
+ {V_IS_HUNGRY && x} [Grab a sandwich in Lake stuff]
    ~ V_CURRENT_TIME += 0.25
    You move towards the center. #CLASS : choice_made
    You walk to the entrance. The center is open until {print_time(16.0)}.\
    You start walking in the small area and about 15 minutes later you've seen it all.\
    There is no restaurant in Lake stuff, not even a fast food one.\
    The food store is already closed. The only store open in the afternoon is the DIY store.\
    -> WYD_After_first_visite (false, y)
+ {y} [Go to the industrial zone to see your new workplace]
    You want to have a look to your new workplace. #CLASS : choice_made
    ~ V_CURRENT_TIME += 0.5
    You're walking through the industrial zone and notice about 10 compagnies here.\
    Mainly transport compagnies, but also a fish shop and down the alley, telecom 2000.\
    That's Steve's compagny, your new workplace.
    And, unsurprisingly, it's closed.
    The building seems brand new compared to the others.
    You stare at the building a few minutes.
    There is no workshop, no cafeteria and no work council.\
    That's clearly worse than your old job, but maybe Steve will make the situation acceptable.\
    You walk back to your car.
    -> WYD_After_first_visite (x , false)
+ [Go to you're new house {V_IS_HUNGRY : without eating}]
    {V_IS_HUNGRY : You have losen your appetite. }You go back to the car and head to your new house tiredly. #CLASS : choice_made
    ~ V_IS_HUNGRY=0
    ~ V_STAT_FORCE_YOU -= 10
    ~ V_STAT_SPEED_YOU -= 10
    While driving, you text Steve to tell him you arrive home in 15 minute.
    -> my_house_TT(-> receive_keys)
    
    
