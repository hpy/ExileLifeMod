/**
                    * ExilelifeServer_object_player_injury_blood_initializeBloodTypes
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

                    private["_bloodTypes","_count"];
if (isNil "ExileLifePlayerBloodTypes")then{
	ExileLifePlayerBloodTypes = [];
};
_bloodTypes = (getArray(missionconfigFile >> "CfgPlayer" >> "bloodTypes"));
{
	_name = _x select 0;
	_count = _x select 1;
	if (_count > 0) then{
		ExileLifePlayerBloodTypes pushback _name;
		ExileLifePlayerBloodTypes pushback _count;
	}else{
		(format["%1 has %2 percentage, skipping!", _name, _count]) call ExileServer_util_log;
	};
}
forEach _bloodTypes;
true
