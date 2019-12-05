////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 5.99
//'now' is Tue Jan 17 00:50:41 2017 : 'file' last modified on Tue Jan 17 00:43:58 2017
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//Class asdg_jointrails : config.bin{
class CfgPatches
{
	class asdg_jointrails
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.64;
		requiredAddons[] = {"A3_Weapons_F","A3_Weapons_F_Mark","A3_Weapons_F_Exp"};
		author[] = {"Robalo"};
	};
	class asdg_jointmuzzles
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.64;
		requiredAddons[] = {"A3_Weapons_F","A3_Weapons_F_Mark","A3_Weapons_F_Exp"};
		author[] = {"Robalo"};
	};
};
class asdg_SlotInfo
{
	access = 0;
	scope = 0;
	linkProxy = "defaultProxy";
	iconPosition[] = {0.0,0.0};
	iconScale = 0.0;
	iconPicture = "";
	iconPinpoint = "Center";
};
class asdg_OpticRail: asdg_SlotInfo
{
	linkProxy = "\a3\data_f\proxies\weapon_slots\TOP";
	displayName = "$STR_A3_CowsSlot0";
	iconPicture = "\a3\weapons_f\Data\ui\attachment_top";
	iconPinpoint = "Bottom";
};
class asdg_MuzzleSlot: asdg_SlotInfo
{
	linkProxy = "\a3\data_f\proxies\weapon_slots\MUZZLE";
	displayName = "$str_a3_cfgweapons_abr_base_f_weaponslotsinfo_muzzleslot0";
	iconPicture = "\a3\weapons_f\Data\ui\attachment_muzzle";
};
class asdg_FrontSideRail: asdg_SlotInfo
{
	linkProxy = "\a3\data_f\proxies\weapon_slots\SIDE";
	displayName = "$STR_A3_PointerSlot0";
	iconPicture = "\a3\weapons_f\Data\ui\attachment_side";
	class compatibleItems
	{
		acc_flashlight = 1;
		acc_pointer_IR = 1;
	};
};
class asdg_UnderSlot: asdg_SlotInfo
{
	linkProxy = "\a3\data_f_mark\Proxies\Weapon_Slots\UNDERBARREL";
	iconPicture = "\a3\weapons_f_mark\Data\UI\attachment_under";
	iconPinpoint = "Bottom";
	class compatibleItems
	{
		bipod_01_F_snd = 1;
		bipod_01_F_blk = 1;
		bipod_01_F_mtp = 1;
		bipod_02_F_blk = 1;
		bipod_02_F_tan = 1;
		bipod_02_F_hex = 1;
		bipod_03_F_blk = 1;
		bipod_03_F_oli = 1;
		bipod_01_F_khk = 1;
	};
};
class asdg_OpticRail1913: asdg_OpticRail
{
	class compatibleItems
	{
		optic_Nightstalker = 1;
		optic_tws = 1;
		optic_tws_mg = 1;
		optic_NVS = 1;
		optic_SOS = 1;
		optic_SOS_khk_F = 1;
		optic_MRCO = 1;
		optic_Arco = 1;
		optic_Arco_ghex_F = 1;
		optic_Arco_blk_F = 1;
		optic_aco = 1;
		optic_ACO_grn = 1;
		optic_aco_smg = 1;
		optic_ACO_grn_smg = 1;
		optic_hamr = 1;
		optic_Hamr_khk_F = 1;
		optic_Holosight = 1;
		optic_Holosight_smg = 1;
		optic_Holosight_blk_F = 1;
		optic_Holosight_khk_F = 1;
		optic_Holosight_smg_blk_F = 1;
		optic_DMS = 1;
		optic_DMS_ghex_F = 1;
		optic_LRPS = 1;
		optic_LRPS_ghex_F = 1;
		optic_LRPS_tna_F = 1;
		optic_AMS = 1;
		optic_AMS_khk = 1;
		optic_AMS_snd = 1;
		optic_KHS_blk = 1;
		optic_KHS_hex = 1;
		optic_KHS_old = 1;
		optic_KHS_tan = 1;
		optic_ERCO_blk_F = 1;
		optic_ERCO_khk_F = 1;
		optic_ERCO_snd_F = 1;
	};
};
class asdg_OpticRail1913_short: asdg_OpticRail1913
{
	class compatibleItems: compatibleItems{};
};
class asdg_OpticRail1913_short_MG: asdg_OpticRail1913_short
{
	class compatibleItems: compatibleItems{};
};
class asdg_OpticRail1913_long: asdg_OpticRail1913
{
	class compatibleItems: compatibleItems{};
};
class asdg_OpticSideMount: asdg_OpticRail
{
	class compatibleItems{};
};
class asdg_MuzzleSlot_762: asdg_MuzzleSlot
{
	class compatibleItems
	{
		muzzle_snds_B = 1;
		muzzle_snds_B_khk_F = 1;
		muzzle_snds_B_snd_F = 1;
	};
};
class asdg_MuzzleSlot_65: asdg_MuzzleSlot_762
{
	class compatibleItems: compatibleItems
	{
		muzzle_snds_h = 1;
		muzzle_snds_h_khk_F = 1;
		muzzle_snds_h_snd_F = 1;
		muzzle_snds_65_TI_blk_F = 1;
		muzzle_snds_65_TI_hex_F = 1;
		muzzle_snds_65_TI_ghex_F = 1;
	};
};
class asdg_MuzzleSlot_556: asdg_MuzzleSlot
{
	class compatibleItems
	{
		muzzle_snds_M = 1;
		muzzle_snds_m_khk_F = 1;
		muzzle_snds_m_snd_F = 1;
	};
};
class asdg_MuzzleSlot_762MG: asdg_MuzzleSlot
{
	class compatibleItems
	{
		muzzle_snds_H_MG = 1;
		muzzle_snds_H_MG_blk_F = 1;
		muzzle_snds_H_MG_khk_F = 1;
		muzzle_snds_H_SW = 1;
	};
};
class asdg_MuzzleSlot_338: asdg_MuzzleSlot
{
	class compatibleItems
	{
		muzzle_snds_338_black = 1;
		muzzle_snds_338_green = 1;
		muzzle_snds_338_sand = 1;
	};
};
class asdg_MuzzleSlot_93x64: asdg_MuzzleSlot
{
	class compatibleItems
	{
		muzzle_snds_93mmg = 1;
		muzzle_snds_93mmg_tan = 1;
	};
};
class asdg_MuzzleSlot_9MM: asdg_MuzzleSlot
{
	class compatibleItems
	{
		muzzle_snds_L = 1;
	};
};
class asdg_MuzzleSlot_9MM_SMG: asdg_MuzzleSlot
{
	class compatibleItems
	{
		muzzle_snds_L = 1;
	};
};
class asdg_MuzzleSlot_45ACP: asdg_MuzzleSlot
{
	class compatibleItems
	{
		muzzle_snds_acp = 1;
	};
};
class asdg_MuzzleSlot_45ACP_SMG: asdg_MuzzleSlot
{
	class compatibleItems
	{
		muzzle_snds_acp = 1;
	};
};
class asdg_MuzzleSlot_545R: asdg_MuzzleSlot
{
	class compatibleItems{};
};
class asdg_MuzzleSlot_762R: asdg_MuzzleSlot
{
	class compatibleItems{};
};
class asdg_MuzzleSlot_58: asdg_MuzzleSlot
{
	class compatibleItems
	{
		muzzle_snds_58_blk_F = 1;
		muzzle_snds_58_wdm_F = 1;
		muzzle_snds_58_ghex_F = 1;
		muzzle_snds_58_hex_F = 1;
	};
};
class CfgWeapons
{
	class Rifle;
	class Rifle_Base_F: Rifle
	{
		class WeaponSlotsInfo;
	};
	class Rifle_Short_Base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo;
	};
	class Rifle_Long_Base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo;
	};
	class EBR_base_F: Rifle_Long_Base_F
	{
		class WeaponSlotsInfo;
	};
	class srifle_EBR_F: EBR_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_762
			{
				iconPosition[] = {0.05,0.38};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.5,0.3};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.4};
				iconScale = 0.25;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.3,0.65};
				iconScale = 0.2;
			};
		};
	};
	class GM6_base_F: Rifle_Long_Base_F{};
	class srifle_GM6_F: GM6_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.55,0.3};
				iconScale = 0.2;
			};
		};
	};
	class LRR_base_F: Rifle_Long_Base_F{};
	class srifle_LRR_F: LRR_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.6,0.35};
				iconScale = 0.2;
			};
		};
	};
	class DMR_01_base_F: Rifle_Long_Base_F
	{
		class WeaponSlotsInfo;
	};
	class srifle_DMR_01_F: DMR_01_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_762
			{
				iconPosition[] = {0,0.45};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.45,0.38};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.5};
				iconScale = 0.25;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.4,0.7};
				iconScale = 0.2;
			};
		};
	};
	class DMR_02_base_F: Rifle_Long_Base_F
	{
		class WeaponSlotsInfo;
	};
	class srifle_DMR_02_F: DMR_02_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_338
			{
				iconPosition[] = {0,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913_long
			{
				iconPosition[] = {0.5,0.36};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.22,0.42};
				iconScale = 0.25;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.2,0.8};
				iconScale = 0.3;
			};
		};
	};
	class DMR_03_base_F: Rifle_Long_Base_F
	{
		class WeaponSlotsInfo;
	};
	class srifle_DMR_03_F: DMR_03_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_762
			{
				iconPosition[] = {0.12,0.431};
				iconScale = 0.15;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.5,0.36};
				iconScale = 0.15;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.33,0.4};
				iconScale = 0.2;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.3,0.8};
				iconScale = 0.3;
			};
		};
	};
	class DMR_04_base_F: Rifle_Long_Base_F
	{
		class WeaponSlotsInfo;
	};
	class srifle_DMR_04_F: DMR_04_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.52,0.38};
				iconScale = 0.15;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.3,0.43};
				iconScale = 0.2;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.3,0.7};
				iconScale = 0.2;
			};
		};
	};
	class DMR_05_base_F: Rifle_Long_Base_F
	{
		class WeaponSlotsInfo;
	};
	class srifle_DMR_05_blk_F: DMR_05_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_93x64
			{
				iconPosition[] = {0,0.43};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913_long
			{
				iconPosition[] = {0.5,0.38};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.22,0.43};
				iconScale = 0.25;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.2,0.8};
				iconScale = 0.3;
			};
		};
	};
	class DMR_06_base_F: Rifle_Long_Base_F
	{
		class WeaponSlotsInfo;
	};
	class srifle_DMR_06_camo_F: DMR_06_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_762
			{
				iconPosition[] = {0.06,0.4};
				iconScale = 0.15;
			};
			class CowsSlot: asdg_OpticRail1913_short
			{
				iconPosition[] = {0.52,0.36};
				iconScale = 0.15;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.32,0.8};
				iconScale = 0.3;
			};
		};
	};
	class LMG_Mk200_F: Rifle_Long_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_762MG
			{
				iconPosition[] = {0.1,0.5};
				iconScale = 0.2;
				class compatibleItems: compatibleItems
				{
					muzzle_snds_h = 1;
					muzzle_snds_h_khk_F = 1;
					muzzle_snds_h_snd_F = 1;
				};
			};
			class CowsSlot: asdg_OpticRail1913_short_MG
			{
				iconPosition[] = {0.6,0.45};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.5};
				iconScale = 0.25;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.35,0.8};
				iconScale = 0.2;
			};
		};
	};
	class LMG_Zafir_F: Rifle_Long_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class CowsSlot: asdg_OpticRail1913_short_MG
			{
				iconPosition[] = {0.6,0.35};
				iconScale = 0.15;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.4,0.4};
				iconScale = 0.15;
			};
		};
	};
	class MMG_01_base_F: Rifle_Long_Base_F
	{
		class WeaponSlotsInfo;
	};
	class MMG_01_hex_F: MMG_01_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_93x64
			{
				iconPosition[] = {0.06,0.4};
				iconScale = 0.15;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.57,0.28};
				iconScale = 0.15;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.38,0.42};
				iconScale = 0.2;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.35,0.85};
				iconScale = 0.3;
			};
		};
	};
	class MMG_02_base_F: Rifle_Long_Base_F
	{
		class WeaponSlotsInfo;
	};
	class MMG_02_camo_F: MMG_02_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_338
			{
				iconPosition[] = {0.06,0.42};
				iconScale = 0.15;
			};
			class CowsSlot: asdg_OpticRail1913_short_MG
			{
				iconPosition[] = {0.62,0.32};
				iconScale = 0.15;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.38,0.42};
				iconScale = 0.2;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.35,0.85};
				iconScale = 0.3;
			};
		};
	};
	class arifle_Katiba_Base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo;
	};
	class arifle_Katiba_F: arifle_Katiba_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_65
			{
				iconPosition[] = {0,0.45};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.45,0.28};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.45};
				iconScale = 0.2;
			};
		};
	};
	class arifle_Katiba_C_F: arifle_Katiba_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_65
			{
				iconPosition[] = {0.1,0.45};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.45,0.28};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.45};
				iconScale = 0.2;
			};
		};
	};
	class arifle_Katiba_GL_F: arifle_Katiba_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_65
			{
				iconPosition[] = {0,0.45};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.45,0.28};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.45};
				iconScale = 0.2;
			};
		};
	};
	class mk20_base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo;
	};
	class arifle_Mk20_F: mk20_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_556
			{
				iconPosition[] = {0,0.38};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.45,0.25};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.35};
				iconScale = 0.25;
			};
		};
	};
	class arifle_Mk20C_F: mk20_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_556
			{
				iconPosition[] = {0,0.38};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.35};
				iconScale = 0.25;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.45,0.25};
				iconScale = 0.2;
			};
		};
	};
	class arifle_Mk20_GL_F: mk20_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_556
			{
				iconPosition[] = {0,0.38};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.35};
				iconScale = 0.25;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.45,0.25};
				iconScale = 0.2;
			};
		};
	};
	class arifle_MX_Base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo;
	};
	class arifle_MXC_F: arifle_MX_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_65
			{
				iconPosition[] = {0,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.5,0.3};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.2,0.4};
				iconScale = 0.25;
			};
		};
	};
	class arifle_MX_F: arifle_MX_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_65
			{
				iconPosition[] = {0,0.45};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.5,0.35};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.2,0.45};
				iconScale = 0.25;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.2,0.7};
				iconScale = 0.2;
			};
		};
	};
	class arifle_MX_GL_F: arifle_MX_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_65
			{
				iconPosition[] = {0,0.45};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.5,0.35};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.2,0.45};
				iconScale = 0.25;
			};
		};
	};
	class arifle_MX_SW_F: arifle_MX_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_65
			{
				iconPosition[] = {0,0.45};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.5,0.35};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.2,0.45};
				iconScale = 0.25;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.2,0.7};
				iconScale = 0.2;
			};
		};
	};
	class arifle_MXM_F: arifle_MX_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_65
			{
				iconPosition[] = {0,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.5,0.35};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.2,0.45};
				iconScale = 0.25;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.2,0.7};
				iconScale = 0.2;
			};
		};
	};
	class Tavor_base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo;
	};
	class arifle_TRG21_F: Tavor_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_556
			{
				iconPosition[] = {0,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913_short
			{
				iconPosition[] = {0.45,0.28};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.25,0.4};
				iconScale = 0.25;
			};
		};
	};
	class arifle_TRG20_F: Tavor_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_556
			{
				iconPosition[] = {0.1,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913_short
			{
				iconPosition[] = {0.45,0.28};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.25,0.4};
				iconScale = 0.25;
			};
		};
	};
	class SMG_01_Base: Rifle_Short_Base_F
	{
		class WeaponSlotsInfo;
	};
	class SMG_01_F: SMG_01_Base
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_45ACP_SMG
			{
				iconPosition[] = {0.1,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.4,0.3};
				iconScale = 0.2;
			};
		};
	};
	class SMG_02_base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo;
	};
	class SMG_02_F: SMG_02_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_9MM_SMG
			{
				iconPosition[] = {0.08,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.45,0.27};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.28,0.4};
				iconScale = 0.25;
			};
		};
	};
	class pdw2000_base_F: Rifle_Short_Base_F
	{
		class WeaponSlotsInfo;
	};
	class hgun_PDW2000_F: pdw2000_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_9MM_SMG
			{
				iconPosition[] = {0.0,0.45};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.5,0.4};
				iconScale = 0.15;
			};
		};
	};
	class LMG_03_base_F: Rifle_Long_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_762MG
			{
				class compatibleItems: compatibleItems
				{
					muzzle_snds_M = 1;
					muzzle_snds_m_khk_F = 1;
					muzzle_snds_m_snd_F = 1;
				};
				iconPosition[] = {0,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913_short_MG
			{
				iconPosition[] = {0.57,0.28};
				iconScale = 0.15;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.38,0.42};
				iconScale = 0.2;
			};
		};
	};
	class DMR_07_base_F: Rifle_Long_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_65
			{
				iconPosition[] = {0,0.45};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913_short
			{
				iconPosition[] = {0.45,0.28};
				iconScale = 0.2;
			};
		};
	};
	class SMG_05_base_F: Rifle_Short_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_9MM_SMG
			{
				iconPosition[] = {0.05,0.35};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913_short
			{
				iconPosition[] = {0.45,0.28};
				iconScale = 0.2;
			};
		};
	};
	class arifle_AK12_base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_762R
			{
				iconPosition[] = {0,0.35};
				iconScale = 0.2;
				class compatibleItems: compatibleItems
				{
					muzzle_snds_B = 1;
					muzzle_snds_B_khk_F = 1;
					muzzle_snds_B_snd_F = 1;
				};
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.5,0.25};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.3,0.35};
				iconScale = 0.2;
			};
		};
	};
	class arifle_AK12_F: arifle_AK12_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.35,0.7};
				iconScale = 0.3;
			};
		};
	};
	class arifle_SPAR_01_base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_556
			{
				iconPosition[] = {0,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.45,0.28};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.45};
				iconScale = 0.2;
			};
		};
	};
	class arifle_SPAR_01_blk_F: arifle_SPAR_01_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.2,0.8};
				iconScale = 0.3;
			};
		};
	};
	class arifle_SPAR_01_khk_F: arifle_SPAR_01_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.2,0.8};
				iconScale = 0.3;
			};
		};
	};
	class arifle_SPAR_01_snd_F: arifle_SPAR_01_base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.2,0.8};
				iconScale = 0.3;
			};
		};
	};
	class arifle_SPAR_02_base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_556
			{
				iconPosition[] = {0,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.45,0.28};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.45};
				iconScale = 0.2;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.2,0.8};
				iconScale = 0.3;
			};
		};
	};
	class arifle_SPAR_03_base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_762
			{
				iconPosition[] = {0,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913_long
			{
				iconPosition[] = {0.45,0.28};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.45};
				iconScale = 0.2;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.2,0.8};
				iconScale = 0.3;
			};
		};
	};
	class arifle_CTAR_base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_58
			{
				iconPosition[] = {0,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.45,0.28};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.45};
				iconScale = 0.2;
			};
		};
	};
	class arifle_CTARS_base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_58
			{
				iconPosition[] = {0,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.45,0.28};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.45};
				iconScale = 0.2;
			};
		};
	};
	class arifle_ARX_base_F: Rifle_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_65
			{
				iconPosition[] = {0,0.4};
				iconScale = 0.2;
			};
			class CowsSlot: asdg_OpticRail1913
			{
				iconPosition[] = {0.45,0.28};
				iconScale = 0.2;
			};
			class PointerSlot: asdg_FrontSideRail
			{
				iconPosition[] = {0.35,0.45};
				iconScale = 0.2;
			};
			class UnderBarrelSlot: asdg_UnderSlot
			{
				iconPosition[] = {0.2,0.8};
				iconScale = 0.3;
			};
		};
	};
	class Pistol;
	class Pistol_Base_F: Pistol
	{
		class WeaponSlotsInfo;
	};
	class hgun_ACPC2_F: Pistol_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_45ACP
			{
				iconPosition[] = {0.25,0.4};
				iconScale = 0.2;
			};
		};
	};
	class hgun_P07_F: Pistol_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_9MM
			{
				iconPosition[] = {0.24,0.35};
				iconScale = 0.2;
			};
		};
	};
	class hgun_Pistol_heavy_01_F: Pistol_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_45ACP
			{
				iconPosition[] = {0.24,0.35};
				iconScale = 0.2;
			};
		};
	};
	class hgun_Rook40_F: Pistol_Base_F
	{
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			class MuzzleSlot: asdg_MuzzleSlot_9MM
			{
				iconPosition[] = {0.3,0.38};
				iconScale = 0.2;
			};
		};
	};
	class muzzle_snds_H;
	class muzzle_snds_H_MG: muzzle_snds_H
	{
		scope = 2;
		displayName = "Sound Suppressor MG";
		picture = "\A3\Weapons_F_Mark\Data\UI\gear_acca_snds_338_tan_CA.paa";
		model = "\A3\Weapons_F\Acc\acca_snds_338_tan_F";
	};
	class muzzle_snds_H_MG_blk_F: muzzle_snds_H_MG
	{
		displayName = "Sound Suppressor MG";
		picture = "\A3\Weapons_F_Mark\Data\UI\gear_acca_snds_338_black_CA.paa";
		model = "\A3\Weapons_F\Acc\acca_snds_338_black_F";
	};
	class muzzle_snds_H_MG_khk_F: muzzle_snds_H_MG
	{
		displayName = "Sound Suppressor MG";
		picture = "\A3\Weapons_F_Mark\Data\UI\gear_acca_snds_338_green_CA.paa";
		model = "\A3\Weapons_F\Acc\acca_snds_338_green_F";
	};
};
class CfgFunctions
{
	class asdg_jointrails
	{
		tag = "asdg";
		class functions
		{
			file = "\asdg_jointrails";
			class compatibleItems{};
		};
	};
};
//};
