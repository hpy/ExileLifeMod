/**
                    * ExilelifeClient_util_math_convertNumString
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

                    private["_number","_mod","_digits","_digitsCount","_modBase","_numberText","_foreachindex"];
_number = _this param [0,0,[0]];
_mod = _this param [1,3,[0]];
_digits = _number call bis_fnc_numberDigits;
_digitsCount = count _digits - 1;
_modBase = _digitsCount % _mod;
_numberText = "";
{
	_numberText = _numberText + str _x;
	if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {
	_numberText = _numberText + ",";
	};
} foreach _digits;
_numberText
