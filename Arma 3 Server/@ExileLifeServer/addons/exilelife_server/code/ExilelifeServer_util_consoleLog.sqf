/**
                    * ExilelifeServer_util_consoleLog
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

                    private["_message","_color","_useTimeStamp"];
params
[
	["_message","",[""]],
	["_color","",[""]],
	["_useTimeStamp",true,[true]]
];
if (_color find "#" > -1) then
{
	if (count(_color) > 4) then
	{
		_color = "#111";
	};
	_message = _message + _color + str(parseNumber(_useTimeStamp));
}
else
{
	switch (toUpper(_color)) do
	{
		case "WHITE":
		{
			_message = _message + format["#111%1",parseNumber(_useTimeStamp)];
		};
		case "RED":
		{
			_message = _message + format["#100%1",parseNumber(_useTimeStamp)];
		};
		case "GREEN":
		{
			_message = _message + format["#010%1",parseNumber(_useTimeStamp)];
		};
		case "BLUE":
		{
			_message = _message + format["#001%1",parseNumber(_useTimeStamp)];
		};
		case "YELLOW":
		{
			_message = _message + format["#110%1",parseNumber(_useTimeStamp)];
		};
		case "PURPLE":
		{
			_message = _message + format["#101%1",parseNumber(_useTimeStamp)];
		};
		case "CYAN":
		{
			_message = _message + format["#011%1",parseNumber(_useTimeStamp)];
		};
		default
		{
			if !(_color isEqualTo "") then
			{
				_message = _message + format["#111",parseNumber(_useTimeStamp)];
			};
		};
	};
};
"debug_console" callExtension (_message);