/**
                    * ExilelifeServer_system_messaging_createMessageID
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

                    private["_chars","_loop","_id","_i","_character","_thread"];
_chars = ["a","S","L","H","t","e","O","v","c","d","N","T","J","F","Y","P","r","z","w","C","o","M","p","m","i","G","K","y","q","Z","W","U","f","b","u","R","A","g","B","n","s","X","Q","l","D","V","I","E","x","h","j","0","1","2","3","4","5","6","7","8","9"];
_loop = true;
while {_loop} do
{
	_id = [];
	for "_i" from 0 to 7 do
	{
		_character = selectRandom _chars;
		_id pushBack _character;
	};
	_id = _id joinString "";
	_thread = _id call ExileLifeServer_system_messaging_getThread;
	if (isNil "_thread") then
	{
		_loop = false;
		missionNamespace setVariable [format["ExileLifeMessage:%1", _id], []];
	};
};
_id
