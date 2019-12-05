/**
                    * ExileClientOverwrites_object_player_event_onKilled
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

                    closeDialog 0;
ExileClientLastDiedPlayerObject = player;
ExileClientIsAutoRunning = false;
if !((vehicle player) isEqualTo player) then
{
	unassignVehicle player;
	player action ["GetOut", vehicle player];
	player action ["Eject", vehicle player];
};
setGroupIconsVisible [false, false];
false call ExileClient_gui_hud_toggle;
[] call ExileClient_object_player_event_unhook;
if !(ExileClientLastDeathMarker isEqualTo "") then
{
	deleteMarkerLocal ExileClientLastDeathMarker;
};
ExileClientLastDeathMarker = createMarkerLocal [format ["Death%1", time], getPos player];
ExileClientLastDeathMarker setMarkerShapeLocal "ICON";
ExileClientLastDeathMarker setMarkerTypeLocal "KIA";
ExileClientLastDeathMarker setMarkerColorLocal "ColorRed";
ExileClientLastDeathMarker setMarkerAlphaLocal 0.5;
if (ExileClientIsInBush) then
{
	call ExileClient_object_bush_detach;
};
if !(ExileClientBreakFreeActionHandle isEqualTo -1) then
{
	player removeAction ExileClientBreakFreeActionHandle;
	ExileClientBreakFreeActionHandle = -1;
};
ExileClientNotificationQueue = [];
ExileIsPlayingRussianRoulette = false;
ExileRussianRouletteChair = false;
[] call ExileClient_gui_russianRoulette_hide;
[] call ExileClient_system_breathing_event_onPlayerDied;
[] call ExileClient_system_snow_event_onPlayerDied;
[] call ExileClient_system_radiation_event_onPlayerDied;
