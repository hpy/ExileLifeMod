/**
                    * ExilelifeClient_system_jobs_uber_network_updateUberJobs
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_uberJob","_jobClassname","_jobConfig","_alertDelay","_skillsTimer","_skillArray","_playerSkillArray","_level","_index","_values","_classTimer","_classArray","_gangTimer","_gangArray","_playerUberJobs"];
_uberJob = _this select 0;
_jobClassname = _uberJob select 1;
_jobConfig = (configFile >> "CfgJobs" >> _jobClassname);
_alertDelay = 0;
if(isClass _jobConfig) then{
    _skillsTimer = _jobConfig >> "Time" >> "Skills";
    if(isClass _skillsTimer)then{
        {
            _skillArray = getArray(_skillsTimer >> _x >> "timeToDelayUberMsg");
            if !(_skillArray isEqualTo [])then{
                _playerSkillArray = missionNamespace getVariable ["ExileLifeClientSkill" + _x, []];
                _level = _playerSkillArray select 0;
                _index = _skillArray findif {(_x select 0) == _level};
                if (_index > -1)then{
                    _values = _skillArray select _index;
                    _alertDelay = _alertDelay + (_values select 1);
                };
            };
        }forEach ["Heal","Lockpick","Strength","Speed","Repair"];
    };
    _classTimer = _jobConfig >> "Time" >> "Class";
    if(isClass _classTimer)then{
            _classArray = getArray(_classTimer >> ExileLifeClientClass >> "timeToDelayUberMsg");
            if !(_classArray isEqualTo [])then{
                  _index = _classArray findif {_x select 0 == ExileLifeClientRank};
                    if (_index > -1)then{
                    _values = _classArray select _index;
                    _alertDelay = _alertDelay + (_values select 1);
                };
            };
    };
    _gangTimer = _jobConfig >> "Time" >> "Gang";
    if(isClass _gangTimer)then{
            _gangArray = getArray(_gangTimer >> ExileLifeClientGang >> "timeToDelayUberMsg");
            if !(_gangArray isEqualTo [])then{
                  _index = _gangArray findif {_x select 0 == ExileLifeClientRank};
                    if (_index > -1)then{
                    _values = _gangArray select _index;
                    _alertDelay = _alertDelay + (_values select 1);
                };
            };
    };
};
if(_alertDelay > 0)then{
    UberJobsQueue pushBackUnique [_uberJob,time + _alertDelay];
}else{
    _playerUberJobs = player getVariable ['ExileLifeClientUberJobs',[]];
    _playerUberJobs pushBackUnique _uberJob;
    player setVariable ['ExileLifeClientUberJobs',_playerUberJobs];
    ["InfoTitleOnly",["Uber Job Alert"]] call ExileClient_gui_toaster_addTemplateToast;
};
