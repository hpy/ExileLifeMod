/**
                    * ExilelifeClient_gui_selectClass_stats_update
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_config","_lockpickEXP","_strengthEXP","_speedEXP","_healEXP","_repairEXP","_hiddenStash","_skillValue","_image"];
disableSerialization; 
_display = uiNameSpace getVariable ["RscExileLifeSelectClassDialog", displayNull];
_config = missionConfigFile >> "CfgPlayer" >> "CfgExileLifeClasses" >> ExileLifeClientClass >> "Skillbonus";
_lockpickEXP = getNumber(_config >> "lockpick");
_strengthEXP = getNumber(_config >> "strength");
_speedEXP = getNumber(_config >> "speed");
_healEXP = getNumber(_config >> "health");
_repairEXP = getNumber(_config >> "repair");
_hiddenStash = getNumber(_config >> "stash"); 
_skillValue = ((round floor((((_lockpickEXP / 500)) * 100)/5))*5);
_image = format ["\exilelife_assets\texture\ui\GUI\progressbar\Percentagebar_%1.paa",_skillValue];
(_display displayCtrl 748508) ctrlSetText _image;
_skillValue = ((round floor((((_strengthEXP / 500)) * 100)/5))*5);
_image = format ["\exilelife_assets\texture\ui\GUI\progressbar\Percentagebar_%1.paa",_skillValue];
(_display displayCtrl 748510) ctrlSetText _image;
_skillValue = ((round floor((((_repairEXP / 500)) * 100)/5))*5);
_image = format ["\exilelife_assets\texture\ui\GUI\progressbar\Percentagebar_%1.paa",_skillValue];
(_display displayCtrl 748512) ctrlSetText _image;
_skillValue = ((round floor((((_healEXP / 500)) * 100)/5))*5);
_image = format ["\exilelife_assets\texture\ui\GUI\progressbar\Percentagebar_%1.paa",_skillValue];
(_display displayCtrl 748514) ctrlSetText _image;
_skillValue = ((round floor((((_speedEXP / 500)) * 100)/5))*5);
_image = format ["\exilelife_assets\texture\ui\GUI\progressbar\Percentagebar_%1.paa",_skillValue];
(_display displayCtrl 748516) ctrlSetText _image;
_image = format ["\exilelife_assets\texture\ui\GUI\%1.paa",ExileLifeClientClass];
(_display displayCtrl 748519) ctrlSetText _image;
