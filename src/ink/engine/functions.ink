// ENGINE //
=== function reset_story ===
//////// AFFINITIES //
    ~ V_AFFINITY_MIKE_MIKE = 100
    ~ V_AFFINITY_MIKE_STEVE = 40
    ~ V_AFFINITY_MIKE_RACHELLE = 10
    ~ V_AFFINITY_MIKE_VANESSA = 80
    ~ V_AFFINITY_MIKE_YOU  = 50
    ~ V_AFFINITY_STEVE_MIKE = 40
    ~ V_AFFINITY_STEVE_STEVE = 40
    ~ V_AFFINITY_STEVE_RACHELLE = 50
    ~ V_AFFINITY_STEVE_VANESSA = 60
    ~ V_AFFINITY_STEVE_YOU = 70
    ~ V_AFFINITY_RACHELLE_MIKE = 70
    ~ V_AFFINITY_RACHELLE_STEVE = 50
    ~ V_AFFINITY_RACHELLE_RACHELLE = 50
    ~ V_AFFINITY_RACHELLE_VANESSA = 30
    ~ V_AFFINITY_RACHELLE_YOU = 50
    ~ V_AFFINITY_VANESSA_MIKE = 60
    ~ V_AFFINITY_VANESSA_STEVE = 60
    ~ V_AFFINITY_VANESSA_RACHELLE = 60
    ~ V_AFFINITY_VANESSA_VANESSA = 100
    ~ V_AFFINITY_VANESSA_YOU = 60
    ~ V_AFFINITY_YOU_MIKE = 50
    ~ V_AFFINITY_YOU_STEVE = 70
    ~ V_AFFINITY_YOU_RACHELLE = 50
    ~ V_AFFINITY_YOU_VANESSA = 50
    ~ V_AFFINITY_YOU_YOU = 60
//////// ACTORS //
    ~ L_ACTORS_ALIVE = (L_ACTORS_ALIVE.Mike, L_ACTORS_ALIVE.Rachelle, L_ACTORS_ALIVE.Steve, L_ACTORS_ALIVE.Vanessa, L_ACTORS_ALIVE.You,L_ACTORS_ALIVE.Faceless)
    ~ L_ACTORS_INJAIL = ()
    ~ L_ACTORS_THEGROUP = (L_ACTORS_THEGROUP.You)
//////// STORY //
    ~ V_CURRENT_STORY_ENDING = -> ENDINGS_EVERYBODY_DIES
    ~ V_CURRENT_DAY = L_DAYS.Saturday
    ~ V_CURRENT_TIME = 10.0
    ~ V_KNOW_FOR_THE_CELLAR = false
    ~ V_LOCKET_FIXED = false
    ~ V_HAVE_THE_HAMMER = false
    ~ V_CALLED_THE_COPS = false

=== function print_current_time ===
    ~ return print_time(V_CURRENT_TIME)

=== function print_time(x) ===
    ~ temp hour = INT(x - (x mod 1))
    ~ temp minutes = INT((x mod 1) * 60)
    ~ temp compHour = ""
    ~ temp compMin = ""
    ~ temp ampm = "am"
    {
        - hour < 10 : 
            ~ compHour="0"
    }
    {
        - minutes < 10 : 
            ~ compMin="0"
    }
    {
        - hour < 1 :
            ~ hour = 12
            ~ ampm = "pm"
        - hour >= 13 :
            ~ hour -= 12
            ~ ampm = "pm"
    }
    ~ return "{compHour}{hour}:{compMin}{minutes} {ampm}"
    
// SUCCESS //
=== function present_success(x) ===
{
    - x:
        ~ return "UNLOCKED"
    - else:
        ~ return "LOCKED"
}

