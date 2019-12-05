/**
                    * ExilelifeClient_object_player_action_sitting_standup
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    try
{
	if !(ExileLifeSittingDown) then 
	{
		throw false;
	};
	if (isNull player) then
	{
		throw false;
	};	
	if !(alive player) then
	{
		throw false;
	};
	if (isNull ExileRussianRouletteChair) then
	{
		throw false;
	};		
	player switchMove "";
	player setUnitPos "UP";
	["switchMoveRequest", [netId player, ""]] call ExileClient_system_network_send;
	ExileRussianRouletteChair setVariable ["ChairTaken",-1,true];
	ExileIsPlayingRussianRoulette = false;
	ExileRussianRouletteChair = objNull;
	ExileLifeSittingDown = false;
}
catch
{
};
