/**
                    * ExilelifeClient_util_array_shuffle
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_array","_strength","_length","_i"];
_array = _this select 0;
_strength = param [1, count(_array)];
_length = count _array;
for "_i" from 1 to _strength do
{
    _array pushBack (_array deleteAt (floor(random _length)));
};
_array