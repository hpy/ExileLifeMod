/**
                    * ExileServer_system_simulationMonitor_initialize
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

                    ExileSimulationMonitoredVehicles = [];
if (getNumber(missionConfigFile >> "CfgSimulation" >> "enableDynamicSimulation") isEqualTo 1) then 
{
	enableDynamicSimulationSystem true;
	"Group" setDynamicSimulationDistance (getNumber(missionConfigFile >> "CfgSimulation" >> "groupSimulationDistance"));
	"Vehicle" setDynamicSimulationDistance (getNumber(missionConfigFile >> "CfgSimulation" >> "vehicleSimulationDistance"));
	"EmptyVehicle" setDynamicSimulationDistance (getNumber(missionConfigFile >> "CfgSimulation" >> "emptyVehicleSimulationDistance"));
	"Prop" setDynamicSimulationDistance (getNumber(missionConfigFile >> "CfgSimulation" >> "propSimulationDistance"));
	"IsMoving" setDynamicSimulationDistanceCoef (getNumber(missionConfigFile >> "CfgSimulation" >> "isMovingSimulationCoef"));
}
else
{
	[20, ExileServer_system_simulationMonitor_thread_toggleSimulation, [], true] call ExileServer_system_thread_addTask;
};
true
