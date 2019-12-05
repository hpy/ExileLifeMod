////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 5.99
//'now' is Thu Dec 05 18:57:45 2019 : 'file' last modified on Thu Dec 05 06:25:14 2019
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//ndefs=5
enum {
	StabilizedInAxesNone = 0,
	StabilizedInAxisX = 1,
	StabilizedInAxisY = 2,
	StabilizedInAxesBoth = 3,
	StabilizedInAxesXYZ = 4
};

//Class exilelife_vehicles : config.bin{
class CfgPatches
{
	class exilelife_vehicles
	{
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Soft_F","exile_client","exile_assets","A3_Data_F","A3_Structures_F_Items_Vessels","A3_Structures_F_Items_Luggage","A3_Structures_F_Bootcamp_Items_Electronics","A3_Structures_F_EPB_Items_Military","A3_Soft_F_Gamma_Hatchback_01","Volha","A3_Sounds_F_Vehicles","A3_Weapons_F","Octavia","A3_Sounds_F","exilelife_assets"};
		units[] = {"ExileLife_car_Hatchback","ExileLife_car_Hatchback_Red","ExileLife_Car_Hatchback_MG","ExileLife_Car_Skoda_White","ExileLife_Car_SkodaBuggy_White","ExileLife_Car_SkodaBuggy_Green","ExileLife_Car_SkodaBuggy_Red","ExileLife_Car_SkodaBuggy_Blue","ExileLife_Car_Buggy2_White","ExileLife_Old_Moto","Exile_Car_Volha_Brown","Exile_Car_Volha_Green","Exile_Car_Volha_Red","Exile_Car_Volha_Trimmed","Exile_Car_Volha_Custom","ExileLife_Truck_Datsun_Pickup","ExileLife_Truck_Datsun_Tube","ExileLife_Truck_Datsun_Covered","ExileLife_Truck_Datsun_Open","ExileLife_Car_Octavia_Guard1","ExileLife_Car_Octavia_Guard2","ExileLife_Car_Octavia_Guard1_Upgrade","ExileLife_Car_Octavia_Guard2_Upgrade"};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgMovesBasic
{
	class DefaultDie;
	class ManActions
	{
		hatchback_driver_EP1 = "hatchback_driver_EP1";
		hatchback_cargo_01 = "hatchback_cargo_01";
		skodovka_driver_EP1 = "skodovka_driver_EP1";
		skodovka_cargo_01 = "skodovka_cargo_01";
		MG_Hatchback_Gunner1 = "MG_Hatchback_Gunner1";
		Bike_Driver = "Bike_Driver";
		Bike_Cargo = "Bike_Cargo";
		Bike_Dead = "Bike_Dead";
	};
};
class CfgMovesMaleSdr: CfgMovesBasic
{
	class States
	{
		class Crew;
		class hatchback_driver_EP1: Crew
		{
			file = "exilelife_vehicles\hatchback\data\anim\hatchback_Driver";
			interpolateTo[] = {"KIA_hatchback_driver",1};
			leftHandIKCurve[] = {1};
			rightHandIKCurve[] = {1};
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
		};
		class KIA_hatchback_driver: DefaultDie
		{
			actions = "DeadActions";
			file = "exilelife_vehicles\hatchback\data\anim\KIA_hatchback_driver";
			speed = 0.5;
			looped = 0;
			terminal = 1;
			soundEnabled = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class hatchback_cargo_01: Crew
		{
			file = "exilelife_vehicles\hatchback\data\anim\hatchback_Cargo01";
			interpolateTo[] = {"KIA_hatchback_Cargo01",0.1};
			speed = 0.3;
		};
		class KIA_hatchback_Cargo01: DefaultDie
		{
			actions = "DeadActions";
			file = "exilelife_vehicles\hatchback\data\anim\KIA_hatchback_Cargo01";
			speed = 0.5;
			looped = 0;
			terminal = 1;
			connectTo[] = {"Unconscious",0.1};
			soundEnabled = 0;
		};
		class skodovka_driver_EP1: Crew
		{
			file = "exilelife_vehicles\skoda\data\anim\Skodovka_Driver";
			interpolateTo[] = {"KIA_Skodovka_Driver",1};
			leftHandIKCurve[] = {1};
			rightHandIKCurve[] = {1};
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
		};
		class KIA_skodovka_driver: DefaultDie
		{
			actions = "DeadActions";
			file = "exilelife_vehicles\skoda\data\anim\KIA_Skodovka_Driver";
			speed = 0.5;
			looped = 0;
			terminal = 1;
			soundEnabled = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class skodovka_cargo_01: Crew
		{
			file = "exilelife_vehicles\skoda\data\anim\Skodovka_Cargo01";
			interpolateTo[] = {"KIA_Skodovka_Cargo01",0.1};
			speed = 0.3;
		};
		class KIA_skodovka_Cargo01: DefaultDie
		{
			actions = "DeadActions";
			file = "exilelife_vehicles\skoda\data\anim\KIA_Skodovka_Cargo01";
			speed = 0.5;
			looped = 0;
			terminal = 1;
			connectTo[] = {"Unconscious",0.1};
			soundEnabled = 0;
		};
		class MG_Hatchback_Gunner1: Crew
		{
			file = "\exilelife_vehicles\hatchback\pk\anim\gunner01.rtm";
			leftHandIKCurve[] = {1};
			rightHandIKCurve[] = {1};
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
		};
		class Bike_Dead: DefaultDie
		{
			actions = "DeadActions";
			file = "exilelife_vehicles\old_moto\data\anim\TT650_Driver.rtm";
			speed = 0.5;
			looped = 0;
			terminal = 1;
			soundEnabled = 0;
			connectTo[] = {"DeadState",0.1};
		};
		class Bike_Driver: Crew
		{
			file = "exilelife_vehicles\old_moto\data\anim\TT650_Driver.rtm";
			interpolateTo[] = {"Bike_Dead",1};
			leftHandIKCurve[] = {1};
			rightHandIKCurve[] = {1};
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
		};
		class Bike_Cargo: Crew
		{
			file = "exilelife_vehicles\old_moto\data\anim\TT650_Cargo.rtm";
			interpolateTo[] = {"Bike_Dead",1};
		};
	};
};
class CfgSounds
{
	sounds[] = {"guard_siren1","guard_horn1"};
	class guard_siren1
	{
		name = "guard_siren1";
		sound[] = {"exilelife_vehicles\sounds\guard\guard_siren1.ogg",6,1,300};
		titles[] = {};
	};
};
class UniformSlotInfo;
class SmallFire;
class DefaultEventHandlers;
class CfgVehicles
{
	class volha_Base;
	class LandVehicle;
	class Car: LandVehicle
	{
		class NewTurret;
	};
	class Car_F: Car
	{
		class Turrets
		{
			class MainTurret: NewTurret
			{
				class ViewOptics;
			};
		};
		class HitPoints
		{
			class HitLFWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRF2Wheel;
			class HitLBWheel;
			class HitRBWheel;
			class HitBody;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
		};
		class EventHandlers;
		class AnimationSources;
	};
	class ExileLife_Car_Baseclass: Car_F
	{
		model = "exilelife_vehicles\hatchback\ExileLife_Old_Hatchback.p3d";
		picture = "a3\soft_f_gamma\hatchback_01\data\ui\portrait_car_ca.paa";
		Icon = "a3\soft_f_gamma\hatchback_01\data\ui\map_car_ca.paa";
		displayName = "Old Hatchback";
		hiddenSelections[] = {"camo1"};
		terrainCoef = 6.0;
		turnCoef = 2.0;
		precision = 10;
		brakeDistance = 3.0;
		acceleration = 15;
		fireResistance = 3;
		armor = 30;
		cost = 2000;
		scope = 0;
		side = 3;
		faction = "CIV_F";
		vehicleclass = "ExileCars";
		skinName = "";
		exileLockSound = "exile_assets\sound\lock01.wss";
		exileUnlockSound = "Exile_psycho_Gaz_volha\sounds\gaz_door";
		maximumLoad = 2000;
		class EventHandlers: DefaultEventHandlers
		{
			init = "";
		};
		class TransportItems{};
		class TransportBackpacks{};
		class TransportMagazines{};
		class TransportWeapons{};
		transportSoldier = 3;
		fuelCapacity = 50;
		wheelCircumference = 2.148;
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		waterLeakiness = 10;
		crewCrashProtection = 0.25;
		driverLeftHandAnimName = "drivewheel";
		driverRightHandAnimName = "drivewheel";
		driverRightLegAnimName = "pedalR";
		driverLeftLegAnimName = "pedalL";
		extCameraPosition[] = {0,1,-6};
		ejectDeadDriver = 1;
		ejectDeadCargo = 1;
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		class UserActions{};
		driverAction = "driver_mid01";
		cargoAction[] = {"hatchback_cargo_01","hatchback_cargo_01","hatchback_cargo_01"};
		getInAction = "GetInLow";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		memorypointsgetincargo[] = {"pos cargo 1","pos cargo 2","pos cargo 3"};
		memorypointsgetincargodir[] = {"pos cargo dir 1","pos cargo dir 2","pos cargo dir 3"};
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 170;
		antiRollbarForceCoef = 2;
		antiRollbarForceLimit = 2;
		antiRollbarSpeedMin = 20;
		antiRollbarSpeedMax = 80;
		idleRpm = 900;
		redRpm = 6900;
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-3.231,"N",0,"D1",2.462,"D2",1.87,"D3",1.241,"D4",0.97,"D5",0.711};
			TransmissionRatios[] = {"High",4.111};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		simulation = "carx";
		dampersBumpCoef = 0.05;
		differentialType = "front_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 1.3;
		centreBias = 1.3;
		clutchStrength = 15.0;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 0.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{0.0,0.0},{0.2,0.65},{0.3,0.8},{0.4,0.95},{0.6,1.0},{0.7,0.95},{0.9,0.9},{1.0,0.5}};
		maxOmega = 650;
		enginePower = 250;
		peakTorque = 370;
		changeGearMinEffectivity[] = {0.95,0.15,0.95,0.95,0.95,0.95,0.95};
		switchTime = 0.31;
		latency = 1.0;
		class Wheels
		{
			class LF
			{
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 20;
				MOI = 3.3;
				dampingRate = 0.5;
				maxBrakeTorque = 2000;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.1;
				mMaxDroop = 0.15;
				sprungMass = 500.0;
				springStrength = 65025;
				springDamperRate = 8700;
				longitudinalStiffnessPerUnitGravity = 10000;
				latStiffX = 25;
				latStiffY = 180;
				frictionVsSlipGraph[] = {{0,1},{0.5,1},{1,1}};
			};
			class LR: LF
			{
				boneName = "wheel_1_2_damper";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 3000;
				latStiffY = 180;
				sprungMass = 500.0;
				springStrength = 30000;
				springDamperRate = 5700;
			};
			class RF: LF
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2_damper";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 3000;
				latStiffY = 180;
				sprungMass = 500.0;
				springStrength = 30000;
				springDamperRate = 5700;
			};
		};
		class RenderTargets
		{
			class CenterMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "PIP0_pos";
					pointDirection = "PIP0_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.4;
				};
			};
			class LeftMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "PIP1_pos";
					pointDirection = "PIP1_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "PIP2_pos";
					pointDirection = "PIP2_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class Back
			{
				renderTarget = "rendertarget3";
				class CameraView1
				{
					pointPosition = "PIP3_pos";
					pointDirection = "PIP3_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
		};
		attenuationEffectType = "CarAttenuation";
		soundGetIn[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1};
		soundGetOut[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1,40};
		soundDammage[] = {"","db-5",1};
		soundEngineOnInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_start","db-8",1.0};
		soundEngineOnExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_start","db-7",1.0,200};
		soundEngineOffInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_stop","db-8",1.0};
		soundEngineOffExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_stop","db-7",1.0,200};
		buildCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_01","db-3",1,200};
		buildCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_02","db-3",1,200};
		buildCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_03","db-3",1,200};
		buildCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_04","db-3",1,200};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_01","db-3",1,200};
		WoodCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_02","db-3",1,200};
		WoodCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_03","db-3",1,200};
		WoodCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_04","db-3",1,200};
		WoodCrash4[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_05","db-3",1,200};
		WoodCrash5[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_06","db-3",1,200};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_01","db-3",1,200};
		ArmorCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_02","db-3",1,200};
		ArmorCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_03","db-3",1,200};
		ArmorCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_04","db-3",1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle","db-13",1,150};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm","db-11",1,200};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm","db-9",1,240};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm","db-8",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm","db-7",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm","db-6",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm","db-5",1,420};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*camPos*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle_exhaust","db-6",1,200};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm_exhaust","db-5",1,250};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm_exhaust","db-4",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm_exhaust","db-3",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm_exhaust","db-2",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm_exhaust","db0",1,400};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm_exhaust","db2",1,450};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Idle_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle","db-15",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm","db-14",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm","db-12",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm","db-11",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm","db-10",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm","db-6",1};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle_exhaust","db-10",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm_exhaust","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm_exhaust","db-8",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm_exhaust","db-7",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm_exhaust","db-6",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm_exhaust","db-5",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm_exhaust","db-4",1};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3","db-8",1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3","db-12",1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-01, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
		};
		memoryPointTrackFLL = "TrackFLL";
		memoryPointTrackFLR = "TrackFLR";
		memoryPointTrackBLL = "TrackBLL";
		memoryPointTrackBLR = "TrackBLR";
		memoryPointTrackFRL = "TrackFRL";
		memoryPointTrackFRR = "TrackFRR";
		memoryPointTrackBRL = "TrackBRL";
		memoryPointTrackBRR = "TrackBRR";
		class Damage
		{
			tex[] = {};
			mat[] = {"exilelife_vehicles\hatchback\data\hatchback.rvmat","exilelife_vehicles\hatchback\data\hatchback.rvmat","exilelife_vehicles\hatchback\data\hatchback_destruct.rvmat","exilelife_vehicles\hatchback\data\hatchback.rvmat","exilelife_vehicles\hatchback\data\hatchback.rvmat","exilelife_vehicles\hatchback\data\hatchback_destruct.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in_damage.rvmat"};
		};
		class Reflectors
		{
			class LightCarHeadL01
			{
				color[] = {1900,1800,1700};
				ambient[] = {5,5,5};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				innerAngle = 100;
				outerAngle = 179;
				coneFadeCoef = 10;
				intensity = 1;
				useFlare = 1;
				dayLight = 1;
				flareSize = 1.0;
				class Attenuation
				{
					start = 1.0;
					constant = 0;
					linear = 0;
					quadratic = 0.25;
					hardLimitStart = 30;
					hardLimitEnd = 60;
				};
			};
			class LightCarHeadR01: LightCarHeadL01
			{
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		aggregateReflectors[] = {{"LightCarHeadL01","LightCarHeadR01"}};
		selectionBackLights = "zadni svetlo";
		selectionBrakeLights = "brzdove svetlo";
	};
	class ExileLife_Car_Hatchback: ExileLife_Car_Baseclass
	{
		model = "exilelife_vehicles\hatchback\ExileLife_Old_Hatchback.p3d";
		displayName = "Old Hatchback";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		class Turrets{};
		hiddenSelectionsTextures[] = {"exilelife_vehicles\hatchback\data\hatchback_co.paa"};
		class EventHandlers
		{
			init = "";
		};
	};
	class ExileLife_Car_Hatchback_Red: ExileLife_Car_Baseclass
	{
		model = "exilelife_vehicles\hatchback\ExileLife_Old_Hatchback.p3d";
		displayName = "Old Hatchback Red";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		class Turrets{};
		hiddenSelectionsTextures[] = {"exilelife_vehicles\hatchback\data\hatchback_anarchy_co.paa"};
		class EventHandlers
		{
			init = "";
		};
	};
	class ExileLife_Hatchback_MG_Baseclass: Car_F
	{
		model = "exilelife_vehicles\hatchback\pk\ExileLife_Old_Hatchback_MG";
		picture = "a3\soft_f_gamma\hatchback_01\data\ui\portrait_car_ca.paa";
		Icon = "a3\soft_f_gamma\hatchback_01\data\ui\map_car_ca.paa";
		displayName = "Old Hatchback";
		hiddenSelections[] = {"camo1"};
		terrainCoef = 6.0;
		turnCoef = 2.0;
		precision = 10;
		brakeDistance = 3.0;
		acceleration = 15;
		fireResistance = 3;
		armor = 30;
		cost = 2000;
		scope = 0;
		side = 3;
		faction = "CIV_F";
		vehicleclass = "ExileCars";
		skinName = "";
		exileLockSound = "exile_assets\sound\lock01.wss";
		exileUnlockSound = "Exile_psycho_Gaz_volha\sounds\gaz_door";
		maximumLoad = 2000;
		class EventHandlers: DefaultEventHandlers
		{
			init = "";
		};
		class TransportItems{};
		class TransportBackpacks{};
		class TransportMagazines{};
		class TransportWeapons{};
		transportSoldier = 3;
		fuelCapacity = 50;
		wheelCircumference = 2.148;
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		waterLeakiness = 10;
		crewCrashProtection = 0.25;
		driverLeftHandAnimName = "drivewheel";
		driverRightHandAnimName = "drivewheel";
		driverRightLegAnimName = "pedalR";
		driverLeftLegAnimName = "pedalL";
		extCameraPosition[] = {0,1,-6};
		ejectDeadDriver = 1;
		ejectDeadCargo = 1;
		class HitPoints: HitPoints
		{
			class HitLFWheel: HitLFWheel
			{
				armor = 0.125;
				material = -1;
				name = "wheel_1_1_steering";
				visual = "";
				passThrough = 0.3;
			};
			class HitLBWheel: HitLBWheel
			{
				armor = 0.125;
				passThrough = 0.0;
			};
			class HitRFWheel: HitRFWheel
			{
				armor = 0.125;
				passThrough = 0.0;
			};
			class HitRBWheel: HitRBWheel
			{
				armor = 0.125;
				passThrough = 0.0;
			};
			class HitFuel
			{
				armor = 0.5;
				material = -1;
				name = "palivo";
				visual = "";
				passThrough = 0.2;
			};
			class HitEngine
			{
				armor = 0.5;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
			class HitBody: HitBody
			{
				name = "karoserie";
				visual = "camo1";
				passThrough = 1;
			};
			class HitGlass1: HitGlass1
			{
				armor = 0.25;
			};
			class HitGlass2: HitGlass2
			{
				armor = 0.25;
			};
			class HitGlass3: HitGlass3
			{
				armor = 0.25;
			};
			class HitGlass4: HitGlass4
			{
				visual = "glass4";
				armor = 0.25;
			};
		};
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		class UserActions{};
		driverAction = "driver_mid01";
		cargoAction[] = {"hatchback_cargo_01","hatchback_cargo_01","hatchback_cargo_01"};
		getInAction = "GetInLow";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		memorypointsgetincargo[] = {"pos cargo 1","pos cargo 2","pos cargo 3"};
		memorypointsgetincargodir[] = {"pos cargo dir 1","pos cargo dir 2","pos cargo dir 3"};
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 170;
		antiRollbarForceCoef = 2;
		antiRollbarForceLimit = 2;
		antiRollbarSpeedMin = 20;
		antiRollbarSpeedMax = 80;
		idleRpm = 900;
		redRpm = 6900;
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-3.231,"N",0,"D1",2.462,"D2",1.87,"D3",1.241,"D4",0.97,"D5",0.711};
			TransmissionRatios[] = {"High",4.111};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		simulation = "carx";
		dampersBumpCoef = 0.05;
		differentialType = "front_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 1.3;
		centreBias = 1.3;
		clutchStrength = 15.0;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 0.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{0.0,0.0},{0.2,0.65},{0.3,0.8},{0.4,0.95},{0.6,1.0},{0.7,0.95},{0.9,0.9},{1.0,0.5}};
		maxOmega = 650;
		enginePower = 250;
		peakTorque = 370;
		changeGearMinEffectivity[] = {0.95,0.15,0.95,0.95,0.95,0.95,0.95};
		switchTime = 0.31;
		latency = 1.0;
		class Wheels
		{
			class LF
			{
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 20;
				MOI = 3.3;
				dampingRate = 0.5;
				maxBrakeTorque = 2000;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.1;
				mMaxDroop = 0.15;
				sprungMass = 500.0;
				springStrength = 65025;
				springDamperRate = 8700;
				longitudinalStiffnessPerUnitGravity = 10000;
				latStiffX = 25;
				latStiffY = 180;
				frictionVsSlipGraph[] = {{0,1},{0.5,1},{1,1}};
			};
			class LR: LF
			{
				boneName = "wheel_1_2_damper";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 3000;
				latStiffY = 180;
				sprungMass = 500.0;
				springStrength = 30000;
				springDamperRate = 5700;
			};
			class RF: LF
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2_damper";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 3000;
				latStiffY = 180;
				sprungMass = 500.0;
				springStrength = 30000;
				springDamperRate = 5700;
			};
		};
		class RenderTargets
		{
			class CenterMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "PIP0_pos";
					pointDirection = "PIP0_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.4;
				};
			};
			class LeftMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "PIP1_pos";
					pointDirection = "PIP1_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "PIP2_pos";
					pointDirection = "PIP2_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class Back
			{
				renderTarget = "rendertarget3";
				class CameraView1
				{
					pointPosition = "PIP3_pos";
					pointDirection = "PIP3_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
		};
		attenuationEffectType = "CarAttenuation";
		soundGetIn[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1};
		soundGetOut[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1,40};
		soundDammage[] = {"","db-5",1};
		soundEngineOnInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_start","db-8",1.0};
		soundEngineOnExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_start","db-7",1.0,200};
		soundEngineOffInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_stop","db-8",1.0};
		soundEngineOffExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_stop","db-7",1.0,200};
		buildCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_01","db-3",1,200};
		buildCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_02","db-3",1,200};
		buildCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_03","db-3",1,200};
		buildCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_04","db-3",1,200};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_01","db-3",1,200};
		WoodCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_02","db-3",1,200};
		WoodCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_03","db-3",1,200};
		WoodCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_04","db-3",1,200};
		WoodCrash4[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_05","db-3",1,200};
		WoodCrash5[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_06","db-3",1,200};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_01","db-3",1,200};
		ArmorCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_02","db-3",1,200};
		ArmorCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_03","db-3",1,200};
		ArmorCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_04","db-3",1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle","db-13",1,150};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm","db-11",1,200};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm","db-9",1,240};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm","db-8",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm","db-7",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm","db-6",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm","db-5",1,420};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*camPos*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle_exhaust","db-6",1,200};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm_exhaust","db-5",1,250};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm_exhaust","db-4",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm_exhaust","db-3",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm_exhaust","db-2",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm_exhaust","db0",1,400};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm_exhaust","db2",1,450};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Idle_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle","db-15",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm","db-14",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm","db-12",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm","db-11",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm","db-10",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm","db-6",1};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle_exhaust","db-10",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm_exhaust","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm_exhaust","db-8",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm_exhaust","db-7",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm_exhaust","db-6",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm_exhaust","db-5",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm_exhaust","db-4",1};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3","db-8",1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3","db-12",1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-01, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
		};
		memoryPointTrackFLL = "TrackFLL";
		memoryPointTrackFLR = "TrackFLR";
		memoryPointTrackBLL = "TrackBLL";
		memoryPointTrackBLR = "TrackBLR";
		memoryPointTrackFRL = "TrackFRL";
		memoryPointTrackFRR = "TrackFRR";
		memoryPointTrackBRL = "TrackBRL";
		memoryPointTrackBRR = "TrackBRR";
		class Damage
		{
			tex[] = {};
			mat[] = {"exilelife_vehicles\hatchback\data\hatchback.rvmat","exilelife_vehicles\hatchback\data\hatchback.rvmat","exilelife_vehicles\hatchback\data\hatchback_destruct.rvmat","exilelife_vehicles\hatchback\data\hatchback.rvmat","exilelife_vehicles\hatchback\data\hatchback.rvmat","exilelife_vehicles\hatchback\data\hatchback_destruct.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in_damage.rvmat"};
		};
		class Reflectors
		{
			class LightCarHeadL01
			{
				color[] = {1900,1800,1700};
				ambient[] = {5,5,5};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				innerAngle = 100;
				outerAngle = 179;
				coneFadeCoef = 10;
				intensity = 1;
				useFlare = 1;
				dayLight = 1;
				flareSize = 1.0;
				class Attenuation
				{
					start = 1.0;
					constant = 0;
					linear = 0;
					quadratic = 0.25;
					hardLimitStart = 30;
					hardLimitEnd = 60;
				};
			};
			class LightCarHeadR01: LightCarHeadL01
			{
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		aggregateReflectors[] = {{"LightCarHeadL01","LightCarHeadR01"}};
		selectionBackLights = "zadni svetlo";
		selectionBrakeLights = "brzdove svetlo";
		class AnimationSources
		{
			class ReloadAnim
			{
				source = "reload";
				weapon = "ExileLife_hatchback_PKT_veh";
			};
			class ReloadMagazine
			{
				source = "reloadmagazine";
				weapon = "ExileLife_hatchback_PKT_veh";
			};
			class Revolving
			{
				source = "revolving";
				weapon = "ExileLife_hatchback_PKT_veh";
			};
			class MainTurret
			{
				type = "rotationY";
				source = "mainTurret";
				selection = "OtocVez";
				axis = "vertrot";
				weapon = "ExileLife_hatchback_PKT_veh";
			};
			class mainGun
			{
				type = "rotationX";
				source = "mainGun";
				selection = "OtocHlaven";
				axis = "OsaHlavne";
				weapon = "ExileLife_hatchback_PKT_veh";
			};
			class HitLFWheel
			{
				source = "Hit";
				hitpoint = "HitLFWheel";
				raw = 1;
			};
			class HitRFWheel: HitLFWheel
			{
				hitpoint = "HitRFWheel";
			};
			class HitLBWheel: HitLFWheel
			{
				hitpoint = "HitLF2Wheel";
			};
			class HitRBWheel: HitLFWheel
			{
				hitpoint = "HitRF2Wheel";
			};
			class HitLF2Wheel: HitLFWheel
			{
				hitpoint = "HitLBWheel";
			};
			class HitRF2Wheel: HitLFWheel
			{
				hitpoint = "HitRBWheel";
			};
			class HitLMWheel: HitLFWheel
			{
				hitpoint = "HitLMWheel";
			};
			class HitRMWheel: HitLFWheel
			{
				hitpoint = "HitRMWheel";
			};
			class HitGlass1
			{
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			class HitGlass2: HitGlass1
			{
				hitpoint = "HitGlass2";
			};
			class HitGlass3: HitGlass1
			{
				hitpoint = "HitGlass3";
			};
			class HitGlass4: HitGlass1
			{
				hitpoint = "HitGlass4";
			};
		};
	};
	class ExileLife_Car_Hatchback_MG: ExileLife_Hatchback_MG_Baseclass
	{
		model = "exilelife_vehicles\hatchback\pk\ExileLife_Old_Hatchback_MG";
		displayName = "Old Hatchback MG";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		hiddenSelectionsTextures[] = {"exilelife_vehicles\hatchback\data\hatchback_co.paa"};
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				body = "MainTurret";
				animationSourceBody = "mainTurret";
				gun = "MainGun";
				animationSourceGun = "mainGun";
				gunAxis = "vertrot";
				turretAxis = "osaveze";
				outGunnerMayFire = 1;
				forceHideGunner = 1;
				castGunnerShadow = 1;
				viewGunnerInExternal = 1;
				gunnerOpticsModel = "\a3\weapons_f\Reticle\optics_empty";
				gunnerForceOptics = 0;
				soundServo[] = {};
				stabilizedInAxes = 0;
				weapons[] = {"ExileLife_hatchback_PKT_veh"};
				magazines[] = {"Exile_Magazine_100Rnd_762x54_PK_Green","Exile_Magazine_100Rnd_762x54_PK_Green","Exile_Magazine_100Rnd_762x54_PK_Green"};
				gunnerAction = "MG_Hatchback_Gunner1";
				gunnerInAction = "MG_Hatchback_Gunner1";
				ejectDeadGunner = 1;
				initElev = 0;
				minElev = -15;
				maxElev = 40;
				minTurn = -45;
				maxTurn = 45;
				initTurn = 0;
				startEngine = 0;
				memoryPointGun = "usti hlavne";
				maxHorizontalRotSpeed = 2;
				maxVerticalRotSpeed = 2;
				memoryPointsGetInGunner = "pos gunner";
				memoryPointsGetInGunnerDir = "pos gunner dir";
				gunnerCompartments = "Compartment2";
				memoryPointGunnerOptics = "eye";
				memoryPointGunnerOutOptics = "eye";
				gunBeg = "usti hlavne";
				gunEnd = "konec hlavne";
				gunnerLeftHandAnimName = "otochlaven";
				gunnerRightHandAnimName = "otochlaven";
				turretInfoType = "RscOptics_Offroad_01";
				discreteDistance[] = {100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500};
				discreteDistanceInitIndex = 3;
				disableSoundAttenuation = 1;
				class ViewGunner
				{
					initFov = 1;
					minFov = 0.25;
					maxFov = 1.4;
					visionMode[] = {"Normal"};
					initAngleX = 0;
					minAngleX = -30;
					maxAngleX = 30;
					initAngleY = 0;
					minAngleY = -100;
					maxAngleY = 100;
					minMoveX = 0;
					maxMoveX = 0;
					minMoveY = 0;
					maxMoveY = 0;
					minMoveZ = 0;
					maxMoveZ = 0;
				};
				class ViewOptics: ViewGunner{};
			};
		};
		class EventHandlers
		{
			init = "";
		};
	};
	class ExileLife_Car_Skoda_Baseclass: Car_F
	{
		model = "exilelife_vehicles\skoda\ExileLife_Skodovka";
		picture = "a3\soft_f_gamma\hatchback_01\data\ui\portrait_car_ca.paa";
		Icon = "a3\soft_f_gamma\hatchback_01\data\ui\map_car_ca.paa";
		displayName = "Skodovka White";
		hiddenSelections[] = {"camo1"};
		terrainCoef = 6.0;
		turnCoef = 2.0;
		precision = 10;
		brakeDistance = 3.0;
		acceleration = 15;
		fireResistance = 3;
		armor = 30;
		cost = 2000;
		scope = 0;
		side = 3;
		faction = "CIV_F";
		vehicleclass = "ExileCars";
		skinName = "";
		exileLockSound = "exile_assets\sound\lock01.wss";
		exileUnlockSound = "Exile_psycho_Gaz_volha\sounds\gaz_door";
		maximumLoad = 1800;
		class EventHandlers: DefaultEventHandlers
		{
			init = "";
		};
		class TransportItems{};
		class TransportBackpacks{};
		class TransportMagazines{};
		class TransportWeapons{};
		transportSoldier = 3;
		fuelCapacity = 40;
		wheelCircumference = 1.7;
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		waterLeakiness = 10;
		crewCrashProtection = 0.25;
		driverLeftHandAnimName = "drivewheel";
		driverRightHandAnimName = "drivewheel";
		driverRightLegAnimName = "pedalR";
		driverLeftLegAnimName = "pedalL";
		extCameraPosition[] = {0,1,-6};
		ejectDeadDriver = 1;
		ejectDeadCargo = 1;
		class Turrets{};
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		class UserActions{};
		driverAction = "driver_low01";
		cargoAction[] = {"skodovka_cargo_01","skodovka_cargo_01","skodovka_cargo_01"};
		getInAction = "GetInLow";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		memorypointsgetincargo[] = {"pos cargo 1","pos cargo 2","pos cargo 3"};
		memorypointsgetincargodir[] = {"pos cargo dir 1","pos cargo dir 2","pos cargo dir 3"};
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 155;
		antiRollbarForceCoef = 7;
		antiRollbarForceLimit = 7;
		antiRollbarSpeedMin = 20;
		antiRollbarSpeedMax = 80;
		idleRpm = 900;
		redRpm = 6900;
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-3.231,"N",0,"D1",2.462,"D2",1.87,"D3",1.241,"D4",0.97,"D5",0.711};
			TransmissionRatios[] = {"High",4.111};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		simulation = "carx";
		dampersBumpCoef = 0.05;
		differentialType = "rear_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 1.3;
		centreBias = 1.3;
		clutchStrength = 5.0;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 0.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{0.0,0.0},{0.2,0.65},{0.3,0.8},{0.4,0.95},{0.6,1.0},{0.7,0.95},{0.9,0.9},{1.0,0.5}};
		maxOmega = 600;
		enginePower = 300;
		peakTorque = 400;
		changeGearMinEffectivity[] = {0.95,0.15,0.95,0.95,0.95,0.95,0.95};
		switchTime = 0.31;
		latency = 2.0;
		class Wheels
		{
			class LF
			{
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 200;
				MOI = 3.3;
				dampingRate = 0.5;
				maxBrakeTorque = 2000;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.05;
				mMaxDroop = 0.1;
				sprungMass = 300.0;
				springStrength = 70625;
				springDamperRate = 20000;
				longitudinalStiffnessPerUnitGravity = 100000;
				latStiffX = 25;
				latStiffY = 180;
				frictionVsSlipGraph[] = {{0,1},{0.5,1},{1,1}};
			};
			class LR: LF
			{
				boneName = "wheel_1_2_damper";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 4000;
				sprungMass = 300.0;
			};
			class RF: LF
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2_damper";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 4000;
				sprungMass = 300.0;
			};
		};
		class RenderTargets
		{
			class CenterMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "PIP0_pos";
					pointDirection = "PIP0_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.4;
				};
			};
			class LeftMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "PIP1_pos";
					pointDirection = "PIP1_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "PIP2_pos";
					pointDirection = "PIP2_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class Back
			{
				renderTarget = "rendertarget3";
				class CameraView1
				{
					pointPosition = "PIP3_pos";
					pointDirection = "PIP3_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
		};
		attenuationEffectType = "CarAttenuation";
		soundGetIn[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1};
		soundGetOut[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1,40};
		soundDammage[] = {"","db-5",1};
		soundEngineOnInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_start","db-8",1.0};
		soundEngineOnExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_start","db-7",1.0,200};
		soundEngineOffInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_stop","db-8",1.0};
		soundEngineOffExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_stop","db-7",1.0,200};
		buildCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_01","db-3",1,200};
		buildCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_02","db-3",1,200};
		buildCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_03","db-3",1,200};
		buildCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_04","db-3",1,200};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_01","db-3",1,200};
		WoodCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_02","db-3",1,200};
		WoodCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_03","db-3",1,200};
		WoodCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_04","db-3",1,200};
		WoodCrash4[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_05","db-3",1,200};
		WoodCrash5[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_06","db-3",1,200};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_01","db-3",1,200};
		ArmorCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_02","db-3",1,200};
		ArmorCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_03","db-3",1,200};
		ArmorCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_04","db-3",1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle","db-13",1,150};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm","db-11",1,200};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm","db-9",1,240};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm","db-8",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm","db-7",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm","db-6",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm","db-5",1,420};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*camPos*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle_exhaust","db-6",1,200};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm_exhaust","db-5",1,250};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm_exhaust","db-4",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm_exhaust","db-3",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm_exhaust","db-2",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm_exhaust","db0",1,400};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm_exhaust","db2",1,450};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Idle_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle","db-15",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm","db-14",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm","db-12",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm","db-11",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm","db-10",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm","db-6",1};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle_exhaust","db-10",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm_exhaust","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm_exhaust","db-8",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm_exhaust","db-7",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm_exhaust","db-6",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm_exhaust","db-5",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm_exhaust","db-4",1};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3","db-8",1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3","db-12",1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-01, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
		};
		memoryPointTrackFLL = "TrackFLL";
		memoryPointTrackFLR = "TrackFLR";
		memoryPointTrackBLL = "TrackBLL";
		memoryPointTrackBLR = "TrackBLR";
		memoryPointTrackFRL = "TrackFRL";
		memoryPointTrackFRR = "TrackFRR";
		memoryPointTrackBRL = "TrackBRL";
		memoryPointTrackBRR = "TrackBRR";
		class Damage
		{
			tex[] = {};
			mat[] = {"exilelife_vehicles\skoda\data\skodovka.rvmat","exilelife_vehicles\skoda\data\skodovka.rvmat","exilelife_vehicles\skoda\data\skodovka_destruct.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in_damage.rvmat"};
		};
		class Reflectors
		{
			class LightCarHeadL01
			{
				color[] = {1900,1800,1700};
				ambient[] = {5,5,5};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				innerAngle = 100;
				outerAngle = 179;
				coneFadeCoef = 10;
				intensity = 1;
				useFlare = 1;
				dayLight = 1;
				flareSize = 1.0;
				class Attenuation
				{
					start = 1.0;
					constant = 0;
					linear = 0;
					quadratic = 0.25;
					hardLimitStart = 30;
					hardLimitEnd = 60;
				};
			};
			class LightCarHeadR01: LightCarHeadL01
			{
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		aggregateReflectors[] = {{"LightCarHeadL01","LightCarHeadR01"}};
		selectionBackLights = "zadni svetlo";
		selectionBrakeLights = "brzdove svetlo";
	};
	class ExileLife_Car_Skoda_White: ExileLife_Car_Skoda_Baseclass
	{
		model = "exilelife_vehicles\skoda\ExileLife_Skodovka";
		displayName = "Skodovka White";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		hiddenSelectionsTextures[] = {"exilelife_vehicles\skoda\data\skodovka_bila_co.paa"};
		class EventHandlers
		{
			init = "";
		};
	};
	class ExileLife_Car_SkodaBuggy_Baseclass: Car_F
	{
		model = "exilelife_vehicles\buggy\ExileLife_SkodaBuggy";
		picture = "a3\soft_f_gamma\hatchback_01\data\ui\portrait_car_ca.paa";
		Icon = "a3\soft_f_gamma\hatchback_01\data\ui\map_car_ca.paa";
		displayName = "Skodovka Buggy White";
		hiddenSelections[] = {"camo1"};
		terrainCoef = 1.0;
		turnCoef = 2.0;
		precision = 10;
		brakeDistance = 3.0;
		acceleration = 15;
		fireResistance = 3;
		armor = 30;
		cost = 2000;
		scope = 0;
		side = 3;
		faction = "CIV_F";
		vehicleclass = "ExileCars";
		skinName = "";
		exileLockSound = "exile_assets\sound\lock01.wss";
		exileUnlockSound = "Exile_psycho_Gaz_volha\sounds\gaz_door";
		maximumLoad = 2000;
		armorWheels = 0.1;
		class EventHandlers: DefaultEventHandlers
		{
			init = "";
		};
		class TransportItems{};
		class TransportBackpacks{};
		class TransportMagazines{};
		class TransportWeapons{};
		transportSoldier = 3;
		fuelCapacity = 40;
		wheelCircumference = 2.2;
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		waterLeakiness = 10;
		crewCrashProtection = 0.25;
		driverLeftHandAnimName = "drivewheel";
		driverRightHandAnimName = "drivewheel";
		driverRightLegAnimName = "pedalR";
		driverLeftLegAnimName = "pedalL";
		weapons[] = {"TruckHorn3"};
		ejectDeadDriver = 1;
		ejectDeadCargo = 1;
		class Turrets{};
		class HitPoints: HitPoints
		{
			class HitLFWheel: HitLFWheel
			{
				armor = 0.66;
				material = -1;
				name = "wheel_1_1_steering";
				visual = "";
				passThrough = 0.3;
			};
			class HitLBWheel: HitLBWheel
			{
				armor = 0.66;
				passThrough = 0.3;
			};
			class HitRFWheel: HitRFWheel
			{
				armor = 0.66;
				passThrough = 0.3;
			};
			class HitRBWheel: HitRBWheel
			{
				armor = 0.66;
				passThrough = 0.3;
			};
			class HitFuel
			{
				armor = 0.5;
				material = -1;
				name = "palivo";
				visual = "";
				passThrough = 0.2;
			};
			class HitEngine
			{
				armor = 0.5;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
			class HitBody: HitBody
			{
				name = "karoserie";
				visual = "camo1";
				passThrough = 1;
			};
			class HitGlass1: HitGlass1
			{
				armor = 0.25;
			};
			class HitGlass2: HitGlass2
			{
				armor = 0.25;
			};
			class HitGlass3: HitGlass3
			{
				armor = 0.25;
			};
			class HitGlass4: HitGlass4
			{
				visual = "glass4";
				armor = 0.25;
			};
		};
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		class AnimationSources: AnimationSources
		{
			class Back_Barrels
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
			class Back_Rack
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
			class Roof_Rack
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
		};
		class UserActions{};
		driverAction = "driver_low01";
		cargoAction[] = {"skodovka_cargo_01","skodovka_cargo_01","skodovka_cargo_01"};
		getInAction = "GetInLow";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		memorypointsgetincargo[] = {"pos cargo 1","pos cargo 2","pos cargo 3"};
		memorypointsgetincargodir[] = {"pos cargo dir 1","pos cargo dir 2","pos cargo dir 3"};
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 180;
		antiRollbarForceCoef = 7;
		antiRollbarForceLimit = 7;
		antiRollbarSpeedMin = 20;
		antiRollbarSpeedMax = 100;
		idleRpm = 900;
		redRpm = 6900;
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-3.231,"N",0,"D1",2.462,"D2",1.87,"D3",1.241,"D4",0.97,"D5",0.711};
			TransmissionRatios[] = {"High",4.111};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		simulation = "carx";
		dampersBumpCoef = 0.05;
		differentialType = "all_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 1.3;
		centreBias = 1.3;
		clutchStrength = 5.0;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 0.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{0.0,0.0},{0.2,0.7},{0.3,0.85},{0.4,0.95},{0.6,1.0},{0.7,0.95},{0.9,0.9},{1.0,0.5}};
		maxOmega = 600;
		enginePower = 400;
		peakTorque = 600;
		changeGearMinEffectivity[] = {0.95,0.15,0.95,0.95,0.95,0.95,0.95};
		switchTime = 0.31;
		latency = 2.0;
		class Wheels
		{
			class LF
			{
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 200;
				MOI = 3.3;
				dampingRate = 0.5;
				maxBrakeTorque = 2000;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.15;
				mMaxDroop = 0.15;
				sprungMass = 325.0;
				springStrength = 9500;
				springDamperRate = 1500;
				longitudinalStiffnessPerUnitGravity = 100000;
				latStiffX = 25;
				latStiffY = 180;
				frictionVsSlipGraph[] = {{0,1},{0.5,1},{1,1}};
			};
			class LR: LF
			{
				boneName = "wheel_1_2_damper";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 4000;
				sprungMass = 325.0;
			};
			class RF: LF
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2_damper";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 4000;
				sprungMass = 325.0;
			};
		};
		class RenderTargets
		{
			class CenterMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "PIP0_pos";
					pointDirection = "PIP0_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.4;
				};
			};
			class LeftMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "PIP1_pos";
					pointDirection = "PIP1_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "PIP2_pos";
					pointDirection = "PIP2_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class Back
			{
				renderTarget = "rendertarget3";
				class CameraView1
				{
					pointPosition = "PIP3_pos";
					pointDirection = "PIP3_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
		};
		attenuationEffectType = "CarAttenuation";
		soundGetIn[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1};
		soundGetOut[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1,40};
		soundDammage[] = {"","db-5",1};
		soundEngineOnInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_start","db-8",1.0};
		soundEngineOnExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_start","db-7",1.0,200};
		soundEngineOffInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_stop","db-8",1.0};
		soundEngineOffExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_stop","db-7",1.0,200};
		buildCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_01","db-3",1,200};
		buildCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_02","db-3",1,200};
		buildCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_03","db-3",1,200};
		buildCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_04","db-3",1,200};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_01","db-3",1,200};
		WoodCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_02","db-3",1,200};
		WoodCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_03","db-3",1,200};
		WoodCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_04","db-3",1,200};
		WoodCrash4[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_05","db-3",1,200};
		WoodCrash5[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_06","db-3",1,200};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_01","db-3",1,200};
		ArmorCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_02","db-3",1,200};
		ArmorCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_03","db-3",1,200};
		ArmorCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_04","db-3",1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle","db-13",1,150};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm","db-11",1,200};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm","db-9",1,240};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm","db-8",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm","db-7",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm","db-6",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm","db-5",1,420};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*camPos*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle_exhaust","db-6",1,200};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm_exhaust","db-5",1,250};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm_exhaust","db-4",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm_exhaust","db-3",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm_exhaust","db-2",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm_exhaust","db0",1,400};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm_exhaust","db2",1,450};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Idle_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle","db-15",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm","db-14",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm","db-12",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm","db-11",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm","db-10",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm","db-6",1};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle_exhaust","db-10",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm_exhaust","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm_exhaust","db-8",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm_exhaust","db-7",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm_exhaust","db-6",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm_exhaust","db-5",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm_exhaust","db-4",1};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3","db-8",1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3","db-12",1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-01, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
		};
		memoryPointTrackFLL = "TrackFLL";
		memoryPointTrackFLR = "TrackFLR";
		memoryPointTrackBLL = "TrackBLL";
		memoryPointTrackBLR = "TrackBLR";
		memoryPointTrackFRL = "TrackFRL";
		memoryPointTrackFRR = "TrackFRR";
		memoryPointTrackBRL = "TrackBRL";
		memoryPointTrackBRR = "TrackBRR";
		class Damage
		{
			tex[] = {};
			mat[] = {"exilelife_vehicles\skoda\data\skodovka.rvmat","exilelife_vehicles\skoda\data\skodovka.rvmat","exilelife_vehicles\skoda\data\skodovka_destruct.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in_damage.rvmat"};
		};
		class Reflectors
		{
			class LightCarHeadL01
			{
				color[] = {1900,1800,1700};
				ambient[] = {5,5,5};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				innerAngle = 100;
				outerAngle = 179;
				coneFadeCoef = 10;
				intensity = 1;
				useFlare = 1;
				dayLight = 1;
				flareSize = 1.0;
				class Attenuation
				{
					start = 1.0;
					constant = 0;
					linear = 0;
					quadratic = 0.25;
					hardLimitStart = 30;
					hardLimitEnd = 60;
				};
			};
			class LightCarHeadR01: LightCarHeadL01
			{
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		aggregateReflectors[] = {{"LightCarHeadL01","LightCarHeadR01"}};
		selectionBackLights = "zadni svetlo";
		selectionBrakeLights = "brzdove svetlo";
	};
	class ExileLife_Car_SkodaBuggy_White: ExileLife_Car_SkodaBuggy_Baseclass
	{
		model = "exilelife_vehicles\buggy\ExileLife_SkodaBuggy";
		displayName = "Skodovka Buggy White";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		hiddenSelectionsTextures[] = {"exilelife_vehicles\skoda\data\skodovka_bila_co.paa"};
		class EventHandlers
		{
			init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
		};
		animationList[] = {"Back_Barrels",1,"Back_Rack",1,"Roof_Rack",1};
	};
	class ExileLife_Car_SkodaBuggy_Green: ExileLife_Car_SkodaBuggy_Baseclass
	{
		model = "exilelife_vehicles\buggy\ExileLife_SkodaBuggy";
		displayName = "Skodovka Buggy Green";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		hiddenSelectionsTextures[] = {"exilelife_vehicles\skoda\data\skodovka_zelena_co.paa"};
		class EventHandlers
		{
			init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
		};
		animationList[] = {"Back_Barrels",1,"Back_Rack",1,"Roof_Rack",1};
	};
	class ExileLife_Car_SkodaBuggy_Red: ExileLife_Car_SkodaBuggy_Baseclass
	{
		model = "exilelife_vehicles\buggy\ExileLife_SkodaBuggy";
		displayName = "Skodovka Buggy Red";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		hiddenSelectionsTextures[] = {"exilelife_vehicles\skoda\data\skodovka_cervena_co.paa"};
		class EventHandlers
		{
			init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
		};
		animationList[] = {"Back_Barrels",1,"Back_Rack",1,"Roof_Rack",1};
	};
	class ExileLife_Car_SkodaBuggy_Blue: ExileLife_Car_SkodaBuggy_Baseclass
	{
		model = "exilelife_vehicles\buggy\ExileLife_SkodaBuggy";
		displayName = "Skodovka Buggy Blue";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		hiddenSelectionsTextures[] = {"exilelife_vehicles\skoda\data\skodovka_modra_co.paa"};
		class EventHandlers
		{
			init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
		};
		animationList[] = {"Back_Barrels",1,"Back_Rack",1,"Roof_Rack",1};
	};
	class ExileLife_Car_Buggy2_Baseclass: Car_F
	{
		model = "exilelife_vehicles\buggy2\ExileLife_Buggy2";
		picture = "a3\soft_f_gamma\hatchback_01\data\ui\portrait_car_ca.paa";
		Icon = "a3\soft_f_gamma\hatchback_01\data\ui\map_car_ca.paa";
		displayName = "Scrap Buggy";
		hiddenSelections[] = {"camo1"};
		terrainCoef = 1.4;
		turnCoef = 2.0;
		precision = 10;
		brakeDistance = 3.0;
		acceleration = 15;
		fireResistance = 3;
		armor = 30;
		cost = 2000;
		scope = 0;
		side = 3;
		faction = "CIV_F";
		vehicleclass = "ExileCars";
		skinName = "";
		exileLockSound = "exile_assets\sound\lock01.wss";
		exileUnlockSound = "Exile_psycho_Gaz_volha\sounds\gaz_door";
		maximumLoad = 2000;
		armorWheels = 0.1;
		class EventHandlers: DefaultEventHandlers
		{
			init = "";
		};
		class TransportItems{};
		class TransportBackpacks{};
		class TransportMagazines{};
		class TransportWeapons{};
		transportSoldier = 3;
		fuelCapacity = 40;
		wheelCircumference = 2.2;
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		waterLeakiness = 10;
		crewCrashProtection = 0.25;
		driverLeftHandAnimName = "drivewheel";
		driverRightHandAnimName = "drivewheel";
		driverRightLegAnimName = "pedalR";
		driverLeftLegAnimName = "pedalL";
		ejectDeadDriver = 1;
		ejectDeadCargo = 1;
		class Turrets{};
		class HitPoints: HitPoints
		{
			class HitLFWheel: HitLFWheel
			{
				armor = 0.66;
				material = -1;
				name = "wheel_1_1_steering";
				visual = "";
				passThrough = 0.3;
			};
			class HitLBWheel: HitLBWheel
			{
				armor = 0.66;
				passThrough = 0.3;
			};
			class HitRFWheel: HitRFWheel
			{
				armor = 0.66;
				passThrough = 0.3;
			};
			class HitRBWheel: HitRBWheel
			{
				armor = 0.66;
				passThrough = 0.3;
			};
			class HitFuel
			{
				armor = 0.5;
				material = -1;
				name = "palivo";
				visual = "";
				passThrough = 0.2;
			};
			class HitEngine
			{
				armor = 0.5;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
			class HitBody: HitBody
			{
				name = "karoserie";
				visual = "camo1";
				passThrough = 1;
			};
			class HitGlass1: HitGlass1
			{
				armor = 0.25;
			};
			class HitGlass2: HitGlass2
			{
				armor = 0.25;
			};
			class HitGlass3: HitGlass3
			{
				armor = 0.25;
			};
			class HitGlass4: HitGlass4
			{
				visual = "glass4";
				armor = 0.25;
			};
		};
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		class UserActions{};
		driverAction = "Kart_driver";
		driverCompartments = "Compartment1";
		cargoCompartments[] = {"Compartment2"};
		getInAction = "GetInLow";
		getOutAction = "GetOutLow";
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 171;
		antiRollbarForceCoef = 7;
		antiRollbarForceLimit = 7;
		antiRollbarSpeedMin = 20;
		antiRollbarSpeedMax = 100;
		idleRpm = 900;
		redRpm = 6900;
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-3.231,"N",0,"D1",2.462,"D2",1.87,"D3",1.241,"D4",0.97,"D5",0.711};
			TransmissionRatios[] = {"High",4.111};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		simulation = "carx";
		dampersBumpCoef = 0.05;
		differentialType = "front_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 1.3;
		centreBias = 1.3;
		clutchStrength = 5.0;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 0.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{0.0,0.0},{0.2,0.57},{0.3,0.75},{0.4,0.9},{0.6,1.0},{0.7,0.9},{0.9,0.8},{1.0,0.5}};
		maxOmega = 600;
		enginePower = 400;
		peakTorque = 600;
		changeGearMinEffectivity[] = {0.95,0.15,0.95,0.95,0.95,0.95,0.95};
		switchTime = 0.31;
		latency = 2.0;
		class Wheels
		{
			class LF
			{
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 200;
				MOI = 3.3;
				dampingRate = 0.5;
				maxBrakeTorque = 2000;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.15;
				mMaxDroop = 0.15;
				sprungMass = 325.0;
				springStrength = 9500;
				springDamperRate = 1500;
				longitudinalStiffnessPerUnitGravity = 100000;
				latStiffX = 25;
				latStiffY = 180;
				frictionVsSlipGraph[] = {{0,1},{0.5,1},{1,1}};
			};
			class LR: LF
			{
				boneName = "wheel_1_2_damper";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 4000;
				sprungMass = 325.0;
			};
			class RF: LF
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2_damper";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 4000;
				sprungMass = 325.0;
			};
		};
		class RenderTargets
		{
			class CenterMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "PIP0_pos";
					pointDirection = "PIP0_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.4;
				};
			};
			class LeftMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "PIP1_pos";
					pointDirection = "PIP1_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "PIP2_pos";
					pointDirection = "PIP2_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class Back
			{
				renderTarget = "rendertarget3";
				class CameraView1
				{
					pointPosition = "PIP3_pos";
					pointDirection = "PIP3_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
		};
		attenuationEffectType = "CarAttenuation";
		soundGetIn[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1};
		soundGetOut[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1,40};
		soundDammage[] = {"","db-5",1};
		soundEngineOnInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_start","db-8",1.0};
		soundEngineOnExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_start","db-7",1.0,200};
		soundEngineOffInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_stop","db-8",1.0};
		soundEngineOffExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_stop","db-7",1.0,200};
		buildCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_01","db-3",1,200};
		buildCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_02","db-3",1,200};
		buildCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_03","db-3",1,200};
		buildCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_04","db-3",1,200};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_01","db-3",1,200};
		WoodCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_02","db-3",1,200};
		WoodCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_03","db-3",1,200};
		WoodCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_04","db-3",1,200};
		WoodCrash4[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_05","db-3",1,200};
		WoodCrash5[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_06","db-3",1,200};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_01","db-3",1,200};
		ArmorCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_02","db-3",1,200};
		ArmorCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_03","db-3",1,200};
		ArmorCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_04","db-3",1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle","db-13",1,150};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm","db-11",1,200};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm","db-9",1,240};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm","db-8",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm","db-7",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm","db-6",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm","db-5",1,420};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*camPos*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle_exhaust","db-6",1,200};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm_exhaust","db-5",1,250};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm_exhaust","db-4",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm_exhaust","db-3",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm_exhaust","db-2",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm_exhaust","db0",1,400};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm_exhaust","db2",1,450};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Idle_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle","db-15",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm","db-14",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm","db-12",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm","db-11",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm","db-10",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm","db-6",1};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle_exhaust","db-10",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm_exhaust","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm_exhaust","db-8",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm_exhaust","db-7",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm_exhaust","db-6",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm_exhaust","db-5",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm_exhaust","db-4",1};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3","db-8",1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3","db-12",1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-01, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
		};
		memoryPointTrackFLL = "TrackFLL";
		memoryPointTrackFLR = "TrackFLR";
		memoryPointTrackBLL = "TrackBLL";
		memoryPointTrackBLR = "TrackBLR";
		memoryPointTrackFRL = "TrackFRL";
		memoryPointTrackFRR = "TrackFRR";
		memoryPointTrackBRL = "TrackBRL";
		memoryPointTrackBRR = "TrackBRR";
		class Damage
		{
			mat[] = {"exile_psycho_Octavia\Data\car_body1.rvmat","exile_psycho_Octavia\Data\car_body1_damage.rvmat","exile_psycho_Octavia\Data\car_body1_destruct.rvmat","exile_psycho_Octavia\Data\car_body.rvmat","exile_psycho_Octavia\Data\car_body_damage.rvmat","exile_psycho_Octavia\Data\car_body_destruct.rvmat","exile_psycho_Octavia\Data\car_chrom.rvmat","exile_psycho_Octavia\Data\car_chrom_damage.rvmat","exile_psycho_Octavia\Data\car_chrom_destruct.rvmat","exile_psycho_Octavia\Data\car_interier.rvmat","exile_psycho_Octavia\Data\car_interier_damage.rvmat","exile_psycho_Octavia\Data\car_interier_destruct.rvmat","A3\data_f\glass_veh_int.rvmat","A3\data_f\Glass_veh_damage.rvmat","A3\data_f\Glass_veh_damage.rvmat","A3\data_f\glass_veh.rvmat","A3\data_f\Glass_veh_damage.rvmat","A3\data_f\Glass_veh_damage.rvmat","a3\data_f\default.rvmat","a3\data_f\default.rvmat","a3\data_f\default_destruct.rvmat"};
			tex[] = {};
		};
		class Reflectors
		{
			class LightCarHeadL01
			{
				color[] = {1900,1800,1700};
				ambient[] = {5,5,5};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				innerAngle = 100;
				outerAngle = 179;
				coneFadeCoef = 10;
				intensity = 1;
				useFlare = 1;
				dayLight = 1;
				flareSize = 1.0;
				class Attenuation
				{
					start = 1.0;
					constant = 0;
					linear = 0;
					quadratic = 0.25;
					hardLimitStart = 30;
					hardLimitEnd = 60;
				};
			};
			class LightCarHeadR01: LightCarHeadL01
			{
				color[] = {1000,1000,1700};
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		aggregateReflectors[] = {{"LightCarHeadL01","LightCarHeadR01"}};
		selectionBackLights = "zadni svetlo";
		selectionBrakeLights = "brzdove svetlo";
	};
	class ExileLife_Car_Buggy2_White: ExileLife_Car_Buggy2_Baseclass
	{
		model = "exilelife_vehicles\buggy2\ExileLife_Buggy2";
		displayName = "Scrap Buggy";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		class CargoTurret;
		class Turrets: Turrets
		{
			class CargoTurret_01: CargoTurret
			{
				gunnerAction = "passenger_bench_1";
				memoryPointsGetInGunner = "pos gunner";
				memoryPointsGetInGunnerDir = "pos gunner dir";
				gunnerName = "Passenger";
				gunnerCompartments = "Compartment3";
				proxyIndex = 1;
				maxElev = 25;
				minElev = -25;
				maxTurn = 45;
				minTurn = -45;
				isPersonTurret = 1;
				ejectDeadGunner = 1;
			};
		};
	};
	class ExileLife_Moto_Baseclass: Car_F
	{
		model = "exilelife_vehicles\old_moto\ExileLife_Old_Moto";
		picture = "a3\soft_f_gamma\hatchback_01\data\ui\portrait_car_ca.paa";
		Icon = "a3\soft_f_gamma\hatchback_01\data\ui\map_car_ca.paa";
		displayName = "Old Moto";
		hiddenSelections[] = {"camo1"};
		terrainCoef = 2.5;
		precision = 10;
		brakeDistance = 3;
		fireResistance = 5;
		armor = 32;
		armorLights = 0.01;
		cost = 50000;
		transportMaxBackpacks = 2;
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		waterLeakiness = 10;
		crewCrashProtection = 0.25;
		scope = 0;
		side = 3;
		faction = "CIV_F";
		vehicleclass = "ExileCars";
		skinName = "";
		exileLockSound = "exile_assets\sound\lock01.wss";
		exileUnlockSound = "Exile_psycho_Gaz_volha\sounds\gaz_door";
		maximumLoad = 1800;
		class EventHandlers: DefaultEventHandlers
		{
			init = "";
		};
		class TransportItems{};
		class TransportBackpacks{};
		class TransportMagazines{};
		class TransportWeapons{};
		transportSoldier = 1;
		ejectDeadDriver = 1;
		ejectDeadCargo = 1;
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		class UserActions{};
		driverAction = "Bike_Driver";
		cargoAction[] = {"Bike_Cargo"};
		driverCompartments = "Compartment1";
		cargoCompartments[] = {"Compartment1"};
		cargoIsCoDriver[] = {1,0};
		getInAction = "GetInLow";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		driverLeftHandAnimName = "wheel_1_steering";
		driverRightHandAnimName = "wheel_1_steering";
		class CargoTurret;
		class Turrets
		{
			class CargoTurret_01: CargoTurret
			{
				gunnerAction = "passenger_flatground_2";
				memoryPointsGetInGunner = "pos gunner";
				memoryPointsGetInGunnerDir = "pos gunner dir";
				gunnerName = "Passenger (Sidecar)";
				proxyIndex = 2;
				gunnerCompartments = "Compartment1";
				LODTurnedIn = 1200;
				LODTurnedOut = 1200;
				maxElev = 45;
				minElev = -35;
				maxTurn = 10;
				minTurn = -105;
				isPersonTurret = 1;
				gunnerUsesPilotView = 0;
				ejectDeadGunner = 0;
				class dynamicViewLimits
				{
					CargoTurret_02[] = {-105,-40};
				};
			};
		};
		memorypointsgetincargo[] = {"pos cargo 1"};
		memorypointsgetincargodir[] = {"pos cargo dir 1"};
		memoryPointsGetInCoDriver[] = {"pos cargo 1"};
		memoryPointsGetInCoDriverDir[] = {"pos cargo dir 1"};
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 134;
		antiRollbarForceCoef = 2;
		antiRollbarForceLimit = 2;
		antiRollbarSpeedMin = 20;
		antiRollbarSpeedMax = 80;
		idleRpm = 900;
		redRpm = 6900;
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-3.231,"N",0,"D1",2.462,"D2",1.87,"D3",1.241,"D4",0.97,"D5",0.711};
			TransmissionRatios[] = {"High",4.111};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		simulation = "carx";
		dampersBumpCoef = 0.05;
		differentialType = "front_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 1.3;
		centreBias = 1.3;
		clutchStrength = 15.0;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 0.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{0.0,0.0},{0.2,0.65},{0.3,0.8},{0.4,0.95},{0.6,1.0},{0.7,0.95},{0.9,0.9},{1.0,0.5}};
		maxOmega = 650;
		enginePower = 360;
		peakTorque = 370;
		changeGearMinEffectivity[] = {0.95,0.15,0.95,0.95,0.95,0.95,0.95};
		switchTime = 0.31;
		latency = 1.0;
		class Wheels
		{
			class LF
			{
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 20;
				MOI = 3.3;
				dampingRate = 0.5;
				maxBrakeTorque = 2000;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.1;
				mMaxDroop = 0.15;
				sprungMass = 500.0;
				springStrength = 65025;
				springDamperRate = 8700;
				longitudinalStiffnessPerUnitGravity = 10000;
				latStiffX = 25;
				latStiffY = 180;
				frictionVsSlipGraph[] = {{0,1},{0.5,1},{1,1}};
			};
			class LR: LF
			{
				boneName = "wheel_1_2_damper";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 3000;
				latStiffY = 180;
				sprungMass = 500.0;
				springStrength = 30000;
				springDamperRate = 5700;
			};
			class RF: LF
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2_damper";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 3000;
				latStiffY = 180;
				sprungMass = 500.0;
				springStrength = 30000;
				springDamperRate = 5700;
			};
		};
		class RenderTargets
		{
			class CenterMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "PIP0_pos";
					pointDirection = "PIP0_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.4;
				};
			};
			class LeftMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "PIP1_pos";
					pointDirection = "PIP1_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "PIP2_pos";
					pointDirection = "PIP2_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class Back
			{
				renderTarget = "rendertarget3";
				class CameraView1
				{
					pointPosition = "PIP3_pos";
					pointDirection = "PIP3_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
		};
		attenuationEffectType = "CarAttenuation";
		soundGetIn[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1};
		soundGetOut[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1,40};
		soundDammage[] = {"","db-5",1};
		soundEngineOnInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_start","db-8",1.0};
		soundEngineOnExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_start","db-7",1.0,200};
		soundEngineOffInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_stop","db-8",1.0};
		soundEngineOffExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_stop","db-7",1.0,200};
		buildCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_01","db-3",1,200};
		buildCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_02","db-3",1,200};
		buildCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_03","db-3",1,200};
		buildCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_04","db-3",1,200};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_01","db-3",1,200};
		WoodCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_02","db-3",1,200};
		WoodCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_03","db-3",1,200};
		WoodCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_04","db-3",1,200};
		WoodCrash4[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_05","db-3",1,200};
		WoodCrash5[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_06","db-3",1,200};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_01","db-3",1,200};
		ArmorCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_02","db-3",1,200};
		ArmorCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_03","db-3",1,200};
		ArmorCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_04","db-3",1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle","db-13",1,150};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm","db-11",1,200};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm","db-9",1,240};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm","db-8",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm","db-7",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm","db-6",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm","db-5",1,420};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*camPos*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle_exhaust","db-6",1,200};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm_exhaust","db-5",1,250};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm_exhaust","db-4",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm_exhaust","db-3",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm_exhaust","db-2",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm_exhaust","db0",1,400};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm_exhaust","db2",1,450};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Idle_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle","db-15",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm","db-14",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm","db-12",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm","db-11",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm","db-10",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm","db-6",1};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle_exhaust","db-10",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm_exhaust","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm_exhaust","db-8",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm_exhaust","db-7",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm_exhaust","db-6",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm_exhaust","db-5",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm_exhaust","db-4",1};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3","db-8",1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3","db-12",1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-01, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
		};
		memoryPointTrackFLL = "TrackFLL";
		memoryPointTrackFLR = "TrackFLR";
		memoryPointTrackBLL = "TrackBLL";
		memoryPointTrackBLR = "TrackBLR";
		memoryPointTrackFRL = "TrackFRL";
		memoryPointTrackFRR = "TrackFRR";
		memoryPointTrackBRL = "TrackBRL";
		memoryPointTrackBRR = "TrackBRR";
		class Damage
		{
			tex[] = {};
			mat[] = {};
		};
		class Reflectors
		{
			class LightCarHeadL01
			{
				color[] = {1900,1800,1700};
				ambient[] = {5,5,5};
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
				size = 1;
				innerAngle = 100;
				outerAngle = 179;
				coneFadeCoef = 10;
				intensity = 1;
				useFlare = 1;
				dayLight = 1;
				flareSize = 1.0;
				class Attenuation
				{
					start = 1.0;
					constant = 0;
					linear = 0;
					quadratic = 0.25;
					hardLimitStart = 30;
					hardLimitEnd = 60;
				};
			};
		};
		aggregateReflectors[] = {{"LightCarHeadL01"}};
		selectionBackLights = "zadni svetlo";
		selectionBrakeLights = "brzdove svetlo";
	};
	class ExileLife_Old_Moto: ExileLife_Moto_Baseclass
	{
		model = "exilelife_vehicles\old_moto\ExileLife_Old_Moto";
		displayName = "Old Moto";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		hiddenSelectionsTextures[] = {"exilelife_vehicles\old_moto\data\old_moto_co.paa"};
		class EventHandlers
		{
			init = "";
		};
	};
	class ExileLife_Car_Volha_Abstract: volha_Base
	{
		author = "ExileLife Mod Team";
		scope = 0;
		side = 3;
		faction = "CIV_F";
		vehicleclass = "ExileCars";
		skinName = "";
		displayName = "Volha";
		exileLockSound = "exile_assets\sound\lock01.wss";
		exileUnlockSound = "Exile_psycho_Gaz_volha\sounds\gaz_door";
		maximumLoad = 2001;
		class EventHandlers: DefaultEventHandlers
		{
			init = "";
		};
		class TransportItems{};
		class TransportBackpacks{};
		class TransportMagazines{};
		class TransportWeapons{};
	};
	class Exile_Car_Volha_Brown: ExileLife_Car_Volha_Abstract
	{
		scope = 2;
		skinName = "Brown";
		hiddenselections[] = {"Camo1"};
		hiddenselectionstextures[] = {"exilelife_vehicles\volha\data\gaz_brown_co.paa"};
	};
	class Exile_Car_Volha_Green: ExileLife_Car_Volha_Abstract
	{
		scope = 2;
		skinName = "Green";
		hiddenselections[] = {"Camo1"};
		hiddenselectionstextures[] = {"exilelife_vehicles\volha\data\gaz_green_co.paa"};
	};
	class Exile_Car_Volha_Red: ExileLife_Car_Volha_Abstract
	{
		scope = 2;
		skinName = "Red";
		hiddenselections[] = {"Camo1"};
		hiddenselectionstextures[] = {"exilelife_vehicles\volha\data\gaz_red_co.paa"};
	};
	class Exile_Car_Volha_Trimmed: ExileLife_Car_Volha_Abstract
	{
		scope = 2;
		skinName = "Black Trim";
		hiddenselections[] = {"Camo1"};
		hiddenselectionstextures[] = {"exilelife_vehicles\volha\data\gaz_trim_co.paa"};
	};
	class Exile_Car_Volha_Custom: ExileLife_Car_Volha_Abstract
	{
		scope = 2;
		skinName = "Purple Custom";
		hiddenselections[] = {"Camo1"};
		hiddenselectionstextures[] = {"exilelife_vehicles\volha\data\gaz_custom_co.paa"};
	};
	class ExileLife_truck_datsun_Baseclass: Car_F
	{
		model = "exilelife_vehicles\datsun\ExileLife_Datsun_Civil";
		picture = "a3\soft_f_gamma\hatchback_01\data\ui\portrait_car_ca.paa";
		Icon = "a3\soft_f_gamma\hatchback_01\data\ui\map_car_ca.paa";
		displayName = "Datsun Civil";
		hiddenSelections[] = {"camo1"};
		terrainCoef = 3;
		turnCoef = 2.0;
		precision = 10;
		brakeDistance = 3.0;
		acceleration = 15;
		fireResistance = 3;
		armor = 30;
		cost = 2000;
		scope = 0;
		side = 3;
		faction = "CIV_F";
		vehicleclass = "ExileCars";
		skinName = "";
		exileLockSound = "exile_assets\sound\lock01.wss";
		exileUnlockSound = "Exile_psycho_Gaz_volha\sounds\gaz_door";
		maximumLoad = 2000;
		class EventHandlers: DefaultEventHandlers
		{
			init = "";
		};
		class TransportItems{};
		class TransportBackpacks{};
		class TransportMagazines{};
		class TransportWeapons{};
		transportSoldier = 3;
		fuelCapacity = 50;
		wheelCircumference = 2.148;
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		waterLeakiness = 10;
		crewCrashProtection = 0.25;
		driverLeftHandAnimName = "drivewheel";
		driverRightHandAnimName = "drivewheel";
		driverRightLegAnimName = "pedalR";
		driverLeftLegAnimName = "pedalL";
		extCameraPosition[] = {0,1,-6};
		ejectDeadDriver = 1;
		ejectDeadCargo = 1;
		class Turrets{};
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		class UserActions{};
		driverAction = "driver_low01";
		cargoAction[] = {"passenger_low01","passenger_flatground_leanleft","passenger_flatground_leanright","passenger_flatground_crosslegs","passenger_flatground_leanleft"};
		getInAction = "GetInLow";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		memorypointsgetincargo[] = {"pos codriver"};
		memorypointsgetincargodir[] = {"pos codriver dir"};
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 170;
		antiRollbarForceCoef = 4;
		antiRollbarForceLimit = 4;
		antiRollbarSpeedMin = 20;
		antiRollbarSpeedMax = 80;
		idleRpm = 400;
		redRpm = 4000;
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-4,"N",0,"D1","4.5*(0.58^0)","D2","4.5*(0.58^1)","D3","4.5*(0.58^2)","D4","4.5*(0.58^3)","D5","4.5*(0.59^4)","D6","4.5*(0.6^5)"};
			TransmissionRatios[] = {"High",7};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		simulation = "carx";
		dampersBumpCoef = 0.05;
		differentialType = "all_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 1.3;
		centreBias = 1.3;
		clutchStrength = 15.0;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 0.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{0.0,"0/500"},{0.2,"225/500"},{0.3,"350/500"},{0.4,"450/500"},{0.6,"500/500"},{0.7,"325/500"},{0.9,"175/500"},{1.0,"0/500"}};
		maxOmega = 500;
		enginePower = 150;
		peakTorque = 500;
		changeGearMinEffectivity[] = {0.95,0.15,0.95,0.95,0.95,0.95,0.95};
		switchTime = 0.31;
		latency = 1.5;
		class Wheels
		{
			class LF
			{
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 20;
				MOI = 3.3;
				dampingRate = 0.5;
				maxBrakeTorque = 2000;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.1;
				mMaxDroop = 0.15;
				sprungMass = 400;
				springStrength = 14400;
				springDamperRate = "1920*2";
				longitudinalStiffnessPerUnitGravity = 10000;
				latStiffX = 25;
				latStiffY = 180;
				frictionVsSlipGraph[] = {{0,1},{0.5,1},{1,1}};
			};
			class LR: LF
			{
				boneName = "wheel_1_2_damper";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 3000;
				latStiffY = 180;
				sprungMass = 500.0;
				springStrength = 30000;
				springDamperRate = 5700;
			};
			class RF: LF
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2_damper";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 3000;
				latStiffY = 180;
				sprungMass = 500.0;
				springStrength = 30000;
				springDamperRate = 5700;
			};
		};
		class RenderTargets
		{
			class CenterMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "PIP0_pos";
					pointDirection = "PIP0_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.4;
				};
			};
			class LeftMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "PIP1_pos";
					pointDirection = "PIP1_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "PIP2_pos";
					pointDirection = "PIP2_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class Back
			{
				renderTarget = "rendertarget3";
				class CameraView1
				{
					pointPosition = "PIP3_pos";
					pointDirection = "PIP3_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
		};
		attenuationEffectType = "CarAttenuation";
		soundGetIn[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1};
		soundGetOut[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1,40};
		soundDammage[] = {"","db-5",1};
		soundEngineOnInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_start","db-8",1.0};
		soundEngineOnExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_start","db-7",1.0,200};
		soundEngineOffInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_stop","db-8",1.0};
		soundEngineOffExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_stop","db-7",1.0,200};
		buildCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_01","db-3",1,200};
		buildCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_02","db-3",1,200};
		buildCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_03","db-3",1,200};
		buildCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_04","db-3",1,200};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_01","db-3",1,200};
		WoodCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_02","db-3",1,200};
		WoodCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_03","db-3",1,200};
		WoodCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_04","db-3",1,200};
		WoodCrash4[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_05","db-3",1,200};
		WoodCrash5[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_06","db-3",1,200};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_01","db-3",1,200};
		ArmorCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_02","db-3",1,200};
		ArmorCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_03","db-3",1,200};
		ArmorCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_04","db-3",1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle","db-13",1,150};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm","db-11",1,200};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm","db-9",1,240};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm","db-8",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm","db-7",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm","db-6",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm","db-5",1,420};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*camPos*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle_exhaust","db-6",1,200};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm_exhaust","db-5",1,250};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm_exhaust","db-4",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm_exhaust","db-3",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm_exhaust","db-2",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm_exhaust","db0",1,400};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm_exhaust","db2",1,450};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Idle_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle","db-15",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm","db-14",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm","db-12",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm","db-11",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm","db-10",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm","db-6",1};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle_exhaust","db-10",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm_exhaust","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm_exhaust","db-8",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm_exhaust","db-7",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm_exhaust","db-6",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm_exhaust","db-5",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm_exhaust","db-4",1};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3","db-8",1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3","db-12",1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-01, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
		};
		memoryPointTrackFLL = "TrackFLL";
		memoryPointTrackFLR = "TrackFLR";
		memoryPointTrackBLL = "TrackBLL";
		memoryPointTrackBLR = "TrackBLR";
		memoryPointTrackFRL = "TrackFRL";
		memoryPointTrackFRR = "TrackFRR";
		memoryPointTrackBRL = "TrackBRL";
		memoryPointTrackBRR = "TrackBRR";
		class Damage
		{
			tex[] = {};
			mat[] = {"exilelife_vehicles\datsun\data\detail\datsun_interier.rvmat","exilelife_vehicles\datsun\data\detail\datsun_interier.rvmat","exilelife_vehicles\datsun\data\detail\datsun_interier_destruct.rvmat","exilelife_vehicles\datsun\data\detail\datsun_trup.rvmat","exilelife_vehicles\datsun\data\detail\datsun_trup.rvmat","exilelife_vehicles\datsun\data\detail\datsun_trup_destruct.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in_damage.rvmat","exilelife_vehicles\hatchback\data\detail\auta_skla_in_damage.rvmat"};
		};
		class Reflectors
		{
			class LightCarHeadL01
			{
				color[] = {1900,1800,1700};
				ambient[] = {5,5,5};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				innerAngle = 100;
				outerAngle = 179;
				coneFadeCoef = 10;
				intensity = 1;
				useFlare = 1;
				dayLight = 1;
				flareSize = 1.0;
				class Attenuation
				{
					start = 1.0;
					constant = 0;
					linear = 0;
					quadratic = 0.25;
					hardLimitStart = 30;
					hardLimitEnd = 60;
				};
			};
			class LightCarHeadR01: LightCarHeadL01
			{
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		aggregateReflectors[] = {{"LightCarHeadL01","LightCarHeadR01"}};
		selectionBackLights = "zadni svetlo";
		selectionBrakeLights = "brzdove svetlo";
		class AnimationSources: AnimationSources
		{
			class Back_Trunk
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
			class Bumper
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
			class Lightrack
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
			class Spare_Tire
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
			class Top_Cover
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
		};
	};
	class ExileLife_Truck_Datsun_Pickup: ExileLife_truck_datsun_Baseclass
	{
		model = "exilelife_vehicles\datsun\ExileLife_Datsun_Civil";
		displayName = "Datsun Pickup";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		hiddenSelectionsTextures[] = {"exilelife_vehicles\datsun\data\datsun_trup1_co.paa"};
		class EventHandlers
		{
			init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
		};
		animationList[] = {"Back_Trunk",1};
	};
	class ExileLife_Truck_Datsun_Tube: ExileLife_Truck_Datsun_Pickup
	{
		model = "exilelife_vehicles\datsun\ExileLife_Datsun_Civil";
		displayName = "Datsun Pickup Tube-Top";
		hiddenSelectionsTextures[] = {"exilelife_vehicles\datsun\data\datsun_trup1_co.paa"};
		animationList[] = {"Back_Trunk",1,"Bumper",1,"Lightrack",1,"Spare_Tire",1};
	};
	class ExileLife_Truck_Datsun_Covered: ExileLife_Truck_Datsun_Pickup
	{
		model = "exilelife_vehicles\datsun\ExileLife_Datsun_Civil";
		displayName = "Datsun Pickup Covered";
		hiddenSelectionsTextures[] = {"exilelife_vehicles\datsun\data\datsun_trup4_co.paa"};
		animationList[] = {"Top_Cover",1,"Back_Trunk",1};
		class CargoTurret;
		class Turrets: Turrets
		{
			class CargoTurret_01: CargoTurret
			{
				gunnerAction = "passenger_flatground_3";
				gunnerCompartments = "Compartment2";
				memoryPointsGetInGunner = "pos gunner 3";
				memoryPointsGetInGunnerDir = "pos gunner dir 3";
				gunnerName = "Passenger (mid)";
				proxyIndex = 4;
				maxElev = 8;
				minElev = -8;
				maxTurn = 25;
				minTurn = -18;
				isPersonTurret = 1;
				ejectDeadGunner = 1;
			};
		};
	};
	class ExileLife_Truck_Datsun_Open: ExileLife_Truck_Datsun_Pickup
	{
		model = "exilelife_vehicles\datsun\ExileLife_Datsun_Civil";
		displayName = "Datsun Pickup Open";
		hiddenSelectionsTextures[] = {"exilelife_vehicles\datsun\data\datsun_trup2_co.paa"};
		animationList[] = {"Bumper",1,"Lightrack",1,"Spare_Tire",1,"Back_Trunk",0};
		class CargoTurret;
		class Turrets: Turrets
		{
			class CargoTurret_01: CargoTurret
			{
				gunnerAction = "passenger_bench_1";
				memoryPointsGetInGunner = "pos gunner";
				memoryPointsGetInGunnerDir = "pos gunner dir";
				gunnerName = "Passenger (left)";
				gunnerCompartments = "Compartment2";
				proxyIndex = 3;
				maxElev = 25;
				minElev = -25;
				maxTurn = 45;
				minTurn = -45;
				isPersonTurret = 1;
				ejectDeadGunner = 1;
			};
			class CargoTurret_02: CargoTurret
			{
				gunnerAction = "passenger_bench_1";
				memoryPointsGetInGunner = "pos gunner 2";
				memoryPointsGetInGunnerDir = "pos gunner dir 2";
				gunnerName = "Passenger (right)";
				gunnerCompartments = "Compartment2";
				proxyIndex = 2;
				maxElev = 25;
				minElev = -25;
				maxTurn = 45;
				minTurn = -45;
				isPersonTurret = 1;
				ejectDeadGunner = 1;
			};
			class CargoTurret_03: CargoTurret
			{
				gunnerAction = "passenger_flatground_3";
				gunnerCompartments = "Compartment2";
				memoryPointsGetInGunner = "pos gunner 3";
				memoryPointsGetInGunnerDir = "pos gunner dir 3";
				gunnerName = "Passenger (mid)";
				proxyIndex = 4;
				maxElev = 25;
				minElev = -10;
				maxTurn = 55;
				minTurn = -55;
				isPersonTurret = 1;
				ejectDeadGunner = 1;
			};
		};
	};
	class ExileLife_car_octavia_Baseclass: Car_F
	{
		model = "exilelife_vehicles\octavia\ExileLife_Octavia";
		picture = "a3\soft_f_gamma\hatchback_01\data\ui\portrait_car_ca.paa";
		Icon = "a3\soft_f_gamma\hatchback_01\data\ui\map_car_ca.paa";
		displayName = "Guard Transport";
		terrainCoef = 6.0;
		turnCoef = 2.0;
		precision = 10;
		brakeDistance = 3.0;
		acceleration = 15;
		fireResistance = 3;
		armor = 30;
		cost = 2000;
		scope = 0;
		side = 3;
		faction = "CIV_F";
		vehicleclass = "ExileCars";
		skinName = "";
		exileLockSound = "exile_assets\sound\lock01.wss";
		exileUnlockSound = "Exile_psycho_Gaz_volha\sounds\gaz_door";
		maximumLoad = 3000;
		weapons[] = {"SportCarHorn","ExileLife_bleep1"};
		class EventHandlers: DefaultEventHandlers
		{
			init = "";
		};
		class TransportItems{};
		class TransportBackpacks{};
		class TransportMagazines{};
		class TransportWeapons{};
		class HitPoints: HitPoints
		{
			class HitLFWheel: HitLFWheel
			{
				armor = 0.18;
				passThrough = 0.3;
			};
			class HitLF2Wheel: HitLF2Wheel
			{
				armor = 0.18;
				passThrough = 0.3;
			};
			class HitRFWheel: HitRFWheel
			{
				armor = 0.18;
				passThrough = 0.3;
			};
			class HitRF2Wheel: HitRF2Wheel
			{
				armor = 0.18;
				passThrough = 0.3;
			};
			class HitFuel
			{
				armor = 0.5;
				material = -1;
				name = "palivo";
				visual = "";
				passThrough = 0.2;
			};
			class HitEngine
			{
				armor = 0.5;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
			class HitBody: HitBody
			{
				name = "karoserie";
				visual = "camo1";
				passThrough = 1;
			};
			class HitGlass1: HitGlass1
			{
				armor = 0.1;
			};
			class HitGlass2: HitGlass2
			{
				armor = 0.05;
			};
			class HitGlass3: HitGlass3
			{
				armor = 0.05;
			};
			class HitGlass4: HitGlass4
			{
				visual = "glass4";
				armor = 0.05;
			};
			class l_red
			{
				armor = 0.05;
				material = -1;
				name = "l_red";
				visual = "l_red";
				passThrough = 1;
			};
		};
		transportSoldier = 3;
		fuelCapacity = 50;
		wheelCircumference = 2.148;
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		waterLeakiness = 10;
		crewCrashProtection = 0.25;
		driverLeftHandAnimName = "drivewheel";
		driverRightHandAnimName = "drivewheel";
		driverRightLegAnimName = "pedalR";
		driverLeftLegAnimName = "pedalL";
		extCameraPosition[] = {0,1,-6};
		ejectDeadDriver = 1;
		ejectDeadCargo = 1;
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		slingLoadCargoMemoryPoints[] = {"SlingLoadCargo1","SlingLoadCargo2","SlingLoadCargo3","SlingLoadCargo4"};
		cargoAction[] = {"passenger_low01","passenger_generic01_leanleft","passenger_generic01_foldhands"};
		getInAction = "GetInLow";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		memorypointsgetincargo[] = {"pos cargo 1","pos cargo 2","pos cargo 3"};
		memorypointsgetincargodir[] = {"pos cargo dir 1","pos cargo dir 2","pos cargo dir 3"};
		driverAction = "driver_mid01";
		canfloat = 0;
		HiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"exile_psycho_octavia\data\car_body_co.paa"};
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 200;
		antiRollbarForceCoef = 2;
		antiRollbarForceLimit = 2;
		antiRollbarSpeedMin = 20;
		antiRollbarSpeedMax = 80;
		idleRpm = 900;
		redRpm = 6900;
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-3.231,"N",0,"D1",2.462,"D2",1.87,"D3",1.241,"D4",0.97,"D5",0.711};
			TransmissionRatios[] = {"High",4.111};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		simulation = "carx";
		dampersBumpCoef = 0.05;
		differentialType = "front_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 1.3;
		centreBias = 1.3;
		clutchStrength = 15.0;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 0.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{0.0,0.0},{0.2,0.65},{0.3,0.8},{0.4,0.95},{0.6,1.0},{0.7,0.95},{0.9,0.9},{1.0,0.5}};
		maxOmega = 720;
		enginePower = 320;
		peakTorque = 500;
		changeGearMinEffectivity[] = {0.95,0.15,0.95,0.95,0.95,0.95,0.95};
		switchTime = 0.31;
		latency = 1.0;
		class Wheels
		{
			class LF
			{
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 20;
				MOI = 3.3;
				dampingRate = 0.5;
				maxBrakeTorque = 2000;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.1;
				mMaxDroop = 0.15;
				sprungMass = 500.0;
				springStrength = 65025;
				springDamperRate = 8700;
				longitudinalStiffnessPerUnitGravity = 10000;
				latStiffX = 25;
				latStiffY = 180;
				frictionVsSlipGraph[] = {{0,1},{0.5,1},{1,1}};
			};
			class LR: LF
			{
				boneName = "wheel_1_2_damper";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 3000;
				latStiffY = 180;
				sprungMass = 500.0;
				springStrength = 30000;
				springDamperRate = 5700;
			};
			class RF: LF
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2_damper";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 3000;
				latStiffY = 180;
				sprungMass = 500.0;
				springStrength = 30000;
				springDamperRate = 5700;
			};
		};
		class RenderTargets
		{
			class CenterMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "PIP0_pos";
					pointDirection = "PIP0_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.4;
				};
			};
			class LeftMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "PIP1_pos";
					pointDirection = "PIP1_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "PIP2_pos";
					pointDirection = "PIP2_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
			class Back
			{
				renderTarget = "rendertarget3";
				class CameraView1
				{
					pointPosition = "PIP3_pos";
					pointDirection = "PIP3_dir";
					renderQuality = 2;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
		};
		attenuationEffectType = "CarAttenuation";
		soundGetIn[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1};
		soundGetOut[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_door","db-5",1,40};
		soundDammage[] = {"","db-5",1};
		soundEngineOnInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_start","db-8",1.0};
		soundEngineOnExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_start","db-7",1.0,200};
		soundEngineOffInt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_stop","db-8",1.0};
		soundEngineOffExt[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_stop","db-7",1.0,200};
		buildCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_01","db-3",1,200};
		buildCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_02","db-3",1,200};
		buildCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_03","db-3",1,200};
		buildCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_building_04","db-3",1,200};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_01","db-3",1,200};
		WoodCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_02","db-3",1,200};
		WoodCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_03","db-3",1,200};
		WoodCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_04","db-3",1,200};
		WoodCrash4[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_05","db-3",1,200};
		WoodCrash5[] = {"A3\Sounds_F\vehicles\soft\noises\crash_mix_wood_06","db-3",1,200};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_01","db-3",1,200};
		ArmorCrash1[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_02","db-3",1,200};
		ArmorCrash2[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_03","db-3",1,200};
		ArmorCrash3[] = {"A3\Sounds_F\vehicles\soft\noises\crash_vehicle_04","db-3",1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle","db-13",1,150};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm","db-11",1,200};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm","db-9",1,240};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm","db-8",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm","db-7",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm","db-6",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm","db-5",1,420};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*camPos*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_idle_exhaust","db-6",1,200};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_1400rpm_exhaust","db-5",1,250};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2000rpm_exhaust","db-4",1,280};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_2600rpm_exhaust","db-3",1,320};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3200rpm_exhaust","db-2",1,360};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_3600rpm_exhaust","db0",1,400};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_ext_4000rpm_exhaust","db2",1,450};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Idle_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle","db-15",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class Engine_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm","db-14",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm","db-12",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm","db-11",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm","db-10",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm","db-6",1};
				frequency = "0.95 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class IdleThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_idle_exhaust","db-10",1};
				frequency = "0.9 + ((rpm/6900) factor[(400/6900),(1150/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(400/6900),(700/6900)])* ((rpm/6900) factor[(1100/6900),(900/6900)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_1000rpm_exhaust","db-9",1};
				frequency = "0.8 + ((rpm/6900) factor[(900/6900),(2100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(870/6900),(1100/6900)])* ((rpm/6900) factor[(2100/6900),(1300/6900)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2000rpm_exhaust","db-8",1};
				frequency = "0.8 + ((rpm/6900) factor[(1300/6900),(3100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(1250/6900),(2050/6900)])* ((rpm/6900) factor[(3100/6900),(2300/6900)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_2600rpm_exhaust","db-7",1};
				frequency = "0.8 + ((rpm/6900) factor[(2200/6900),(4100/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(2250/6900),(3050/6900)])* ((rpm/6900) factor[(4100/6900),(3300/6900)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_3200rpm_exhaust","db-6",1};
				frequency = "0.8 + ((rpm/6900) factor[(3300/6900),(4900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(3250/6900),(4050/6900)])* ((rpm/6900) factor[(4870/6900),(4200/6900)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_4000rpm_exhaust","db-5",1};
				frequency = "0.8 + ((rpm/6900) factor[(4200/6900),(6200/6900)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/6900) factor[(4150/6900),(4800/6900)])* ((rpm/6900) factor[(6150/6900),(5150/6900)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\Hatchback_01\Hatchback_01_int_5000rpm_exhaust","db-4",1};
				frequency = "0.9 + ((rpm/6900) factor[(5100/6900),(6900/6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/6900) factor[(5100/6900),(6100/6900)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2","db-6",1.0,60};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3","db-8",1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2","db-6",1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3","db-12",1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02","db-3",1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt","db-3",1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int","db-10",1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-01, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int","db-10",1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
		};
		memorypointtrackbll = "Stopa ZLL";
		memorypointtrackblr = "Stopa ZLP";
		memorypointtrackbrl = "Stopa ZPL";
		memorypointtrackbrr = "Stopa ZPP";
		memorypointtrackfll = "Stopa PLL";
		memorypointtrackflr = "Stopa PLP";
		memorypointtrackfrl = "Stopa PPL";
		memorypointtrackfrr = "Stopa PPP";
		dustFrontLeftPos = "Stopa PPL";
		dustFrontRightPos = "Stopa PLP";
		dustBackLeftPos = "Stopa ZLL";
		dustBackRightPos = "Stopa ZLP";
		class Damage
		{
			mat[] = {"exile_psycho_Octavia\Data\car_body1.rvmat","exile_psycho_Octavia\Data\car_body1_damage.rvmat","exile_psycho_Octavia\Data\car_body1_destruct.rvmat","exile_psycho_Octavia\Data\car_body.rvmat","exile_psycho_Octavia\Data\car_body_damage.rvmat","exile_psycho_Octavia\Data\car_body_destruct.rvmat","exile_psycho_Octavia\Data\car_chrom.rvmat","exile_psycho_Octavia\Data\car_chrom_damage.rvmat","exile_psycho_Octavia\Data\car_chrom_destruct.rvmat","exile_psycho_Octavia\Data\car_interier.rvmat","exile_psycho_Octavia\Data\car_interier_damage.rvmat","exile_psycho_Octavia\Data\car_interier_destruct.rvmat","A3\data_f\glass_veh_int.rvmat","A3\data_f\Glass_veh_damage.rvmat","A3\data_f\Glass_veh_damage.rvmat","A3\data_f\glass_veh.rvmat","A3\data_f\Glass_veh_damage.rvmat","A3\data_f\Glass_veh_damage.rvmat","a3\data_f\default.rvmat","a3\data_f\default.rvmat","a3\data_f\default_destruct.rvmat"};
			tex[] = {};
		};
		driverCompartments = "Compartment1";
		cargoCompartments[] = {"Compartment1","Compartment2","Compartment2"};
		class Reflectors
		{
			class LightCarHeadL01
			{
				color[] = {1900,1800,1700};
				ambient[] = {5,5,5};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				innerAngle = 100;
				outerAngle = 179;
				coneFadeCoef = 10;
				intensity = 1;
				useFlare = 1;
				dayLight = 1;
				flareSize = 1.0;
				class Attenuation
				{
					start = 1.0;
					constant = 0;
					linear = 0;
					quadratic = 0.25;
					hardLimitStart = 30;
					hardLimitEnd = 60;
				};
			};
			class LightCarHeadR01: LightCarHeadL01
			{
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		aggregateReflectors[] = {{"LightCarHeadL01","LightCarHeadR01"}};
		selectionBackLights = "zadni svetlo";
		selectionBrakeLights = "brzdove svetlo";
		class AnimationSources: AnimationSources
		{
			class Lightbar
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
			class Lightbar_Default
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
			class Lightbar_Upgraded
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
			class Lightbar_Default_Lights
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
			class Lightbar_upgraded_Lights
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
			class Siren
			{
				source = "user";
				animPeriod = 0.001;
				initPhase = 0;
			};
		};
	};
	class ExileLife_Car_Octavia_Guard1: ExileLife_Car_Octavia_Baseclass
	{
		model = "exilelife_vehicles\octavia\ExileLife_Octavia";
		displayName = "White Octavia";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		class Turrets{};
		HiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"exile_psycho_Octavia\Data\car_body_co.paa"};
		class EventHandlers
		{
			init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
		};
		animationList[] = {"Lightbar_Default",1};
		class UserActions
		{
			class SirenOn
			{
				displayName = "Siren On";
				position = "drivewheel";
				radius = 1;
				onlyForplayer = 1;
				condition = "driver this == player && this animationPhase 'Siren' == 0";
				statement = "this animate ['Siren', 1]; [this,true] spawn ExilelifeClient_object_vehicle_toggle_Siren;";
			};
			class SirenOff
			{
				displayName = "Siren Off";
				position = "drivewheel";
				radius = 1;
				onlyForplayer = 1;
				condition = "driver this == player && this animationPhase 'Siren' == 1";
				statement = "this animate ['Siren', 0]; [this,false] spawn ExilelifeClient_object_vehicle_toggle_Siren;";
			};
			class Lightbaron
			{
				displayName = "Lightbar On";
				position = "drivewheel";
				radius = 1;
				onlyForplayer = 1;
				condition = "driver this == player && this animationPhase 'Lightbar' == 0";
				statement = "this animate ['Lightbar', 1]; this animate ['Lightbar_Default_Lights', 1]; [this,true] call ExilelifeClient_object_vehicle_toggle_Lightbar;";
			};
			class Lightbaroff
			{
				displayName = "Lightbar Off";
				position = "drivewheel";
				radius = 1;
				onlyForplayer = 1;
				condition = "driver this == player && this animationPhase 'Lightbar' == 1";
				statement = "this animate ['Lightbar', 0]; this animate ['Lightbar_Default_Lights', 0]; [this,false] call ExilelifeClient_object_vehicle_toggle_Lightbar;";
			};
		};
	};
	class ExileLife_Car_Octavia_Guard2: ExileLife_Car_Octavia_Guard1
	{
		model = "exilelife_vehicles\octavia\ExileLife_Octavia";
		displayName = "Black Octavia";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		class Turrets{};
		HiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"exile_psycho_octavia\Data\car_body_bl_co.paa"};
		class EventHandlers
		{
			init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
		};
		animationList[] = {"Lightbar_Default",1};
	};
	class ExileLife_Car_Octavia_Guard1_Upgrade: ExileLife_Car_Octavia_Baseclass
	{
		model = "exilelife_vehicles\octavia\ExileLife_Octavia";
		displayName = "White Octavia Upgraded";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		class Turrets{};
		HiddenSelections[] = {"camo"};
		maxSpeed = 240;
		terrainCoef = 3.5;
		armor = 40;
		maximumLoad = 4200;
		hiddenSelectionsTextures[] = {"exile_psycho_Octavia\Data\car_body_co.paa"};
		class EventHandlers
		{
			init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
		};
		animationList[] = {"Lightbar_Upgraded",1};
		class UserActions
		{
			class SirenOn
			{
				displayName = "Siren On";
				position = "drivewheel";
				radius = 1;
				onlyForplayer = 1;
				condition = "driver this == player && this animationPhase 'Siren' == 0";
				statement = "this animate ['Siren', 1]; [this,true] spawn ExilelifeClient_object_vehicle_toggle_Siren;";
			};
			class SirenOff
			{
				displayName = "Siren Off";
				position = "drivewheel";
				radius = 1;
				onlyForplayer = 1;
				condition = "driver this == player && this animationPhase 'Siren' == 1";
				statement = "this animate ['Siren', 0]; [this,false] spawn ExilelifeClient_object_vehicle_toggle_Siren;";
			};
			class Lightbaron
			{
				displayName = "Lightbar On";
				position = "drivewheel";
				radius = 1;
				onlyForplayer = 1;
				condition = "driver this == player && this animationPhase 'Lightbar' == 0";
				statement = "this animate ['Lightbar', 1]; this animate ['Lightbar_Upgraded_Lights', 1]; [this,true] call ExilelifeClient_object_vehicle_toggle_Lightbar;";
			};
			class Lightbaroff
			{
				displayName = "Lightbar Off";
				position = "drivewheel";
				radius = 1;
				onlyForplayer = 1;
				condition = "driver this == player && this animationPhase 'Lightbar' == 1";
				statement = "this animate ['Lightbar', 0]; this animate ['Lightbar_Upgraded_Lights', 0]; [this,false] call ExilelifeClient_object_vehicle_toggle_Lightbar;";
			};
		};
	};
	class ExileLife_Car_Octavia_Guard2_Upgrade: ExileLife_Car_Octavia_Guard1_Upgrade
	{
		model = "exilelife_vehicles\octavia\ExileLife_Octavia";
		displayName = "Black Octavia Upgraded";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		class Turrets{};
		HiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"exile_psycho_octavia\Data\car_body_bl_co.paa"};
		class EventHandlers
		{
			init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
		};
		animationList[] = {"Lightbar_Upgraded",1};
	};
	class Land_LampAirport_off_F;
	class ExileLife_LightObject: Land_LampAirport_off_F
	{
		_generalMacro = "ExileLife_LightObject";
		scope = 1;
		scopeCurator = 0;
		displayName = "Lights";
		model = "\exilelife_vehicles\octavia\light\ExileLife_LightObject.p3d";
		hiddenSelections[] = {""};
		hiddenSelectionsTextures[] = {""};
		class MarkerLights
		{
			class Light_red
			{
				color[] = {1,0.0,0.0,1};
				ambient[] = {1,0.0,1};
				intensity = 800;
				name = "left";
				blinking = 1;
				blinkingPattern[] = {0.14,0.2};
				blinkingStartsOn = 1;
				blinkingPatternGuarantee = 1;
				useFlare = 1;
				flareSize = 0.0001;
				flareMaxDistance = 1000;
				activeLight = 1;
				dayLight = 0;
				drawLight = 0;
				class Attenuation
				{
					start = 0;
					constant = 2;
					linear = 10;
					quadratic = 20;
					hardLimitStart = 5;
					hardLimitEnd = 6;
				};
			};
			class Light_blue: Light_red
			{
				color[] = {0.12,0.11,0.9,1};
				ambient[] = {0.12,0.11,0.9};
				intensity = 800;
				name = "right";
				blinking = 1;
				blinkingPattern[] = {0.12,0.16};
			};
		};
	};
};
class WeaponFireGun;
class WeaponCloudsGun;
class WeaponFireMGun;
class WeaponCloudsMGun;
class RCWSOptics;
class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;
class CfgWeapons
{
	class Default;
	class MgunCore;
	class PistolCore;
	class RifleCore;
	class MGun: MgunCore{};
	class CarHorn;
	class ExileLife_bleep1: CarHorn
	{
		displayname = "Warning Siren";
		reloadTime = 4;
		drySound[] = {"exilelife_vehicles\sounds\guard\guard_bleep1.ogg",5,1,200};
	};
	class veh_MGun: MgunCore{};
	class Rifle_Base_F;
	class ExileLife_hatchback_PKT_veh: veh_MGun
	{
		class GunClouds{};
		bullet1[] = {"A3\Sounds_F\weapons\bullets\7_62-dirt1",1,1,15};
		bullet2[] = {"A3\Sounds_F\weapons\bullets\7_62-dirt2",1,1,15};
		bullet3[] = {"A3\Sounds_F\weapons\bullets\7_62-dirt3",1,1,15};
		bullet4[] = {"A3\Sounds_F\weapons\bullets\7_62-dirt4",1,1,15};
		bullet5[] = {"A3\Sounds_F\weapons\bullets\7_62-hard1",1,1,15};
		bullet6[] = {"A3\Sounds_F\weapons\bullets\7_62-hard2",1,1,15};
		bullet7[] = {"A3\Sounds_F\weapons\bullets\7_62-hard3",1,1,15};
		bullet8[] = {"A3\Sounds_F\weapons\bullets\7_62-hard4",1,1,15};
		bullet9[] = {"A3\Sounds_F\weapons\bullets\7_62-metal1",1,1,15};
		bullet10[] = {"A3\Sounds_F\weapons\bullets\7_62-metal2",1,1,15};
		bullet11[] = {"A3\Sounds_F\weapons\bullets\7_62-metal3",1,1,15};
		bullet12[] = {"A3\Sounds_F\weapons\bullets\7_62-metal4",1,1,15};
		soundBullet[] = {"bullet1",0.083,"bullet2",0.083,"bullet3",0.083,"bullet4",0.083,"bullet5",0.083,"bullet6",0.083,"bullet7",0.083,"bullet8",0.083,"bullet9",0.083,"bullet10",0.083,"bullet11",0.083,"bullet12",0.083};
		scope = 1;
		displayName = "PKT_Veh";
		cursor = "EmptyCursor";
		cursorAim = "mg";
		magazines[] = {"Exile_Magazine_100Rnd_762x54_PK_Green","100Rnd_762x54_PK_Tracer_Yellow","100Rnd_762x54_PK_Tracer_White","100Rnd_762x54_PK_Tracer_Green","100Rnd_762x54_PK_Tracer_Red"};
		canLock = "LockNo";
		modes[] = {"manual","close","short","medium","far"};
		ballisticsComputer = 2;
		magazineReloadTime = 7;
		reloadMagazineSound[] = {"\exilelife_vehicles\sounds\PKM\reload-belt-1",1,1,35};
		class GunParticles
		{
			class effect1
			{
				positionName = "usti hlavne";
				directionName = "konec hlavne";
				effectName = "MachineGunCloud";
			};
		};
		class Manual: MGun
		{
			displayName = "PKT_Veh";
			sounds[] = {"StandardSound1","StandardSound2","StandardSound3"};
			class StandardSound1
			{
				begin1[] = {"\exilelife_vehicles\sounds\PKM\PKM_single1",1.12202,1,1100};
				soundBegin[] = {"begin1",0.33};
				weaponSoundEffect = "DefaultRifle";
			};
			class StandardSound2
			{
				begin1[] = {"\exilelife_vehicles\sounds\PKM\PKM_single2",1.12202,1,1100};
				soundBegin[] = {"begin1",0.33};
				weaponSoundEffect = "DefaultRifle";
			};
			class StandardSound3
			{
				begin1[] = {"\exilelife_vehicles\sounds\PKM\PKM_single3",1.12202,1,1100};
				soundBegin[] = {"begin1",0.33};
				weaponSoundEffect = "DefaultRifle";
			};
			reloadTime = 0.075;
			dispersion = 0.00125;
			showToPlayer = 1;
			soundContinuous = 0;
			burst = 1;
			aiRateOfFire = 0.5;
			aiRateOfFireDistance = 50;
			minRange = 1;
			minRangeProbab = 0.01;
			midRange = 2;
			midRangeProbab = 0.01;
			maxRange = 3;
			maxRangeProbab = 0.01;
		};
		class close: Manual
		{
			showToPlayer = 0;
			soundBurst = 0;
			burst = 15;
			aiRateOfFire = 1;
			aiRateOfFireDistance = 50;
			minRange = 0;
			minRangeProbab = 0.05;
			midRange = 20;
			midRangeProbab = 0.7;
			maxRange = 50;
			maxRangeProbab = 0.1;
		};
		class short: close
		{
			burst = 10;
			aiRateOfFire = 2;
			aiRateOfFireDistance = 300;
			minRange = 50;
			minRangeProbab = 0.05;
			midRange = 150;
			midRangeProbab = 0.7;
			maxRange = 300;
			maxRangeProbab = 0.1;
		};
		class medium: Manual
		{
			showToPlayer = 0;
			soundBurst = 0;
			burst = 7;
			aiRateOfFire = 4;
			aiRateOfFireDistance = 600;
			minRange = 200;
			minRangeProbab = 0.05;
			midRange = 400;
			midRangeProbab = 0.7;
			maxRange = 600;
			maxRangeProbab = 0.1;
		};
		class far: medium
		{
			burst = 4;
			aiRateOfFire = 5;
			aiRateOfFireDistance = 1000;
			minRange = 400;
			minRangeProbab = 0.05;
			midRange = 750;
			midRangeProbab = 0.4;
			maxRange = 1000;
			maxRangeProbab = 0.01;
		};
	};
};
//};
