/**
                    * ExilelifeClient_action_resting_aborted
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    [
	"InfoTitleAndText", 
	[
		"You woke up abruptly", 
		format
		[
			"You gained %2%1 health, but you lost %3%1 hunger and %4%1 thirst",
			"%",
			ExileLifeClientRestingHealthRegen,
			ExileLifeClientRestingHungerDeg,
			ExileLifeClientRestingThirstDeg
		]
	]
] 
call ExileClient_gui_toaster_addTemplateToast;
cutText ["","BLACK IN"];
detach player;
//ExileLifeClient_object_player_event_onKnockOut