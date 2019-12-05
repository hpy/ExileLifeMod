/**
                    * ExilelifeClient_gui_jobs_board_event_updateAvailableJobs
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_result","_display","_listbox","_jobBoardLocations","_jobBoardType","_jobBoardLoc","_job","_jobBoardLocs","_jobName","_jobType","_shortDescription","_index","_msg","_requiredGangs","_gangs","_requiredClass","_classes","_requiredSkills","_skillName","_skillAmount","_strArray","_i","_skillStr","_skill","_loaded"];
_result = true;
disableSerialization;
try
{
    _display = uiNamespace getVariable ["RscExileLifeJobsBoard",displayNull];
    if(_display==displayNull) then
    {
        throw false;
    };
    _listbox = _display displayCtrl 17105;
    lbClear _listbox;
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
        if (_job != tolower(ExileLifeClientGang)) then
        {
            throw false;
        };
    };
    _listbox ctrlRemoveAllEventHandlers "LBSelChanged";
    _listbox ctrlSetEventHandler ["LBSelChanged","_this call ExileLifeClient_gui_jobs_board_event_onJobsLBSelChanged;"];
    {
        _jobName = _x select 0;
        _jobType = _x select 3;
        if(_jobType == _job) then
        {
            ExileLifeSelectedJobBoard pushBackUnique _x; 
            _shortDescription = getText(configFile >> "CfgJobs" >> _jobName >> "shortDescription");
            _index = _listbox lbAdd _shortDescription;
            _listbox lbSetValue [_index,_forEachIndex];
           try
           {
               	if (isNumber (configFile >> "CfgJobs" >> _jobName >> "RequiredRank")) then {
               		if (getNumber (configFile >> "CfgJobs" >> _jobName >> "RequiredRank") > ExileLifeClientRank) then{
               			_msg = true;
               			throw "You do not have the required Rank to access this Job!";
               		};
               	};
               	if (isArray (configFile >> "CfgJobs" >> _jobName >> "RequiredGangs")) then {
               		_requiredGangs = getArray (configFile >> "CfgJobs" >> _jobName >> "RequiredGangs");
               		if (({_x == ExileLifeClientGang} count _requiredGangs)==0) then{
               			_msg = true;
               			_gangs = _requiredGangs joinString ", or ";
               			throw format["You need to be a member of the %1 to access this job!",_gangs];
               		};
               	};
               	if (isArray (configFile >> "CfgJobs" >> _jobName >> "RequiredClasses")) then {
               		_requiredClass = getArray (configFile >> "CfgJobs" >> _jobName >> "RequiredClasses");
               		if (({_x == ExileLifeClientClass} count _requiredClass)==0) then{
               			_msg = true;
               			_classes = _requiredClass joinString ", or ";
               			throw format["You need to be a %1 to access this job!",_classes];
               		};
               	};
               	if (isArray (configFile >> "CfgJobs" >> _jobName >> "RequiredSkills")) then {
               		_requiredSkills = getArray (configFile >> "CfgJobs" >> _jobName >> "RequiredSkills");
                   	{
                   		_skillName = _x select 0;
                   		_skillAmount = _x select 1;
                   		_strArray = _skillName splitString "";
                   		_strArray set[0,(toUpper (_strArray select 0))];
                   		for "_i" from 1 to ((count _strArray) - 1) do {_strArray set[_i,(toLower (_strArray select _i))]};
                   		_skillStr = _strArray joinString "";
                   		_skill = currentNamespace getVariable format["ExileLifeClientSkill%1",_skillStr];
                        if (count _skill > 1) then {
                            if ((_skill select 0) < _skillAmount) then{
                                _msg = true;
                                throw format["You need %1 level %2 to access this job!",_skillStr,_skillAmount];
                            };
                        };
                   	} forEach _requiredSkills;
                };
            }
            catch
            {
                _listbox lbSetColor [_index, [1, 0.1, 0.1, 1]];
                _listbox lbSetData [_index, "-1"];
                _listbox lbSetTooltip [_index, format["%1",_exception]];
            };
            if !(_loaded) then {
                (_display displayCtrl 17109) ctrlSetText "";
                (_display displayCtrl 17111) ctrlShow false;
                (_display displayCtrl 17110) ctrlEnable false;
            };
        };
    }
    forEach ExileLifeJobBoard;
    _listbox lbSetCurSel 0;
}
catch
{
   _result = _exception;
   if !(_result) then
   {
        ExileLifeJobBoard_Current = [];
       _display closeDisplay 1;
   };
};
_result
