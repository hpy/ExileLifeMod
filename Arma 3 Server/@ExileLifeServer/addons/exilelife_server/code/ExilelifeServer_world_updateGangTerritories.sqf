/**
                    * ExilelifeServer_world_updateGangTerritories
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

                    private["_GangMarkerName","_GangTerritoryRadius"];
_GangMarkerName = _this select 0;
_GangTerritoryRadius = _this select 1;
_GangMarkerName setMarkerSize [_GangTerritoryRadius,_GangTerritoryRadius];
