/**
                    * ExilelifeClient_object_interactionSel
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_interactionname","_zone","_model","_interactionanimations","_success"];
_interactionname = _this select 0;
_zone = _this select 1;
_model = _this select 2;
try
{
	_interactionanimations = 
	[
		"ainvpknlmstpslaywrfldnon_medic",
		"AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"
	];
	if (animationState player in _interactionanimations) then
	{
		throw false;
	};	
	[true] call ExileLifeClient_object_player_action_holsterweapon;
	if (ExileLifeClientInteractionChk) then
	{
		throw false;
	};	
	if (ExileClientIsHandcuffed) then 
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
	ExileLifeClientInteractionChk = true;	
	player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	["interactionSel", [_interactionname,_zone,_model]] call ExileClient_system_network_send;
}
catch
{
	_success = _exception;
};
