/*
	Author: Karel Moricky

	Description:
	Multiplayer mission init, executed automatically upon mission start.

	Parameter(s):
	None

	Returns:
	NOTHING
*/

//--- Execute MP functions
["BIS_fnc_initMultiplayer"] call bis_fnc_startLoadingScreen;
["BIS_fnc_initMultiplayer"] call bis_fnc_endLoadingScreen;

// Disabled Functions
if (isMultiplayer) then
{
	BIS_fnc_MP_packet = compileFinal '';
};

// Naaaaah