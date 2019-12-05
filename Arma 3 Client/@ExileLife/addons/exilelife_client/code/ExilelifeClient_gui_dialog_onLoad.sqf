/**
                    * ExilelifeClient_gui_dialog_onLoad
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_dialogName","_display","_config","_scenes","_code","_unLoad"];
disableSerialization;
_dialogName = _this;
createDialog "RscExileLifeInformation";
waitUntil {!isNull findDisplay 16100};
ExileLifeDialogPreviousScene = "Scene_1";
_display = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
{
	(_display displayCtrl _x) ctrlShow false;
} forEach [16106,16107,16108,16109,16110,16113,16114];
try
{
	_config = (configFile >> "CfgDialogs" >> _dialogName);
	if !(isClass(_config)) then
	{
		throw format["%1 does not exist in CfgDialogs",_dialogName];
	};
	(_display displayCtrl 16101) ctrlSetText getText(_config >> "title");
	_scenes = [(_config >> "Main")] call ExileLifeClient_util_config_getSubClasses;
	if (count(_scenes) isEqualTo 0) then
	{
		throw format["%1 does not have any scenes defined",_dialogName];
	};
	if !(isClass(_config >> "Main" >> "Scene_1")) then
	{
		throw format["%1 does not have a first scene!",_dialogName];
	};
	[_dialogName,"Scene_1"] call ExileLifeClient_gui_dialog_event_loadScene;
	if (isText(_config >> "tradersgang")) then
	{
		ExileLifeCurrentTradersGang = getText(_config >> "tradersgang");
	};
	_code = getText(_config >> "onLoad");
	if !(_code isEqualTo "") then
	{
		call (compile _code);
	};
	_unLoad = getText(_config >> "onUnload");
	if !(_unLoad isEqualTo "") then
	{
		_display displayAddEventHandler ["Unload", compile _unLoad];
	};
	if ((getNumber(_config >> "disableExitButton") isEqualTo 1)) then 
	{
		(_display displayCtrl 16112) ctrlEnable false;
	};
}
catch
{
	_exception call ExileLifeClient_util_log;
};
true