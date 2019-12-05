/**
                    * ExilelifeClient_gui_dialog_select
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_baseName","_jobBase","_jobStep","_unrepeatable","_progressionMap","_specificTrader","_traderCheck"];
_baseName = _this;
_jobBase = ExileLifeCurrentJob param [0,""];
_jobStep = ExileLifeCurrentJob param [1,""];
_unrepeatable = getArray(missionConfigFile >> "CfgJobs" >> "unrepeatables");
_progressionMap = "true" configClasses (configFile >> "CfgJobs" >> _jobBase >> "Progression") apply {configName _x};
try 
{
	if (_baseName isEqualTo "ExileLife_Trader_Receivings") then 
	{
		if ((profileNameSpace getVariable ["ExileLifeCompletedTutorial","COMPLETED"]) isEqualTo "STARTED") then
		{
			throw _baseName;
		};
	};
	if (_baseName in _unrepeatable) then 
	{
		if (!(_jobBase isEqualTo _baseName) && (_baseName in ExileLifeCompletedJobs || _baseName in ExileLifeFailedJobs)) then
		{
			throw format["%1_Unrepeatable", _baseName];
		};
	};
	if (ExileLifeCurrentJob isEqualTo []) then
	{
		throw _baseName;
	};
	if (_jobBase isEqualTo _baseName) then 
	{
		if (_jobStep isEqualTo (count(_progressionMap) - 1)) then 
		{
			throw format["%1_CompletingJobForPerson", _baseName];
		}
		else
		{
			throw format["%1_JobForPerson", _baseName];
		};
	};
	_specificTrader = getText(configFile >> "CfgJobs" >> _jobBase >> "Progression" >> format["Step%1", _jobStep] >> "trader");
	if (_specificTrader isEqualTo "") then
	{
		throw format["%1_JobNotForPerson",_baseName];
	};
	_traderCheck = [_baseName, _specificTrader] call BIS_fnc_inString;
	if (_traderCheck) then
	{
		throw _specificTrader;
	};
	throw format["%1_JobNotForPerson",_baseName];
}
catch 
{
	_exception spawn ExileLifeClient_gui_dialog_onLoad;
};
true