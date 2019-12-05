/**
                    * config
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

                    class CfgPatches
{
	class exile_client_overwrites
	{
		requiredVersion = 0.1;
		requiredAddons[] =
		{
			"exilelife_client"
		};
	};
};
class CfgFunctions
{
	class ExileClient
	{
		class Bootstrap
		{
			class preInit { file = "exile_client_overwrites\bootstrap\fn_preInit.sqf"; preInit = 1; };
			class oldPreInit { file = "exile_client\bootstrap\fn_preInit.sqf";};
		};
	};
};