/**
                    * ExilelifeClient_object_player_event_onEnterGangzone
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
if (ExileLifeClientRefineryZone) then
{
	call ExileLifeClient_object_player_event_onLeaveRefineryzone;
};
ExileLifeClientGangZone = true;
	_messages =
	[
			[format ["%1 TERRITORY",(toUpper ExileLifeGangTerritory)], "align='left' size='0.7' font='PuristaSemibold'"],
			["","<br/>"],
			[([daytime] call BIS_fnc_timeToString), "align='left' size='0.7' font='PuristaMedium'"]
	];
    [_messages] spawn BIS_fnc_typeText2;
	ExileLifeClientHeartBeatThread = [16, {playSound "SndExileHeartbeatSlow";}, [], true] call ExileClient_system_thread_addtask;
	playSound "SndExileHeartbeatSlow";
