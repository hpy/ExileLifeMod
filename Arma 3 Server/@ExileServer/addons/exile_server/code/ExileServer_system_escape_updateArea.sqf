/**
                    * ExileServer_system_escape_updateArea
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

                    private["_previewLength","_roundLength","_previewTime","_previewLengthSeconds","_position","_roundZoneRadius","_playAreaRadius","_newPlayAreaRadius","_maximumPlayAreaMove","_newPosition","_i","_message","_heliDelay"];
_previewLength = getNumber (configFile >> "CfgSettings" >> "Escape" >> "minutesBeforePreview");
_roundLength = getNumber (configFile >> "CfgSettings" >> "Escape" >> "minutesPerRound");
_previewTime = _roundLength - _previewLength;
_previewLengthSeconds = _previewLength * 60;
uiSleep _previewLengthSeconds;
"Updating play area..." call ExileServer_util_log;
_position = getMarkerPos "ExileFuturePlayArea";
_roundZoneRadius = getArray (configFile >> "CfgSettings" >> "Escape" >> "roundZoneRadius");
_playAreaRadius = (getMarkerSize "ExilePlayArea") select 0;
_newPlayAreaRadius = _roundZoneRadius select ExileEscapeCurrentRound;
_maximumPlayAreaMove = _playAreaRadius - _newPlayAreaRadius;
_newPosition = [_position, 10, _maximumPlayAreaMove, 5, 0 , 10 , 0 ] call BIS_fnc_findSafePos; 
"ExileFuturePlayArea" setMarkerPos _newPosition;
"ExileFuturePlayArea" setMarkerSize [_newPlayAreaRadius, _newPlayAreaRadius];
"ExileFuturePlayArea" setMarkerAlpha 1;
[_newPosition, _newPlayAreaRadius, "green"] call ExileServer_system_escape_3dzone_create;
for "_i" from 0 to (_previewTime - 1) do
{
	if ((_previewTime - _i) isEqualTo 1) then 
	{
		_message = "In one minute the area will update!";
	}
	else 
	{
		_message = format ["In %1 minutes the area will update!", _previewTime - _i];
	};
	["baguetteRequest", [_message]] call ExileServer_system_network_send_broadcast;
	uiSleep 60;
};
"green" call ExileServer_system_escape_3dzone_destroy;
"red" call ExileServer_system_escape_3dzone_destroy;
[_newPosition, _newPlayAreaRadius, "red"] call ExileServer_system_escape_3dzone_create;
"ExileFuturePlayArea" setMarkerAlpha 0;
"ExilePlayArea" setMarkerPos _newPosition;
"ExilePlayArea" setMarkerSize [_newPlayAreaRadius, _newPlayAreaRadius];
{
	if (((getMarkerPos _x) distance2D _newPosition) > _newPlayAreaRadius) then 
	{
		deleteMarker _x;
	};
}
forEach allMapMarkers;
ExileEscapeCurrentRound = ExileEscapeCurrentRound + 1;
if (ExileEscapeTotalRounds > ExileEscapeCurrentRound) then
{
	["baguetteRequest", ["The area of play has updated!"]] call ExileServer_system_network_send_broadcast;
	[] spawn ExileServer_system_escape_updateArea;
}
else
{
	["baguetteRequest", ["The area of play has updated!"]] call ExileServer_system_network_send_broadcast;
	[] spawn ExileServer_system_escape_shrinkFinalArea;
	_heliDelay = ((_roundLength * 60) / 2);
	[_heliDelay, ExileServer_system_escape_extractionHeli, [], false] call ExileServer_system_thread_addtask;
};
true