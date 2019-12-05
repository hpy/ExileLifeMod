/**
                    * ExilelifeClient_system_attribute_getValue
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_skillType","_attributeName","_defaultValue","_playerSkill"];
_skillType = param [0, ""];
_attributeName = param [1, ""];
_defaultValue = param [2, nil];
_playerSkill = param [3, []];
result = nil;
try{
	if(_skillType isEqualTo "")then{
		throw _defaultValue;
	};
	if(_attributeName isEqualTo "")then{
		throw _defaultValue;
	};
	if (_playerSkill isEqualTo [])then{
		_playerSkill = currentNamespace getVariable [format["ExileLifeClientSkill%1",_skillType],[]];
	};
	if(count _playerSkill != 2)then{
		throw _defaultValue;
	};
	result = [missionConfigFile >> "CfgLifeSkills" >> _skillType >> "Levels" >> str(_playerSkill select 0), _attributeName ,_defaultValue] call BIS_fnc_returnConfigEntry;
}catch{
	result = _exception;
};
result
