/**
                    * ExilelifeClient_gui_itemDetails_event_onFillButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_buttonFill","_tabDetails","_tabRecipes"];
disableSerialization;
_display = findDisplay 24004;
_buttonFill = _display displayCtrl 5005;
_tabDetails = _display displayCtrl 5003;
_tabRecipes = _display displayCtrl 5004;
_tabDetails ctrlShow false;
_tabRecipes ctrlShow false;
_buttonFill ctrlShow true;
_tabDetails ctrlCommit 1;
_tabRecipes ctrlCommit 1;
_buttonFill ctrlCommit 1;
true