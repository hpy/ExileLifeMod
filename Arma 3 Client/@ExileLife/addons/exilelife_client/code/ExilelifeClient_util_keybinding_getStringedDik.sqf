/**
                    * ExilelifeClient_util_keybinding_getStringedDik
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

                    private["_dikKey","_key"];
_dikKey = _this;
_key = "";
{
	if (str(_dikKey) isEqualTo (_x select 0)) exitWith
	{
		_key = _x select 1;
	};
}
forEach ExileLifeStringedDiks;
_key