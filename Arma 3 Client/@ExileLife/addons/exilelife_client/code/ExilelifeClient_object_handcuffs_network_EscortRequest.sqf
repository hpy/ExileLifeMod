/**
                    * ExilelifeClient_object_handcuffs_network_EscortRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_victimNetID","_escort","_victim","_playerNetID"];
_victimNetID = _this select 0;
_escort = _this select 1;
_victim = objectFromNetId _victimNetID;
_playerNetID = netID player;
try
{
	if (ExileClientIsHandcuffed) then
	{
		throw "You cannot escort a free person!";
	};
	if !(isPlayer _victim) then
	{
		throw "You cannot escort the unknown!";
	};
	if (_escort) then
	{
		_victim attachTo [player,[0.1,1.1,0]];
		player reveal _victim;
		"Start escorting player thread..." call ExileClient_util_log;
		ExileLifeClientEscortPlayerChk = [2, ExileLifeClient_object_player_thread_EscortPlayerChk, [_victimNetID,_playerNetID], true,"Escort Player"] call ExileClient_system_thread_addtask;
	}
	else
	{
		detach _victim;
		"Removing escorting player thread..." call ExileClient_util_log;
		[ExileLifeClientEscortPlayerChk] call ExileClient_system_thread_removeTask;
		ExileLifeClientEscortPlayerChk = -1;
	};
}
catch
{
	["ErrorTitleAndText", ["Error!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
