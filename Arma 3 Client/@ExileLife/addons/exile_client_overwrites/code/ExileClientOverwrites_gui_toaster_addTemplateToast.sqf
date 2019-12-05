/**
                    * ExileClientOverwrites_gui_toaster_addTemplateToast
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

                    private["_template","_placeholders","_placeholder1","_placeholder2","_placeholder3","_placeholder4","_templateConfig","_color","_templateText","_rawText"];
_template = _this select 0;
if !(isClass (configFile >> "CfgExileToasts" >> _template)) exitWith
{
	systemChat format ["UNKNOWN TOAST TEMPLATE: %1", _template];
};
_placeholders = param [1, [""]];
_placeholder1 = _placeholders param [0, ""];
_placeholder2 = _placeholders param [1, ""];
_placeholder3 = _placeholders param [2, ""];
_placeholder4 = _placeholders param [3, ""];
_templateConfig = configFile >> "CfgExileToasts" >> _template;
_color = getArray (_templateConfig >> "color");
_templateText = getText (_templateConfig >> "template");
_rawText = format [_templateText, _placeholder1, _placeholder2, _placeholder3, _placeholder4];
ExileLifeNotifications pushBack [_placeholder1, format["%1<br />%2<br />%3",_placeholder2,_placeholder3,_placeholder4], time];
[_rawText, _color] call ExileClient_gui_toaster_addToast;