/**
                    * ExilelifeClient_object_player_action_sitting_sitDown
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    ExileRussianRouletteChair = _this;
try
{
	if (ExileLifeSittingDown) then 
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
	if (ExileClientIsHandcuffed) then
	{
		throw false;
	};
	if ((ExileRussianRouletteChair getVariable ["ChairTaken",-1]) > -1) then 
	{
		throw false;
	};
	ExileRussianRouletteChair setVariable ["ChairTaken",1,true];
	ExileLifeSittingDown = true;
	if !((handGunWeapon player) isEqualTo "") then 
	{
		player selectWeapon (handGunWeapon player); 
	};
	["switchMoveRequest", [netId player, "Exile_RouletteSitting01"]] call ExileClient_system_network_send;
	player switchMove "Exile_RouletteSitting01";  
	player disableCollisionWith ExileRussianRouletteChair;
	player setPosASL (getPosASL ExileRussianRouletteChair);
	player setDir ((getDir ExileRussianRouletteChair) + 180);   
}
catch
{
	systemchat format ["%1",_exception];
};