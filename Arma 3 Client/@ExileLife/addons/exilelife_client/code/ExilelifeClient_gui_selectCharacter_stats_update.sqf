/**
                    * ExilelifeClient_gui_selectCharacter_stats_update
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_character","_display","_characterDB","_lockpickLVL","_lockpickEXP","_lockpickMAX","_lockpickMAXLVL","_strengthLVL","_strengthEXP","_strengthMAX","_strengthMAXLVL","_speedLVL","_speedEXP","_speedMAX","_speedMAXLVL","_healLVL","_healEXP","_healMAX","_healMAXLVL","_repairLVL","_repairEXP","_repairMAX","_repairMAXLVL","_class","_gang","_rank","_skillValue","_image"];
if (ExileLifeGuard) exitWith {};
disableSerialization;
_character = missionNamespace getVariable format["ExileLifeClientCharacterSelection%1",_this select 0];
_display = uiNameSpace getVariable ["RscExileLifeCharacterSelectionChooseChar", displayNull];
_characterDB = _character select 1;
_lockpickLVL = _characterDB select 7;
_lockpickEXP = _characterDB select 8;
_lockpickMAX = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Lockpick" >> "Levels" >> str(_lockpickLVL + 1) >> "requiredExp");
_lockpickMAXLVL = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Lockpick" >> "maxLevel");
if(_lockpickMAX == 0)then{
	_lockpickMAX = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Lockpick" >> "maxLevel");
	if(_lockpickEXP == 0)then{
		_lockpickEXP = _lockpickMAX;
	};
};
_strengthLVL = _characterDB select 9;
_strengthEXP = _characterDB select 10;
_strengthMAX = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Strength" >> "Levels" >> str(_strengthLVL + 1) >> "requiredExp");
_strengthMAXLVL = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Strength" >> "maxLevel");
if(_strengthMAX == 0)then{
	_strengthMAX = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Strength" >> "Levels" >> str(_strengthLVL) >> "requiredExp");
	if(_strengthEXP == 0)then{
		_strengthEXP = _strengthMAX;
	};
};
_speedLVL = _characterDB select 11;
_speedEXP = _characterDB select 12;
_speedMAX = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Speed" >> "Levels" >> str(_speedLVL + 1) >> "requiredExp");
_speedMAXLVL = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Speed" >> "maxLevel");
if(_speedMAX == 0)then{
	_speedMAX = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Speed" >> "Levels" >> str(_speedLVL) >> "requiredExp");
	if(_speedEXP == 0)then{
		_speedEXP = _speedMAX;
	};
};
_healLVL = _characterDB select 13;
_healEXP = _characterDB select 14;
_healMAX = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Heal" >> "Levels" >> str(_healLVL + 1) >> "requiredExp");
_healMAXLVL = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Heal" >> "maxLevel");
if(_healMAX == 0)then{
	_healMAX = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Heal" >> "Levels" >> str(_healLVL) >> "requiredExp");
	if(_healEXP == 0)then{
		_healEXP = _healMAX;
	};
};
_repairLVL = _characterDB select 15;
_repairEXP = _characterDB select 16;
_repairMAX = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Repair" >> "Levels" >> str(_repairLVL + 1) >> "requiredExp");
_repairMAXLVL = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Repair" >> "maxLevel");
if(_repairMAX == 0)then{
	_repairMAX = getNumber(missionConfigFile >> "CfgLifeSkills" >> "Repair" >> "Levels" >> str(_repairLVL) >> "requiredExp");
	if(_repairEXP == 0)then{
		_repairEXP = _healMAX;
	};
};
_class = _characterDB select 4;
_gang = _characterDB select 6;
_rank = _characterDB select 5;
if !(_gang isEqualTo "") then
{
	if (_rank isEqualTo 0) then
	{
		_rank = "Pleb";
	};
}
else
{
	_gang = "Loner";
	if (_rank isEqualTo 0) then
	{
		_rank = "UnRanked";
	};
};
_skillValue = ((round floor((((_lockpickEXP / _lockpickMAX)) * 100)/5))*5) min 100;
_image = format ["\exilelife_assets\texture\ui\GUI\progressbar\Percentagebar_%1.paa",_skillValue];
(_display displayCtrl 728511) ctrlSetText _image;
(_display displayCtrl 728510) ctrlSetStructuredText parseText format["<t align='center' valign='middle' size='0.8'>[%1])</t>",_lockpickLVL];
_skillValue = ((round floor((((_strengthEXP / _strengthMAX)) * 100)/5))*5) min 100;
_image = format ["\exilelife_assets\texture\ui\GUI\progressbar\Percentagebar_%1.paa",_skillValue];
(_display displayCtrl 728514) ctrlSetText _image;
(_display displayCtrl 728513) ctrlSetStructuredText parseText format["<t align='center' valign='middle' size='0.8'>[%1])</t>",_strengthLVL];
_skillValue = ((round floor((((_repairEXP / _repairMAX)) * 100)/5))*5) min 100;
_image = format ["\exilelife_assets\texture\ui\GUI\progressbar\Percentagebar_%1.paa",_skillValue];
(_display displayCtrl 728517) ctrlSetText _image;
(_display displayCtrl 728516) ctrlSetStructuredText parseText format["<t align='center' valign='middle' size='0.8'>[%1])</t>",_repairLVL];
_skillValue = ((round floor((((_healEXP / _healMAX)) * 100)/5))*5) min 100;
_image = format ["\exilelife_assets\texture\ui\GUI\progressbar\Percentagebar_%1.paa",_skillValue];
(_display displayCtrl 728520) ctrlSetText _image;
(_display displayCtrl 728519) ctrlSetStructuredText parseText format["<t align='center' valign='middle' size='0.8'>[%1])</t>",_healLVL];
_skillValue = ((round floor((((_speedEXP / _speedMAX)) * 100)/5))*5) min 100;
_image = format ["\exilelife_assets\texture\ui\GUI\progressbar\Percentagebar_%1.paa",_skillValue];
(_display displayCtrl 728523) ctrlSetText _image;
(_display displayCtrl 728522) ctrlSetStructuredText parseText format["<t align='center' valign='middle' size='0.8'>[%1])</t>",_speedLVL];
(_display displayCtrl 728524) ctrlSetStructuredText parseText format["<t align='center' valign='top' size='1'>|  %1  |  %2  |  %3  | </t>",_rank,_class,_gang];
