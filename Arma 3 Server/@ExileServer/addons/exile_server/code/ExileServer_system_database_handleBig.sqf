/**
                    * ExileServer_system_database_handleBig
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

                    private["_key","_result","_pipe"];
_key = _this;
_result = "";
while{true} do
{
	_pipe = "extDB3" callExtension format["5:%1", _key];
	if(_pipe isEqualTo "") exitWith {};
	_result = _result + _pipe;
};
call (compile _result)