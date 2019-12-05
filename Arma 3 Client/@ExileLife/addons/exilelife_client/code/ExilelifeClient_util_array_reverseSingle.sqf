/**
                    * ExilelifeClient_util_array_reverseSingle
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_array","_temp","_i"];
_array = _this;
_temp = [];
if !(_array isEqualTo []) then
{
	for [{_i = count(_array)}, {_i > -1}, {_i=_i-1}] do
	{
		_temp pushBack (_array select _i);
	};
};
_temp