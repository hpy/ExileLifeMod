/**
 * Pre-Start
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 *
 * --------------------------
 *
 * Eichi:
 * Do not use "with uiNameSpace do" here or you will collect mini dumps.
 * Also, do not call or spawn shit here. Serialization does not work. FSMs
 * are not executed at all. onEachFrame never fires. onDraw does not fire.
 * onLoad fires for all, onUnload only fires for some. And CT_ANIMATED_TEXTURE
 * looks ugly. If I ever have to touch this again, I will kill myself.
 *
 */

if !(hasInterFace) exitWith {false};

///////////////////////////////////////////////////////////////////////////////
// Reset loading screen data
///////////////////////////////////////////////////////////////////////////////
uiNameSpace setVariable ["ExileClient_gui_loadingScreen_reset",
{
	uiNameSpace setVariable ["ExileLoadingScreenBackgroundPicture", nil];
	uiNameSpace setVariable ["ExileLoadingScreenMapData", nil];
	uiNameSpace setVariable ["ExileLoadingScreenMissionData", nil];
	uiNameSpace setVariable ["ExileClientLoadingScreenDisplays", nil];
	uiNameSpace setVariable ["RscDisplayLoading_display", nil];
}];

///////////////////////////////////////////////////////////////////////////////
// Constructor of our loading screen
//
// Eichi: Careful! Passing the display to call or spawn DOES NOT WORK!
// I had this split into multiple functions, but serializing them is
// obivously not possible. Means we have a big booty functio now :(
///////////////////////////////////////////////////////////////////////////////

