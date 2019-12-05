/**
                    * ExileServer_object_animal_event_onKilled
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

                    private["_animal","_animalConfig","_gutItems"];
_animal = _this select 0;
_animalConfig = configFile >> "CfgVehicles" >> typeOf _animal >> "Exile";
_gutItems = getArray (_animalConfig >> "gutItems");
if !(_gutItems isEqualTo []) then 
{
	_animal setVariable ["WasGutted", false];
	_animal setVariable ["CanBeGutted", true, true];
};
_animal setVariable ["DiedAt", time];
