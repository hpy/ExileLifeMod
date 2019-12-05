/**
                    * ExilelifeServer_system_defines
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

                    ExileLifeGoldMine = [];
ExileLifeIronMine = [];
ExileLifeSaltMine = 0; 
ExileLifeArtefactsMine = 0;
ExileLifeLocalClient = objNull;
ExileLifeOnlineGuards = [];
ExileLifeOnlineMedics = [];
ExileLifeHouses = getArray(missionconfigFile >> "CfgHousing" >> worldname >> "Houses");
ExileLife_AI_Pistols =
[
	"Exile_Weapon_Colt1911",
	"Exile_Weapon_Makarov",
	"Exile_Weapon_Taurus",
	"Exile_Weapon_TaurusGold",
	"hgun_ACPC2_F",
	"hgun_Rook40_F",
	"hgun_Pistol_heavy_01_F",
	"hgun_Pistol_heavy_02_F",
	"hgun_P07_F"
];
ExileLife_AI_Assault =
[
	"Exile_Weapon_AK47",
	"Exile_Weapon_AK74_GL",
	"Exile_Weapon_AKS_Gold",
	"Exile_Weapon_AK107",
	"Exile_Weapon_AK107_GL",
	"arifle_Katiba_F",
	"arifle_Katiba_GL_F",
	"arifle_MX_Black_F",
	"arifle_MX_GL_Black_F",
	"arifle_Mk20_F",
	"arifle_Mk20_plain_F",
	"arifle_Mk20_GL_F",
	"arifle_TRG20_F",
	"arifle_TRG21_F",
	"arifle_TRG21_GL_F"
];
ExileLife_AI_Clothing=
[
	"U_O_CombatUniform_ocamo",
	"U_O_PilotCoveralls",
	"U_BG_Guerilla1_1",
	"U_BG_Guerilla2_2",
	"U_BG_Guerilla2_3",
	"U_BG_Guerilla3_1",
	"U_IG_Guerilla3_2",
	"U_BG_Guerrilla_6_1",
	"U_I_G_resistanceLeader_F",
	"U_B_SpecopsUniform_sgg",
	"U_I_OfficerUniform",
	"U_B_CTRG_3",
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_stripped",
	"U_C_Poloshirt_tricolour",
	"U_C_Poloshirt_salmon",
	"U_C_Poloshirt_redwhite",
	"U_C_Commoner1_1",
	"U_C_Commoner1_2",
	"U_C_Commoner1_3",
	"U_NikosBody",
	"U_OrestesBody",
	"U_B_CombatUniform_mcam_worn",
	"U_B_SpecopsUniform_sgg",
	"U_I_CombatUniform_tshirt",
	"U_MillerBody",
	"U_KerryBody",
	"U_C_HunterBody_grn",
	"U_C_WorkerCoveralls",
	"U_C_Poor_shorts_1",
	"U_C_Poor_2",
	"U_C_Poor_1",
	"U_C_ShirtSurfer_shorts"
];
ExileLife_AI_Backpacks =
[
	"B_FieldPack_oucamo",
	"B_FieldPack_cbr",
	"B_Kitbag_mcamo",
	"B_Carryall_oli",
	"B_Carryall_cbr",
	"B_Bergen_rgr",
	"B_Bergen_blk"
];
ExileLife_AI_Vests =
[
	"V_PlateCarrierH_CTRG",
	"V_PlateCarrierIA2_dgtl",
	"V_PlateCarrierGL_blk",
	"V_PlateCarrierGL_mtp",
	"V_PlateCarrierGL_rgr",
	"V_PlateCarrierL_CTRG",
	"V_TacVest_blk_POLICE",
	"V_PlateCarrierSpec_rgr",
	"V_PlateCarrierSpec_blk",
	"V_PlateCarrierSpec_mtp",
	"V_HarnessO_brn",
	"V_HarnessO_gry",
	"V_Chestrig_khk",
	"V_Chestrig_rgr",
	"V_BandollierB_oli",
	"V_Rangemaster_belt"
];
ExileLife_AI_Helmets =
[
	"H_HelmetIA_camo",
	"H_HelmetLeaderO_ocamo",
	"H_HelmetLeaderO_oucamo",
	"H_HelmetSpecB_paint1",
	"H_Booniehat_dirty",
	"H_Booniehat_dgtl",
	"H_Cap_red",
	"H_Cap_blu",
	"H_Bandanna_khk",
	"H_Bandanna_sgg",
	"H_Hat_grey"
];
ExileLifeUberJobMutex = false;
