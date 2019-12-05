/**
                    * ExilelifeServer_object_player_skills_network_updateSkillRequest
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

                    private["_sessionID","_payload","_skill","_value","_player","_expData","_totalUpdate","_maxGainPerRestart","_level","_CurExp","_MaxExp","_MaxLevel","_RemainingExp","_NewLevelData","_remainingExp"];
_sessionID = _this select 0;
_payload = _this select 1;
_skill = _payload select 0;
_value = _payload select 1;
_player = objectFromNetId (_payload select 2);
try
{
    if (isnull _player) then
    {
        throw "Failed Skill Update: Player not found!";
    };
    if (isnil "_skill") then
    {
        throw "Failed Skill Update: No Skill Passed";
    };
    if (isnil "_value") then
    {
        throw "Failed Skill Update: No Exp Value Passed";
    };
    _expData = _player getVariable ["ExileLifeSkill:" + _skill, []];
    if(_expData isEqualTo [])then{
        throw "Invalid Skill";
    };
    _totalUpdate = _player getVariable ["ExileLifeSkillUpdate:" + _skill, 0];
    _maxGainPerRestart = getNumber(missionConfigFile >> "CfgLifeSkills" >> "maxGainPerRestart");
    if(_totalUpdate >= _maxGainPerRestart) then{
        throw format["Max skill (%1) for player (%2) reached for this session",_maxGainPerRestart,_player];
    };
    _level = _expData select 0;
    _CurExp = _expData select 1;
    _MaxExp = getNumber (missionConfigFile >> "CfgLifeSkills" >> _skill >> "Levels" >> str(_expData select 0) >> "requiredExp");
    _MaxLevel = getNumber (missionConfigFile >> "CfgLifeSkills" >> _skill >> "maxLevel");
    if ((_CurExp + _value) >= _MaxExp) then
    {
        if !(_level isEqualTo _MaxLevel) then
        {
            _RemainingExp = (_CurExp + _value - _MaxExp);
            if (_RemainingExp > 0) then
            {
                _NewLevelData = [(_level + 1), (0 + _remainingExp)];
            }
            else
            {
                _NewLevelData = [(_level + 1), 0];
            };
        }
        else
        {
            _NewLevelData = [_level, _MaxExp];
        };
    }
    else
    {
        _NewLevelData = [_level, (_CurExp + _value)];
    };
    _player setVariable ["ExileLifeSkill:" + _skill, _NewLevelData];
    _player setVariable ["ExileLifeSkillUpdate:" + _skill, _totalUpdate + _value];
    [_player, "updateSkillResponse", [_skill, _NewLevelData]] call ExileServer_system_network_send_to; 
}
catch
{
    _exception call ExileServer_util_log;
};
