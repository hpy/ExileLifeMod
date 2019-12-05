/**
                    * ExilelifeClient_object_player_event_onEnterPrisonZone
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_messages"];
ExileLifeClientResourceZone = true;
ExileLifeClientPrisonZone = true;
ExileLifeResourcezone = "mining";
ExileLifeResourceType = "Exium";
_messages =
[
        ["Hard Labour Camp", "align='left' size='0.7' font='PuristaSemibold'"],
        ["","<br/>"],
        [([daytime] call BIS_fnc_timeToString), "align='left' size='0.7' font='PuristaMedium'"]
];
[_messages] spawn BIS_fnc_typeText2;
