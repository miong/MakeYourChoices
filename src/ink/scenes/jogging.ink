=== jogging_TT ===
#AUDIO: normal_ambiance2
-> save_or_continu("The neighborhood", -> jogging_TT, -> jogging)

=== jogging ===
You walk to to sidewalk.
You look left and rigth. \
The lottisage form a cicle.
+ [Go on the left]
    You goes left. #CLASS: choice_made
+ [Go on the right]
    #DBG_SAME_STATE
    You goes right. #CLASS: choice_made
-
You start jogging.
It makes you realize that you haven't really visited the neighborhood. \
While running, you look at the houses and you see plenty of great ones. \
The gardens are often well maintained. \
A few ones have hedges as barrier. \
Some even have garden decorations.
The road are empty at this hour.\
No cars so no exhaust gas.
"That's better than my last location" you're thinking. #CLASS: you_speak
But there is also nobody. \
It creates a feeling of absolute calm. \
No noise to disturb you, though it's kinda creepy.
Until you hear an entrance opening.
You look on your left and you see an other jogger preparing himself. \
You wave at him and he smiles at you. \
A few seconds later, you're both running together.
"Hey, what's up ? You're new here for sure. I'm Mike." #CLASS: mike_speak
"Hi, yeah I'm new here. I'm David."#CLASS : you_speak
"That was kinda obvious. I'm usually the only one jogging the {V_CURRENT_DAY} morning here." #CLASS: mike_speak
"I saw there was no one in the streets, indeed." #CLASS: you_speak
Then a few minutes goes without a word spoken. \
It took you 20 minutes to run through the lotissage. \
You decide to continue running for another round.
When you arrive in front of Mike house, he starts a new discussion.
"You're in good shape. Are you sporty ?" #CLASS: mike_speak
"I was. I've been a football player for 4 years." #CLASS: you_speak
"But I've stopped since last year. Now I only do some jogging." #CLASS: you_speak
"Nice. I was linebacker when I was in college. You ?" #CLASS: mike_speak
"Receiver" #CLASS: you_speak
{affect_affinity(MIKE,YOU,C_STAT_LIL_UP)}
{affect_affinity(YOU,MIKE,C_STAT_LIL_UP)}
+[Talk a bit of you carreer]
    You're in the mood to talk about your carreer. #CLASS: choice_made
    {affect_affinity(MIKE,YOU,C_STAT_LIL_UP)}
    {affect_affinity(YOU,MIKE,C_STAT_LIL_UP)}
    "I've played for the southern Illinois Salukis football team." #CLASS: you_speak
    "Maroon and White." #CLASS: mike_speak
    "Yes. But i was on the bench." #CLASS: you_speak
    "Even if. It was one of my favorite football team." #CLASS: mike_speak
+[Say no more]
    You're not in the mood to talk. #CLASS: choice_made
-
You continue running with a few small talks about sports and the city. \
You're on the fourth round. \
When you arrive in font of my house he stops.
"I'm done. But that was great not to be alone for once." #CLASS: mike_speak
"Yes. It was cool." #CLASS: you_speak
"See you next {V_CURRENT_DAY} dude." #CLASS: mike_speak
"I'll be there." #CLASS: you_speak
And he leaves you alone.
The last few miles were the difficult ones as always. \
But you're now in front of your house.
~ V_CURRENT_TIME += 1.0
+ [Continue]
    -> my_house_TT(-> back_from_jogging)
