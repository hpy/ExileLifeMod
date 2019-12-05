/**
                    * config
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    class CfgPatches
{
	class exilelife_server
	{
		requiredVersion = 0.1;
		requiredAddons[] =
		{
			"exilelife_client",
			"exilelife_server_config",
			"exilelife_assets",
			"exilelife_weapons",
			"exilelife_vehicles"
		};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgFunctions
{
	class ExileLifeServer
	{
		class Bootstrap
		{
			file = "exilelife_server\bootstrap";
			class preInit { preInit = 1; };
		};
	};
};
