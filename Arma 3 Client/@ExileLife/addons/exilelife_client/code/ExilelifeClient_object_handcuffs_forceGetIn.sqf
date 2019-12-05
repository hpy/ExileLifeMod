/**
                    * ExilelifeClient_object_handcuffs_forceGetIn
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_success","_victimNetID","_victim"];
_success = false;
try
{
	if !(alive player) then
	{
		throw false;
	};
	if ((locked ExileClientInteractionObject) isEqualTo 2) then
	{
		throw false;
	};
	_victimNetID = player getVariable ["ExileLifeIsEscorting", ""];
	_victim = objectFromNetId _victimNetID;
	if (isNull _victim) then
	{
		throw false;
	};
	if (_victim isEqualTo player) then
	{
		throw false;
	};
	if !(isPlayer _victim) then
	{
		throw false;
	};
	if !(alive _victim) then
	{
		throw false;
	};
	if (_victim getVariable ['ExileLifeClientUnconscious',false]) then
	{
		throw false;
	};
    if (_victim getVariable ['ExileLifeClientIncapacitated', false]) then
    {
        throw false;
    };
	if !(_victim getVariable ["ExileIsHandcuffed", false]) then
	{
		throw false;
	};
	if ((player distance _victim) > 5) then
	{
		throw false;
	};
	if ((_victim distance ExileClientInteractionObject) > 5) then
	{
		throw false;
	};
	["forceGetInRequest", [(netId _victim),(netId ExileClientInteractionObject),ExileLifeNearestAction]] call ExileClient_system_network_send;
    call ExileClient_gui_interactionMenu_unhook;
}
catch
{
	_success = _exception;
};
_success
