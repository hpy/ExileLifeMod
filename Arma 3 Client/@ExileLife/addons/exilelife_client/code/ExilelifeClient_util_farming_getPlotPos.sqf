/**
                    * ExilelifeClient_util_farming_getPlotPos
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

                    private["_garden","_gardenplot","_plotPos","_plotPosWorld"];
	_garden = _this select 0;
	_gardenplot = _this select 1;
	_plotPos = _garden selectionPosition (format ["plot_%1",_gardenplot]);
	_plotPosWorld = _garden modelToWorld _plotPos;
	_plotPosWorld = [_plotPosWorld select 0, _plotPosWorld select 1, _plotPos select 2];
	_plotPosWorld