=== function worth_prize() ===
    ~ return V_SUCCESS_YOU_SURVIVED && V_SUCCESS_ALL_SURVIVED && V_SUCCESS_YOU_DIED && V_SUCCESS_ALL_DIED && V_SUCCESS_MADNESS &&  V_SUCCESS_KILLER_DEAD && V_SUCCESS_KILLER_JAIL && V_SUCCESS_YOU_JAIL && V_SUCCESS_DONJUAN && V_SUCCESS_SUCIDAL

=== function unlock_sucess(ref x) ===
    ~ x = true

// UTILS
=== save_or_continu(title, -> current_divert, -> next_divert) ===
#CLEAR
{title} #CLASS: story_title_transition
* [Save game]
    // Handled by main.js //
    #CLEAR
    {title} #CLASS: story_title_transition
    -> current_divert
+ [Continue]
    -> next_divert

=== function print_list(list, if_empty) 
    {LIST_COUNT(list): 
    - 2: 
        	{LIST_MIN(list)} and {print_list(list - LIST_MIN(list), if_empty)}
    - 1: 
        	{list}
    - 0: 
			{if_empty}	        
    - else: 
      		{LIST_MIN(list)}, {print_list(list - LIST_MIN(list), if_empty)} 
    }
    
// AFFINITY //
=== function affect_affinity(actor_from,actor_to,value) ===
{ actor_from :
    - MIKE:
        { actor_to :
            - MIKE:
                ~ stats_add(V_AFFINITY_MIKE_MIKE,value)
            - STEVE:
                ~ stats_add(V_AFFINITY_MIKE_STEVE,value)
            - RACHELLE:
                ~ stats_add(V_AFFINITY_MIKE_RACHELLE,value)
            - VANESSA:
                ~ stats_add(V_AFFINITY_MIKE_VANESSA,value)
            - YOU:
                ~ stats_add(V_AFFINITY_MIKE_YOU,value)
        }
    - STEVE:
        { actor_to :
            - MIKE:
                ~ stats_add(V_AFFINITY_STEVE_MIKE,value)
            - STEVE:
                ~ stats_add(V_AFFINITY_STEVE_STEVE,value)
            - RACHELLE:
                ~ stats_add(V_AFFINITY_STEVE_RACHELLE,value)
            - VANESSA:
                ~ stats_add(V_AFFINITY_STEVE_VANESSA,value)
            - YOU:
                ~ stats_add(V_AFFINITY_STEVE_YOU,value)
        }
    - RACHELLE:
        { actor_to :
            - MIKE:
                ~ stats_add(V_AFFINITY_RACHELLE_MIKE,value)
            - STEVE:
                ~ stats_add(V_AFFINITY_RACHELLE_STEVE,value)
            - RACHELLE:
                ~ stats_add(V_AFFINITY_RACHELLE_RACHELLE,value)
            - VANESSA:
                ~ stats_add(V_AFFINITY_RACHELLE_VANESSA,value)
            - YOU:
                ~ stats_add(V_AFFINITY_RACHELLE_YOU,value)
        }
    - VANESSA:
        { actor_to :
            - MIKE:
                ~ stats_add(V_AFFINITY_VANESSA_MIKE,value)
            - STEVE:
                ~ stats_add(V_AFFINITY_VANESSA_STEVE,value)
            - RACHELLE:
                ~ stats_add(V_AFFINITY_VANESSA_RACHELLE,value)
            - VANESSA:
                ~ stats_add(V_AFFINITY_VANESSA_VANESSA,value)
            - YOU:
                ~ stats_add(V_AFFINITY_VANESSA_YOU,value)
        }
    - YOU:
        { actor_to :
            - MIKE:
                ~ stats_add(V_AFFINITY_YOU_MIKE,value)
            - STEVE:
                ~ stats_add(V_AFFINITY_YOU_STEVE,value)
            - RACHELLE:
                ~ stats_add(V_AFFINITY_YOU_RACHELLE,value)
            - VANESSA:
                ~ stats_add(V_AFFINITY_YOU_VANESSA,value)
            - YOU:
                ~ stats_add(V_AFFINITY_YOU_YOU,value)
        }
}

