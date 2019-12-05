/**
                    * ExilelifeClient_gui_dialog_event_loadScene
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_dialogName","_scene","_config","_buttons","_idcIndex","_func","_configName","_body","_action","_button","_code","_closeButton"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
_dialogName = _this select 0;
_scene = _this select 1;
{
	(_display displayCtrl _x) ctrlShow false;
} forEach [16106,16107,16108,16109,16110,16111,16113,16114];
try
{
	_config = (configFile >> "CfgDialogs" >> _dialogName);
	if !(isClass(_config >> "Main" >> _scene)) then
	{
		throw format["%1 does not have %2 scene!",_dialogName,_scene];
	};
	_buttons = [(_config >> "Main" >> _scene)] call ExileLifeClient_util_config_getSubClasses;
	_idcIndex = 16110;
	_func = "";
	{
		_configName = (_config >> "Main" >> _scene >> _x);
		_name = getText(_configName >> "name");
		_body = getText(_configName >> "body");
		_action = getText(_configName >> "action");
		_button = (_display displayCtrl _idcIndex);
		try
		{
			_button ctrlSetText _name;
			_code = "";
			if ((_action find "Scene_") > -1) then
			{
				_code = format["ExileLifeDialogPreviousScene = %3; [%1,%2] call ExileLifeClient_gui_dialog_event_loadScene;",str(_dialogName),str(_action),str(_scene)];
			}
			else
			{
				if (_action isEqualTo "") then
				{
					_code = format["[%1,%2,%3] call ExileLifeClient_gui_dialog_event_loadDialog",str(_dialogName),str(_scene),str(_x)];
				}
				else
				{
					_code = format["[%1,%2,%3] call %4",str(_dialogName),str(_scene),str(_x),_action];
				};
			};
			_button ctrlRemoveAllEventHandlers "ButtonClick";
			_button ctrlAddEventHandler ["ButtonClick",_code];
			if (count(_buttons) > 1) then
			{
				_button ctrlShow true;
			};
			if (_x isEqualTo "Button_1") then
			{
				_func = _code;
			};
			_idcIndex = _idcIndex - 1;
		}
		catch
		{
			format["OMITTED: %1 %2 %3",_dialogName,_x,_exception] call ExileLifeClient_util_log;
		};
	}
	forEach (_buttons call ExileLifeClient_util_array_reverseSingle);
	_closeButton = (_display displayCtrl 16112);
	if (_scene isEqualTo "Scene_1") then
	{
		_closeButton ctrlRemoveAllEventHandlers "ButtonClick";
		_closeButton ctrlAddEventHandler ["ButtonClick","closeDialog 16100"];
		_closeButton ctrlSetText "Bye";
		if ((getNumber(_config >> "disableExitButton") isEqualTo 1)) then 
		{
			_closeButton ctrlEnable false;
		};
	}
	else
	{
		_closeButton ctrlRemoveAllEventHandlers "ButtonClick";
		_closeButton ctrlAddEventHandler ["ButtonClick",format["[%1,%2] call ExileLifeClient_gui_dialog_event_loadScene",str(_dialogName),str(ExileLifeDialogPreviousScene)]];
		_closeButton ctrlSetText "Back";
		_closeButton ctrlEnable true;
	};
	call (compile _func);
}
catch
{
	_exception call ExileLifeClient_util_log;
};
true
