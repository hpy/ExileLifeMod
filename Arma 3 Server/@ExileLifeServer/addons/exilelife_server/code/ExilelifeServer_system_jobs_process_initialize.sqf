/**
                    * ExilelifeServer_system_jobs_process_initialize
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

                    private["_array","_weight","_jobs","_timeLeft"];
"Initalizing Job System" call ExileLifeServer_util_log;
ExileLifeTimeDifference = -1;
publicVariable "ExileLifeTimeDifference";
ExileLifeTimeSynced = false;
publicVariable "ExileLifeTimeSynced";
"Starting Time Sync Thread" call ExileLifeServer_util_log;
[150,ExileLifeServer_system_jobs_process_thread_timeSync,[],true,"Time Sync"] call ExileServer_system_thread_addTask;
"Starting Queuing" call ExileLifeServer_util_log;
[5,ExileLifeServer_system_jobs_process_thread_queue,[],true,"Job Queue"] call ExileServer_system_thread_addTask;
"Initalizing Job Board" call ExileLifeServer_util_log;
ExileLifeJob_MinTime = getNumber(missionConfigFile >> "CfgJobs" >> "minTime");
ExileLifeJob_MaxTime = getNumber(missionConfigFile >> "CfgJobs" >> "maxTime");
ExileLifeJob_MinJobs = getNumber(missionConfigFile >> "CfgJobs" >> "minJobs");
ExileLifeJob_MaxJobs = getNumber(missionConfigFile >> "CfgJobs" >> "maxJobs");
ExileLifeJob_AvailableJobs = [];
ExileLifeJobBoard = [];
ExileLifeJob_LastRanJob = "";
ExileLifeJob_LastJobAddedRan = time;
ExileLifeJobBoardIniterationNumber = -1;
ExileLifeWantedVehicles = [];
ExileLifeServerCurrentJobPos = [];
if (ExileLifeServerSunMoonCycle isEqualTo 1) then
{
	_array = getArray(missionConfigFile >> "CfgJobs" >> "availableDayJobs");
}
else
{
	_array = getArray(missionConfigFile >> "CfgJobs" >> "availableNightJobs");
};
ExileLifeJobBoardDayNight = ExileLifeServerSunMoonCycle;
{
	if (isClass(configFile >> "CfgJobs" >> _x)) then
	{
		_weight = getNumber(configFile >> "CfgJobs" >> _x >> "Time" >> "weight");
		if (_weight > 0) then
		{
			ExileLifeJob_AvailableJobs pushbackUnique [_x,_weight];
		};
	}
	else
	{
		format["ERROR! Job %1 does not exist in CfgJobs!",_x] call ExileLifeServer_util_log;
	};
}
forEach _array;
_jobs = "getJobsBoardJobs" call ExileServer_system_database_query_selectFull;
{
	_timeLeft = [_x select 3,call ExileServer_util_time_currentTime] call ExileLifeServer_util_time_timeLeft;
	ExileLifeJobBoard pushbackUnique [_x select 1,_x select 0,str(_timeLeft),_x select 2, 0];
}
forEach _jobs;
ExileLifeJobBoardIniterationNumber = (count(_jobs) * -1) - 1;
[5,ExileLifeServer_system_jobs_process_thread_jobSelector,[],true,"Job Selector"] call ExileServer_system_thread_addTask;
"Job System - Loading job positions" call ExileLifeServer_util_log;
ExileLifeJobPos_generator =
[
	[3877.57, 12865.1, 18.0476],
	[3711.26, 14043.5, 25.3817],
	[4428.23, 20635.6, 293.586],
	[6291.69, 19819.8, 234.913],
	[7481.72, 21550.2, 172.409],
	[9455.42, 21198.9, 62.1858],
	[4213.07, 12115.1, 46.6206],
	[9473.65, 15368.4, 127.238],
	[10935.9, 18774.6, 86.2469],
	[20567.6, 16016.5, 26.9785],
	[20561.2, 16034.2, 27.4656],
	[15585.9, 16211.9, 16.2074],
	[15586.5, 16206.3, 16.3918],
	[21931.9, 8631.74, 41.5712],
	[19598.6, 6621.55, 66.2489],
	[22064.7, 4924.75, 10.9866],
	[12073, 20526.7, 95.5679],
	[15227.8, 17736.4, 22.5684],
	[20922.8, 19182.6, 12.8384],
	[17055.5, 12737, 15.8917]
];
ExileLifeJobPos_fuelstation =
[
	[9205.75,12112.2,-0.0487213],
	[11831.6,14155.9,-0.0342026],
	[12024.7,15830,-0.0298138],
	[12026.6,15830.1,-0.0342979],
	[12028.4,15830,-0.0388718],
	[9025.78,15729.4,-0.0206451],
	[9023.75,15729,-0.027153],
	[9021.82,15728.7,-0.0293427],
	[16750.9,12513.1,-0.0525188],
	[6798.15,15561.6,-0.0441475],
	[6198.83,15081.4,-0.0912437],
	[14181.6,16549.3,0.00917625],
	[5023.26,14429.6,-0.0978947],
	[5019.68,14436.7,-0.0114822],
	[4001.12,12592.1,-0.0966644],
	[17417.2,13936.7,-0.10652],
	[3757.14,13477.9,-0.0540285],
	[3757.54,13485.9,-0.010498],
	[16875.2,15469.4,0.0373325],
	[16871.7,15476.6,0.0102873],
	[8481.69,18260.7,-0.0266876],
	[15297.1,17565.9,-0.2838],
	[14221.4,18302.5,-0.0697174],
	[15781,17453.2,-0.285282],
	[19961.3,11454.6,-0.0349312],
	[19965.1,11447.6,-0.0483704],
	[5768.99,20085.7,-0.0189667],
	[21230.4,7116.56,-0.0604248],
	[20784.8,16665.9,-0.0521202],
	[20789.6,16672.3,-0.0213318],
	[23379.4,19799,-0.0544052],
	[25701.2,21372.6,-0.0774155]
];
ExileLifeJobPos_cartel =
[
	[9854.05,12162.5,0],
	[9475.33,12265.4,0],
	[9216.61,12403.3,0],
	[8761.67,12570.4,0],
	[8542.37,12187.4,0],
	[8612.35,11825,0],
	[8830.87,11366.4,0],
	[9211.82,11486.7,0],
	[9510.86,11357.5,0],
	[9757.31,11611.5,0],
	[10045.3,11890,0]
];
ExileLifeJobPos_mafia =
[
	[25216.1,21297,0],
	[25202.9,21347,0],
	[25078.1,20962.2,0],
	[25064.9,20896.4,0],
	[25252.3,20730.4,0],
	[26108.5,20777.7,0],
	[26335.5,21008.2,0],
	[26448.2,20985.7,0],
	[26531.3,21246.8,0],
	[26312.2,21548.8,0],
	[25729.2,21951.2,0],
	[25233.7,21664.7,0]
];
ExileLifeJobPos_yakuza =
[
	[20374.4,12068,0],
	[20659.9,11874.1,0],
	[20573.3,11444.8,0],
	[20422,11147.5,0],
	[20058.2,11149.5,0],
	[19844.6,11077.5,0],
	[19805.5,11288.4,0],
	[19748.1,11692.6,0],
	[19633.7,11875.5,0],
	[19752.2,11851.3,0],
	[20034.9,12010,0],
	[20168.4,12338.8,0]
];
ExileLifeJobPos_syndicate =
[
	[3982.89,18016.1,0],
	[3720.61,17972.9,0],
	[4415.22,17557.9,0],
	[4246.74,17323.8,0],
	[4345.26,17011.9,0],
	[4732.84,17160.5,0],
	[4498.4,17495.5,0],
	[3596.55,17995.8,0],
	[3717.83,17977.6,0],
	[3440.27,17876.9,0],
	[3517.51,17908.9,0]
];
ExileLifeGeneratorJobsInProgress =	uiNamespace getVariable ["ExileLifeGeneratorJobsInProgress",[]];
if !(ExileLifeGeneratorJobsInProgress isEqualTo []) then
{
	{
		[0,_x,2000] call ExileLifeServer_system_environment_event_lights;
		ExileLifeJobPos_generator = ExileLifeJobPos_generator - [_x];
	} forEach ExileLifeGeneratorJobsInProgress;
};
"Job System has been Initialized" call ExileLifeServer_util_log;
