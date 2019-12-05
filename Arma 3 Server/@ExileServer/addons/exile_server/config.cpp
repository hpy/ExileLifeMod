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
	class exile_server
	{
		requiredVersion = 0.1;
		requiredAddons[] =
		{
			"exile_client",
			"exile_assets"
		};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgFunctions
{
	class ExileServer
	{
		class Bootstrap
		{
			file = "exile_server\bootstrap";
			class preInit { preInit = 1; };
			class postInit { postInit = 1; };
		};
		class FiniteStateMachine
		{
			file = "exile_server\fsm";
			class main { ext = ".fsm"; };
		};
	};
};