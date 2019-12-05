/**
                    * ExileClientOverwrites_gui_toaster_pushToBottom
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

                    private["_position","_toastControl","_toastPosition","_status","_statusChangeAt"];
disableSerialization;
_position = 0;
{
	_toastControl = _x select 0;
	_toastPosition = ctrlPosition _toastControl;
	_status = 0;
	_statusChangeAt = (_x select 2) max (diag_tickTime + 2);
	if (_forEachIndex isEqualTo 0) then 
	{
		_position = safeZoneY + 40 * pixelH; 
		_toastControl ctrlSetFade 0;
	}
	else 
	{
		if (_forEachIndex > 4) then 
		{
			_toastControl ctrlSetFade 1;
			_status = 1;
			_statusChangeAt = diag_tickTime + 2;
		};
	};
	_toastPosition set [1, _position];
	_toastControl ctrlSetPosition _toastPosition;
	_toastControl ctrlCommit 0.25;
	_position = _position + (_toastPosition select 3) + (10 * pixelH);
	ExileClientToasts set [_forEachIndex, [_toastControl, _status, _statusChangeAt]];
}
forEach ExileClientToasts;
