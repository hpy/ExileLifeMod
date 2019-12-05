/**
                    * ExilelifeClient_util_simpleArray_loop
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

                    private["_secondaryArray","_array","_return"];
_secondaryArray = _this;
_array = [];
{
	if (_x isEqualType []) then
	{
		_return = _x call ExileLifeClient_util_simpleArray_loop;
		_array pushBack _return;
	}
	else
	{
		_array pushBack _x;
	};
}
forEach _secondaryArray;
_array