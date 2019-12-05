/**
                    * ExilelifeClient_gui_jobs_board_event_onJobsLBSelChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_index","_selectedValue","_selectedData","_jobBoardLocations","_jobBoardType","_jobBoardLoc","_job","_jobBoardLocs","_config","_timeToComplete","_activeTime","_temp","_items","_type","_array","_itemClassname","_quantity","_configName","_itemsText","_reward","_requiredMembers","_requiredGangs","_numGangs","_gangsPermitted","_requiredPlayers","_text","_txt"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeJobsBoard",displayNull];
_index = _this select 1;
_selectedValue = lbValue [17105, _index];
_selectedData = lbData [17105, _index];
(_display displayCtrl 17109) ctrlSetText "";
(_display displayCtrl 17111) ctrlShow false;
(_display displayCtrl 17110) ctrlEnable false;
try
{
	_jobBoardLocations = [];
	_jobBoardLocations = getArray(missionConfigFile >> "CfgExileLifeWorld" >> worldName >> "JobBoards");
	if(count _jobBoardLocations == 0) then
	{
		throw false;
	};
	_jobBoardType = "";
	_jobBoardLoc = "";
	_job = "";
	{
		_jobBoardType = toLower(_x select 0);
		_jobBoardLocs = _x select 1;
		{
			if((player distance2D _x) < 10) then
			{
				_job = _jobBoardType;
			};
		}forEach _jobBoardLocs;
	}
	forEach _jobBoardLocations;
	if (_job=="") then
	{
		throw false;
	};
	if (_job == "generic") then
	{
		if (ExileLifeClientClass isEqualTo 'Guard') then
		{
			throw false;
		};
	};
	if (_job != "generic") then
	{
		if !(_job == tolower(ExileLifeClientGang)) then
		{
			throw false;
		};
	};
	if (((count ExileLifeSelectedJobBoard) > 0) && !(_selectedData isEqualTo "-1")) then
	{
		_config = (configFile >> "CfgJobs" >> (ExileLifeSelectedJobBoard select _selectedValue) select 0);
		if (getText(_config >> "JobBoard") != _job) then {
			_index = 0;
			_selectedValue = lbValue [17105, _index];
			_selectedData = lbData [17105, _index];
			_config = (configFile >> "CfgJobs" >> (ExileLifeSelectedJobBoard select _selectedValue) select 0);
		};
		_timeToComplete = getArray(_config >> "Time" >> "timeToComplete");
		_activeTime = getArray(_config >> "Time" >> "activeTime");
		_temp = [];
		_items = [];
		{
			_type = _x select 0;
			_array = _x select 1;
			switch (toUpper(_type)) do
			{
				case ("MONEY"):
				{
					_temp pushBack format["%1 poptabs",_array select 1];
				};
				case ("RESPECT"):
				{
					_temp pushBack format["%1 Respect",_array select 0];
				};
				case ("PHYSICAL"):
				{
					_itemClassname = _array select 0;
					_quantity = _array select 1;
					_configName = _itemClassname call ExileClient_util_gear_getConfigNameByClassName;
					_items pushBack format[" [x%2] %1",getText(configFile >> _configName >> _itemClassname >> "displayName"),_quantity];
				};
			};
		}
		forEach getArray(_config >> "reward");
		if !(_items isEqualTo []) then
		{
			_itemsText = _items joinString ",";
			_temp pushback _itemsText;
		};
		_reward = _temp joinString ",";
		_requiredMembers = getNumber(_config >> "RequiredMembers");
		if(_requiredMembers==0)then{_requiredMembers=1;};
		_requiredGangs = getArray(_config >> "RequiredGangs");
		if(_requiredGangs isEqualTo [])then{_requiredGangs = ["Mafia ","Cartel ","Yakuza ","Sydnicate "];};
		_numGangs = count _requiredGangs + 1;
		_gangsPermitted = _requiredGangs apply {_numGangs = _numGangs - 1; if(_numGangs>1) then{_x + ", "}else{_x}};
		_requiredPlayers = getNumber(_config >> "RequiredPlayers");
		if(_requiredPlayers==0)then{_requiredPlayers=1;};
		_text = format ["<t size='0.9'><br/><t align='center' valign='middle' size='1.6'>%1</t><br/><br/><br/>%2<br/><br/>Time allowed to complete: %3<br/><br/>Reward for Completion:<br/>%4</t><br/><br/>Participants Required: %5</t><br/><br/>Island Population: %6</t><br/><br/>Gang Population: %7</t><br/><br/>Permitted Gangs: %8</t>",getText(_config >> "shortDescription"),getText(_config >> "longDescription"),format["%1 Days, %2 Hours, %3 Minutes",_timeToComplete select 0,_timeToComplete select 1, _timeToComplete select 2],_reward,_requiredMembers,_requiredPlayers,_requiredGangs];
		(_display displayCtrl 17109) ctrlSetStructuredText parseText _text;
		(_display displayCtrl 17110) ctrlShow true;
		(_display displayCtrl 17110) ctrlEnable (ExileLifeCurrentJob isEqualTo []);
		ExileLifeJobBoard_Current = ExileLifeSelectedJobBoard select _selectedValue;
		call ExileLifeClient_gui_jobs_board_thread_update;
	}
	else
	{
		_txt = "No Jobs Available!";
		if (_selectedData isEqualTo "-1") then {
			_txt = "This job is not available to you!";
		};
		(_display displayCtrl 17109) ctrlSetStructuredText parseText (format["<t align='center' valign='middle' size='1.6'><br/>%1</t>",_txt]);
		(_display displayCtrl 17111) ctrlShow false;
		(_display displayCtrl 17110) ctrlEnable false;
	};
	if (player getVariable ["ExileLifeJobMultiJob",""] != "") then {
		(_display displayCtrl 17110) ctrlEnable false;
	};
}
catch
{
	_txt = "No Jobs Available!";
	(_display displayCtrl 17109) ctrlSetStructuredText parseText (format["<t align='center' valign='middle' size='1.6'><br/>%1</t>",_txt]);
	(_display displayCtrl 17111) ctrlShow false;
	(_display displayCtrl 17110) ctrlEnable false;
};
true
