/**
                    * ExileClientOverwrites_gui_itemDetails_event_onTabButtonClicked
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

                    private["_tabName","_display","_tabDetails","_tabRecipes","_buttonFill","_tabGunRepair"];
disableSerialization;
_tabName = _this;
_display = findDisplay 24004;
_tabDetails = _display displayCtrl 5003;
_tabRecipes = _display displayCtrl 5004;
_buttonFill = _display displayCtrl 5005;
_tabGunRepair = _display displayCtrl 5007;
switch (_tabName) do
{
	case "RECIPES":
	{
		_tabRecipes ctrlShow true;
		_tabDetails ctrlShow false;
		_buttonFill ctrlShow false;
		_tabGunRepair ctrlShow false;
	};
	case "DETAILS":
	{
		_tabDetails ctrlShow true;
		_tabRecipes ctrlShow false;
		_buttonFill ctrlShow false;
		_tabGunRepair ctrlShow false;
	};
	case "REPAIR":
	{
		_tabGunRepair ctrlShow true;
		_tabDetails ctrlShow false;
		_tabRecipes ctrlShow false;
		_buttonFill ctrlShow false;
	};
};
_tabDetails ctrlCommit 1;
_tabRecipes ctrlCommit 1;
_buttonFill ctrlCommit 1;
_tabGunRepair ctrlCommit 1;
true