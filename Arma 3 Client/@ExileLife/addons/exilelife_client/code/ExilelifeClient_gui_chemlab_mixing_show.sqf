/**
                    * ExilelifeClient_gui_chemlab_mixing_show
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_control1","_checkstatus","_result","_control2"];
disableSerialization;
createdialog "RscExileLifeChemLabMixing";
waitUntil { !isNull findDisplay 24037 };
_display = uiNameSpace getVariable ["RscExileLifeChemLabMixing", displayNull];
_display displayAddEventHandler ["KeyDown", "_this call ExileClient_gui_loadingScreen_event_onKeyDown"];
ExileLifeChemicalArray = 
[
	[35002,"item_beaker_hydrochloricacid",35005],
	[35003,"item_beaker_phosphoricacid",35006],
	[35004,"item_beaker_acetone",35007]
];
{
	_control1 = _display displayCtrl (_x select 0);
	_checkstatus = ExileClientInteractionObject getVariable [(_x select 1),[]];
	_result = false;
	if !(_checkstatus isEqualTo []) then 
	{
		if !((_checkstatus select 3) == format["%1_empty_dirty",_x select 1]) then 
		{
			_result = true;
		};	
	};
	if (_result) then 
	{
	 	_control1 ctrlSetEventHandler ["MouseEnter", "_this call ExileLifeClient_gui_chemlab_mixing_event_onMouseEnter"];
	 	_control1 ctrlSetEventHandler ["MouseExit", "_this call ExileLifeClient_gui_chemlab_mixing_event_onMouseExit"];
	 	_control1 ctrlSetEventHandler ["MouseButtonClick", "_this call ExileLifeClient_gui_chemlab_mixing_event_onMouseClick"];
	}
	else
	{
		_control1 ctrlremoveAllEventHandlers "MouseEnter";
		_control1 ctrlremoveAllEventHandlers "MouseExit";
		_control1 ctrlremoveAllEventHandlers "MouseButtonClick";				
		_control1 ctrlshow false;
		_control1 ctrlEnable false;
		_control2 = _display displayCtrl (_x select 2);	
		_control2 ctrlshow false;
		_control2 ctrlEnable false;			
	};
}forEach ExileLifeChemicalArray;
