/**
                    * ExilelifeClient_util_config_inherits
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_config","_baseConfig","_inherits"];
_config = _this select 0;
_baseConfig = _this select 1;
_inherits = false;
while { isClass _config } do 
{
	_config = inheritsFrom _config;
	if (_baseConfig isEqualTo _config) exitWith 
	{
		_inherits = true;
	};
};
_inherits