INCLUDE scenes/includes.ink
INCLUDE actors/includes.ink

-> MYC_START

=== MYC_START ===
An interactive horror novel by G.Mion.
Would you survive if a slasher was after you ?
+ Start
    -> MYC_MENU

=== MYC_MENU ===
#CLEAR
#AUDIO: main_menu
Main Menu #CLASS: menu
Game Version : {C_GAME_VERSION} #CLASS: version
+ Start a new game
    -> MYC_START_GAME
+ Save game
    -> MYC_MENU
+ Load game
    // Handled by main.js //
    -> MYC_LOAD_FAILED
+ Help about the game
    -> MYC_HELP
+ Audio
    -> MYC_AUDIO
+ Success
    -> MYC_SUCCESS
+ Credits
    -> MYC_CREDITS
+ Reset the game
    #RESTART
    -> END

=== MYC_LOAD_FAILED ===
#CLEAR
Loadind  #CLASS: menu   
Loading the game file failed :(
It could be because the saved was made on an other version of the game
Current version is : {C_GAME_VERSION}
+ Return
    -> MYC_MENU
    
=== MYC_START_GAME ===
#CLEAR
{reset_story()}
-> INTRO_TT

=== MYC_HELP ===
-> HELP_MAIN

=== MYC_AUDIO ===
#CLEAR
Audio #CLASS: menu
+ Mute/Unmute
    -> MYC_AUDIO
+ Volume down
    -> MYC_AUDIO
+ Volume up
    -> MYC_AUDIO
+ Return
    -> MYC_MENU

=== MYC_SUCCESS ===
#CLEAR
#AUDIO: success
Success #CLASS: menu
You survived the story : {present_success(V_SUCCESS_YOU_SURVIVED)} #CLASS: success_item
Everyone survived the story : {present_success(V_SUCCESS_ALL_SURVIVED)} #CLASS: success_item
You were killed : {present_success(V_SUCCESS_YOU_DIED)} #CLASS: success_item
No survivor : {present_success(V_SUCCESS_ALL_DIED)} #CLASS: success_item
Madness : {present_success(V_SUCCESS_MADNESS)} #CLASS: success_item
Faceless is dead : {present_success(V_SUCCESS_KILLER_DEAD)} #CLASS: success_item
Faceless is in jail : {present_success(V_SUCCESS_KILLER_JAIL)} #CLASS: success_item
You're in jail : {present_success(V_SUCCESS_YOU_JAIL)} #CLASS: success_item
You're a hero : {present_success(V_SUCCESS_SUCIDAL)} #CLASS: success_item
You're a lover : {present_success(V_SUCCESS_DONJUAN)} #CLASS: success_item
+ {worth_prize()} Grant your prize
    -> MYC_SUCCESS
+ Return
    -> MYC_MENU

=== MYC_STORY_ENDING ===
-> V_CURRENT_STORY_ENDING

=== MYC_WIP ===
Futhermore soon... This project is not finished yet. #CLASS: neutral_ending
-> MYC_END

=== MYC_END ===
+ See affinities.
    -> MYC_SHOW_AFFINITIES
+ See status.
    -> MYC_SHOW_ACTORS_STATUS
+ Try again from the beginning.
    -> MYC_START_GAME
+ Return to the menu.
    -> MYC_MENU

=== MYC_SHOW_ACTORS_STATUS ===
Alive   : {print_list(L_ACTORS_ALIVE,"No one")}
Killed  : {print_list(LIST_INVERT(L_ACTORS_ALIVE),"No one")}
In jail : {print_list(L_ACTORS_INJAIL," No one")}
-> MYC_END

=== MYC_SHOW_AFFINITIES ===
Affinities board :
Order of answers are YOU,MIKE,STEVE,RACHELLE,VANESSA.
YOU : {show_affinity(YOU,YOU)},{show_affinity(YOU,MIKE)},{show_affinity(YOU,STEVE)},{show_affinity(YOU,RACHELLE)},{show_affinity(YOU,VANESSA)}
MIKE : {show_affinity(MIKE,YOU)},{show_affinity(MIKE,MIKE)},{show_affinity(MIKE,STEVE)},{show_affinity(MIKE,RACHELLE)},{show_affinity(MIKE,VANESSA)}      
STEVE : {show_affinity(STEVE,YOU)},{show_affinity(STEVE,MIKE)},{show_affinity(STEVE,STEVE)},{show_affinity(STEVE,RACHELLE)},{show_affinity(STEVE,VANESSA)}
RACHELLE : {show_affinity(RACHELLE,YOU)},{show_affinity(RACHELLE,MIKE)},{show_affinity(RACHELLE,STEVE)},{show_affinity(RACHELLE,RACHELLE)},{show_affinity(RACHELLE,VANESSA)}
VANESSA : {show_affinity(VANESSA,YOU)},{show_affinity(VANESSA,MIKE)},{show_affinity(VANESSA,STEVE)},{show_affinity(VANESSA,RACHELLE)},{show_affinity(VANESSA,VANESSA)}
-> MYC_END

