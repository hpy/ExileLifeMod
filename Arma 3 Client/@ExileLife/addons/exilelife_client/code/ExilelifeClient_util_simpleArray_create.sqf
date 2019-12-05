/**
                    * ExilelifeClient_util_simpleArray_create
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

                    private["_array","_simpleArray","_return"];
_array = _this;
_simpleArray = [];
if (_array isEqualType []) then
{
	{
		if (_x isEqualType []) then
		{
			_return = _x call ExileLifeClient_util_simpleArray_loop;
			_simpleArray pushBack _return;
		}
		else
		{
			_simpleArray pushback _x;
		};
	}
	forEach _array;
	_simpleArray = str(_simpleArray);
}
else
{
	format["[createSimpleArray] params passed is not an array! %1",_this] call ExileLifeClient_util_log;
};
_simpleArray