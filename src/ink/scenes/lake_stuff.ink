=== lake_stuff_TT(to) ===
#AUDIO: normal_ambiance1
-> save_or_continu("Lake stuff", -> lake_stuff_TT, to)

=== comming_to_buy_hammer_first_day ===
~ V_CURRENT_TIME += 0.5
You arrive at lake stuff.
It's {print_current_time()}.
{
    - V_CURRENT_TIME < 16.00 :
        It's still open.
        You enter and go to the DIY store.
        You found a hammer and go to the cash register.
        Once you've payed you go to you're car and head for your house.
        ~ V_CURRENT_TIME += 0.5
        ~ V_HAVE_THE_HAMMER = true
    - else :
        But it's already closed.
        "Arg ! Too bad. I'll have to wait for Monday.." you sigh. #CLASS: you_speak
}
+ [Continue]
    -> my_house_TT(-> come_back_from_the_center)