=== function stats_add(ref stat,value) ===
{ 
    - stat + value > 100:
        ~ stat = 100
    - stat + value < 0:
        ~ stat = 0
    - else:
        ~ stat += value
}

=== function get_affinity(actor_from,actor_to) ===
{ actor_from :
    - MIKE:
        { actor_to :
            - MIKE:
                ~ return V_AFFINITY_MIKE_MIKE
            - STEVE:
                ~ return V_AFFINITY_MIKE_STEVE
            - RACHELLE:
                ~ return V_AFFINITY_MIKE_RACHELLE
            - VANESSA:
                ~ return V_AFFINITY_MIKE_VANESSA
            - YOU:
                ~ return V_AFFINITY_MIKE_YOU
            - else:
                ~ return 0
        }
    - STEVE:
        { actor_to :
            - MIKE:
                ~ return V_AFFINITY_STEVE_MIKE
            - STEVE:
                ~ return V_AFFINITY_STEVE_STEVE
            - RACHELLE:
                ~ return V_AFFINITY_STEVE_RACHELLE
            - VANESSA:
                ~ return V_AFFINITY_STEVE_VANESSA
            - YOU:
                ~ return V_AFFINITY_STEVE_YOU
            - else:
                ~ return 0
        }
    - RACHELLE:
        { actor_to :
            - MIKE:
                ~ return V_AFFINITY_RACHELLE_MIKE
            - STEVE:
                ~ return V_AFFINITY_RACHELLE_STEVE
            - RACHELLE:
                ~ return V_AFFINITY_RACHELLE_RACHELLE
            - VANESSA:
                ~ return V_AFFINITY_RACHELLE_VANESSA
            - YOU:
                ~ return V_AFFINITY_RACHELLE_YOU
            - else:
                ~ return 0
        }
    - VANESSA:
        { actor_to :
            - MIKE:
                ~ return V_AFFINITY_VANESSA_MIKE
            - STEVE:
                ~ return V_AFFINITY_VANESSA_STEVE
            - RACHELLE:
                ~ return V_AFFINITY_VANESSA_RACHELLE
            - VANESSA:
                ~ return V_AFFINITY_VANESSA_VANESSA
            - YOU:
                ~ return V_AFFINITY_VANESSA_YOU
            - else:
                ~ return 0
        }
    - YOU:
        { actor_to :
            - MIKE:
                ~ return V_AFFINITY_YOU_MIKE
            - STEVE:
                ~ return V_AFFINITY_YOU_STEVE
            - RACHELLE:
                ~ return V_AFFINITY_YOU_RACHELLE
            - VANESSA:
                ~ return V_AFFINITY_YOU_VANESSA
            - YOU:
                ~ return V_AFFINITY_YOU_YOU
            - else:
                ~ return 0
        }
    - else:
        ~ return 0
}

=== function get_affinity_class(actor_from,actor_to) ===
    ~ temp aff = get_affinity(actor_from,actor_to)
    {
        -  aff >= 80 :
            ~ return L_AFFINITY_CLASS.LOVE
        -  aff >= 60 :
            ~ return L_AFFINITY_CLASS.LIKE
        -  aff >= 40 :
            ~ return L_AFFINITY_CLASS.NEUTRAL
        -  aff >= 20 :
            ~ return L_AFFINITY_CLASS.DISLIKE
        - else :
            ~ return L_AFFINITY_CLASS.HATE
        
    }
    
=== function show_affinity(actor_from,actor_to) ===
    ~ temp aff = get_affinity_class(actor_from,actor_to)
    {aff:
        - LOVE:
            ~ return "love"
        - LIKE:
            ~ return "like"
        - NEUTRAL:
            ~ return "none"
        - DISLIKE:
            ~ return "dislike"
        - HATE:
            ~ return "hate"
    }
