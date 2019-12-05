/**
                    * ExileClientOverwrites_object_handcuffs_searchGear
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_otherPlayer","_success"];
_otherPlayer = _this select 0;
_success = false;
try 
{
	if !(alive player) then
	{
		throw false; 
	};
	if (_otherPlayer isEqualTo player) then
	{
		throw false; 
	};
	if !(isPlayer _otherPlayer) then
	{
		throw false; 
	};
	if !(alive _otherPlayer) then
	{
		throw false; 
	};
	if (!(_otherPlayer getVariable ["ExileIsHandcuffed", false]) && !(_otherPlayer getVariable ['ExileLifeSurrendered', false]) && !(_otherPlayer getVariable ["ExileLifeClientUnconscious",false])) then
	{
		throw false; 
	};
	if ((player distance _otherPlayer) > 5) then
	{
		throw false; 
	};
	player action ["Gear", _otherPlayer];
}
catch 
{
	_success = _exception;
};
call ExileClient_gui_interactionMenu_unhook;
_success
