/**
                    * ExilelifeClient_util_world_checkZone
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

                    private["_zone"];
try
{
	if !(ExileLifeResourceType == "") then 
	{
		throw ExileLifeResourceType;
	};
	if !(ExileLifeRefineryType == "") then 
	{
		throw ExileLifeRefineryType;
	};
	throw "";
}
catch
{
	_zone = _exception;
};
_zone