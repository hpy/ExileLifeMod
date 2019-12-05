////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 5.99
//'now' is Thu Dec 05 18:57:46 2019 : 'file' last modified on Thu Dec 05 06:23:06 2019
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//Class exilelife_weapons : config.bin{
class CfgPatches
{
	class exilelife_weapons
	{
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Soft_F","exile_client","A3_Weapons_F","A3_Sounds_F","A3_Sounds_F_Arsenal","A3_Data_F","A3Data","A3_Data_F_Mark"};
		units[] = {"Weapon_ExileLife_Weapon_MK16","Weapon_ExileLife_Weapon_MK16_Black"};
		weapons[] = {"ExileLife_Weapon_Compact","ExileLife_Weapon_Glock17","ExileLife_Weapon_M9","ExileLife_Weapon_MK16","ExileLife_Weapon_MK16_Black"};
		magazines[] = {"14Rnd_9mm","15Rnd_9mm","17Rnd_9mm"};
		ammo[] = {"BulletBase"};
	};
};
class CfgAmmo
{
	class Default;
	class BulletCore;
	class BulletBase: BulletCore{};
};
class CfgMagazines
{
	class Default;
	class CA_Magazine;
	class 14Rnd_9mm: CA_Magazine
	{
		author = "ExileLife Mod Team";
		scope = 2;
		displayName = "14Rnd 9mm Luger";
		ammo = "B_9x18_Ball";
		count = 14;
		picture = "\exilelife_weapons\icons\compact\icon_compact_mag_ca.paa";
		descriptionShort = "A magazine loaded with 14 Rounds of 9mm Luger";
		mass = 6;
		initSpeed = 250;
	};
	class 15Rnd_9mm: CA_Magazine
	{
		author = "ExileLife Mod Team";
		scope = 2;
		displayName = "15Rnd 9mm Parabellum";
		ammo = "B_9x18_Ball";
		count = 15;
		picture = "\A3\weapons_f\data\ui\M_16Rnd_9x21_CA.paa";
		descriptionShort = "A magazine loaded with 15 Rounds of 9mm Parabellum";
		mass = 6;
		initSpeed = 250;
	};
	class 17Rnd_9mm: CA_Magazine
	{
		author = "ExileLife Mod Team";
		scope = 2;
		displayName = "17Rnd 9mm Parabellum";
		ammo = "B_9x18_Ball";
		count = 17;
		picture = "\exilelife_weapons\icons\glock17\icon_glock17_mag_ca.paa";
		descriptionShort = "A magazine loaded with 17 Rounds of 9mm Parabellum";
		mass = 6;
		initSpeed = 250;
	};
};
class CfgVehicles
{
	class Weapon_Base_F;
	class Weapon_ExileLife_Weapon_MK16: Weapon_Base_F
	{
		dlc = "exilelife_weapons";
		scope = 2;
		scopeCurator = 2;
		displayName = "SCAR MK-16 (Tan)";
		editorCategory = "EdCat_Weapons";
		editorSubcategory = "EdSubcat_AssaultRifles";
		vehicleClass = "WeaponsPrimary";
		class TransportWeapons
		{
			class ExileLife_Weapon_MK16
			{
				weapon = "ExileLife_Weapon_MK16";
				count = 1;
			};
		};
	};
	class Weapon_ExileLife_Weapon_MK16_Black: Weapon_Base_F
	{
		dlc = "exilelife_weapons";
		scope = 2;
		scopeCurator = 2;
		displayName = "SCAR MK-16 (Black)";
		editorCategory = "EdCat_Weapons";
		editorSubcategory = "EdSubcat_AssaultRifles";
		vehicleClass = "WeaponsPrimary";
		class TransportWeapons
		{
			class ExileLife_Weapon_MK16_Black
			{
				weapon = "ExileLife_Weapon_MK16_Black";
				count = 1;
			};
		};
	};
};
class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;
class MuzzleSlot;
class SlotInfo;
class CowsSlot;
class PointerSlot;
class UnderBarrelSlot;
class CfgWeapons
{
	class Pistol;
	class Pistol_Base_F: Pistol
	{
		class WeaponSlotsInfo;
	};
	class Rifle;
	class Rifle_Base_F: Rifle
	{
		class WeaponSlotsInfo;
		class GunParticles;
	};
	class ExileLife_Weapon_Compact: Pistol_Base_F
	{
		author = "ExileLife Mod Team";
		_generalMacro = "ExileLife_Weapon_Compact";
		scope = 2;
		picture = "\exilelife_weapons\icons\compact\icon_compact_x_ca.paa";
		model = "exilelife_weapons\pistols\Compact\ExileLife_Weapon_Compact";
		magazines[] = {"15Rnd_9mm","14Rnd_9mm"};
		displayname = "CZ 75 D PCR Compact";
		htMin = 1;
		htMax = 300;
		afMax = 0;
		mfMax = 0;
		mFact = 1;
		tBody = 100;
		bullet1[] = {"A3\Sounds_F\weapons\shells\9mm\metal_9mm_01",0.5011872,1,15};
		bullet2[] = {"A3\Sounds_F\weapons\shells\9mm\metal_9mm_02",0.5011872,1,15};
		bullet3[] = {"A3\Sounds_F\weapons\shells\9mm\metal_9mm_03",0.5011872,1,15};
		bullet4[] = {"A3\Sounds_F\weapons\shells\9mm\metal_9mm_04",0.5011872,1,15};
		bullet5[] = {"A3\Sounds_F\weapons\shells\9mm\dirt_9mm_01",0.39810717,1,15};
		bullet6[] = {"A3\Sounds_F\weapons\shells\9mm\dirt_9mm_02",0.39810717,1,15};
		bullet7[] = {"A3\Sounds_F\weapons\shells\9mm\dirt_9mm_03",0.39810717,1,15};
		bullet8[] = {"A3\Sounds_F\weapons\shells\9mm\dirt_9mm_04",0.39810717,1,15};
		bullet9[] = {"A3\Sounds_F\weapons\shells\9mm\grass_9mm_01",0.2238721,1,15};
		bullet10[] = {"A3\Sounds_F\weapons\shells\9mm\grass_9mm_02",0.2238721,1,15};
		bullet11[] = {"A3\Sounds_F\weapons\shells\9mm\grass_9mm_03",0.2238721,1,15};
		bullet12[] = {"A3\Sounds_F\weapons\shells\9mm\grass_9mm_04",0.2238721,1,15};
		soundBullet[] = {"bullet1",0.083,"bullet2",0.083,"bullet3",0.083,"bullet4",0.083,"bullet5",0.083,"bullet6",0.083,"bullet7",0.083,"bullet8",0.083,"bullet9",0.083,"bullet10",0.083,"bullet11",0.083,"bullet12",0.083};
		modes[] = {"Single"};
		initSpeed = -1.04;
		recoil = "recoil_pistol_p07";
		class Single: Mode_SemiAuto
		{
			sounds[] = {"StandardSound","SilencedSound"};
			class BaseSoundModeType
			{
				closure1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Closure_P07_01",0.22387211,1,10};
				closure2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Closure_P07_02",0.22387211,1.2,10};
				soundClosure[] = {"closure1",0.5,"closure2",0.5};
			};
			class StandardSound: BaseSoundModeType
			{
				begin1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_short_01",3.9810717,1,1200};
				begin2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_short_02",3.9810717,1,1200};
				begin3[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_short_03",3.9810717,1,1200};
				soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin1",0.34};
				class SoundTails
				{
					class TailInterior
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_interior",1.0,1,1200};
						frequency = 1;
						volume = "interior";
					};
					class TailTrees
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_trees",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*trees";
					};
					class TailForest
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_forest",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*forest";
					};
					class TailMeadows
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_meadows",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*(meadows/2 max sea/2)";
					};
					class TailHouses
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_houses",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*houses";
					};
				};
			};
			class SilencedSound: BaseSoundModeType
			{
				begin1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_short_01",0.56234133,1,400};
				begin2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_short_02",0.56234133,1,400};
				begin3[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_short_03",0.56234133,1,400};
				soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin1",0.34};
				class SoundTails
				{
					class TailInterior
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_interior",1.0,1,400};
						frequency = 1;
						volume = "interior";
					};
					class TailTrees
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_trees",1.0,1,400};
						frequency = 1;
						volume = "(1-interior/1.4)*trees";
					};
					class TailForest
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_forest",1.0,1,400};
						frequency = 1;
						volume = "(1-interior/1.4)*forest";
					};
					class TailMeadows
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_meadows",1.0,1,400};
						frequency = 1;
						volume = "(1-interior/1.4)*(meadows/2 max sea/2)";
					};
					class TailHouses
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_houses",1.0,1,400};
						frequency = 1;
						volume = "(1-interior/1.4)*houses";
					};
				};
			};
			recoil = "recoil_pistol_light";
			recoilProne = "recoil_prone_pistol_light";
			reloadTime = 0.12;
			dispersion = 0.0029;
			minRange = 5;
			minRangeProbab = 0.3;
			midRange = 25;
			midRangeProbab = 0.6;
			maxRange = 50;
			maxRangeProbab = 0.1;
			aiRateOfFire = 2;
			aiRateOfFireDistance = 25;
		};
		reloadAction = "GestureReloadPistol";
		drySound[] = {"exilelife_weapons\sounds\pistols\dry",0.39810717,1,20};
		reloadMagazineSound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\reload_P07",0.56234133,1,30};
		recoilProne = "recoil_prone_pistol_heavy";
		inertia = 0.2;
		selectionFireAnim = "muzzleFlash";
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			mass = 20;
			class CowsSlot{};
			class MuzzleSlot: MuzzleSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				iconPosition[] = {0.39,0.35};
				iconScale = 0.3;
				iconPicture = "\A3\Weapons_F\Data\UI\attachment_muzzle.paa";
				iconPinPoint = "Right";
			};
		};
	};
	class ExileLife_Weapon_Glock17: Pistol_Base_F
	{
		author = "ExileLife Mod Team";
		_generalMacro = "ExileLife_Weapon_Glock17";
		scope = 2;
		picture = "\exilelife_weapons\icons\glock17\icon_glock17_x_ca.paa";
		model = "\exilelife_weapons\pistols\glock17\ExileLife_Weapon_Glock17";
		magazines[] = {"17Rnd_9mm","15Rnd_9mm","14Rnd_9mm"};
		displayname = "Glock 17";
		htMin = 1;
		htMax = 300;
		afMax = 0;
		mfMax = 0;
		mFact = 1;
		tBody = 100;
		bullet1[] = {"A3\Sounds_F\weapons\shells\9mm\metal_9mm_01",0.5011872,1,15};
		bullet2[] = {"A3\Sounds_F\weapons\shells\9mm\metal_9mm_02",0.5011872,1,15};
		bullet3[] = {"A3\Sounds_F\weapons\shells\9mm\metal_9mm_03",0.5011872,1,15};
		bullet4[] = {"A3\Sounds_F\weapons\shells\9mm\metal_9mm_04",0.5011872,1,15};
		bullet5[] = {"A3\Sounds_F\weapons\shells\9mm\dirt_9mm_01",0.39810717,1,15};
		bullet6[] = {"A3\Sounds_F\weapons\shells\9mm\dirt_9mm_02",0.39810717,1,15};
		bullet7[] = {"A3\Sounds_F\weapons\shells\9mm\dirt_9mm_03",0.39810717,1,15};
		bullet8[] = {"A3\Sounds_F\weapons\shells\9mm\dirt_9mm_04",0.39810717,1,15};
		bullet9[] = {"A3\Sounds_F\weapons\shells\9mm\grass_9mm_01",0.2238721,1,15};
		bullet10[] = {"A3\Sounds_F\weapons\shells\9mm\grass_9mm_02",0.2238721,1,15};
		bullet11[] = {"A3\Sounds_F\weapons\shells\9mm\grass_9mm_03",0.2238721,1,15};
		bullet12[] = {"A3\Sounds_F\weapons\shells\9mm\grass_9mm_04",0.2238721,1,15};
		soundBullet[] = {"bullet1",0.083,"bullet2",0.083,"bullet3",0.083,"bullet4",0.083,"bullet5",0.083,"bullet6",0.083,"bullet7",0.083,"bullet8",0.083,"bullet9",0.083,"bullet10",0.083,"bullet11",0.083,"bullet12",0.083};
		modes[] = {"Single"};
		initSpeed = -1.04;
		recoil = "recoil_pistol_p07";
		class Single: Mode_SemiAuto
		{
			sounds[] = {"StandardSound","SilencedSound"};
			class BaseSoundModeType
			{
				closure1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Closure_P07_01",0.22387211,1,10};
				closure2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Closure_P07_02",0.22387211,1.2,10};
				soundClosure[] = {"closure1",0.5,"closure2",0.5};
			};
			class StandardSound: BaseSoundModeType
			{
				begin1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_short_01",3.9810717,1,1200};
				begin2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_short_02",3.9810717,1,1200};
				begin3[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_short_03",3.9810717,1,1200};
				soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin1",0.34};
				class SoundTails
				{
					class TailInterior
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_interior",1.0,1,1200};
						frequency = 1;
						volume = "interior";
					};
					class TailTrees
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_trees",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*trees";
					};
					class TailForest
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_forest",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*forest";
					};
					class TailMeadows
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_meadows",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*(meadows/2 max sea/2)";
					};
					class TailHouses
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_houses",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*houses";
					};
				};
			};
			class SilencedSound: BaseSoundModeType
			{
				begin1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_short_01",0.56234133,1,400};
				begin2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_short_02",0.56234133,1,400};
				begin3[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_short_03",0.56234133,1,400};
				soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin1",0.34};
				class SoundTails
				{
					class TailInterior
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_interior",1.0,1,400};
						frequency = 1;
						volume = "interior";
					};
					class TailTrees
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_trees",1.0,1,400};
						frequency = 1;
						volume = "(1-interior/1.4)*trees";
					};
					class TailForest
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_forest",1.0,1,400};
						frequency = 1;
						volume = "(1-interior/1.4)*forest";
					};
					class TailMeadows
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_meadows",1.0,1,400};
						frequency = 1;
						volume = "(1-interior/1.4)*(meadows/2 max sea/2)";
					};
					class TailHouses
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_houses",1.0,1,400};
						frequency = 1;
						volume = "(1-interior/1.4)*houses";
					};
				};
			};
			recoil = "recoil_pistol_light";
			recoilProne = "recoil_prone_pistol_light";
			reloadTime = 0.12;
			dispersion = 0.0029;
			minRange = 5;
			minRangeProbab = 0.3;
			midRange = 25;
			midRangeProbab = 0.6;
			maxRange = 50;
			maxRangeProbab = 0.1;
			aiRateOfFire = 2;
			aiRateOfFireDistance = 25;
		};
		reloadAction = "GestureReloadPistol";
		drySound[] = {"exilelife_weapons\sounds\pistols\dry",0.39810717,1,20};
		reloadMagazineSound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\reload_P07",0.56234133,1,30};
		recoilProne = "recoil_prone_pistol_heavy";
		inertia = 0.2;
		selectionFireAnim = "muzzleFlash";
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			mass = 20;
			class CowsSlot: CowsSlot
			{
				compatibleItems[] = {"optic_ACO_grn_smg","optic_Aco_smg"};
				linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
				iconPosition[] = {0.6,0.27};
				iconScale = 0.15;
			};
			class MuzzleSlot: MuzzleSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				iconPosition[] = {0.39,0.35};
				iconScale = 0.3;
				iconPicture = "\A3\Weapons_F\Data\UI\attachment_muzzle.paa";
				iconPinPoint = "Right";
			};
		};
	};
	class ExileLife_Weapon_M9: Pistol_Base_F
	{
		author = "ExileLife Mod Team";
		_generalMacro = "ExileLife_Weapon_M9";
		scope = 2;
		picture = "\exilelife_weapons\icons\m9\icon_m9_x_ca.paa";
		model = "exilelife_weapons\pistols\m9\ExileLife_Weapon_M9";
		magazines[] = {"15Rnd_9mm","14Rnd_9mm"};
		displayname = "Beretta M9";
		htMin = 1;
		htMax = 300;
		afMax = 0;
		mfMax = 0;
		mFact = 1;
		tBody = 100;
		bullet1[] = {"A3\Sounds_F\weapons\shells\9mm\metal_9mm_01",0.5011872,1,15};
		bullet2[] = {"A3\Sounds_F\weapons\shells\9mm\metal_9mm_02",0.5011872,1,15};
		bullet3[] = {"A3\Sounds_F\weapons\shells\9mm\metal_9mm_03",0.5011872,1,15};
		bullet4[] = {"A3\Sounds_F\weapons\shells\9mm\metal_9mm_04",0.5011872,1,15};
		bullet5[] = {"A3\Sounds_F\weapons\shells\9mm\dirt_9mm_01",0.39810717,1,15};
		bullet6[] = {"A3\Sounds_F\weapons\shells\9mm\dirt_9mm_02",0.39810717,1,15};
		bullet7[] = {"A3\Sounds_F\weapons\shells\9mm\dirt_9mm_03",0.39810717,1,15};
		bullet8[] = {"A3\Sounds_F\weapons\shells\9mm\dirt_9mm_04",0.39810717,1,15};
		bullet9[] = {"A3\Sounds_F\weapons\shells\9mm\grass_9mm_01",0.2238721,1,15};
		bullet10[] = {"A3\Sounds_F\weapons\shells\9mm\grass_9mm_02",0.2238721,1,15};
		bullet11[] = {"A3\Sounds_F\weapons\shells\9mm\grass_9mm_03",0.2238721,1,15};
		bullet12[] = {"A3\Sounds_F\weapons\shells\9mm\grass_9mm_04",0.2238721,1,15};
		soundBullet[] = {"bullet1",0.083,"bullet2",0.083,"bullet3",0.083,"bullet4",0.083,"bullet5",0.083,"bullet6",0.083,"bullet7",0.083,"bullet8",0.083,"bullet9",0.083,"bullet10",0.083,"bullet11",0.083,"bullet12",0.083};
		modes[] = {"Single"};
		initSpeed = -1.04;
		recoil = "recoil_pistol_p07";
		class Single: Mode_SemiAuto
		{
			sounds[] = {"StandardSound","SilencedSound"};
			class BaseSoundModeType
			{
				closure1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Closure_P07_01",0.22387211,1,10};
				closure2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Closure_P07_02",0.22387211,1.2,10};
				soundClosure[] = {"closure1",0.5,"closure2",0.5};
			};
			class StandardSound: BaseSoundModeType
			{
				begin1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_short_01",3.9810717,1,1200};
				begin2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_short_02",3.9810717,1,1200};
				begin3[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_short_03",3.9810717,1,1200};
				soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin1",0.34};
				class SoundTails
				{
					class TailInterior
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_interior",1.0,1,1200};
						frequency = 1;
						volume = "interior";
					};
					class TailTrees
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_trees",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*trees";
					};
					class TailForest
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_forest",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*forest";
					};
					class TailMeadows
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_meadows",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*(meadows/2 max sea/2)";
					};
					class TailHouses
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\P07_tail_houses",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*houses";
					};
				};
			};
			class SilencedSound: BaseSoundModeType
			{
				begin1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_short_01",0.56234133,1,400};
				begin2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_short_02",0.56234133,1,400};
				begin3[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_short_03",0.56234133,1,400};
				soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin1",0.34};
				class SoundTails
				{
					class TailInterior
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_interior",1.0,1,400};
						frequency = 1;
						volume = "interior";
					};
					class TailTrees
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_trees",1.0,1,400};
						frequency = 1;
						volume = "(1-interior/1.4)*trees";
					};
					class TailForest
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_forest",1.0,1,400};
						frequency = 1;
						volume = "(1-interior/1.4)*forest";
					};
					class TailMeadows
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_meadows",1.0,1,400};
						frequency = 1;
						volume = "(1-interior/1.4)*(meadows/2 max sea/2)";
					};
					class TailHouses
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\Silencer_P07_tail_houses",1.0,1,400};
						frequency = 1;
						volume = "(1-interior/1.4)*houses";
					};
				};
			};
			recoil = "recoil_pistol_light";
			recoilProne = "recoil_prone_pistol_light";
			reloadTime = 0.12;
			dispersion = 0.0029;
			minRange = 5;
			minRangeProbab = 0.3;
			midRange = 25;
			midRangeProbab = 0.6;
			maxRange = 50;
			maxRangeProbab = 0.1;
			aiRateOfFire = 2;
			aiRateOfFireDistance = 25;
		};
		reloadAction = "GestureReloadPistol";
		drySound[] = {"exilelife_weapons\sounds\pistols\dry",0.39810717,1,20};
		reloadMagazineSound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\P07\reload_P07",0.56234133,1,30};
		recoilProne = "recoil_prone_pistol_heavy";
		inertia = 0.2;
		selectionFireAnim = "muzzleFlash";
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			mass = 20;
			class CowsSlot{};
			class MuzzleSlot: MuzzleSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				iconPosition[] = {0.39,0.35};
				iconScale = 0.3;
				iconPicture = "\A3\Weapons_F\Data\UI\attachment_muzzle.paa";
				iconPinPoint = "Right";
			};
		};
	};
	class arifle_SPAR_01_base_F;
	class ExileLife_Weapon_MK16: arifle_SPAR_01_base_F
	{
		author = "ExileLife Mod Team";
		scope = 2;
		_generalMacro = "ExileLife_Weapon_MK16";
		displayName = "SCAR MK16 (Tan)";
		descriptionShort = "";
		picture = "\exilelife_weapons\icons\mk16\gear_mk16tan_x_ca.paa";
		model = "exilelife_weapons\rifle\mk16\ExileLife_Weapon_MK16.p3d";
		handAnim[] = {"OFP2_ManSkeleton","exilelife_weapons\rifle\mk16\anim\mk16_handanim.rtm"};
		hiddenSelections[] = {"Camo","Camo2"};
		hiddenSelectionsTextures[] = {"exilelife_weapons\rifle\mk16\data\ExileLife_Weapon_MK16_l_co.paa","exilelife_weapons\rifle\mk16\data\ExileLife_Weapon_MK16_acc_co.paa"};
		reloadAction = "HLC_GestureReloadG36V";
		class Single: Mode_SemiAuto
		{
			sounds[] = {"StandardSound","SilencedSound"};
			class BaseSoundModeType
			{
				closure1[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_closure_01",0.22387211,1,10};
				closure2[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_closure_01",0.22387211,1.2,10};
				soundClosure[] = {"closure1",0.5,"closure2",0.5};
			};
			class StandardSound: BaseSoundModeType
			{
				begin1[] = {"exilelife_weapons\sounds\rifle\mk16\mk16_short_01",3.9810717,1,1200};
				begin2[] = {"exilelife_weapons\sounds\rifle\mk16\mk16_short_01",3.9810717,1,1200};
				soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin2",0.34};
				class SoundTails
				{
					class TailInterior
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_tailinterior",1.0,1,1200};
						frequency = 1;
						volume = "interior";
					};
					class TailTrees
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_tailtrees",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*trees";
					};
					class TailForest
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_tailforest",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*forest";
					};
					class TailMeadows
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_tailmeadows",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*(meadows/2 max sea/2)";
					};
					class TailHouses
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_tailhouses",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*houses";
					};
				};
			};
			class SilencedSound: BaseSoundModeType
			{
				begin1[] = {"A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencerShot_01",0.7943282,1,400};
				begin2[] = {"A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencerShot_02",0.7943282,1,400};
				soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin1",0.34};
				class SoundTails
				{
					class TailInterior
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencertailinterior",1.0,1,1200};
						frequency = 1;
						volume = "interior";
					};
					class TailTrees
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencertailtrees",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*trees";
					};
					class TailForest
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencertailforest",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*forest";
					};
					class TailMeadows
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencertailmeadows",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*(meadows/2 max sea/2)";
					};
					class TailHouses
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencertailhouses",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*houses";
					};
				};
			};
		};
		class FullAuto: Mode_FullAuto
		{
			soundContinuous = 0;
			soundBurst = 0;
			sounds[] = {"StandardSound","SilencedSound"};
			class BaseSoundModeType
			{
				closure1[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_closure_01",0.22387211,1,10};
				closure2[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_closure_01",0.22387211,1.2,10};
				soundClosure[] = {"closure1",0.5,"closure2",0.5};
				soundSet = "";
			};
			class StandardSound: BaseSoundModeType
			{
				begin1[] = {"exilelife_weapons\sounds\rifle\mk16\mk16_short_01",3.9810717,1,1200};
				begin2[] = {"exilelife_weapons\sounds\rifle\mk16\mk16_short_01",3.9810717,1,1200};
				soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin1",0.34};
				class SoundTails
				{
					class TailInterior
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Rifles\MX\mx_tail_interior",1.5848932,1,1800};
						frequency = 1;
						volume = "interior";
					};
					class TailTrees
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Rifles\MX\mx_tail_trees",1.0,1,1800};
						frequency = 1;
						volume = "(1-interior/1.4)*trees";
					};
					class TailForest
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Rifles\MX\mx_tail_forest",1.0,1,1800};
						frequency = 1;
						volume = "(1-interior/1.4)*forest";
					};
					class TailMeadows
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Rifles\MX\mx_tail_meadows",1.0,1,1800};
						frequency = 1;
						volume = "(1-interior/1.4)*(meadows/2 max sea/2)";
					};
					class TailHouses
					{
						sound[] = {"A3\Sounds_F\arsenal\weapons\Rifles\MX\mx_tail_houses",1.0,1,1800};
						frequency = 1;
						volume = "(1-interior/1.4)*houses";
					};
				};
			};
			class SilencedSound: BaseSoundModeType
			{
				begin1[] = {"A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencerShot_01",0.7943282,1,400};
				begin2[] = {"A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencerShot_02",0.7943282,1,400};
				begin3[] = {"A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencerShot_03",0.7943282,1,400};
				soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin1",0.34};
				class SoundTails
				{
					class TailInterior
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencertailinterior",1.0,1,1200};
						frequency = 1;
						volume = "interior";
					};
					class TailTrees
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencertailtrees",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*trees";
					};
					class TailForest
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencertailforest",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*forest";
					};
					class TailMeadows
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencertailmeadows",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*(meadows/2 max sea/2)";
					};
					class TailHouses
					{
						sound[] = {"\A3\Sounds_F\arsenal\weapons\Rifles\TRG20\TRG20_silencertailhouses",1.0,1,1200};
						frequency = 1;
						volume = "(1-interior/1.4)*houses";
					};
				};
			};
		};
	};
	class ExileLife_Weapon_MK16_Black: ExileLife_Weapon_MK16
	{
		scope = 2;
		author = "ExileLife Mod Team";
		displayName = "SCAR MK16 (Black)";
		hiddenSelections[] = {"Camo","Camo2"};
		hiddenSelectionsTextures[] = {"exilelife_weapons\rifle\mk16\data\ExileLife_Weapon_MK16_l_black_co.paa","exilelife_weapons\rifle\mk16\data\ExileLife_Weapon_MK16_acc_black_co.paa"};
		picture = "\exilelife_weapons\icons\mk16\gear_mk16black_x_ca.paa";
	};
};
//};
