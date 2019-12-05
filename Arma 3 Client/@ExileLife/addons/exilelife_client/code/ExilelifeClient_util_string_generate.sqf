/**
                    * ExilelifeClient_util_string_generate
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

                    private["_length","_useAlpha","_useNum","_useSymbols","_delim","_alpha","_num","_sym","_list","_stringArray","_i","_number","_string"];
_length = _this select 0;
_useAlpha = param [1,true];
_useNum = param [2,false];
_useSymbols = param [3,false];
_delim = param [4,""];
_alpha = ["a","S","L","H","t","e","O","v","c","d","N","T","J","F","Y","P","r","z","w","C","o","M","p","m","i","G","K","y","q","Z","W","U","f","b","u","R","A","g","B","n","s","X","Q","l","D","V","I","E","x","h","j"];
_num = ["0","1","2","3","4","5","6","7","8","9"];
_sym = ["#","$","&","*"];
_list = [];
if (_useAlpha) then
{
	_list = _list + _alpha;
};
if (_useNum) then
{
	_list = _list + _num;
};
if (_useSymbols) then
{
	_list = _list + _sym;
};
if (!_useNum && !_useNum && !_useSymbols) then
{
	_list = _alpha;
};
_list = [_list, 100] call ExileLifeClient_util_array_shuffle;
_stringArray = [];
for "_i" from 1 to _length do
{
	_number = random (count(_list) - 1);
	_stringArray pushBack (_list select _number);
};
_string = _stringArray joinString _delim;
_string