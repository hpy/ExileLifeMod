/**
                    * ExilelifeClient_object_player_skills_updateSkillRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_skill","_value","_data","_SkillMaxLevel","_MaxExp"];
_skill = _this select 0;
_value = _this select 1;
try
{
    if (isnil "_skill") then
    {
        throw "Skill Type Was Null";
    };
    if (isnil "_value") then
    {
        throw "Increment Value Was Null";
    };
    _data = [];
   _data = missionNamespace getVariable ["ExileLifeClientSkill" + _skill, []];
    if (_data isEqualTo []) then
    {
        throw format ["Player Skill Error: %1 - Skill Data Was Empty", _skill];
    };
    _SkillMaxLevel = getNumber (missionConfigFile >> "CfgLifeSkills" >> _skill >> "maxLevel");
    _MaxExp = getNumber (missionConfigFile >> "CfgLifeSkills" >> _skill >> "Levels" >> str(_data select 0) >> "requiredExp");
    if (((_data select 1) isEqualTo (_MaxExp)) && ((_data select 0) isEqualTo _SkillMaxLevel)) exitwith {};
    ["updateSkillRequest", [_skill, _value, (netId player)]] call ExileClient_system_network_send;
}
catch
{
     _exception call ExileClient_util_log;
};
