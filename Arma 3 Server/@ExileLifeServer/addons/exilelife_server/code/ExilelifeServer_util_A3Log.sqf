/**
                    * ExilelifeServer_util_A3Log
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

                    private["_message","_type","_return","_logName","_logArray"];
_message = param [0,""];
_type = param [1,""];
_return = "";
if(_type != "") then
{
	_return = "A3Log" callExtension (_type + toString[31] + _message);
	_logName = format["ExileLifeServer_Logs_%1",_type];
	_logArray = missionNamespace getVariable [_logName,[]];
	_logArray pushback _message;
	missionNamespace setVariable [_logName,_logArray];
	ExileLifeServer_Logs_MasterLog pushBackUnique _logName;
}
else
{
	_return = "A3Log" callExtension _message;
	_logName = "ExileLifeServer_Logs_General";
	_logArray = missionNamespace getVariable [_logName,[]];
	_logArray pushback _message;
	missionNamespace setVariable [_logName,_logArray];
	ExileLifeServer_Logs_MasterLog pushBackUnique _logName;
};
_return