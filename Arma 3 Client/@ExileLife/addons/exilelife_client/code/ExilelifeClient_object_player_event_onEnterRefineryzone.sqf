/**
                    * ExilelifeClient_object_player_event_onEnterRefineryzone
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_messages"];
if (ExileLifeClientResourceZone) then
{
	call ExileLifeClient_object_player_event_onLeaveResourcezone;
};
if (ExileLifeClientGangZone) then
{
	call ExileLifeClient_object_player_event_onLeaveGangzone;
};
ExileLifeClientRefineryZone = true;
	_messages =
	[
			[format ["%1 REFINERY",(toUpper ExileLifeRefineryType)], "align='left' size='0.7' font='PuristaSemibold'"],
			["","<br/>"],
			[([daytime] call BIS_fnc_timeToString), "align='left' size='0.7' font='PuristaMedium'"]
	];
    [_messages] spawn BIS_fnc_typeText2;