uiNameSpace setVariable ["ExileClient_gui_loadingScreen_load",
{
	disableSerialization;

	private ["_spinnerTextControl", "_newsControl", "_cookie", "_cookieAlphabet"];

	params ["_display", "_displayType"];

	// Seems to be required so the core engine functions work
	uiNameSpace setVariable ["RscDisplayLoading_display", _display];

	// So BIS_fnc_progressLoadingScreen works
	RscDisplayLoading_progress = (_display displayCtrl 104);

	// Update the text to either loading map or mission
	_spinnerTextControl = _display displayCtrl 66002;

	switch (_displayType) do
	{
		case "RscDisplayMultiplayerSetup":
		{
			_spinnerTextControl ctrlSetStructuredText (parseText "<t>Joining...</t>");
		};

		case "RscDisplayClient":
		{
			_spinnerTextControl ctrlSetStructuredText (parseText "<t>Connecting...</t>");
		};

		case "RscMPSetupMessage":
		{
			_spinnerTextControl ctrlSetStructuredText (parseText "<t>Downloading...</t>");
		};

		default
		{
			// 1 out of 10 is link
			if ((floor (random 10)) < 1) then 
			{
				_loadingText = "<t>Your text here? Make a suggestion: </t><t color='#c72651'>www.exilemod.com/discord</t>";
			}
			else 
			{
				_loadingTextTemplates = getArray (configFile >> "CfgExileLoadingScreen" >> "templates");
				_loadingTextTemplate = selectRandom _loadingTextTemplates;			
				_loadingText = format ["<t>%1</t> <t size='0.5' color='#00c8ec' valign='bottom'>Submitted by %2</t>", _loadingTextTemplate select 0, _loadingTextTemplate select 1];
			};

			_spinnerTextControl ctrlSetStructuredText (parseText _loadingText);
		};
	};

	///////////////////////////////////////////////////////////////////////////
	// Find out if the current mission / world is a cutscene

	private ["_isCutscene", "_cutscenes"];

	_isCutscene = true;

	// World must be set and not VR
	// Never show a loading screen for VR
	if !(worldName in ["", "VR"]) then
	{
		// As we have a world, we should be able to read the map config
		_cutscenes = [];

		{
			_cutscenes pushBackUnique (toLower _x);	
		}
		forEach getArray (configFile >> "CfgWorlds" >> worldName >> "cutscenes");

		// Add these to the test array
		_cutscenes pushBackUnique "tempmissionsp";
		_cutscenes pushBackUnique "";

		// If the mission name is empty, tempMissionSP or in the world cutscenes,
		// it is a cutscene. If not, this sets it to false
		_isCutscene = ((toLower missionName) in _cutscenes);
	};

	///////////////////////////////////////////////////////////////////////////

	private ["_backgroundPicture", "_backgroundPictureControl"];

	// If we do not have a background image yet, choose a random one
	_backgroundPicture = uiNameSpace getVariable ["ExileLoadingScreenBackgroundPicture", false];

	// Update the background picture. This is not needed to be done
	// in the loop below, since onLoad fires at least once for all
	// of them and the background image does not depend on mission
	// or map info
	if (_backgroundPicture isEqualTo false) then
	{
		_backgroundPicture = selectRandom
		[
			"exile_assets\texture\loading\loading_axe_co.paa",
			"exile_assets\texture\loading\loading_bigmomma_co.paa",
			"exile_assets\texture\loading\loading_cement_co.paa",
			"exile_assets\texture\loading\loading_cheathas_co.paa",
			"exile_assets\texture\loading\loading_cockonut_co.paa",
			"exile_assets\texture\loading\loading_codelock_co.paa",
			"exile_assets\texture\loading\loading_concrete_mixer_co.paa",
			"exile_assets\texture\loading\loading_dsnuts_co.paa",
			"exile_assets\texture\loading\loading_emre_co.paa",
			"exile_assets\texture\loading\loading_flag_co.paa",
			"exile_assets\texture\loading\loading_foolbox_co.paa",
			"exile_assets\texture\loading\loading_knife_co.paa",
			"exile_assets\texture\loading\loading_laptop_co.paa",
			"exile_assets\texture\loading\loading_metal_screws_co.paa",
			"exile_assets\texture\loading\loading_moobar_co.paa",
			"exile_assets\texture\loading\loading_pop_tabs_co.paa",
			"exile_assets\texture\loading\loading_raisins_co.paa",
			"exile_assets\texture\loading\loading_shovel_co.paa",
			"exile_assets\texture\loading\loading_sledge_hammer_co.paa",
			"exile_assets\texture\loading\loading_vishpirin_co.paa"
		];

		uiNameSpace setVariable ["ExileLoadingScreenBackgroundPicture", _backgroundPicture];
	};

	_backgroundPictureControl = _display displayCtrl 66000;
	_backgroundPictureControl ctrlSetText _backgroundPicture;

	///////////////////////////////////////////////////////////////////////////
/*
	private ["_mapData", "_mapConfig", "_mapName", "_mapAuthor", "_mapPicture"];
	private ["_mapControl", "_mapNameControl", "_mapAuthorControl", "_mapPictureControl"];

	// Do we have map data already?
	_mapData = uiNameSpace getVariable ["ExileLoadingScreenMapData", false];

	if (_mapData isEqualTo false) then
	{
		// Ignore cutscenes
		if !(_isCutscene) then
			{
				// Access the map config
				_mapConfig = configFile >> "CfgWorlds" >> worldName;

				// Get the map name
				_mapName = getText (_mapConfig >> "description");

				// Fall back to the config name of this map
				if (_mapName isEqualTo "") then
				{
					_mapName = worldName;
				};

				// Extract the map author...
				_mapAuthor = getText (_mapConfig >> "author");

				// ...or default to "Unknown Community Author"
				if (_mapAuthor isEqualTo "") then
				{
					_mapAuthor = localize "STR_AUTHOR_UNKNOWN";
				};

				// Update the map picture
				_mapPicture = getText (_mapConfig >> "pictureShot");

				// Because VR is utterly broken. It only has a white image
				if (_mapPicture isEqualTo "A3\Map_VR\data\ui_VR_ca.paa") then
				{
					_mapPicture = "";
				};

				if (_mapPicture isEqualTo "") then
				{
					_mapPicture = getText (_mapConfig >> "pictureMap");
				};

				// Default to Arma 3 logo if there is no map picture
				if (_mapPicture isEqualTo "") then
				{
					_mapPicture = "a3\ui_f\data\Logos\arma3_white_ca.paa"
			};

			// Tanoa does not have a good pictureMap
			if (worldName isEqualTo "Tanoa") then 
			{
				_mapPicture = "exile_assets\texture\map\tanoa_co.paa"
				};

				// Save the map data for later use
				_mapData =
				[
					_mapName,
					_mapAuthor,
					_mapPicture
				];

				uiNameSpace setVariable ["ExileLoadingScreenMapData", _mapData];
			};
		};
	};
*/
	///////////////////////////////////////////////////////////////////////////
/*
	private ["_missionData", "_missionName", "_missionAuthor", "_missionPicture"];
	private ["_missionControl", "_missionPictureControl", "_missionNameControl", "_missionAuthorControl"];

	_missionData = uiNameSpace getVariable ["ExileLoadingScreenMissionData", false];

	// If we do not have a mission data, try to extract it
	if (_missionData isEqualTo false) then
	{
		// Ignore cutscenes
		if !(_isCutscene) then
		{
			// Get the defined mission name or briefing name
			_missionName = getMissionConfigValue ["onLoadName", briefingName];

			// If there is no mission name, use "Unnamed Mission"
			if (_missionName isEqualTo "") then
			{
				_missionName = localize "STR_a3_rscdisplay_loading_noname";
			};

			// Get the defined mission author or "Unknown Community Author"
			_missionAuthor = getMissionConfigValue ["author", localize "STR_AUTHOR_UNKNOWN"];

			// Try to get a community logo first
			_missionPicture = getText (missionConfigFile >> "loadScreen");

			// If there is no community logo, try another, older property
			if (_missionPicture isEqualTo "") then
			{
				_missionPicture = getText (missionConfigFile >> "overviewPicture");
			};

			// If that still is not defined, use our logo
			if (_missionPicture isEqualTo "") then
			{
				_missionPicture = "exilelife_assets\texture\mod\logo.paa";
			};

			// Keep this in mind :D
			_missionData =
			[
				_missionName,
				_missionAuthor,
				_missionPicture
			];

			// Store the data so we can access it later (where missionConfig is not there)
			uiNameSpace setVariable ["ExileLoadingScreenMissionData", _missionData];
		};
	};
*/
	///////////////////////////////////////////////////////////////////////////

	// Keep all involved displays in mind. onLoad does not fire
	// for all of them. "Receiving data..." for example never has
	// a onLoad...
	_loadingDisplays = uiNameSpace getVariable ["ExileClientLoadingScreenDisplays", []];
	_loadingDisplays pushBackUnique _display;
/*


//we dont need all those silly things cluttering up our loading screen!

	{
		if !(isNull _x) then
		{
			// Update the map info
			_mapControl = _x displayCtrl 66003;

			if (_mapData isEqualTo false) then
			{
				// Hide the map, if we lack data
				_mapControl ctrlShow false;
			}
			else
			{
				// Show the map data
				_mapControl ctrlShow true;

				// Update the map name
				_mapNameControl = _x displayCtrl 66005;
				_mapNameControl ctrlSetText (_mapData select 0);

				// Update the map author
				_mapAuthorControl = _x displayCtrl 66006;
				_mapAuthorControl ctrlSetText (_mapData select 1);

				// Update the map picture
				_mapPictureControl = _x displayCtrl 66004;
				_mapPictureControl ctrlSetText (_mapData select 2);
			};

			// Update the mission info
			_missionControl = _x displayCtrl 66007;

			// If we do not have mission data, hide the mission
			if (_missionData isEqualTo false) then
			{
				_missionControl ctrlShow false;
			}
			else
			{
				// Ensure it is shown if we have data
				_missionControl ctrlShow true;

				// Update the name
				_missionNameControl = _x displayCtrl 66009;
				_missionNameControl ctrlSetText (_missionData select 0);

				// Update the author
				_missionAuthorControl = _x displayCtrl 66010;
				_missionAuthorControl ctrlSetText (_missionData select 1);

				// Update the picture
				_missionPictureControl = _x displayCtrl 66008;
				_missionPictureControl ctrlSetText (_missionData select 2);
			};
		};
	}
	forEach _loadingDisplays;
*/
	uiNameSpace setVariable ["ExileClientLoadingScreenDisplays", _loadingDisplays];
}];

