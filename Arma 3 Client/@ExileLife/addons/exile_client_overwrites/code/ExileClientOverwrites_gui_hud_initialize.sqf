/**
                    * ExileClientOverwrites_gui_hud_initialize
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

                    private["_hasChanges"];
ExileHudIsVisible = false;
if (isNil "ExileHudEventHandle") then
{
	ExileHudEventHandle = -1;
};
ExileHudLastSpeedRenderedAt = diag_tickTime;
ExileHudLastGroupRenderedAt = diag_tickTime;
ExileHudStatsRenderedAt = diag_tickTime;
ExileHudLastVehicleRenderedAt = diag_tickTime;
ExileHudLastRenderedMuzzle = "";
ExileHudLastRenderedGrenadeClassName = "";
ExileHudLastRenderedVehicleClassName = "";
ExileHudLastRenderedVehicleFuelTankSize = 0;
ExileHudMode = 0;
ExileLayerGasMask = ("RscExileGaskMaskLayer" call BIS_fnc_rscLayer);
ExileLayerHUD = ("RscExileHUDLayer" call BIS_fnc_rscLayer);
ExileLayerRussianRoulette = ("RscExileRussianRouletteLayer" call BIS_fnc_rscLayer);
ExileBaguetteLayer = ("RscExileBaguetteLayer" call BIS_fnc_rscLayer);
ExileBaguetteLayer cutRsc ["RscExileBaguetteArea", "PLAIN", 0, true];
if (getText(missionConfigFile >> "Header" >> "gameType") isEqualTo "Escape") then
{
	ExileEscapeHudLayer = ("RscExileEscapeHUDLayer" call BIS_fnc_rscLayer);
	ExileEscapeHudLayer cutRsc ["RscExileEscapeHUD", "PLAIN", 1, false];
	[0.5, ExileClient_gui_hud_renderEscapeHUD, [], true] call ExileClient_system_thread_addTask;
	ExileEscapeStatsLayer = ("RscExileEscapeHUDStatsLayer" call BIS_fnc_rscLayer);
	ExileStatsHudIsVisible = false;
	ExileHudMode = 1;
};
ExileLifeLayerWatermark = ("RscExileLifeWatermarkLayer" call BIS_fnc_rscLayer);
inGameUISetEventHandler ["Action", "_this call ExileClient_gui_hud_event_onAction"];
_hasChanges = false;
{
	if ((profileNamespace getVariable [_x select 0, -1]) isEqualTo -1) then
	{
		profileNamespace setVariable [_x select 0, profileNamespace getVariable [_x select 1, 1]];
		_hasChanges = true;
	};
}
forEach
[
	["ExilePartyESPRed", "IGUI_TEXT_RGB_R"],
	["ExilePartyESPGreen", "IGUI_TEXT_RGB_G"],
	["ExilePartyESPBlue", "IGUI_TEXT_RGB_B"]
];
if ((profileNamespace getVariable ["ExilePartyESPAlpha", -1]) isEqualTo -1) then
{
	profileNamespace setVariable ["ExilePartyESPAlpha", 0.75];
	_hasChanges = true;
};
if ((profileNamespace getVariable ["ExilePartyMarkerAlpha", -1]) isEqualTo -1) then
{
	profileNamespace setVariable ["ExilePartyMarkerAlpha", 0.75];
	_hasChanges = true;
};
if (_hasChanges) then
{
	saveProfileNamespace;
};
