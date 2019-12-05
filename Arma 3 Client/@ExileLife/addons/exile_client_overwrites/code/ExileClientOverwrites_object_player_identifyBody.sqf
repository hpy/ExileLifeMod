/**
                    * ExileClientOverwrites_object_player_identifyBody
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

                    private["_target"];
_target = _this select 0;
if (!(alive _target)||(_target getVariable ['ExileLifeClientIncapacitated',false])) then
{
	_name = [_target] call ExileLifeClient_util_player_name;
	if !(_name isEqualTo -1) then
	{
		["InfoTitleOnly", [format ["The prisoner's ID reads: %1", _name]]] call ExileClient_gui_toaster_addTemplateToast;
	};
};
