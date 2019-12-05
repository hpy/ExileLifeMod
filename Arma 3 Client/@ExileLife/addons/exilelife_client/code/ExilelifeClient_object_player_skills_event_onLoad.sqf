/**
                    * ExilelifeClient_object_player_skills_event_onLoad
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    [] spawn{
    uisleep 5;
    switch (tolower(ExileLifeClientClass)) do {
        case ("thief"): {
            player setUnitTrait ["audibleCoef",-20];
            player setUnitTrait ["camouflageCoef",-20];
        };
        case ("murderer"): {
            player setUnitTrait ["medic",true]; 
        };
        case ("smuggler"): {
            player setUnitTrait ["loadCoef",true];
        };
        case ("thug"): {
            player setUnitTrait ["loadCoef",-20];
        };
        default {
        };
    };
};