///////////////////////////////////////////////////////////////////////////////
// A spawned thread to animate the spinning wheel of our loading screen
//
// -----
//
//_animationThread = uiNameSpace getVariable ["ExileLoadingScreenSpinnerThread", scriptNull];
//
// if (isNull _animationThread) then
// {
// 	// We cannot pass _spinner here :(
// 	_animationThread = [] spawn (uiNameSpace getVariable ["ExileClient_gui_animateLoadingScreen", scriptNull]);
//
// 	uiNameSpace setVariable ["ExileLoadingScreenSpinnerThread", _animationThread];
// };
//
// uiNameSpace setVariable ["ExileLoadingScreenSpinnerThread", _animationThread];
///////////////////////////////////////////////////////////////////////////////

uiNameSpace setVariable ["ExileClient_gui_loadingScreen_animate",
{
	disableSerialization;

	private ["_spinner", "_startTime"];

	_spinner = (uiNameSpace getVariable ["RscExileLoadingScreen", controlNull]) displayCtrl 66001;
	_startTime = diag_tickTime;

	while {true} do // until terminate on unload fires
	{
		_spinner ctrlSetAngle [(diag_tickTime - _startTime) * 360, 0.5, 0.5];

		// 1/60 results in underflow = the spinner lags
		// minimum in Arma is 3ms, but this works:
		uiSleep 0.016;
	};
}];

///////////////////////////////////////////////////////////////////////////////
// Deconstruct the loading screen
///////////////////////////////////////////////////////////////////////////////

uiNameSpace setVariable ["ExileClient_gui_loadingScreen_unload",
{
	disableSerialization;

	private ["_animationThread"];

	_animationThread = uiNameSpace getVariable ["ExileLoadingScreenSpinnerThread", scriptNull];

	if !(isNull _animationThread) then
	{
		terminate _animationThread;
		uiNameSpace setVariable ["ExileLoadingScreenSpinnerThread", scriptNull]
	};
}];

true
