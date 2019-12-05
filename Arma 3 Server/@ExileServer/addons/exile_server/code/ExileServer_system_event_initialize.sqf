/**
                    * ExileServer_system_event_initialize
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

                    private["_events"];
_events = getArray (configFile >> "CfgSettings" >> "Events" >> "enabledEvents");
if (getNumber(configFile >> "CfgSettings" >> "Escape" >> "enableEscape") isEqualTo 1) then
{
	_events = getArray (configFile >> "CfgSettings" >> "Events" >> "enabledEscapeEvents");
};
{
	missionNamespace setVariable [format ["ExileServerEvent%1LastExecutedAt", _x], 0];
}
forEach _events;
ExileEventThreadID = [60, ExileServer_system_event_thread_spawn, [], true, "Game Events"] call ExileServer_system_thread_addtask;
