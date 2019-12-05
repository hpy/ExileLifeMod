/**
                    * ExilelifeClient_gui_xm8_slide_settings_event_onShowMapMarkersChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_cambo"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_cambo = _display displayCtrl 5015;
profileNamespace setVariable ["ExileLifeMapMarkers", ((lbCurSel _cambo) isEqualTo 1)];
if (profileNameSpace getVariable ["ExileLifeMapMarkers", false]) then
{
	[["Fruit","Mining","Artefacts","Drugs","Refinery","BlackMarket"]] call ExileLifeClient_system_world_loadResources;
}
else
{
	[[]] call ExileLifeClient_system_world_loadResources;
};
