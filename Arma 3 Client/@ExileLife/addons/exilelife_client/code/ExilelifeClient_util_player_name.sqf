/**
                    * ExilelifeClient_util_player_name
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

                    private["_player","_format","_returnedName"];
_player = _this select 0;
_format = param [1, "FIRST/LAST"];
_returnedName = "UNKNOWN";
try
{
	if (isNull _player) then
	{
		throw false;
	};
	if !(isPlayer _player)then{
		throw false;
	};
	_name = _player getVariable ["ExileLifeName", -1];
	if (_name isEqualTo -1) then
	{
		throw false;
	};
	switch (toLower(_format)) do
	{
		case "last/first":
		{
			_returnedName = format["%1, %2", _name select 1, _name select 0];
		};
		case "first":
		{
			_returnedName = _name select 0;
		};
		case "last":
		{
			_returnedName = _name select 1;
		};
		default
		{
			_returnedName = _name joinString " ";
		};
	};
}
catch
{
	_returnedName = "UNKNOWN";
};
_returnedName
