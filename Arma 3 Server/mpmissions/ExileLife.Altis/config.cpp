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

                    class CfgAllowance
{
	gangallowancetime = 30; 
	prisonallowancetime = 30; 
	class CfgPrisonersAllowance
	{
		PaymentLevel_1 = 30;
		PaymentLevel_2 = 50;
		PaymentLevel_3 = 70;
		PaymentLevel_4 = 100;
		PaymentLevel_5 = 150;
		PaymentLevel_6 = 200;
		class Time
		{
			timeSinceLastJob = 3; 
		};
	};
	class CfgGuardsAllowance
	{
		PaymentLevel_1 = 50;
		PaymentLevel_2 = 75;
		PaymentLevel_3 = 100;
		PaymentLevel_4 = 150;
		PaymentLevel_5 = 200;
		PaymentLevel_6 = 250;
	};
};
class CfgClans
{
	registrationFee = 20000;
	clanNameAlphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ._-!\\/";
	maximumIcons = 20;
	maximumIconText = 50;
	maximumPolys = 10;
	maximumPolyNode = 10;
};
class CfgCommands
{
	allowedHTMLLoadURIs[]={"http://*"};
};
class Exile_AbstractCraftingRecipe
{
	name = "";
	pictureItem = ""; 
	returnedItems[] = {};
	components[] = {}; 
	tools[] = {}; 
	requiredInteractionModelGroup = ""; 
	requiresOcean = 0; 
	requiresFire = 0; 
	requiresConcreteMixer = 0; 
	requiredAttributeNameAndValue[] = {};  
	delayedAction = ""; 
	chanceFunction = ""; 
};
class ExileLife_AbstractRecycleWeapon: Exile_AbstractCraftingRecipe
{
	name = "";
	pictureItem = ""; 
	returnedItems[] = {};
	components[] = {}; 
	tools[] = 
	{
		"Exile_Item_Hammer",
		"Exile_Item_Pliers",
		"Exile_Item_Screwdriver"
	}; 
	requiredInteractionModelGroup = "Workbench"; 
	requiresOcean = 0; 
	requiresFire = 0; 
	requiresConcreteMixer = 0; 
	requiredAttributeNameAndValue[] = {};  
	delayedAction = ""; 
};
class CfgCraftingRecipes
{
class ChopApples: Exile_AbstractCraftingRecipe
{
	name = "Chop Up Apples";
	pictureItem = "exilelife_item_pulpingpro_full";
	requiresFire = 0;
	returnedItems[] =
	{
		{1, "exilelife_item_pulpingpro_full"}
	};
	tools[] =
	{
		"Exile_Item_Knife"
	};
	components[] =
	{
		{1, "exilelife_item_pulpingpro_empty"},
		{10, "exilelife_item_apple"}
	};
};
class cider: Exile_AbstractCraftingRecipe
{
	name = "Bottle Apple Cider";
	pictureItem = "exilelife_item_cider";
	requiredInteractionModelGroup = "BrewingSource";
	requiredinteractionitem = "cider";
	returnedItems[] =
	{
		{1, "exilelife_item_cider"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] =
	{
		{1, "exilelife_item_BeerEmpty"}
	};
};
class CookBBQSandwich: Exile_AbstractCraftingRecipe
{
	name = "Cook BBQ Sandwich";
	pictureItem = "Exile_Item_BBQSandwich_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_BBQSandwich_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_BBQSandwich"}
	};
};
class CookCatFood: Exile_AbstractCraftingRecipe
{
	name = "Cook Cat Food";
	pictureItem = "Exile_Item_CatFood_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_CatFood_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_CatFood"}
	};
};
class CookChristmasTinner: Exile_AbstractCraftingRecipe
{
	name = "Cook Christmas Tinner";
	pictureItem = "Exile_Item_ChristmasTinner_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_ChristmasTinner_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_ChristmasTinner"}
	};
};
class CookCoffee: Exile_AbstractCraftingRecipe
{
	name = "Brew Coffee";
	pictureItem = "Exile_Item_PlasticBottleCoffee";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_PlasticBottleCoffee"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_PlasticBottleFreshWater"},
		{1, "Exile_Item_InstantCoffee"}
	};
};
class CookDogFood: Exile_AbstractCraftingRecipe
{
	name = "Cook Dog Food";
	pictureItem = "Exile_Item_DogFood_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_DogFood_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_DogFood"}
	};
};
class CookGloriousKnakworst: Exile_AbstractCraftingRecipe
{
	name = "Cook Glorious Knakworst";
	pictureItem = "Exile_Item_GloriousKnakworst_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_GloriousKnakworst_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_GloriousKnakworst"}
	};
};
class CookMacasCheese: Exile_AbstractCraftingRecipe
{
	name = "Cook Macas Cheese";
	pictureItem = "Exile_Item_MacasCheese_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_MacasCheese_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_MacasCheese"}
	};
};
class CookMullet: Exile_AbstractCraftingRecipe
{
	name = "Cook Mullet";
	pictureItem = "exilelife_item_Mullet_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "exilelife_item_Mullet_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot",
		"Exile_Item_Knife"
	};
	components[] =
	{
		{1, "exilelife_item_Mullet"}
	};
};
class CookPlasticBottleDirtyWater: Exile_AbstractCraftingRecipe
{
	name = "Cook Dirty Water";
	pictureItem = "Exile_Item_PlasticBottleFreshWater";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_PlasticBottleFreshWater"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_PlasticBottleDirtyWater"}
	};
};
class CookPlasticBottleSaltWater: Exile_AbstractCraftingRecipe
{
	name = "Cook Salt Water";
	pictureItem = "Exile_Item_PlasticBottleFreshWater";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_PlasticBottleFreshWater"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_PlasticBottleSaltWater"}
	};
};
class CookPotato: Exile_AbstractCraftingRecipe
{
    name = "Cook Baked Potato";
    pictureItem = "ExileLife_Item_Potato";
    requiresFire = 1;
    returnedItems[] =
    {
        {1, "ExileLife_Item_Potato_Cooked"}
    };
    tools[] = {};
    components[] = 
    {
        {1, "ExileLife_Item_Potato"}
    };
};
class CookPumpkinSoup: Exile_AbstractCraftingRecipe
{
    name = "Cook Pumpkin Soup";
    pictureItem = "ExileLife_Item_Pumpkin";
    requiresFire = 1;
    returnedItems[] =
    {
        {2, "ExileLife_Item_PumpkinSoup"}
    };
    tools[] =
    {
        "Exile_Item_CookingPot"
    };
    components[] = 
    {
        {2, "Exile_Item_PlasticBottleFreshWater"},
        {1, "ExileLife_Item_Pumpkin"}
    };
};
class CookSausageGravy: Exile_AbstractCraftingRecipe
{
	name = "Cook Sausage Gravy";
	pictureItem = "Exile_Item_SausageGravy_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_SausageGravy_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_SausageGravy"}
	};
};
class CookSurstromming: Exile_AbstractCraftingRecipe
{
	name = "Cook Surströmming";
	pictureItem = "Exile_Item_Surstromming_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_Surstromming_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_Surstromming"}
	};
};
class CookAlsatianSteak: Exile_AbstractCraftingRecipe
{
	name = "Cook Alsatian Steak";
	pictureItem = "Exile_Item_AlsatianSteak_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_AlsatianSteak_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_AlsatianSteak_Raw"}
	};
};
class CookCatSharkFilet: Exile_AbstractCraftingRecipe
{
	name = "Cook Cat Shark Filet";
	pictureItem = "Exile_Item_CatSharkFilet_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_CatSharkFilet_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_CatSharkFilet_Raw"}
	};
};
class CookChickenFilet: Exile_AbstractCraftingRecipe
{
	name = "Cook Chicken Filet";
	pictureItem = "Exile_Item_ChickenFilet_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_ChickenFilet_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_ChickenFilet_Raw"}
	};
};
class CookFinSteak: Exile_AbstractCraftingRecipe
{
	name = "Cook Fin Steak";
	pictureItem = "Exile_Item_FinSteak_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_FinSteak_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_FinSteak_Raw"}
	};
};
class CookGoatSteak: Exile_AbstractCraftingRecipe
{
	name = "Cook Goat Steak";
	pictureItem = "Exile_Item_GoatSteak_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_GoatSteak_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_GoatSteak_Raw"}
	};
};
class CookMackerelFilet: Exile_AbstractCraftingRecipe
{
	name = "Cook Mackerel Filet";
	pictureItem = "Exile_Item_MackerelFilet_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_MackerelFilet_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_MackerelFilet_Raw"}
	};
};
class CookMulletFilet: Exile_AbstractCraftingRecipe
{
	name = "Cook Mullet Filet";
	pictureItem = "Exile_Item_MulletFilet_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_MulletFilet_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_MulletFilet_Raw"}
	};
};
class CookOrnateFilet: Exile_AbstractCraftingRecipe
{
	name = "Cook Ornate Filet";
	pictureItem = "Exile_Item_OrnateFilet_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_OrnateFilet_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_OrnateFilet_Raw"}
	};
};
class CookRabbitSteak: Exile_AbstractCraftingRecipe
{
	name = "Cook Rabbit Steak";
	pictureItem = "Exile_Item_RabbitSteak_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_RabbitSteak_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_RabbitSteak_Raw"}
	};
};
class CookRoosterFilet: Exile_AbstractCraftingRecipe
{
	name = "Cook Rooster Filet";
	pictureItem = "Exile_Item_RoosterFilet_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_RoosterFilet_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_RoosterFilet_Raw"}
	};
};
class CookSalemaFilet: Exile_AbstractCraftingRecipe
{
	name = "Cook Salema Filet";
	pictureItem = "Exile_Item_SalemaFilet_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_SalemaFilet_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_SalemaFilet_Raw"}
	};
};
class CookSheepSteak: Exile_AbstractCraftingRecipe
{
	name = "Cook Sheep Steak";
	pictureItem = "Exile_Item_SheepSteak_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_SheepSteak_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_SheepSteak_Raw"}
	};
};
class CookSnakeFilet: Exile_AbstractCraftingRecipe
{
	name = "Cook Snake Filet";
	pictureItem = "Exile_Item_SnakeFilet_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_SnakeFilet_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_SnakeFilet_Raw"}
	};
};
class CookTunaFilet: Exile_AbstractCraftingRecipe
{
	name = "Cook Tuna Filet";
	pictureItem = "Exile_Item_TunaFilet_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_TunaFilet_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_TunaFilet_Raw"}
	};
};
class CookTurtleFilet: Exile_AbstractCraftingRecipe
{
	name = "Cook Turtle Filet";
	pictureItem = "Exile_Item_TurtleFilet_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_TurtleFilet_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_TurtleFilet_Raw"}
	};
};
class MakeAppleJuice: Exile_AbstractCraftingRecipe
{
	name = "Make Apple Juice";
	pictureItem = "exilelife_item_applejuice";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "exilelife_item_applejuice"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] =
	{
		{1, "exilelife_item_pulpingpro_pulped"},
		{1, "Exile_Item_PlasticBottleFreshWater"}
	};
};
class MakeOrangeJuice: Exile_AbstractCraftingRecipe
{
	name = "Make Orange Juice";
	pictureItem = "exilelife_item_orangejuice";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "exilelife_item_orangejuice"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] =
	{
		{5, "exilelife_item_orange"},
		{1, "Exile_Item_PlasticBottleFreshWater"}
	};
};
class pruno: Exile_AbstractCraftingRecipe
{
	name = "Bottle Pruno";
	pictureItem = "exilelife_item_orangejuice";
	requiredInteractionModelGroup = "BrewingSource";
	requiredinteractionitem = "pruno";
	returnedItems[] =
	{
		{1, "exilelife_item_pruno"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] =
	{
		{1, "Exile_Item_PlasticBottleEmpty"}
	};
};
class PulpApples: Exile_AbstractCraftingRecipe
{
	name = "Pulp Apples";
	pictureItem = "exilelife_item_pulpingpro_pulped";
	requiresFire = 0;
	returnedItems[] =
	{
		{1, "exilelife_item_pulpingpro_pulped"}
	};
	tools[] =
	{
		"Exile_Item_Grinder"
	};
	components[] =
	{
		{1, "exilelife_item_pulpingpro_full"}
	};
};
class CraftBandage: Exile_AbstractCraftingRecipe
{
	name = "Craft Bandage";
	pictureItem = "Exile_Item_Bandage";
	returnedItems[] =
	{
		{1, "Exile_Item_Bandage"}
	};
	components[] = 
	{
		{4, "Exile_Item_ToiletPaper"}
	};
};
class CraftCleanWaterFromDirtyWater: Exile_AbstractCraftingRecipe
{
	name = "Purify Dirty Water";
	pictureItem = "ExileLife_Item_WaterPurificationTablets";
	returnedItems[] =
	{
		{1, "Exile_Item_PlasticBottleFreshWater"}
	};
	components[] = 
	{
		{1, "ExileLife_Item_WaterPurificationTablets"},
		{1, "Exile_Item_PlasticBottleDirtyWater"}
	};
};
class CraftCleanWaterFromSaltWater: Exile_AbstractCraftingRecipe
{
	name = "Purify Salt Water";
	pictureItem = "ExileLife_Item_WaterPurificationTablets";
	returnedItems[] =
	{
		{1, "Exile_Item_PlasticBottleFreshWater"}
	};
	components[] = 
	{
		{1, "ExileLife_Item_WaterPurificationTablets"},
		{1, "Exile_Item_PlasticBottleSaltWater"}
	};
};
class CraftFirePlace: Exile_AbstractCraftingRecipe
{
	name = "Craft Fire Place";
	pictureItem = "Exile_Item_CampFireKit";
	returnedItems[] = 
	{
		{1, "Exile_Item_CampFireKit"}
	};
	components[] = 
	{
		{2, "Exile_Item_WoodLog"}
	};
};
class Craftpulpingpro: Exile_AbstractCraftingRecipe
{
	name = "Build a pulpingpro";
	pictureItem = "exilelife_item_pulpingpro_empty";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "exilelife_item_pulpingpro_empty"}
	};
	tools[] =
	{
		"Exile_Item_Grinder"
	};
	components[] =
	{
		{2, "exilelife_item_bucket"},
		{1, "Exile_Item_MetalPole"},
		{1, "Exile_Item_MetalBoard"}
	};
};
class CraftRepairKitConcrete: Exile_AbstractCraftingRecipe
{
	name = "Craft Concrete Repair Kit";
	pictureItem = "Exile_Item_Cement";
	requiresConcreteMixer = true;
	returnedItems[] = 
	{
		{1, "Exile_Item_RepairKitConcrete"},
		{1, "Exile_Item_WaterCanisterEmpty"},
		{1, "Exile_Item_FuelCanisterEmpty"}
	};
	components[] = 
	{
		{4, "Exile_Item_Cement"},
		{2, "Exile_Item_Sand"},
		{1, "Exile_Item_WaterCanisterDirtyWater"},
		{1, "Exile_Item_FuelCanisterFull"}
	};
};
class CraftRepairKitMetal: Exile_AbstractCraftingRecipe
{
	name = "Craft Metal Repair Kit";
	pictureItem = "Exile_Item_RepairKitMetal";
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_RepairKitMetal"}
	};
	components[] = 
	{
		{4, "Exile_Item_MetalBoard"}
	};
	tools[] = 
	{
		"Exile_Item_Foolbox",
		"Exile_Item_Grinder"
	};
};
class CraftRepairKitWood: Exile_AbstractCraftingRecipe
{
	name = "Craft Wood Repair Kit";
	pictureItem = "Exile_Item_RepairKitWood";
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_RepairKitWood"}
	};
	components[] = 
	{
		{4, "Exile_Item_WoodPlank"}
	};
	tools[] = 
	{
		"Exile_Item_Foolbox"
	};
};
class CraftStorageCrate: Exile_AbstractCraftingRecipe
{
	name = "Craft Storage Crate";
	pictureItem = "Exile_Item_StorageCrateKit";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_StorageCrateKit"}
	};
	components[] = 
	{
		{5, "Exile_Item_WoodPlank"}
	};
};
class CraftWaterBarrel: Exile_AbstractCraftingRecipe
{
	name = "Craft Water Barrel";
	pictureItem = "Exile_Item_WaterBarrelKit";
	requiredInteractionModelGroup = "WorkBench";
	requiresFire = 1;
	returnedItems[] = 
	{
		{1, "Exile_Item_WaterBarrelKit"}
	};
	components[] = 
	{
		{20, "Exile_Item_PlasticBottleEmpty"}
	};
};
class CraftWaterPurificationTablets: Exile_AbstractCraftingRecipe
{
	name = "Craft Water Purification Tablets";
	pictureItem = "ExileLife_Item_WaterPurificationTablets";
	returnedItems[] =
	{
		{1, "ExileLife_Item_WaterPurificationTablets"}
	};
	components[] = 
	{
		{1, "ExileLife_Item_Disinfectant"},
		{1, "ExileLife_Item_Antibiotics"}
	};
};
class CraftWoodLadder: Exile_AbstractCraftingRecipe
{
	name = "Craft Wood Ladder";
	pictureItem = "Exile_Item_WoodLadderKit";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] =
	{
		{1, "Exile_Item_WoodLadderKit"}
	};
	components[] =
	{
		{6, "Exile_Item_WoodPlank"}
	};
};
class CraftWorkBench: Exile_AbstractCraftingRecipe
{
	name = "Craft Work Bench";
	pictureItem = "Exile_Item_WorkBenchKit";
	returnedItems[] = 
	{
		{1, "Exile_Item_WorkBenchKit"}
	};
	components[] = 
	{
		{4, "Exile_Item_WoodLog"}
	};
};
class FillBeakerAcetone: Exile_AbstractCraftingRecipe
{
	name = "Fill Beaker with Acetone";
	pictureItem = "ExileLife_Item_Beaker_Acetone";
	crossfillingitem = 2;
	returnedItems[] =
	{
		{1, "ExileLife_Item_Beaker_Acetone"}
	};
	fillcomponents[] =
	{
		{1, "ExileLife_Item_Acetone"},
		{1, "ExileLife_Item_Beaker_Clean"}
	};
};
class FillBeakerHydrochloricAcid: Exile_AbstractCraftingRecipe
{
	name = "Fill Beaker with HydrochloricAcid";
	pictureItem = "ExileLife_Item_Beaker_HydrochloricAcid";
	crossfillingitem = 2;
	returnedItems[] =
	{
		{1, "ExileLife_Item_Beaker_HydrochloricAcid"}
	};
	fillcomponents[] =
	{
		{1, "ExileLife_Item_HydrochloricAcid"},
		{1, "ExileLife_Item_Beaker_Clean"}
	};
};
class FillEmptyPlasticBottleWithDirtyWater: Exile_AbstractCraftingRecipe
{
	name = "Fill Dirty Water";
	pictureItem = "Exile_Item_PlasticBottleDirtyWater";
	requiredInteractionModelGroup = "WaterSource";
	returnedItems[] =
	{
		{1, "Exile_Item_PlasticBottleDirtyWater"}
	};
	components[] = 
	{
		{1, "Exile_Item_PlasticBottleEmpty"}
	};
};
class FillEmptyPlasticBottleWithFreshWater: Exile_AbstractCraftingRecipe
{
	name = "Fill Fresh Water";
	pictureItem = "Exile_Item_PlasticBottleFreshWater";
	requiredInteractionModelGroup = "CleanWaterSource";
	returnedItems[] =
	{
		{1, "Exile_Item_PlasticBottleFreshWater"}
	};
	components[] = 
	{
		{1, "Exile_Item_PlasticBottleEmpty"}
	};
};
class FillEmptyPlasticBottleWithSaltWater: Exile_AbstractCraftingRecipe
{
	name = "Fill Salt Water";
	pictureItem = "Exile_Item_PlasticBottleSaltWater";
	requiresOcean = 1;
	returnedItems[] = 
	{
		{1, "Exile_Item_PlasticBottleSaltWater"}
	};
	components[] = 
	{
		{1, "Exile_Item_PlasticBottleEmpty"}
	};
};
class FillEmptyWaterCanisterWithDirtyWater: Exile_AbstractCraftingRecipe
{
	name = "Fill Dirty Water";
	pictureItem = "Exile_Item_WaterCanisterDirtyWater";
	requiredInteractionModelGroup = "WaterSource";
	returnedItems[] =
	{
		{1, "Exile_Item_WaterCanisterDirtyWater"}
	};
	components[] = 
	{
		{1, "Exile_Item_WaterCanisterEmpty"}
	};
};
class FillFuelCanister: Exile_AbstractCraftingRecipe
{
	name = "Fill Fuel Canister";
	pictureItem = "Exile_Item_FuelCanisterFull";
	requiredInteractionModelGroup = "FuelSource";
	returnedItems[] = 
	{
		{1, "Exile_Item_FuelCanisterFull"}
	};
	components[] = 
	{
		{1, "Exile_Item_FuelCanisterEmpty"}
	};
};
};
class CfgEnvironment
{
	enableMoonlitNights = 0;
};
class CfgExileAnimals
{
	enabled = 1;
	disableVanillaAnimals = 1;
	animalTypes[] = 
	{
		"Exile_Animal_Rooster_Abstract",
		"Exile_Animal_Hen_Abstract",
		"Exile_Animal_Goat_Abstract",
		"Exile_Animal_Sheep_Abstract",
		"ExileLife_Animal_Snake_Abstract"		
	};
	spawnDistance = 150;
	spawnRadius = 50;
	minimumSpawnDelay = 5;
	maximumSpawnDelay = 10;
	keepAliveRadius = 500;
	minimumLifetime = 5 * 60;
};
class CfgExileArsenal
{
	class Exile_Uniform_BambiOverall				{ quality = 1; price = 1; sellPrice = 1; };
	class U_C_Journalist 							{ quality = 1; price = 20; };
	class U_C_Poloshirt_blue 						{ quality = 1; price = 20; };
	class U_C_Poloshirt_burgundy 					{ quality = 1; price = 20; };
	class U_C_Poloshirt_salmon 						{ quality = 1; price = 20; };
	class U_C_Poloshirt_stripped 					{ quality = 1; price = 20; };
	class U_C_Poloshirt_tricolour 					{ quality = 1; price = 20; };
	class U_C_Poor_1 								{ quality = 1; price = 20; };
	class U_C_Poor_2 								{ quality = 1; price = 20; };
	class U_C_Poor_shorts_1 						{ quality = 1; price = 20; };
	class U_C_Scientist 							{ quality = 1; price = 20; };
	class U_OrestesBody 							{ quality = 1; price = 40; };
	class U_Rangemaster 							{ quality = 1; price = 40; };
	class U_NikosAgedBody 							{ quality = 1; price = 40; };
	class U_NikosBody 								{ quality = 1; price = 40; };
	class U_Competitor 								{ quality = 1; price = 40; };
	class U_B_CombatUniform_mcam 					{ quality = 2; price = 40; };
	class U_B_CombatUniform_mcam_tshirt 			{ quality = 2; price = 40; };
	class U_B_CombatUniform_mcam_vest 				{ quality = 2; price = 40; };
	class U_B_CombatUniform_mcam_worn 				{ quality = 2; price = 40; };
	class U_B_CTRG_1 								{ quality = 2; price = 40; };
	class U_B_CTRG_2 								{ quality = 2; price = 40; };
	class U_B_CTRG_3								{ quality = 2; price = 40; };
	class U_I_CombatUniform 						{ quality = 2; price = 40; };
	class U_I_CombatUniform_shortsleeve				{ quality = 2; price = 40; };
	class U_I_CombatUniform_tshirt					{ quality = 2; price = 40; };
	class U_I_OfficerUniform						{ quality = 2; price = 40; };
	class U_O_CombatUniform_ocamo 					{ quality = 2; price = 40; };
	class U_O_CombatUniform_oucamo 					{ quality = 2; price = 40; };
	class U_O_OfficerUniform_ocamo 					{ quality = 3; price = 80; };
	class U_B_SpecopsUniform_sgg 					{ quality = 3; price = 80; };
	class U_O_SpecopsUniform_blk 					{ quality = 3; price = 80; };
	class U_O_SpecopsUniform_ocamo 					{ quality = 3; price = 80; };
	class U_I_G_Story_Protagonist_F 				{ quality = 3; price = 100; };
	class Exile_Uniform_Woodland 					{ quality = 3; price = 150; };
	class U_C_HunterBody_grn						{ quality = 2; price = 40; };
	class U_IG_Guerilla1_1							{ quality = 2; price = 40; };
	class U_IG_Guerilla2_1							{ quality = 2; price = 60; };
	class U_IG_Guerilla2_2							{ quality = 2; price = 40; };
	class U_IG_Guerilla2_3							{ quality = 2; price = 40; };
	class U_IG_Guerilla3_1							{ quality = 2; price = 40; };
	class U_BG_Guerilla2_1							{ quality = 2; price = 40; };
	class U_IG_Guerilla3_2							{ quality = 2; price = 40; };
	class U_BG_Guerrilla_6_1						{ quality = 2; price = 60; };
	class U_BG_Guerilla1_1							{ quality = 2; price = 40; };
	class U_BG_Guerilla2_2							{ quality = 2; price = 40; };
	class U_BG_Guerilla2_3							{ quality = 2; price = 40; };
	class U_BG_Guerilla3_1							{ quality = 2; price = 40; };
	class U_BG_leader								{ quality = 3; price = 40; };
	class U_IG_leader								{ quality = 3; price = 40; };
	class U_I_G_resistanceLeader_F					{ quality = 3; price = 100; };
	class U_B_FullGhillie_ard						{ quality = 4; price = 550; };
	class U_B_FullGhillie_lsh						{ quality = 4; price = 550; };
	class U_B_FullGhillie_sard						{ quality = 4; price = 550; };
	class U_B_GhillieSuit							{ quality = 3; price = 500; };
	class U_I_FullGhillie_ard						{ quality = 4; price = 550; };
	class U_I_FullGhillie_lsh						{ quality = 4; price = 550; };
	class U_I_FullGhillie_sard						{ quality = 4; price = 550; };
	class U_I_GhillieSuit							{ quality = 3; price = 500; };
	class U_O_FullGhillie_ard						{ quality = 6; price = 550; };
	class U_O_FullGhillie_lsh						{ quality = 6; price = 550; };
	class U_O_FullGhillie_sard						{ quality = 6; price = 550; };
	class U_O_GhillieSuit							{ quality = 6; price = 500; };
	class U_I_Wetsuit								{ quality = 3; price = 180; };
	class U_O_Wetsuit								{ quality = 3; price = 180; };
	class U_B_Wetsuit								{ quality = 3; price = 180; };
	class U_B_survival_uniform						{ quality = 3; price = 180; };
	class V_BandollierB_blk							{ quality = 1; price = 70; };
	class V_BandollierB_cbr							{ quality = 1; price = 70; };
	class V_BandollierB_khk							{ quality = 1; price = 70; };
	class V_BandollierB_oli							{ quality = 1; price = 70; };
	class V_BandollierB_rgr							{ quality = 1; price = 70; };
	class V_Chestrig_blk 							{ quality = 1; price = 150; };
	class V_Chestrig_khk 							{ quality = 1; price = 150; };
	class V_Chestrig_oli 							{ quality = 1; price = 150; };
	class V_Chestrig_rgr 							{ quality = 1; price = 150; };
	class V_Press_F									{ quality = 1; price = 40; };
	class V_Rangemaster_belt						{ quality = 1; price = 20; };
	class V_TacVest_blk								{ quality = 2; price = 150; };
	class V_TacVest_blk_POLICE						{ quality = 3; price = 150; };
	class V_TacVest_brn								{ quality = 2; price = 150; };
	class V_TacVest_camo							{ quality = 2; price = 150; };
	class V_TacVest_khk								{ quality = 2; price = 150; };
	class V_TacVest_oli								{ quality = 2; price = 150; };
	class V_TacVestCamo_khk							{ quality = 2; price = 150; };
	class V_TacVestIR_blk							{ quality = 2; price = 150; };
	class V_I_G_resistanceLeader_F					{ quality = 2; price = 150; };
	class V_HarnessO_brn							{ quality = 1; price = 120; };
	class V_HarnessO_gry							{ quality = 1; price = 120; };
	class V_HarnessOGL_brn							{ quality = 1; price = 120; };
	class V_HarnessOGL_gry							{ quality = 1; price = 120; };
	class V_HarnessOSpec_brn						{ quality = 1; price = 120; };
	class V_HarnessOSpec_gry						{ quality = 1; price = 120; };
	class V_PlateCarrier1_blk 						{ quality = 1; price = 180; };
	class V_PlateCarrier1_rgr 						{ quality = 1; price = 180; };
	class V_PlateCarrier2_rgr 						{ quality = 2; price = 200; };
	class V_PlateCarrier3_rgr 						{ quality = 2; price = 200; };
	class V_PlateCarrierGL_blk 						{ quality = 6; price = 1000; };
	class V_PlateCarrierGL_mtp 						{ quality = 6; price = 1000; };
	class V_PlateCarrierGL_rgr 						{ quality = 6; price = 1000; };
	class V_PlateCarrierH_CTRG 						{ quality = 2; price = 200; };
	class V_PlateCarrierIA1_dgtl 					{ quality = 2; price = 180; };
	class V_PlateCarrierIA2_dgtl 					{ quality = 2; price = 200; };
	class V_PlateCarrierIAGL_dgtl 					{ quality = 3; price = 800; };
	class V_PlateCarrierIAGL_oli 					{ quality = 3; price = 800; };
	class V_PlateCarrierL_CTRG 						{ quality = 2; price = 200; };
	class V_PlateCarrierSpec_blk 					{ quality = 5; price = 400; };
	class V_PlateCarrierSpec_mtp 					{ quality = 5; price = 400; };
	class V_PlateCarrierSpec_rgr 					{ quality = 5; price = 400; };
	class H_Cap_blk 								{ quality = 1; price = 10; };
	class H_Cap_blk_Raven 							{ quality = 1; price = 10; };
	class H_Cap_blu 								{ quality = 1; price = 6; };
	class H_Cap_brn_SPECOPS 						{ quality = 1; price = 16; };
	class H_Cap_grn 								{ quality = 1; price = 10; };
	class H_Cap_headphones 							{ quality = 1; price = 6; };
	class H_Cap_khaki_specops_UK 					{ quality = 1; price = 16; };
	class H_Cap_oli 								{ quality = 1; price = 10; };
	class H_Cap_press 								{ quality = 1; price = 6; };
	class H_Cap_red 								{ quality = 1; price = 6; };
	class H_Cap_tan 								{ quality = 1; price = 10; };
	class H_Cap_tan_specops_US 						{ quality = 1; price = 16; };
	class G_Spectacles			 		{ quality = 1; price = 25; };
	class G_Spectacles_Tinted			{ quality = 1; price = 30; };
	class G_Combat			 			{ quality = 1; price = 50; };
	class G_Lowprofile			 		{ quality = 1; price = 25; };
	class G_Shades_Black			 	{ quality = 1; price = 25; };
	class G_Shades_Green			 	{ quality = 1; price = 25; };
	class G_Shades_Red			 		{ quality = 1; price = 25; };
	class G_Squares			 			{ quality = 1; price = 35; };
	class G_Squares_Tinted			 	{ quality = 1; price = 35; };
	class G_Sport_BlackWhite			{ quality = 1; price = 35; };
	class G_Sport_Blackyellow			{ quality = 1; price = 35; };
	class G_Sport_Greenblack			{ quality = 1; price = 35; };
	class G_Sport_Checkered			 	{ quality = 1; price = 35; };
	class G_Sport_Red			 		{ quality = 1; price = 35; };
	class G_Tactical_Black			 	{ quality = 1; price = 35; };
	class G_Aviator			 			{ quality = 1; price = 45; };
	class G_Lady_Mirror			 		{ quality = 1; price = 25; };
	class G_Lady_Dark			 		{ quality = 1; price = 25; };
	class G_Lady_Red			 		{ quality = 1; price = 25; };
	class G_Lady_Blue			 		{ quality = 1; price = 25; };
	class G_Diving			 			{ quality = 1; price = 45; };
	class G_B_Diving			 		{ quality = 1; price = 45; };
	class G_O_Diving			 		{ quality = 1; price = 45; };
	class G_I_Diving			 		{ quality = 1; price = 45; };
	class G_Goggles_VR			 		{ quality = 1; price = 45; };
	class G_Balaclava_blk			 	{ quality = 2; price = 20; };
	class G_Balaclava_oli			 	{ quality = 2; price = 20; };
	class G_Balaclava_combat			{ quality = 2; price = 20; };
	class G_Balaclava_lowprofile		{ quality = 2; price = 20; };
	class G_Bandanna_blk			 	{ quality = 1; price = 15; };
	class G_Bandanna_oli			 	{ quality = 1; price = 15; };
	class G_Bandanna_khk			 	{ quality = 1; price = 15; };
	class G_Bandanna_tan			 	{ quality = 1; price = 15; };
	class G_Bandanna_beast			 	{ quality = 1; price = 15; };
	class G_Bandanna_shades			 	{ quality = 1; price = 15; };
	class G_Bandanna_sport			 	{ quality = 1; price = 15; };
	class G_Bandanna_aviator			{ quality = 1; price = 15; };
	class G_Shades_Blue			 		{ quality = 1; price = 15; };
	class G_Sport_Blackred			 	{ quality = 1; price = 25; };
	class G_Tactical_Clear			 	{ quality = 1; price = 15; };
	class G_Balaclava_TI_blk_F			{ quality = 2; price = 25; };
	class G_Balaclava_TI_tna_F			{ quality = 2; price = 25; };
	class G_Balaclava_TI_G_blk_F		{ quality = 2; price = 25; };
	class G_Balaclava_TI_G_tna_F		{ quality = 2; price = 25; };
	class G_Combat_Goggles_tna_F		{ quality = 1; price = 35; };
	class H_MilCap_blue 							{ quality = 1; price = 18; };
	class H_MilCap_dgtl 							{ quality = 1; price = 18; };
	class H_MilCap_mcamo 							{ quality = 1; price = 18; };
	class H_MilCap_ocamo 							{ quality = 1; price = 18; };
	class H_MilCap_oucamo 							{ quality = 1; price = 18; };
	class H_MilCap_rucamo 							{ quality = 1; price = 18; };
	class H_Watchcap_blk 							{ quality = 1; price = 12; };
	class H_Watchcap_camo 							{ quality = 1; price = 12; };
	class H_Watchcap_khk 							{ quality = 1; price = 12; };
	class H_Watchcap_sgg 							{ quality = 1; price = 12; };
	class H_Bandanna_camo							{ quality = 1; price = 15; };
	class H_Bandanna_cbr							{ quality = 1; price = 15; };
	class H_Bandanna_gry							{ quality = 1; price = 15; };
	class H_Bandanna_khk							{ quality = 1; price = 15; };
	class H_Bandanna_khk_hs							{ quality = 1; price = 15; };
	class H_Bandanna_mcamo							{ quality = 1; price = 15; };
	class H_Bandanna_sgg							{ quality = 1; price = 15; };
	class H_Bandanna_surfer							{ quality = 1; price = 15; };
	class H_Booniehat_dgtl							{ quality = 1; price = 12; };
	class H_Booniehat_dirty							{ quality = 1; price = 12; };
	class H_Booniehat_grn							{ quality = 1; price = 12; };
	class H_Booniehat_indp							{ quality = 1; price = 12; };
	class H_Booniehat_khk							{ quality = 1; price = 12; };
	class H_Booniehat_khk_hs						{ quality = 1; price = 12; };
	class H_Booniehat_mcamo							{ quality = 1; price = 12; };
	class H_Booniehat_tan							{ quality = 1; price = 12; };
	class H_Hat_blue								{ quality = 1; price = 6; };
	class H_Hat_brown								{ quality = 1; price = 6; };
	class H_Hat_camo								{ quality = 1; price = 6; };
	class H_Hat_checker								{ quality = 1; price = 6; };
	class H_Hat_grey								{ quality = 1; price = 6; };
	class H_Hat_tan									{ quality = 1; price = 6; };
	class H_StrawHat								{ quality = 1; price = 6; };
	class H_StrawHat_dark							{ quality = 1; price = 6; };
	class Exile_Headgear_SantaHat					{ quality = 1; price = 35; };
	class Exile_Headgear_SafetyHelmet				{ quality = 1; price = 45; };
	class H_Beret_02								{ quality = 2; price = 20; };
	class H_Beret_blk								{ quality = 2; price = 20; };
	class H_Beret_blk_POLICE						{ quality = 2; price = 20; };
	class H_Beret_brn_SF							{ quality = 2; price = 20; };
	class H_Beret_Colonel							{ quality = 3; price = 25; };
	class H_Beret_grn								{ quality = 2; price = 20; };
	class H_Beret_grn_SF							{ quality = 2; price = 20; };
	class H_Beret_ocamo								{ quality = 2; price = 20; };
	class H_Beret_red								{ quality = 2; price = 20; };
	class H_Shemag_khk								{ quality = 1; price = 60; };
	class H_Shemag_olive							{ quality = 1; price = 60; };
	class H_Shemag_olive_hs							{ quality = 1; price = 60; };
	class H_Shemag_tan								{ quality = 1; price = 60; };
	class H_ShemagOpen_khk							{ quality = 1; price = 60; };
	class H_ShemagOpen_tan							{ quality = 1; price = 60; };
	class H_TurbanO_blk								{ quality = 1; price = 60; };
	class H_HelmetB_light							{ quality = 2; price = 45; };
	class H_HelmetB_light_black						{ quality = 2; price = 45; };
	class H_HelmetB_light_desert					{ quality = 2; price = 45; };
	class H_HelmetB_light_grass						{ quality = 2; price = 45; };
	class H_HelmetB_light_sand						{ quality = 2; price = 45; };
	class H_HelmetB_light_snakeskin					{ quality = 2; price = 45; };
	class H_HelmetIA								{ quality = 3; price = 80; };
	class H_HelmetIA_camo							{ quality = 3; price = 80; };
	class H_HelmetIA_net							{ quality = 3; price = 80; };
	class H_HelmetB									{ quality = 3; price = 120; };
	class H_HelmetB_black							{ quality = 3; price = 120; };
	class H_HelmetB_camo							{ quality = 3; price = 160; }; 
	class H_HelmetB_desert							{ quality = 3; price = 120; };
	class H_HelmetB_grass							{ quality = 3; price = 120; };
	class H_HelmetB_paint							{ quality = 3; price = 120; };
	class H_HelmetB_plain_blk						{ quality = 3; price = 120; };
	class H_HelmetB_sand							{ quality = 3; price = 120; };
	class H_HelmetB_snakeskin						{ quality = 3; price = 120; };
	class H_HelmetSpecB								{ quality = 4; price = 160; };
	class H_HelmetSpecB_blk							{ quality = 4; price = 160; };
	class H_HelmetSpecB_paint1						{ quality = 4; price = 160; };
	class H_HelmetSpecB_paint2						{ quality = 4; price = 160; };
	class H_HelmetO_ocamo							{ quality = 5; price = 300; };
	class H_HelmetO_oucamo							{ quality = 5; price = 300; };
	class H_HelmetSpecO_blk							{ quality = 5; price = 200; };
	class H_HelmetSpecO_ocamo						{ quality = 5; price = 200; };
	class H_HelmetLeaderO_ocamo						{ quality = 5; price = 400; };
	class H_HelmetLeaderO_oucamo					{ quality = 5; price = 400; };
	class acc_flashlight 							{ quality = 1; price = 25; };
	class acc_pointer_IR 							{ quality = 1; price = 60; };
	class bipod_01_F_blk	 						{ quality = 2; price = 65; };
	class bipod_01_F_mtp	 						{ quality = 2; price = 65; };
	class bipod_01_F_snd	 						{ quality = 2; price = 65; };
	class bipod_02_F_blk	 						{ quality = 2; price = 65; };
	class bipod_02_F_hex	 						{ quality = 2; price = 65; };
	class bipod_02_F_tan	 						{ quality = 2; price = 65; };
	class bipod_03_F_blk	 						{ quality = 2; price = 65; };
	class bipod_03_F_oli	 						{ quality = 2; price = 65; };
	class muzzle_snds_338_black 					{ quality = 5; price = 150; };
	class muzzle_snds_338_green 					{ quality = 5; price = 150; };
	class muzzle_snds_338_sand 						{ quality = 5; price = 150; };
	class muzzle_snds_93mmg 						{ quality = 4; price = 150; };
	class muzzle_snds_93mmg_tan 					{ quality = 4; price = 150; };
	class muzzle_snds_acp 							{ quality = 1; price = 110; };
	class muzzle_snds_B 							{ quality = 3; price = 120; };
	class muzzle_snds_H 							{ quality = 2; price = 120; };
	class muzzle_snds_H_MG 							{ quality = 2; price = 120; };
	class muzzle_snds_H_SW 							{ quality = 2; price = 120; };
	class muzzle_snds_L 							{ quality = 1; price = 110; };
	class muzzle_snds_M 							{ quality = 1; price = 110; };
	class I_UavTerminal								{ quality = 4; price = 750; };
	class I_UAV_01_backpack_F						{ quality = 4; price = 3000; };
	class O_HMG_01_weapon_F 						{ quality = 4; price = 5000; };
	class O_HMG_01_support_F 						{ quality = 4; price = 1000; };
	class optic_Aco									{ quality = 1; price = 470; };
	class optic_ACO_grn								{ quality = 1; price = 470; };
	class optic_ACO_grn_smg							{ quality = 1; price = 470; };
	class optic_Aco_smg								{ quality = 1; price = 470; };
	class optic_AMS									{ quality = 5; price = 8300; };
	class optic_AMS_khk								{ quality = 5; price = 8300; };
	class optic_AMS_snd								{ quality = 5; price = 8300; };
	class optic_Arco								{ quality = 1; price = 100; };
	class optic_DMS									{ quality = 5; price = 6650; };
	class optic_Hamr								{ quality = 3; price = 2200; }; 
	class optic_Holosight							{ quality = 1; price = 450; };
	class optic_Holosight_smg						{ quality = 1; price = 450; };
	class optic_KHS_blk								{ quality = 5; price = 8300; };
	class optic_KHS_hex								{ quality = 5; price = 8300; };
	class optic_KHS_old								{ quality = 5; price = 8300; };
	class optic_KHS_tan								{ quality = 5; price = 8300; };
	class optic_MRCO								{ quality = 1; price = 1100; };
	class optic_MRD									{ quality = 1; price = 350; };
	class optic_Yorris								{ quality = 1; price = 350; };
	class Exile_Item_Rope							{ quality = 1; price = 20; };
	class Exile_Item_DuctTape						{ quality = 1; price = 30; };
	class Exile_Item_ExtensionCord					{ quality = 1; price = 10; };
	class Exile_Item_FuelCanisterEmpty				{ quality = 1; price = 40; };
	class Exile_Item_JunkMetal						{ quality = 1; price = 10; sellPrice = 4; }; 
	class Exile_Item_LightBulb						{ quality = 1; price = 2; };
	class Exile_Item_WoodLog						{ quality = 1; price = 5; sellPrice = 1; };
	class Exile_Item_MetalBoard						{ quality = 1; price = 50; };
	class Exile_Item_SafeKit						{ quality = 4; price = 5000; };
	class Exile_Item_CodeLock						{ quality = 1; price = 1000; };
	class Exile_Item_Laptop							{ quality = 5; price = 9000; };
	class Exile_Item_BaseCameraKit					{ quality = 5; price = 5000; };
	class Exile_Item_CamoTentKit					{ quality = 1; price = 250; };
	class Exile_Item_MetalPole						{ quality = 1; price = 30; };
	class Exile_Item_MetalScrews					{ quality = 1; price = 20; };
	class Exile_Item_MetalWire						{ quality = 1; price = 100; };
	class Exile_Item_Cement							{ quality = 1; price = 20; };
	class Exile_Item_Sand							{ quality = 1; price = 20; };
	class Exile_Item_CarWheel						{ quality = 1; price = 100; };
	class Exile_Item_SprayCan_Black				{ quality = 2; price = 20; };
	class Exile_Item_SprayCan_Red					{ quality = 2; price = 20; };
	class Exile_Item_SprayCan_Green				{ quality = 2; price = 20; };
	class Exile_Item_SprayCan_White				{ quality = 2; price = 20; };
	class Exile_Item_SprayCan_Blue				{ quality = 2; price = 20; };
	class Exile_Item_BurlapSack					{ quality = 2; price = 5; };
	class Exile_Item_Bullets_556					{ quality = 2; price = 5; };
	class Exile_Item_Bullets_762					{ quality = 2; price = 5; };
	class Exile_Item_WeaponParts					{ quality = 2; price = 20; };
	class Exile_Item_SheepSteak_Cooked				{ quality = 4; price = 230; }; 
	class Exile_Item_AlsatianSteak_Cooked			{ quality = 4; price = 230; }; 
	class Exile_Item_CatSharkFilet_Cooked			{ quality = 4; price = 230; }; 
	class Exile_Item_FinSteak_Cooked				{ quality = 4; price = 230; }; 
	class Exile_Item_GoatSteak_Cooked				{ quality = 4; price = 230; }; 
	class Exile_Item_TurtleFilet_Cooked				{ quality = 4; price = 230; }; 
	class Exile_Item_TunaFilet_Cooked				{ quality = 3; price = 220; }; 
	class Exile_Item_RabbitSteak_Cooked				{ quality = 3; price = 215; }; 
	class Exile_Item_EMRE							{ quality = 3; price = 54; }; 
	class Exile_Item_ChickenFilet_Cooked			{ quality = 3; price = 205; }; 
	class Exile_Item_RoosterFilet_Cooked			{ quality = 3; price = 205; }; 
	class Exile_Item_MulletFilet_Cooked				{ quality = 3; price = 200; }; 
	class Exile_Item_SalemaFilet_Cooked				{ quality = 3; price = 200; }; 
	class Exile_Item_GloriousKnakworst				{ quality = 3; price = 40; }; 
	class Exile_Item_MackerelFilet_Cooked			{ quality = 3; price = 190; }; 
	class Exile_Item_Surstromming					{ quality = 3; price = 34; }; 
	class Exile_Item_SausageGravy					{ quality = 3; price = 30; }; 
	class Exile_Item_OrnateFilet_Cooked				{ quality = 3; price = 180; }; 
	class Exile_Item_SnakeFilet_Cooked				{ quality = 3; price = 180; }; 
	class Exile_Item_Catfood						{ quality = 2; price = 24; }; 
	class Exile_Item_ChristmasTinner				{ quality = 3; price = 20; }; 
	class Exile_Item_BBQSandwich					{ quality = 3; price = 20; }; 
	class Exile_Item_MacasCheese					{ quality = 3; price = 20; }; 
	class Exile_Item_Dogfood						{ quality = 2; price = 18; }; 
	class Exile_Item_BeefParts						{ quality = 2; price = 18; }; 
	class Exile_Item_Cheathas						{ quality = 2; price = 18; }; 
	class Exile_Item_CatSharkFilet_Raw				{ quality = 2; price = 125; }; 
	class Exile_Item_Noodles						{ quality = 1; price = 14; }; 
	class Exile_Item_SeedAstics						{ quality = 1; price = 12; }; 
	class Exile_Item_TunaFilet_Raw					{ quality = 2; price = 120; }; 
	class Exile_Item_AlsatianSteak_Raw				{ quality = 2; price = 115; };	
	class Exile_Item_TurtleFilet_Raw				{ quality = 2; price = 115; }; 
	class Exile_Item_SheepSteak_Raw					{ quality = 2; price = 115; }; 
	class Exile_Item_FinSteak_Raw					{ quality = 2; price = 115; }; 
	class Exile_Item_GoatSteak_Raw					{ quality = 2; price = 115; }; 
	class Exile_Item_Raisins						{ quality = 1; price = 10; }; 
	class Exile_Item_ChickenFilet_Raw				{ quality = 2; price = 110; }; 
	class Exile_Item_RoosterFilet_Raw				{ quality = 2; price = 110; }; 
	class Exile_Item_Moobar							{ quality = 1; price = 8; }; 
	class Exile_Item_InstantCoffee					{ quality = 1; price = 20; }; 
	class Exile_Item_MackerelFilet_Raw				{ quality = 2; price = 108; }; 
	class Exile_Item_MulletFilet_Raw				{ quality = 2; price = 108; }; 
	class Exile_Item_OrnateFilet_Raw				{ quality = 2; price = 108; }; 
	class Exile_Item_RabbitSteak_Raw				{ quality = 2; price = 108; }; 
	class Exile_Item_SalemaFilet_Raw				{ quality = 2; price = 108; }; 
	class Exile_Item_SnakeFilet_Raw					{ quality = 2; price = 108; }; 
	class Exile_Item_Can_Empty						{ quality = 1; price = 1; sellPrice = 1; };
	class Exile_Item_PlasticBottleCoffee	 		{ quality = 3; price = 70; sellPrice = 10; };
	class Exile_Item_PowerDrink						{ quality = 3; price = 60; }; 
	class Exile_Item_PlasticBottleFreshWater 		{ quality = 2; price = 50; sellPrice = 4; }; 
	class Exile_Item_Beer 							{ quality = 1; price = 50; }; 
	class Exile_Item_EnergyDrink					{ quality = 1; price = 40; }; 
	class Exile_Item_ChocolateMilk					{ quality = 1; price = 25; }; 
	class Exile_Item_MountainDupe					{ quality = 1; price = 30; }; 
	class Exile_Item_PlasticBottleEmpty				{ quality = 1; price = 4; };
	class Exile_Item_InstaDoc                       { quality = 5; price = 150; };
	class Exile_Item_Vishpirin						{ quality = 3; price = 80; };
	class Exile_Item_Bandage	                    { quality = 1; price = 30; sellPrice = 20; };
	class Exile_Item_Heatpack	                    { quality = 1; price = 50; };
	class Exile_Item_Matches 						{ quality = 1; price = 5; };
	class Exile_Item_CookingPot						{ quality = 2; price = 10; };
	class Exile_Melee_Axe							{ quality = 2; price = 100; };
	class Exile_Melee_SledgeHammmer					{ quality = 3; price = 150; };
	class Exile_Item_CanOpener						{ quality = 1; price = 10; };
	class Exile_Item_Handsaw						{ quality = 2; price = 50; };
	class Exile_Item_Pliers							{ quality = 2; price = 20; };
	class Exile_Item_Grinder						{ quality = 2; price = 150; };
	class Exile_Item_Foolbox						{ quality = 2; price = 200; };
	class Exile_Item_CordlessScrewdriver			{ quality = 1; price = 150; };
	class Exile_Item_FireExtinguisher				{ quality = 1; price = 100; };
	class Exile_Item_Hammer							{ quality = 1; price = 20; };
	class Exile_Item_OilCanister					{ quality = 1; price = 50; };
	class Exile_Item_Screwdriver					{ quality = 1; price = 20; };
	class Exile_Item_Shovel							{ quality = 1; price = 100; };
	class ExileLife_Item_Hoe						{ quality = 1; price = 100; };
	class Exile_Item_Wrench							{ quality = 1; price = 50; };
	class Exile_Item_ToiletPaper					{ quality = 1; price = 2; };
	class Exile_Item_ZipTie							{ quality = 3; price = 250; };
	class ItemWatch									{ quality = 1; price = 2; };
	class ItemGPS									{ quality = 2; price = 40; };
	class ItemMap									{ quality = 1; price = 2; };
	class ItemCompass								{ quality = 1; price = 6; };
	class ItemRadio									{ quality = 1; price = 40; };
	class Binocular									{ quality = 1; price = 40; };
	class Rangefinder								{ quality = 3; price = 600; };
	class Laserdesignator							{ quality = 6; price = 750; };
	class Laserdesignator_02						{ quality = 6; price = 750; };
	class Laserdesignator_03						{ quality = 6; price = 750; };
	class NVGoggles									{ quality = 2; price = 500; };
	class NVGoggles_INDEP							{ quality = 2; price = 500; };
	class NVGoggles_OPFOR							{ quality = 2; price = 500; };
	class Exile_Item_XM8							{ quality = 2; price = 20; };
	class Exile_Item_MobilePhone					{ quality = 6; price = 500; };
	class ExileLife_Mask_GasMask					{ quality = 4; price = 1500; };
	class V_RebreatherB								{ quality = 2; price = 250; };
	class V_RebreatherIA							{ quality = 2; price = 250; };
	class V_RebreatherIR							{ quality = 2; price = 250; };
	class B_Parachute								{ quality = 3; price = 150; };
	class H_CrewHelmetHeli_B						{ quality = 3; price = 150; };
	class H_CrewHelmetHeli_I						{ quality = 3; price = 150; };
	class H_CrewHelmetHeli_O						{ quality = 3; price = 150; };
	class H_HelmetCrew_I							{ quality = 3; price = 100; };
	class H_HelmetCrew_B							{ quality = 3; price = 100; };
	class H_HelmetCrew_O							{ quality = 3; price = 100; };
	class H_PilotHelmetHeli_B						{ quality = 4; price = 100; };
	class H_PilotHelmetHeli_I						{ quality = 4; price = 100; };
	class H_PilotHelmetHeli_O						{ quality = 4; price = 100; };
	class U_B_HeliPilotCoveralls					{ quality = 4; price = 80; };
	class U_B_PilotCoveralls						{ quality = 2; price = 60; };
	class U_I_HeliPilotCoveralls					{ quality = 2; price = 60; };
	class U_I_pilotCoveralls						{ quality = 2; price = 60; };
	class U_O_PilotCoveralls						{ quality = 2; price = 60; };
	class H_PilotHelmetFighter_B					{ quality = 5; price = 150; };
	class H_PilotHelmetFighter_I					{ quality = 5; price = 150; };
	class H_PilotHelmetFighter_O					{ quality = 5; price = 150; };
	class B_HuntingBackpack							{ quality = 3; price = 70; };
	class B_OutdoorPack_blk							{ quality = 1; price = 80; };
	class B_OutdoorPack_blu							{ quality = 1; price = 80; };
	class B_OutdoorPack_tan							{ quality = 1; price = 80; };
	class B_AssaultPack_blk							{ quality = 1; price = 90; };
	class B_AssaultPack_cbr							{ quality = 1; price = 90; };
	class B_AssaultPack_dgtl						{ quality = 1; price = 90; };
	class B_AssaultPack_khk							{ quality = 1; price = 90; };
	class B_AssaultPack_mcamo						{ quality = 1; price = 90; };
	class B_AssaultPack_rgr							{ quality = 1; price = 90; };
	class B_AssaultPack_sgg							{ quality = 1; price = 90; };
	class B_FieldPack_blk							{ quality = 2; price = 120; };
	class B_FieldPack_cbr							{ quality = 2; price = 120; };
	class B_FieldPack_ocamo							{ quality = 2; price = 120; };
	class B_FieldPack_oucamo						{ quality = 2; price = 120; };
	class B_TacticalPack_blk						{ quality = 2; price = 150; };
	class B_TacticalPack_rgr						{ quality = 2; price = 150; };
	class B_TacticalPack_ocamo						{ quality = 2; price = 150; };
	class B_TacticalPack_mcamo						{ quality = 2; price = 150; };
	class B_TacticalPack_oli						{ quality = 2; price = 150; };
	class B_Kitbag_cbr								{ quality = 3; price = 200; };
	class B_Kitbag_mcamo							{ quality = 3; price = 200; };
	class B_Kitbag_sgg								{ quality = 3; price = 200; };
	class B_Bergen_blk								{ quality = 3; price = 200; };
	class B_Bergen_mcamo							{ quality = 3; price = 200; };
	class B_Bergen_rgr								{ quality = 3; price = 200; };
	class B_Bergen_sgg								{ quality = 3; price = 200; };
	class B_Carryall_cbr							{ quality = 4; price = 300; };
	class B_Carryall_khk							{ quality = 4; price = 300; };
	class B_Carryall_mcamo							{ quality = 4; price = 300; };
	class B_Carryall_ocamo							{ quality = 4; price = 300; };
	class B_Carryall_oli							{ quality = 4; price = 300; };
	class B_Carryall_oucamo							{ quality = 4; price = 300; };
	class 100Rnd_65x39_caseless_mag 						{ quality = 2; price = 30; };
	class 100Rnd_65x39_caseless_mag_Tracer 					{ quality = 2; price = 40; };
	class 10Rnd_127x54_Mag 									{ quality = 4; price = 30; };
	class 10Rnd_338_Mag 									{ quality = 5; price = 30; };
	class 10Rnd_762x54_Mag 									{ quality = 3; price = 30; };
	class 10Rnd_93x64_DMR_05_Mag 							{ quality = 4; price = 40; };
	class 11Rnd_45ACP_Mag 									{ quality = 1; price = 8; };
	class 150Rnd_762x54_Box 								{ quality = 3; price = 20; };
	class 150Rnd_762x54_Box_Tracer 							{ quality = 3; price = 30; };
	class 16Rnd_9x21_Mag 									{ quality = 1; price = 20; };
	class 200Rnd_65x39_cased_Box 							{ quality = 2; price = 30; };
	class 200Rnd_65x39_cased_Box_Tracer 					{ quality = 2; price = 30; };
	class 150Rnd_93x64_Mag 									{ quality = 6; price = 50; };
	class 130Rnd_338_Mag 									{ quality = 5; price = 40; };
	class 20Rnd_556x45_UW_mag 								{ quality = 1; price = 20; };
	class 20Rnd_762x51_Mag 									{ quality = 2; price = 20; };
	class 30Rnd_45ACP_Mag_SMG_01 							{ quality = 1; price = 10; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Green 				{ quality = 1; price = 10; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow				{ quality = 1; price = 10; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Red					{ quality = 1; price = 10; };
	class 30Rnd_556x45_Stanag 								{ quality = 1; price = 20; };
	class 30Rnd_556x45_Stanag_Tracer_Green 					{ quality = 1; price = 20; };
	class 30Rnd_556x45_Stanag_green  						{ quality = 1; price = 20; };
	class 30Rnd_556x45_Stanag_Tracer_Red 					{ quality = 1; price = 20; };
	class 30Rnd_556x45_Stanag_Tracer_Yellow 				{ quality = 1; price = 20; };
	class 30Rnd_556x45_Stanag_red 							{ quality = 1; price = 20; };
	class 30Rnd_65x39_caseless_green 						{ quality = 2; price = 20; };
	class 30Rnd_65x39_caseless_green_mag_Tracer 			{ quality = 2; price = 30; };
	class 30Rnd_65x39_caseless_mag 							{ quality = 2; price = 20; };
	class 30Rnd_65x39_caseless_mag_Tracer 					{ quality = 2; price = 30; };
	class 30Rnd_9x21_Mag 									{ quality = 1; price = 40; };
	class 30Rnd_9x21_Yellow_Mag								{ quality = 1; price = 40; };
	class 30Rnd_9x21_Green_Mag								{ quality = 1; price = 40; };
	class 30Rnd_9x21_Red_Mag								{ quality = 1; price = 40; };
	class 5Rnd_127x108_APDS_Mag 							{ quality = 6; price = 50; };
	class 5Rnd_127x108_Mag 									{ quality = 6; price = 40; };
	class 6Rnd_45ACP_Cylinder 								{ quality = 1; price = 8; };
	class 6Rnd_GreenSignal_F 								{ quality = 1; price = 30; };
	class 6Rnd_RedSignal_F 									{ quality = 1; price = 30; };
	class 7Rnd_408_Mag 										{ quality = 6; price = 10; };
	class 9Rnd_45ACP_Mag 									{ quality = 1; price = 6; };
	class Exile_Magazine_5Rnd_127x108_Bullet_Cam_Mag 			{ quality = 6; price = 40 +  5 * 20; };
	class Exile_Magazine_5Rnd_127x108_APDS_Bullet_Cam_Mag 		{ quality = 6; price = 40 +  5 * 20; };
	class Exile_Magazine_10Rnd_93x64_DMR_05_Bullet_Cam_Mag 		{ quality = 6; price = 40 + 10 * 20; };
	class Exile_Magazine_7Rnd_408_Bullet_Cam_Mag 				{ quality = 6; price = 10 +  7 * 20; };
	class Exile_Magazine_10Rnd_338_Bullet_Cam_Mag 				{ quality = 6; price = 30 + 10 * 20; };
	class Exile_Magazine_10Rnd_127x99_m107_Bullet_Cam_Mag 		{ quality = 6; price = 40 + 10 * 20; };
	class Exile_Magazine_5Rnd_127x108_KSVK_Bullet_Cam_Mag 		{ quality = 6; price = 40 +  5 * 20; };
	class Exile_Magazine_5Rnd_127x108_APDS_KSVK_Bullet_Cam_Mag 	{ quality = 6; price = 40 +  5 * 20; };
	class Chemlight_blue							{ quality = 1; price = 2; };
	class Chemlight_green							{ quality = 1; price = 2; };
	class Chemlight_red								{ quality = 1; price = 2; };
	class FlareGreen_F								{ quality = 1; price = 6; };
	class FlareRed_F								{ quality = 1; price = 6; };
	class FlareWhite_F								{ quality = 1; price = 6; };
	class FlareYellow_F								{ quality = 1; price = 6; };
	class UGL_FlareGreen_F							{ quality = 2; price = 8; };
	class UGL_FlareRed_F							{ quality = 2; price = 8; };
	class UGL_FlareWhite_F							{ quality = 2; price = 8; };
	class UGL_FlareYellow_F							{ quality = 2; price = 8; };
	class 3Rnd_UGL_FlareGreen_F						{ quality = 3; price = 8*3; };
	class 3Rnd_UGL_FlareRed_F						{ quality = 3; price = 8*3; };
	class 3Rnd_UGL_FlareWhite_F						{ quality = 3; price = 8*3; };
	class 3Rnd_UGL_FlareYellow_F					{ quality = 3; price = 8*3; };
	class SmokeShell								{ quality = 1; price = 6; };
	class SmokeShellBlue							{ quality = 1; price = 6; };
	class SmokeShellGreen							{ quality = 1; price = 6; };
	class SmokeShellOrange							{ quality = 1; price = 6; };
	class SmokeShellPurple							{ quality = 1; price = 6; };
	class SmokeShellRed								{ quality = 1; price = 6; };
	class SmokeShellYellow							{ quality = 1; price = 6; };
	class 1Rnd_Smoke_Grenade_shell					{ quality = 2; price = 8; };
	class 1Rnd_SmokeBlue_Grenade_shell				{ quality = 2; price = 8; };
	class 1Rnd_SmokeGreen_Grenade_shell				{ quality = 2; price = 8; };
	class 1Rnd_SmokeOrange_Grenade_shell			{ quality = 2; price = 8; };
	class 1Rnd_SmokePurple_Grenade_shell			{ quality = 2; price = 8; };
	class 1Rnd_SmokeRed_Grenade_shell				{ quality = 2; price = 8; };
	class 1Rnd_SmokeYellow_Grenade_shell			{ quality = 2; price = 8; };
	class 3Rnd_Smoke_Grenade_shell					{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeBlue_Grenade_shell				{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeGreen_Grenade_shell				{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeOrange_Grenade_shell			{ quality = 3; price = 8*3; };
	class 3Rnd_SmokePurple_Grenade_shell			{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeRed_Grenade_shell				{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeYellow_Grenade_shell			{ quality = 3; price = 8*3; };
	class HandGrenade								{ quality = 3; price = 140; };
	class MiniGrenade								{ quality = 2; price = 130; };
	class B_IR_Grenade								{ quality = 1; price = 150; };
	class O_IR_Grenade								{ quality = 1; price = 150; };
	class I_IR_Grenade								{ quality = 1; price = 150; };
	class 1Rnd_HE_Grenade_shell						{ quality = 2; price = 170; };
	class 3Rnd_HE_Grenade_shell						{ quality = 3; price = 170*3; };
	class APERSBoundingMine_Range_Mag				{ quality = 3; price = 1500; };
	class APERSMine_Range_Mag						{ quality = 3; price = 1600; };
	class APERSTripMine_Wire_Mag					{ quality = 3; price = 1300; };
	class ClaymoreDirectionalMine_Remote_Mag		{ quality = 3; price = 2350; };
	class DemoCharge_Remote_Mag						{ quality = 4; price = 3700; };
	class IEDLandBig_Remote_Mag						{ quality = 3; price = 3600; };
	class IEDLandSmall_Remote_Mag					{ quality = 3; price = 3300; };
	class IEDUrbanBig_Remote_Mag					{ quality = 3; price = 3800; };
	class IEDUrbanSmall_Remote_Mag					{ quality = 3; price = 3400; };
	class SatchelCharge_Remote_Mag					{ quality = 5; price = 5000; };
	class SLAMDirectionalMine_Wire_Mag				{ quality = 3; price = 3700; };
	class hgun_ACPC2_F 								{ quality = 1; price = 500; };
	class hgun_P07_F 								{ quality = 1; price = 500; };
	class hgun_Pistol_heavy_01_F 					{ quality = 2; price = 800; };
	class hgun_Pistol_heavy_02_F 					{ quality = 2; price = 800; };
	class hgun_Pistol_Signal_F 						{ quality = 1; price = 1000; };
	class hgun_Rook40_F 							{ quality = 1; price = 500; };
	class hgun_PDW2000_F 							{ quality = 1; price = 1000; };
	class SMG_01_F 									{ quality = 1; price = 1500; };
	class SMG_02_F 									{ quality = 1; price = 1500; };
	class arifle_MX_SW_Black_F						{ quality = 2; price = 2500; };
	class arifle_MX_SW_F							{ quality = 2; price = 2500; };
	class LMG_Mk200_F								{ quality = 2; price = 3000; };
	class LMG_Zafir_F								{ quality = 3; price = 3500; };
	class MMG_01_hex_F								{ quality = 6; price = 8000; };
	class MMG_01_tan_F								{ quality = 6; price = 8000; };
	class MMG_02_black_F							{ quality = 6; price = 4500; };
	class MMG_02_camo_F								{ quality = 5; price = 4500; };
	class MMG_02_sand_F								{ quality = 5; price = 4500; };
	class arifle_Katiba_C_F							{ quality = 2; price = 1500; };
	class arifle_Katiba_F							{ quality = 2; price = 1500; };
	class arifle_Katiba_GL_F						{ quality = 2; price = 2000; };
	class arifle_Mk20_F								{ quality = 1; price = 1500; };
	class arifle_Mk20_GL_F							{ quality = 1; price = 2000; };
	class arifle_Mk20_GL_plain_F					{ quality = 1; price = 2000; };
	class arifle_Mk20_plain_F						{ quality = 1; price = 1500; };
	class arifle_Mk20C_F							{ quality = 1; price = 1500; };
	class arifle_Mk20C_plain_F						{ quality = 1; price = 1500; };
	class arifle_MX_Black_F							{ quality = 2; price = 4500; };
	class arifle_MX_F								{ quality = 2; price = 4500; };
	class arifle_MX_GL_Black_F						{ quality = 2; price = 4500; };
	class arifle_MX_GL_F							{ quality = 2; price = 4500; };
	class arifle_MXC_Black_F						{ quality = 2; price = 3500; };
	class arifle_MXC_F								{ quality = 2; price = 3500; };
	class arifle_SDAR_F								{ quality = 1; price = 6500; };
	class arifle_TRG20_F							{ quality = 1; price = 2500; };
	class arifle_TRG21_F							{ quality = 1; price = 2500; };
	class arifle_TRG21_GL_F							{ quality = 1; price = 3500; };
	class arifle_MXM_Black_F 						{ quality = 2; price = 5500; };
	class arifle_MXM_F 								{ quality = 2; price = 5500; };
	class srifle_DMR_01_F 							{ quality = 3; price = 6000; };
	class srifle_DMR_02_camo_F 						{ quality = 3; price = 8000; };
	class srifle_DMR_02_F 							{ quality = 3; price = 8000; };
	class srifle_DMR_02_sniper_F 					{ quality = 3; price = 8000; };
	class srifle_DMR_03_F 							{ quality = 3; price = 7500; };
	class srifle_DMR_03_khaki_F 					{ quality = 3; price = 7500; };
	class srifle_DMR_03_multicam_F 					{ quality = 3; price = 7500; };
	class srifle_DMR_03_tan_F 						{ quality = 3; price = 7500; };
	class srifle_DMR_03_woodland_F 					{ quality = 3; price = 7500; };
	class srifle_DMR_04_F 							{ quality = 4; price = 7000; };
	class srifle_DMR_04_Tan_F 						{ quality = 4; price = 7000; };
	class srifle_DMR_05_blk_F 						{ quality = 4; price = 8500; };
	class srifle_DMR_05_hex_F 						{ quality = 4; price = 8500; };
	class srifle_DMR_05_tan_f 						{ quality = 4; price = 8500; };
	class srifle_DMR_06_camo_F 						{ quality = 5; price = 8000; };
	class srifle_DMR_06_olive_F 					{ quality = 5; price = 8000; };
	class srifle_EBR_F 								{ quality = 3; price = 7000; };
	class srifle_GM6_camo_F 						{ quality = 6; price = 9000; };
	class srifle_GM6_F 								{ quality = 6; price = 9000; };
	class srifle_LRR_camo_F 						{ quality = 6; price = 8500; };
	class srifle_LRR_F 								{ quality = 6; price = 8500; };
	class Exile_Weapon_AK107						{ quality = 1; price = 3000; };
	class Exile_Weapon_AK107_GL						{ quality = 2; price = 4000; };
	class Exile_Weapon_AK74							{ quality = 2; price = 3500; };
	class Exile_Weapon_AK74_GL						{ quality = 2; price = 4000; };
	class Exile_Weapon_AK47							{ quality = 3; price = 5000; };
	class Exile_Weapon_AKM							{ quality = 3; price = 5000; };
	class Exile_Weapon_AKS							{ quality = 3; price = 5000; };
	class Exile_Weapon_AKS_Gold						{ quality = 3; price = 5500; };
	class Exile_Weapon_DMR							{ quality = 3; price = 6500; };
	class Exile_Weapon_LeeEnfield					{ quality = 1; price = 900; }; 
	class Exile_Weapon_CZ550						{ quality = 2; price = 4000; };
	class Exile_Weapon_SVD							{ quality = 4; price = 8000; };
	class Exile_Weapon_SVDCamo						{ quality = 4; price = 8500; };
	class Exile_Weapon_VSSVintorez					{ quality = 3; price = 6000; };
	class Exile_Weapon_RPK							{ quality = 2; price = 2500; };
	class Exile_Weapon_PK							{ quality = 3; price = 3000; };
	class Exile_Weapon_PKP							{ quality = 3; price = 3500; };
	class Exile_Weapon_Colt1911						{ quality = 1; price = 400; };
	class Exile_Weapon_Makarov						{ quality = 1; price = 400; };
	class Exile_Weapon_Taurus						{ quality = 1; price = 400; };
	class Exile_Weapon_TaurusGold					{ quality = 1; price = 450; };
	class Exile_Weapon_M1014						{ quality = 2; price = 600; };
	class Exile_Weapon_SA61							{ quality = 1; price = 150; };
	class Exile_Weapon_m107							{ quality = 5; price = 850; };
	class Exile_Weapon_ksvk							{ quality = 5; price = 850; };
	class Exile_Weapon_M4							{ quality = 2; price = 300; };
	class Exile_Weapon_M16A4						{ quality = 2; price = 350; };
	class Exile_Weapon_M16A2						{ quality = 1; price = 300; };
	class Exile_Magazine_30Rnd_762x39_AK				{ quality = 3; price = 20; };
	class Exile_Magazine_30Rnd_545x39_AK				{ quality = 1; price = 20; };
	class Exile_Magazine_30Rnd_545x39_AK_Green			{ quality = 1; price = 20; };
	class Exile_Magazine_30Rnd_545x39_AK_Red			{ quality = 1; price = 20; };
	class Exile_Magazine_30Rnd_545x39_AK_White			{ quality = 1; price = 20; };
	class Exile_Magazine_30Rnd_545x39_AK_Yellow			{ quality = 1; price = 20; };
	class Exile_Magazine_45Rnd_545x39_RPK_Green			{ quality = 1; price = 20; };
	class Exile_Magazine_75Rnd_545x39_RPK_Green			{ quality = 1; price = 20; };
	class Exile_Magazine_20Rnd_762x51_DMR				{ quality = 3; price = 20; };
	class Exile_Magazine_20Rnd_762x51_DMR_Yellow		{ quality = 3; price = 20; };
	class Exile_Magazine_20Rnd_762x51_DMR_Red			{ quality = 3; price = 20; };
	class Exile_Magazine_20Rnd_762x51_DMR_Green			{ quality = 3; price = 20; };
	class Exile_Magazine_10Rnd_303						{ quality = 1; price = 20; };
	class Exile_Magazine_100Rnd_762x54_PK_Green			{ quality = 3; price = 20; };
	class Exile_Magazine_7Rnd_45ACP						{ quality = 1; price = 20; };
	class Exile_Magazine_8Rnd_9x18						{ quality = 1; price = 20; };
	class Exile_Magazine_6Rnd_45ACP						{ quality = 1; price = 20; };
	class Exile_Magazine_5Rnd_22LR						{ quality = 1; price = 20; };
	class Exile_Magazine_10Rnd_762x54					{ quality = 1; price = 20; };
	class Exile_Magazine_10Rnd_9x39						{ quality = 1; price = 20; };
	class Exile_Magazine_20Rnd_9x39						{ quality = 1; price = 20; };
	class Exile_Magazine_8Rnd_74Slug					{ quality = 1; price = 20; };
	class Exile_Magazine_8Rnd_74Pellets					{ quality = 1; price = 20; }; 
	class Exile_Magazine_10Rnd_765x17_SA61				{ quality = 1; price = 10; };
	class Exile_Magazine_20Rnd_765x17_SA61				{ quality = 1; price = 20; };
	class Exile_Magazine_10Rnd_127x99_m107				{ quality = 3; price = 30; };
	class Exile_Magazine_5Rnd_127x108_APDS_KSVK			{ quality = 3; price = 40; };
	class Exile_Magazine_5Rnd_127x108_KSVK				{ quality = 3; price = 30; };
	class hgun_Pistol_01_F            { quality = 1; price = 650; };
	class hgun_P07_khk_F              { quality = 1; price = 650; };
	class SMG_05_F					  { quality = 1; price = 1500; };
	class LMG_03_F					  { quality = 2; price = 3000; };
	class arifle_MX_khk_F             { quality = 2; price = 4500; };
	class arifle_MX_GL_khk_F          { quality = 2; price = 5000; };
	class arifle_MXC_khk_F            { quality = 2; price = 3500; };
	class arifle_MXM_khk_F            { quality = 2; price = 5000; };
	class srifle_LRR_tna_F            { quality = 6; price = 8500; };
	class srifle_GM6_ghex_F           { quality = 6; price = 9000; };
	class srifle_DMR_07_blk_F         { quality = 4; price = 7500; };
	class srifle_DMR_07_hex_F         { quality = 4; price = 7500; };
	class srifle_DMR_07_ghex_F        { quality = 4; price = 7500; };
	class arifle_AK12_F               { quality = 3; price = 6500; };
	class arifle_AK12_GL_F            { quality = 3; price = 7000; };
	class arifle_AKM_F                { quality = 3; price = 4000; };
	class arifle_AKM_FL_F             { quality = 3; price = 4000; };
	class arifle_AKS_F                { quality = 3; price = 3500; };
	class arifle_ARX_blk_F            { quality = 5; price = 9000; };
	class arifle_ARX_ghex_F           { quality = 5; price = 9000; };
	class arifle_ARX_hex_F            { quality = 5; price = 9000; };
	class arifle_CTAR_blk_F           { quality = 2; price = 4500; };
	class arifle_CTAR_hex_F           { quality = 2; price = 4500; };
	class arifle_CTAR_ghex_F          { quality = 2; price = 4500; };
	class arifle_CTAR_GL_blk_F        { quality = 2; price = 4500; };
	class arifle_CTARS_blk_F          { quality = 2; price = 4500; };
	class arifle_CTARS_ghex_F          { quality = 2; price = 4500; };
	class arifle_CTARS_hex_F          { quality = 2; price = 4500; };
	class arifle_SPAR_01_blk_F        { quality = 1; price = 4000; };
	class arifle_SPAR_01_khk_F        { quality = 1; price = 4000; };
	class arifle_SPAR_01_snd_F        { quality = 1; price = 4000; };
	class arifle_SPAR_01_GL_blk_F     { quality = 1; price = 5000; };
	class arifle_SPAR_01_GL_khk_F     { quality = 1; price = 5000; };
	class arifle_SPAR_01_GL_snd_F     { quality = 1; price = 5000; };
	class arifle_SPAR_02_blk_F        { quality = 2; price = 5500; };
	class arifle_SPAR_02_khk_F        { quality = 2; price = 5500; };
	class arifle_SPAR_02_snd_F        { quality = 2; price = 5500; };
	class arifle_SPAR_03_blk_F        { quality = 3; price = 6000; };
	class arifle_SPAR_03_khk_F        { quality = 3; price = 6000; };
	class arifle_SPAR_03_snd_F        { quality = 3; price = 6000; };
	class muzzle_snds_H_khk_F         { quality = 2; price = 500; };
	class muzzle_snds_H_snd_F         { quality = 2; price = 500; };
	class muzzle_snds_58_blk_F        { quality = 1; price = 200; };
	class muzzle_snds_m_khk_F         { quality = 1; price = 150; };
	class muzzle_snds_m_snd_F         { quality = 1; price = 150; };
	class muzzle_snds_B_khk_F         { quality = 3; price = 500; };
	class muzzle_snds_B_snd_F         { quality = 3; price = 500; };
	class muzzle_snds_58_wdm_F        { quality = 1; price = 200; };
	class muzzle_snds_65_TI_blk_F     { quality = 2; price = 750; };
	class muzzle_snds_65_TI_hex_F     { quality = 2; price = 750; };
	class muzzle_snds_65_TI_ghex_F    { quality = 2; price = 750; };
	class muzzle_snds_H_MG_blk_F      { quality = 2; price = 200; };
	class muzzle_snds_H_MG_khk_F      { quality = 2; price = 200; };
	class optic_Arco_blk_F            { quality = 1; price = 1000; };
	class optic_Arco_ghex_F           { quality = 1; price = 1000; };
	class optic_DMS_ghex_F            { quality = 2; price = 1500; };
	class optic_Hamr_khk_F            { quality = 3; price = 2000; };
	class optic_ERCO_blk_F            { quality = 1; price = 1250; };
	class optic_ERCO_khk_F            { quality = 1; price = 1250; };
	class optic_ERCO_snd_F            { quality = 1; price = 1250; };
	class optic_SOS_khk_F             { quality = 2; price = 2000; };
	class optic_LRPS_tna_F            { quality = 5; price = 3000; };
	class optic_LRPS_ghex_F           { quality = 5; price = 3000; };
	class optic_Holosight_blk_F       { quality = 1; price = 500; };
	class optic_Holosight_khk_F       { quality = 1; price = 500; };
	class optic_Holosight_smg_blk_F   { quality = 1; price = 500; };
	class bipod_01_F_khk              { quality = 2; price = 100; };
	class O_NVGoggles_hex_F           { quality = 3; price = 1500; };
	class O_NVGoggles_urb_F           { quality = 3; price = 1500; };
	class O_NVGoggles_ghex_F          { quality = 3; price = 1500; };
	class NVGoggles_tna_F             { quality = 2; price = 1000; };
	class U_B_T_Soldier_F             { quality = 2; price = 40; };
	class U_B_T_Soldier_AR_F          { quality = 2; price = 40; };
	class U_B_T_Soldier_SL_F          { quality = 2; price = 40; };
	class U_B_T_Sniper_F              { quality = 3; price = 100; };
	class U_B_T_FullGhillie_tna_F     { quality = 4; price = 150; };
	class U_B_CTRG_Soldier_F          { quality = 2; price = 40; };
	class U_B_CTRG_Soldier_2_F        { quality = 2; price = 40; };
	class U_B_CTRG_Soldier_3_F        { quality = 2; price = 40; };
	class U_B_GEN_Soldier_F           { quality = 2; price = 35; };
	class U_B_GEN_Commander_F         { quality = 2; price = 35; };
	class U_O_T_Soldier_F             { quality = 2; price = 40; };
	class U_O_T_Officer_F             { quality = 3; price = 40; };
	class U_O_T_Sniper_F              { quality = 3; price = 100; };
	class U_O_T_FullGhillie_tna_F     { quality = 4; price = 150; };
	class U_O_V_Soldier_Viper_F       { quality = 4; price = 150; };
	class U_O_V_Soldier_Viper_hex_F   { quality = 4; price = 150; };
	class U_I_C_Soldier_Para_1_F      { quality = 2; price = 30; };
	class U_I_C_Soldier_Para_2_F      { quality = 2; price = 30; };
	class U_I_C_Soldier_Para_3_F      { quality = 2; price = 30; };
	class U_I_C_Soldier_Para_4_F      { quality = 2; price = 30; };
	class U_I_C_Soldier_Para_5_F      { quality = 2; price = 30; };
	class U_I_C_Soldier_Bandit_1_F    { quality = 1; price = 15; };
	class U_I_C_Soldier_Bandit_2_F    { quality = 1; price = 15; };
	class U_I_C_Soldier_Bandit_3_F    { quality = 1; price = 15; };
	class U_I_C_Soldier_Bandit_4_F    { quality = 1; price = 15; };
	class U_I_C_Soldier_Bandit_5_F    { quality = 1; price = 15; };
	class U_I_C_Soldier_Camo_F        { quality = 2; price = 30; };
	class U_C_man_sport_1_F           { quality = 1; price = 10; };
	class U_C_man_sport_2_F           { quality = 1; price = 10; };
	class U_C_man_sport_3_F           { quality = 1; price = 10; };
	class U_C_Man_casual_1_F          { quality = 1; price = 10; };
	class U_C_Man_casual_2_F          { quality = 1; price = 10; };
	class U_C_Man_casual_3_F          { quality = 1; price = 10; };
	class U_C_Man_casual_4_F          { quality = 1; price = 10; };
	class U_C_Man_casual_5_F          { quality = 1; price = 10; };
	class U_C_Man_casual_6_F          { quality = 1; price = 10; };
	class U_B_CTRG_Soldier_urb_1_F    { quality = 2; price = 40; };
	class U_B_CTRG_Soldier_urb_2_F    { quality = 2; price = 40; };
	class U_B_CTRG_Soldier_urb_3_F    { quality = 2; price = 40; };
	class H_Helmet_Skate              { quality = 2; price = 20; };
	class H_HelmetB_TI_tna_F          { quality = 4; price = 100; };
	class H_HelmetB_tna_F             { quality = 3; price = 50; };
	class H_HelmetB_Enh_tna_F         { quality = 4; price = 100; };
	class H_HelmetB_Light_tna_F       { quality = 2; price = 20; };
	class H_HelmetSpecO_ghex_F        { quality = 5; price = 100; };
	class H_HelmetLeaderO_ghex_F      { quality = 5; price = 175; };
	class H_HelmetO_ghex_F            { quality = 5; price = 75; };
	class H_HelmetCrew_O_ghex_F       { quality = 3; price = 75; };
	class H_MilCap_tna_F              { quality = 1; price = 8; };
	class H_MilCap_ghex_F             { quality = 1; price = 8; };
	class H_Booniehat_tna_F           { quality = 1; price = 4; };
	class H_Beret_gen_F               { quality = 2; price = 12; };
	class H_MilCap_gen_F              { quality = 1; price = 10; };
	class H_Cap_oli_Syndikat_F        { quality = 1; price = 6; };
	class H_Cap_tan_Syndikat_F        { quality = 1; price = 6; };
	class H_Cap_blk_Syndikat_F        { quality = 1; price = 6; };
	class H_Cap_grn_Syndikat_F        { quality = 1; price = 6; };
	class H_FakeHeadgear_Syndikat_F   { quality = 1; price = 6; };
	class V_TacChestrig_grn_F         { quality = 1; price = 15; };
	class V_TacChestrig_oli_F         { quality = 1; price = 15; };
	class V_TacChestrig_cbr_F         { quality = 1; price = 15; };
	class V_PlateCarrier1_tna_F       { quality = 3; price = 50; };
	class V_PlateCarrier2_tna_F       { quality = 3; price = 60; };
	class V_PlateCarrierSpec_tna_F    { quality = 5; price = 100; };
	class V_PlateCarrierGL_tna_F      { quality = 6; price = 500; };
	class V_HarnessO_ghex_F           { quality = 2; price = 50; };
	class V_HarnessOGL_ghex_F         { quality = 1; price = 30; };
	class V_BandollierB_ghex_F        { quality = 1; price = 10; };
	class V_TacVest_gen_F             { quality = 1; price = 25; };
	class V_PlateCarrier1_rgr_noflag_F		{ quality = 2; price = 50; };
	class V_PlateCarrier2_rgr_noflag_F		{ quality = 2; price = 60; };
	class B_Bergen_Base_F					{ quality = 5; price = 400; };
	class B_Bergen_mcamo_F                  { quality = 5; price = 400; };
	class B_Bergen_dgtl_F                   { quality = 5; price = 400; };
	class B_Bergen_hex_F                    { quality = 5; price = 400; };
	class B_Bergen_tna_F                    { quality = 5; price = 400; };
	class B_AssaultPack_tna_F               { quality = 1; price = 90; };
	class B_Carryall_ghex_F                 { quality = 4; price = 300; };
	class B_FieldPack_ghex_F                { quality = 2; price = 120; };
	class B_ViperHarness_base_F             { quality = 3; price = 250; };
	class B_ViperHarness_blk_F              { quality = 3; price = 250; };
	class B_ViperHarness_ghex_F             { quality = 3; price = 250; };
	class B_ViperHarness_hex_F              { quality = 3; price = 250; };
	class B_ViperHarness_khk_F              { quality = 3; price = 250; };
	class B_ViperHarness_oli_F              { quality = 3; price = 250; };
	class B_ViperLightHarness_base_F        { quality = 2; price = 200; };
	class B_ViperLightHarness_blk_F         { quality = 2; price = 200; };
	class B_ViperLightHarness_ghex_F        { quality = 2; price = 200; };
	class B_ViperLightHarness_hex_F         { quality = 2; price = 200; };
	class B_ViperLightHarness_khk_F         { quality = 2; price = 200; };
	class B_ViperLightHarness_oli_F         { quality = 2; price = 200; };
	class 30Rnd_9x21_Mag_SMG_02						{quality = 1; price = 10; };
	class 30Rnd_9x21_Mag_SMG_02_Tracer_Red          {quality = 1; price = 15; };
	class 30Rnd_9x21_Mag_SMG_02_Tracer_Yellow       {quality = 1; price = 15; };
	class 30Rnd_9x21_Mag_SMG_02_Tracer_Green        {quality = 1; price = 15; };
	class 30Rnd_580x42_Mag_F                        {quality = 2; price = 15; };
	class 30Rnd_580x42_Mag_Tracer_F                 {quality = 2; price = 15; };
	class 100Rnd_580x42_Mag_F                       {quality = 2; price = 15; };
	class 100Rnd_580x42_Mag_Tracer_F                {quality = 2; price = 15; };
	class 20Rnd_650x39_Cased_Mag_F                  {quality = 4; price = 20; };
	class 10Rnd_50BW_Mag_F                          {quality = 5; price = 35; };
	class 150Rnd_556x45_Drum_Mag_F                  {quality = 2; price = 75; };
	class 150Rnd_556x45_Drum_Mag_Tracer_F           {quality = 2; price = 75; };
	class 30Rnd_762x39_Mag_F                        {quality = 3; price = 25; };
	class 30Rnd_762x39_Mag_Green_F                  {quality = 3; price = 25; };
	class 30Rnd_762x39_Mag_Tracer_F                 {quality = 3; price = 25; };
	class 30Rnd_762x39_Mag_Tracer_Green_F           {quality = 3; price = 25; };
	class 30Rnd_545x39_Mag_F                        {quality = 1; price = 10; };
	class 30Rnd_545x39_Mag_Green_F                  {quality = 1; price = 10; };
	class 30Rnd_545x39_Mag_Tracer_F                 {quality = 1; price = 10; };
	class 30Rnd_545x39_Mag_Tracer_Green_F           {quality = 1; price = 10; };
	class 200Rnd_556x45_Box_F                       {quality = 1; price = 90; };
	class 200Rnd_556x45_Box_Red_F                   {quality = 1; price = 90; };
	class 200Rnd_556x45_Box_Tracer_F                {quality = 1; price = 90; };
	class 200Rnd_556x45_Box_Tracer_Red_F            {quality = 1; price = 90; };
	class 10Rnd_9x21_Mag							{quality = 1; price = 10; };
	class V_DeckCrew_yellow_F						{ quality = 2; price = 30; };
	class V_DeckCrew_blue_F							{ quality = 2; price = 30; };
	class V_DeckCrew_green_F						{ quality = 2; price = 30; };
	class V_DeckCrew_red_F							{ quality = 2; price = 30; };
	class V_DeckCrew_white_F						{ quality = 2; price = 30; };
	class V_DeckCrew_brown_F						{ quality = 2; price = 30; };
	class V_DeckCrew_violet_F						{ quality = 2; price = 30; };
	class Exile_Bike_OldBike 						{ quality = 1; price = 40; };
	class Exile_Bike_MountainBike 					{ quality = 1; price = 50; };
	class Exile_Bike_QuadBike_Black					{ quality = 1; price = 2500; };
	class Exile_Bike_QuadBike_Blue					{ quality = 1; price = 2500; };
	class Exile_Bike_QuadBike_Red					{ quality = 1; price = 2500; };
	class Exile_Bike_QuadBike_White					{ quality = 1; price = 2500; };
	class Exile_Bike_QuadBike_Nato					{ quality = 1; price = 2500; };
	class Exile_Bike_QuadBike_Csat					{ quality = 1; price = 2500; };
	class Exile_Bike_QuadBike_Fia					{ quality = 1; price = 2500; };
	class Exile_Bike_QuadBike_Guerilla01			{ quality = 1; price = 2500; };
	class Exile_Bike_QuadBike_Guerilla02			{ quality = 1; price = 2500; };
	class Exile_Car_Kart_BluKing					{ quality = 1; price = 1100; };
	class Exile_Car_Kart_RedStone					{ quality = 1; price = 1100; };
	class Exile_Car_Kart_Vrana						{ quality = 1; price = 1100; };
	class Exile_Car_Kart_Green						{ quality = 1; price = 1100; };
	class Exile_Car_Kart_Blue						{ quality = 1; price = 1100; };
	class Exile_Car_Kart_Orange						{ quality = 1; price = 1100; };
	class Exile_Car_Kart_White						{ quality = 1; price = 1100; };
	class Exile_Car_Kart_Yellow						{ quality = 1; price = 1100; };
	class Exile_Car_Kart_Black						{ quality = 1; price = 1100; };
	class Exile_Boat_MotorBoat_Police				{ quality = 1; price = 700; };
	class Exile_Boat_MotorBoat_Orange				{ quality = 1; price = 700; };
	class Exile_Boat_MotorBoat_White				{ quality = 1; price = 700; };
	class Exile_Boat_RubberDuck_CSAT				{ quality = 1; price = 500; };
	class Exile_Boat_RubberDuck_Digital				{ quality = 1; price = 500; };
	class Exile_Boat_RubberDuck_Orange				{ quality = 1; price = 500; };
	class Exile_Boat_RubberDuck_Blue				{ quality = 1; price = 500; };
	class Exile_Boat_RubberDuck_Black				{ quality = 1; price = 500; };
	class Exile_Boat_SDV_CSAT						{ quality = 2; price = 11000; };
	class Exile_Boat_SDV_Digital					{ quality = 2; price = 11000; };
	class Exile_Boat_SDV_Grey						{ quality = 2; price = 11000; };
	class Exile_Chopper_Huey_Green 					{ quality = 2; price = 21000; };
	class Exile_Chopper_Huey_Desert					{ quality = 2; price = 21000; };
	class Exile_Chopper_Huey_Armed_Green			{ quality = 2; price = 25000; };
	class Exile_Chopper_Huey_Armed_Desert			{ quality = 2; price = 25000; };
	class Exile_Chopper_Hellcat_Green				{ quality = 3; price = 27500; };
	class Exile_Chopper_Hellcat_FIA					{ quality = 3; price = 27500; };
	class Exile_Chopper_Hummingbird_Green			{ quality = 3; price = 23000; };
	class Exile_Chopper_Hummingbird_Civillian_Blue				{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_Red				{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_ION				{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_BlueLine			{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_Digital			{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_Elliptical		{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_Furious			{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_GrayWatcher		{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_Jeans				{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_Light				{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_Shadow			{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_Sheriff			{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_Speedy			{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_Sunset			{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_Vrana				{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_Wasp				{ quality = 2; price = 17000; };
	class Exile_Chopper_Hummingbird_Civillian_Wave				{ quality = 2; price = 17000; };
	class Exile_Chopper_Huron_Black								{ quality = 5; price = 50000; };
	class Exile_Chopper_Huron_Green								{ quality = 5; price = 50000; };
	class Exile_Chopper_Mohawk_FIA								{ quality = 4; price = 45000; };
	class Exile_Chopper_Orca_CSAT								{ quality = 3; price = 28000; };
	class Exile_Chopper_Orca_Black								{ quality = 3; price = 28000; };
	class Exile_Chopper_Orca_BlackCustom						{ quality = 3; price = 28000; };
	class Exile_Chopper_Taru_Transport_CSAT						{ quality = 3; price = 17000; };
	class Exile_Chopper_Taru_Transport_Black					{ quality = 3; price = 17000; };
	class Exile_Chopper_Taru_CSAT								{ quality = 4; price = 33000; };
	class Exile_Chopper_Taru_Black								{ quality = 4; price = 33000; };
	class Exile_Chopper_Taru_Covered_CSAT						{ quality = 4; price = 43000; };
	class Exile_Chopper_Taru_Covered_Black						{ quality = 4; price = 43000; };
	class Exile_Plane_Cessna									{ quality = 1; price = 16500; };
	class Exile_Plane_AN2_Green									{ quality = 2; price = 17000; };
	class Exile_Plane_AN2_White									{ quality = 2; price = 17000; };
	class Exile_Plane_AN2_Stripe								{ quality = 2; price = 17000; };
	class Exile_Car_Hatchback_Beige						{ quality = 3; price = 12000; };
	class Exile_Car_Hatchback_Green						{ quality = 3; price = 12000; };
	class Exile_Car_Hatchback_Blue						{ quality = 3; price = 12000; };
	class Exile_Car_Hatchback_BlueCustom				{ quality = 3; price = 12000; };
	class Exile_Car_Hatchback_BeigeCustom				{ quality = 3; price = 12000; };
	class Exile_Car_Hatchback_Yellow					{ quality = 3; price = 12000; };
	class Exile_Car_Hatchback_Grey						{ quality = 3; price = 12000; };
	class Exile_Car_Hatchback_Black						{ quality = 3; price = 12000; };
	class Exile_Car_Hatchback_Dark						{ quality = 3; price = 12000; };
	class Exile_Car_Hatchback_Rusty1					{ quality = 3; price = 12000; };
	class Exile_Car_Hatchback_Rusty2					{ quality = 3; price = 12000; };
	class Exile_Car_Hatchback_Rusty3					{ quality = 3; price = 12000; };
	class Exile_Car_Golf_Red							{ quality = 1; price = 8000; };
	class Exile_Car_Golf_Black							{ quality = 1; price = 8000; };
	class Exile_Car_Ikarus_Blue 						{ quality = 1; price = 17000; };
	class Exile_Car_Ikarus_Red 							{ quality = 1; price = 17000; };
	class Exile_Car_Ikarus_Party 						{ quality = 1; price = 17000; };
	class Exile_Car_Ural_Open_Blue						{ quality = 2; price = 25000; };
	class Exile_Car_Ural_Open_Yellow					{ quality = 2; price = 25000; };
	class Exile_Car_Ural_Open_Worker					{ quality = 2; price = 25000; };
	class Exile_Car_Ural_Open_Military					{ quality = 2; price = 25000; };
	class Exile_Car_Ural_Covered_Blue					{ quality = 2; price = 28000; };
	class Exile_Car_Ural_Covered_Yellow					{ quality = 2; price = 28000; };
	class Exile_Car_Ural_Covered_Worker					{ quality = 2; price = 28000; };
	class Exile_Car_Ural_Covered_Military				{ quality = 2; price = 28000; };
	class Exile_Car_V3S_Open							{ quality = 2; price = 28000; };
	class Exile_Car_V3S_Covered							{ quality = 2; price = 28000; };
	class Exile_Car_SUVXL_Black 						{ quality = 3; price = 20000; };
	class Exile_Car_Tractor_Red 						{ quality = 1; price = 2000; };
	class Exile_Car_OldTractor_Red 						{ quality = 1; price = 1200; };
	class Exile_Car_TowTractor_White					{ quality = 1; price = 1800; };
	class Exile_Car_Octavius_White						{ quality = 2; price = 6000; };
	class Exile_Car_Octavius_Black						{ quality = 2; price = 6000; };
	class Exile_Car_UAZ_Green							{ quality = 2; price = 7000; };
	class Exile_Car_UAZ_Open_Green						{ quality = 2; price = 8000; };
	class Exile_Car_LandRover_Red 						{ quality = 3; price = 11000; };
	class Exile_Car_LandRover_Urban 					{ quality = 3; price = 11000; };
	class Exile_Car_LandRover_Green 					{ quality = 3; price = 11000; };
	class Exile_Car_LandRover_Sand 						{ quality = 3; price = 11000; };
	class Exile_Car_LandRover_Desert 					{ quality = 3; price = 11000; };
	class Exile_Car_LandRover_Ambulance_Green			{ quality = 3; price = 12000; };
	class Exile_Car_LandRover_Ambulance_Desert			{ quality = 3; price = 12000; };
	class Exile_Car_LandRover_Ambulance_Sand			{ quality = 3; price = 12000; };
	class Exile_Car_Lada_Green 							{ quality = 2; price = 6000; };
	class Exile_Car_Lada_Taxi 							{ quality = 2; price = 6000; };
	class Exile_Car_Lada_Red 							{ quality = 2; price = 6000; };
	class Exile_Car_Lada_White 							{ quality = 2; price = 6000; };
	class Exile_Car_Lada_Hipster 						{ quality = 2; price = 6000; };
	class Exile_Car_Volha_Blue							{ quality = 2; price = 6000; };
	class Exile_Car_Volha_White							{ quality = 2; price = 6000; };
	class Exile_Car_Volha_Black							{ quality = 2; price = 6000; };
	class Exile_Car_Hatchback_Sport_Red					{ quality = 4; price = 14000; };
	class Exile_Car_Hatchback_Sport_Blue				{ quality = 4; price = 14000; };
	class Exile_Car_Hatchback_Sport_Orange				{ quality = 4; price = 14000; };
	class Exile_Car_Hatchback_Sport_White				{ quality = 4; price = 14000; };
	class Exile_Car_Hatchback_Sport_Beige				{ quality = 4; price = 14000; };
	class Exile_Car_Hatchback_Sport_Green				{ quality = 4; price = 14000; };
	class Exile_Car_HEMMT 								{ quality = 3; price = 48000; };
	class Exile_Car_Hunter 								{ quality = 5; price = 26500; };
	class Exile_Car_Ifrit 								{ quality = 4; price = 23000; };
	class Exile_Car_Offroad_Red							{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Beige						{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_White						{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Blue						{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_DarkRed						{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_BlueCustom					{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Guerilla01					{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Guerilla02					{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Guerilla03					{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Guerilla04					{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Guerilla05					{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Guerilla06					{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Guerilla07					{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Guerilla08					{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Guerilla09					{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Guerilla10					{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Guerilla11					{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Guerilla12					{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Rusty1						{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Rusty2						{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Rusty3						{ quality = 3; price = 16000; };
	class Exile_Car_Offroad_Armed_Guerilla01 			{ quality = 5; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla02 			{ quality = 5; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla03 			{ quality = 5; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla04 			{ quality = 5; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla05 			{ quality = 5; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla06 			{ quality = 5; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla07 			{ quality = 5; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla08 			{ quality = 5; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla09 			{ quality = 5; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla10 			{ quality = 5; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla11 			{ quality = 5; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla12 			{ quality = 5; price = 25000; };
	class Exile_Car_Offroad_Repair_Civillian 			{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Red 					{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Beige 				{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_White 				{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Blue 				{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_DarkRed 				{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_BlueCustom 			{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla01 			{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla02 			{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla03 			{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla04 			{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla05 			{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla06 			{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla07 			{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla08 			{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla09 			{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla10 			{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla11 			{ quality = 4; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla12 			{ quality = 4; price = 12500; };
	class Exile_Car_Strider 							{ quality = 6; price = 44000; };
	class Exile_Car_SUV_Red 							{ quality = 3; price = 14000; };
	class Exile_Car_SUV_Black 							{ quality = 3; price = 14000; };
	class Exile_Car_SUV_Grey 							{ quality = 3; price = 14000; };
	class Exile_Car_SUV_Orange 							{ quality = 3; price = 14000; };
	class Exile_Car_SUV_Armed_Black 					{ quality = 4; price = 25000; };
	class Exile_Car_BRDM2_HQ 							{ quality = 5; price = 25000; };
	class Exile_Car_BTR40_MG_Green 						{ quality = 6; price = 38000; };
	class Exile_Car_BTR40_MG_Camo 						{ quality = 6; price = 38000; };
	class Exile_Car_BTR40_Green 						{ quality = 2; price = 15000; };
	class Exile_Car_BTR40_Camo 							{ quality = 2; price = 15000; };
	class Exile_Car_HMMWV_M134_Green 					{ quality = 5; price = 33000; };
	class Exile_Car_HMMWV_M134_Desert 					{ quality = 5; price = 33000; };
	class Exile_Car_HMMWV_M2_Green 						{ quality = 6; price = 40000; };
	class Exile_Car_HMMWV_M2_Desert 					{ quality = 6; price = 40000; };
	class Exile_Car_HMMWV_MEV_Green 					{ quality = 3; price = 21000; };
	class Exile_Car_HMMWV_MEV_Desert 					{ quality = 3; price = 21000; };
	class Exile_Car_HMMWV_UNA_Green 					{ quality = 3; price = 21000; };
	class Exile_Car_HMMWV_UNA_Desert 					{ quality = 3; price = 21000; };
	class Exile_Car_Tempest 							{ quality = 4; price = 48300; };
	class Exile_Car_Van_Black 							{ quality = 2; price = 12000; };
	class Exile_Car_Van_White 							{ quality = 2; price = 12000; };
	class Exile_Car_Van_Red 							{ quality = 2; price = 12000; };
	class Exile_Car_Van_Guerilla01 						{ quality = 2; price = 12000; };
	class Exile_Car_Van_Guerilla02 						{ quality = 2; price = 12000; };
	class Exile_Car_Van_Guerilla03 						{ quality = 2; price = 12000; };
	class Exile_Car_Van_Guerilla04 						{ quality = 2; price = 12000; };
	class Exile_Car_Van_Guerilla05 						{ quality = 2; price = 12000; };
	class Exile_Car_Van_Guerilla06 						{ quality = 2; price = 12000; };
	class Exile_Car_Van_Guerilla07 						{ quality = 2; price = 12000; };
	class Exile_Car_Van_Guerilla08 						{ quality = 2; price = 12000; };
	class Exile_Car_Van_Box_Black 						{ quality = 3; price = 17000; };
	class Exile_Car_Van_Box_White 						{ quality = 3; price = 17000; };
	class Exile_Car_Van_Box_Red 						{ quality = 3; price = 17000; };
	class Exile_Car_Van_Box_Guerilla01 					{ quality = 3; price = 17000; };
	class Exile_Car_Van_Box_Guerilla02 					{ quality = 3; price = 17000; };
	class Exile_Car_Van_Box_Guerilla03 					{ quality = 3; price = 17000; };
	class Exile_Car_Van_Box_Guerilla04 					{ quality = 3; price = 17000; };
	class Exile_Car_Van_Box_Guerilla05 					{ quality = 3; price = 17000; };
	class Exile_Car_Van_Box_Guerilla06 					{ quality = 3; price = 17000; };
	class Exile_Car_Van_Box_Guerilla07 					{ quality = 3; price = 17000; };
	class Exile_Car_Van_Box_Guerilla08 					{ quality = 3; price = 17000; };
	class Exile_Car_Van_Fuel_Black 						{ quality = 3; price = 15000; };
	class Exile_Car_Van_Fuel_White 						{ quality = 3; price = 15000; };
	class Exile_Car_Van_Fuel_Red 						{ quality = 3; price = 15000; };
	class Exile_Car_Van_Fuel_Guerilla01 				{ quality = 3; price = 15000; };
	class Exile_Car_Van_Fuel_Guerilla02 				{ quality = 3; price = 15000; };
	class Exile_Car_Van_Fuel_Guerilla03 				{ quality = 3; price = 15000; };
	class Exile_Car_Zamak 								{ quality = 4; price = 43000; };
	class Exile_Boat_WaterScooter						{ quality = 2; price = 800; };
	class Exile_Boat_RHIB								{ quality = 3; price = 1500; };
	class Exile_Plane_Ceasar							{ quality = 2; price = 15000; };
	class Exile_Plane_BlackfishInfantry					{ quality = 6; price = 60000; };
	class Exile_Plane_BlackfishVehicle					{ quality = 6; price = 60000; };
	class Exile_Car_ProwlerLight						{ quality = 3; price = 22000; };
	class Exile_Car_ProwlerUnarmed						{ quality = 3; price = 22000; };
	class Exile_Car_QilinUnarmed						{ quality = 3; price = 21000; };
	class Exile_Car_MB4WD								{ quality = 2; price = 15000; };
	class Exile_Car_MB4WDOpen							{ quality = 2; price = 15000; };
	class Exile_Item_FlagStolen1						{ quality = 1; price = 5000;  sellPrice = 5000;  };
	class Exile_Item_FlagStolen2						{ quality = 1; price = 10000; sellPrice = 10000; };
	class Exile_Item_FlagStolen3						{ quality = 1; price = 15000; sellPrice = 15000; };
	class Exile_Item_FlagStolen4						{ quality = 1; price = 20000; sellPrice = 20000; };
	class Exile_Item_FlagStolen5						{ quality = 1; price = 25000; sellPrice = 25000; };
	class Exile_Item_FlagStolen6						{ quality = 1; price = 30000; sellPrice = 30000; };
	class Exile_Item_FlagStolen7						{ quality = 1; price = 35000; sellPrice = 35000; };
	class Exile_Item_FlagStolen8						{ quality = 1; price = 40000; sellPrice = 40000; };
	class Exile_Item_FlagStolen9						{ quality = 1; price = 45000; sellPrice = 45000; };
	class Exile_Item_FlagStolen10						{ quality = 1; price = 50000; sellPrice = 50000; };
	class ExileLife_Item_Iron		                	   { quality = 2; 	price = 50; 	};
	class ExileLife_Item_IronOre	                	{ quality = 2; 	price = 10; 	};
	class ExileLife_Item_Salt                       	   { quality = 2; 	price = 10;		};
	class ExileLife_Item_Artefacts                  	{ quality = 2; 	price = 200; 	};
	class ExileLife_Item_Gold	                    	  { quality = 2; 	price = 100; 	};
	class ExileLife_Item_GoldOre	                   { quality = 2; 	price = 50; 	};
	class ExileLife_Item_ExiumOre              			{ quality = 2; 	price = 1000; 	};
	class ExileLife_Item_Meth_Clear                 	{ quality = 2; 	price = 5000;	};
	class ExileLife_Item_Meth_Blue             	    	{ quality = 2; 	price = 4000;	};
	class ExileLife_Item_Meth_Brown                 	{ quality = 2; 	price = 1000;	};
	class ExileLife_Item_Cannabis                   	{ quality = 2; 	price = 200; 	};
	class ExileLife_Item_Cannabis_Packet            	{ quality = 2; 	price = 2000;	};
	class ExileLife_Item_Apple                   	{ quality = 1; 		price = 1; };
	class ExileLife_Item_Orange                  	{ quality = 1; 		price = 1; };
	class ExileLife_Item_SeedHemp                   { quality = 1; 		price = 50; }; 
	class exilelife_item_applejuice                 { quality = 1; 		price = 6; };
	class exilelife_item_orangejuice                { quality = 1; 		price = 6; };
	class exilelife_item_pruno               		{ quality = 1;  		price = 50; };
	class exilelife_item_cider                		{ quality = 1;  		price = 50; };
};
class CfgExileCustomCode
{
};
class CfgExileEnvironment
{
	class Altis 
	{
		class FireFlies
		{
			enable = 1;
			startHour = 21;
			endHour = 4;
		};
		class Anomalies
		{
			enable = 0;
			startHour = 20;
			endHour = 5;
		};
		class Breathing
		{
			enable = 0;
		};
		class Snow
		{
			enable = 0;
			surfaces[] = {};
		};
		class Radiation 
		{
			enable = 1;
		};
		class Temperature
		{
			daytimeTemperature[] = {15.93,16.89,18.42,20.40,22.68,25.10,27.48,29.63,31.40,32.66,33.32,33.80,33.80,33.32,32.66,31.40,29.63,27.48,25.10,22.68,20.40,18.42,16.89,15.93,15.93};
			overcast = -2;
			rain = -5;
			wind = -1;
			altitude = -0.5;
			water = -5;
		};
	};
	class Namalsk: Altis 
	{
		class FireFlies: FireFlies
		{
			enable = 1;
		};
		class Anomalies: Anomalies
		{
			enable = 1;
		};
		class Breathing: Breathing
		{
			enable = 1;
		};
		class Snow: Snow
		{
			enable = 1;
			surfaces[] = {"#nam_snow"};
		};
		class Radiation: Radiation
		{
			enable = 1;
			contaminatedZones[] = 
			{
				{{3960.14,	8454.75,	152.862}, 	80, 	140},	
				{{4974.70,	6632.82,	4.74293}, 	40, 	150},	
				{{6487.92,	9302.03,	36.0014}, 	60, 	110}	
			};
		};
		class Temperature: Temperature
		{
			daytimeTemperature[] = {-2.00,-1.77,-1.12,-0.10,1.24,2.78,4.40,6.00,7.46,8.65,9.50,9.90,9.90,9.50,8.65,7.46,6.00,4.40,2.78,1.24,-0.10,-1.12,-1.77,-2.00,-2.00};
		};
	};
	class Tanoa: Altis
	{
		class FireFlies: FireFlies
		{
			enable = 0;
		};
		class Anomalies: Anomalies
		{
			enable = 0;
		};
		class Breathing: Breathing
		{
			enable = 0;
		};
		class Snow: Snow
		{
			enable = 0;
		};
		class Radiation: Radiation
		{
			enable = 1;
		};
		class Temperature: Temperature
		{
			daytimeTemperature[] = {15.93,16.89,18.42,20.40,22.68,25.10,27.48,29.63,31.40,32.66,33.32,33.80,33.80,33.32,32.66,31.40,29.63,27.48,25.10,22.68,20.40,18.42,16.89,15.93,15.93};
		};
	};
	class Malden: Altis
	{
		class FireFlies: FireFlies
		{
			enable = 1;
		};
		class Anomalies: Anomalies
		{
			enable = 0;
		};
		class Breathing: Breathing
		{
			enable = 0;
		};
		class Snow: Snow
		{
			enable = 0;
		};
		class Radiation: Radiation
		{
			enable = 0;
		};
		class Temperature: Temperature
		{
			daytimeTemperature[] = {15.93,16.89,18.42,20.40,22.68,25.10,27.48,29.63,31.40,32.66,33.32,33.80,33.80,33.32,32.66,31.40,29.63,27.48,25.10,22.68,20.40,18.42,16.89,15.93,15.93};
		};
	};
};
class CfgExileHUD
{
	class ShortItemNames
	{
		SmokeShell[] 						= {"WHITE", 	"SMOKE"};
		1Rnd_Smoke_Grenade_shell[] 			= {"WHITE", 	"SMOKE"};
		3Rnd_Smoke_Grenade_shell[] 			= {"WHITE", 	"SMOKE"};
		SmokeShellBlue[] 					= {"BLUE", 		"SMOKE"};
		1Rnd_SmokeBlue_Grenade_shell[] 		= {"BLUE", 		"SMOKE"};
		3Rnd_SmokeBlue_Grenade_shell[] 		= {"BLUE", 		"SMOKE"};
		SmokeShellGreen[] 					= {"GREEN", 	"SMOKE"};
		1Rnd_SmokeGreen_Grenade_shell[] 	= {"GREEN", 	"SMOKE"};
		3Rnd_SmokeGreen_Grenade_shell[] 	= {"GREEN", 	"SMOKE"};
		SmokeShellOrange[] 					= {"ORANGE", 	"SMOKE"};
		1Rnd_SmokeOrange_Grenade_shell[]	= {"ORANGE", 	"SMOKE"};
		3Rnd_SmokeOrange_Grenade_shell[] 	= {"ORANGE", 	"SMOKE"};
		SmokeShellPurple[] 					= {"PURPLE", 	"SMOKE"};
		1Rnd_SmokePurple_Grenade_shell[] 	= {"PURPLE", 	"SMOKE"};
		3Rnd_SmokePurple_Grenade_shell[] 	= {"PURPLE", 	"SMOKE"};
		SmokeShellRed[] 					= {"RED", 		"SMOKE"};
		1Rnd_SmokeRed_Grenade_shell[] 		= {"RED", 		"SMOKE"};
		3Rnd_SmokeRed_Grenade_shell[] 		= {"RED", 		"SMOKE"};
		SmokeShellYellow[] 					= {"YELLOW", 	"SMOKE"};
		1Rnd_SmokeYellow_Grenade_shell[] 	= {"YELLOW", 	"SMOKE"};
		3Rnd_SmokeYellow_Grenade_shell[] 	= {"YELLOW", 	"SMOKE"};
		UGL_FlareCIR_F[] 					= {"IR", 		"FLARE"};
		3Rnd_UGL_FlareCIR_F[] 				= {"IR", 		"FLARE"};
		UGL_FlareGreen_F[] 					= {"GREEN", 	"FLARE"};
		3Rnd_UGL_FlareGreen_F[] 			= {"GREEN", 	"FLARE"};
		UGL_FlareRed_F[] 					= {"RED", 		"FLARE"};
		3Rnd_UGL_FlareRed_F[] 				= {"RED", 		"FLARE"};
		UGL_FlareWhite_F[] 					= {"WHITE", 	"FLARE"};
		3Rnd_UGL_FlareWhite_F[] 			= {"WHITE", 	"FLARE"};
		UGL_FlareYellow_F[] 				= {"YELLOW", 	"FLARE"};
		3Rnd_UGL_FlareYellow_F[] 			= {"YELLOW", 	"FLARE"};
		Chemlight_blue[] 					= {"BLUE", 		"LIGHT"};
		Chemlight_green[] 					= {"GREEN", 	"LIGHT"};
		Chemlight_red[] 					= {"RED", 		"LIGHT"};
		Chemlight_yellow[] 					= {"YELLOW", 	"LIGHT"};
		1Rnd_HE_Grenade_shell[] 			= {"40MM"};
		3Rnd_HE_Grenade_shell[] 			= {"40MM"};
		O_IR_Grenade[] 						= {"IR"};
		I_IR_Grenade[] 						= {"IR"};
		B_IR_Grenade[] 						= {"IR"};
		HandGrenade[] 						= {"RGO"};
		MiniGrenade[] 						= {"RGN"};
		Exile_Item_ZipTie[]					= {"ZIP", "TIE"};
	};
};
class CfgExileLifeBlackMarket
{
    class Inventory
    {
        class arifle_ARX_blk_F                      	{ quantity = 2; price = 900; };
        class U_C_Poor_shorts_1 						{ quantity = 2; price = 20; };
		class U_B_CombatUniform_mcam_worn 				{ quantity = 2; price = 40; };
		class V_Chestrig_khk 							{ quantity = 1; price = 30; };
		class V_PlateCarrierH_CTRG 						{ quantity = 1; price = 100; };
		class muzzle_snds_B 							{ quantity = 1; price = 20; };
		class Exile_Item_Pliers							{ quantity = 3; price = 350; };
		class 30Rnd_9x21_Yellow_Mag						{ quantity = 7; price = 40; };
		class arifle_MXC_F								{ quantity = 3; price = 350; };
		class arifle_SDAR_F								{ quantity = 5; price = 650; };
    };
};
class CfgExileLifeDifficulty
{
	hardcore = 0;
};
class CfgExileLifeInteraction
{
	class chemicalplant
	{
		class land_dp_mainfactory_f
		{
			interactionitems[] =
			{
				{
					"panel01",
					{{4187.97,15088.4,25.147},{4187.97,15088.4,24.9196},{4187.33,15088.5,25.1536},{4187.33,15088.5,24.9234}}
				},
				{
					"pipe01",
					{{4181.16,15086.4,29.7618},{4181.16,15086.3,29.4256},{4180.93,15086.4,29.7616},{4180.93,15086.3,29.4326}}
				},
				{
					"panel02",
					{{4187.98,15088.4,24.8585},{4187.95,15088.4,24.637},{4187.33,15088.5,24.8736},{4187.34,15088.5,24.6413}}
				},
				{
					"pipe02",
					{{4179.5,15086.3,29.2615},{4179.5,15086.5,28.3595},{4179.47,15085.4,29.1971},{4179.47,15085.3,28.0022}}
				},
				{
					"panel03",
					{{4177.93,15088.7,25.1336},{4177.93,15088.7,24.9172},{4177.3,15088.8,25.1346},{4177.31,15088.8,24.9178}}
				},
				{
					"pipe03",
					{{4176.94,15086.5,29.7772},{4176.93,15086.5,29.4091},{4176.69,15086.5,29.7699},{4176.68,15086.5,29.4166}}
				},
				{
					"panel04",
					{{4177.93,15088.7,24.8612},{4177.93,15088.7,24.646},{4177.3,15088.8,24.8647},{4177.31,15088.8,24.6482}}
				},
				{
					"pipe04",
					{{4175.25,15086.2,29.2077},{4175.25,15086.2,28.7948},{4175.24,15085.8,29.1977},{4175.24,15085.8,28.7569}}
				}
			};
			class interactionrequires
			{
				panel01[] = {"generator"};
				panel02[] = {"generator"};
				panel03[] = {"generator"};
				panel04[] = {"generator"};
				pipe01[] = {"generator","panel01"};
				pipe02[] = {"generator","panel02"};
				pipe03[] = {"generator","panel03"};
				pipe04[] = {"generator","panel04"};
			};
		};
		class land_fuelstation_feed_f
		{
			interactionitems[] =
			{
				{
					"bowser01",
					{{4237.65,15084,21.1562},{4237.65,15084,19.8367},{4237.65,15083.4,21.1566},{4237.65,15083.4,19.8663}}
				},
				{
					"bowser02",
					{{4237.63,15082.7,21.1363},{4237.63,15082.7,19.804},{4237.63,15082.1,21.1315},{4237.63,15082.1,19.8405}}
				},
				{
					"bowser03",
					{{4237.58,15077.1,21.1138},{4237.58,15077.1,19.7896},{4237.58,15076.5,21.1215},{4237.58,15076.5,19.7903}}
				},
				{
					"bowser04",
					{{4237.56,15075.8,21.1095},{4237.56,15075.8,19.8124},{4237.56,15075.2,21.1066},{4237.56,15075.2,19.8142}}
				}
			};
			class interactionrequires
			{
				bowser01[] = {"generator","panel01","pipe01"};
				bowser02[] = {"generator","panel02","pipe02"};
				bowser03[] = {"generator","panel03","pipe03"};
				bowser04[] = {"generator","panel04","pipe04"};
			};
		};
		class land_powergenerator_f
		{
			interactionitems[] =
			{
				{
					"generator",
					{{4199.15,15034.7,19.2946},{4199.19,15034.7,18.1146},{4197.39,15034.7,19.1999},{4197.46,15034.7,18.0487}}
				}
			};
			class interactionrequires
			{
				generator[] = {"magazines"};
				magazines[] = {"Exile_Item_FuelCanisterFull"};
			};
		};
		class panel01
		{
			interactiontitle = "Hydrochloric Acid Pump";
			interactionsuccess = "Hydrochloric Acid transfer pump started!";
			interactionerror = "Pump deactivated!";
			interactionmultiuse = 0;
			interactiontimer = 1800;
		};
		class panel02
		{
			interactiontitle = "Acetone Pump";
			interactionsuccess = "Acetone transfer pump started!";
			interactionerror = "Pump deactivated!";
			interactionmultiuse = 0;
			interactiontimer = 1800;
		};
		class panel03
		{
			interactiontitle = "Phosphoric Acid Pump";
			interactionsuccess = "Phosphoric Acid transfer pump started!";
			interactionerror = "Pump deactivated!";
			interactionmultiuse = 0;
			interactiontimer = 1800;
		};
		class panel04
		{
			interactiontitle = "Hydrazine Pump";
			interactionsuccess = "Hydrazine transfer pump started!";
			interactionerror = "Pump deactivated!";
			interactionmultiuse = 0;
			interactiontimer = 1800;
		};
		class pipe01
		{
			interactiontitle = "Hydrochloric Acid Valve";
			interactionsuccess = "Hydrochloric Acid transfer valve opened!";
			interactionerror = "Pipes Blocked!";
			interactionmultiuse = 0;
			interactiontimer = 1800;
		};
		class pipe02
		{
			interactiontitle = "Acetone Valve";
			interactionsuccess = "Acetone transfer valve opened!";
			interactionerror = "Pipes Blocked!";
			interactionmultiuse = 0;
			interactiontimer = 1800;
		};
		class pipe03
		{
			interactiontitle = "Phosphoric Acid Valve";
			interactionsuccess = "Phosphoric Acid transfer valve opened!";
			interactionerror = "Pipes Blocked!";
			interactionmultiuse = 0;
			interactiontimer = 1800;
		};
		class pipe04
		{
			interactiontitle = "Hydrazine Valve";
			interactionsuccess = "Hydrazine transfer valve opened!";
			interactionerror = "Pipes Blocked!";
			interactionmultiuse = 0;
			interactiontimer = 1800;
		};
		class bowser01
		{
			interactiontitle = "Hydrochloric Acid Bowser";
			interactionsuccess = "You filled a jerrycan with Hydrochloric Acid!";
			interactionerror = "Tank Empty!";
			interactionmultiuse = 1;
			interactiontimer = 1800;
		};
		class bowser02
		{
			interactiontitle = "Acetone Bowser";
			interactionsuccess = "You filled a jerrycan with Acetone!";
			interactionerror = "Tank Empty!";
			interactionmultiuse = 1;
			interactiontimer = 1800;
		};
		class bowser03
		{
			interactiontitle = "Phosphoric Acid Bowser";
			interactionsuccess = "You filled a jerrycan with Phosphoric Acid!";
			interactionerror = "Tank Empty!";
			interactionmultiuse = 1;
			interactiontimer = 1800;
		};
		class bowser04
		{
			interactiontitle = "Hydrazine Bowser";
			interactionsuccess = "You filled a jerrycan with Hydrazine!";
			interactionerror = "Tank Empty!";
			interactionmultiuse = 1;
			interactiontimer = 1800;
		};
		class generator
		{
			interactiontitle = "Generator";
			interactionsuccess = "Generator Started!";
			interactionerror = "No Power!";
			interactionmultiuse = 0;
			interactiontimer = 1800;
		};
		class Exile_Item_FuelCanisterFull
		{
			interactionerror = "No Fuel!";
		};
	};
	class smelter
	{
		class land_indpipe1_valve_f
		{
			interactionitems[] =
			{
				{
					"gasmains",
					{{5897.85,20081.8,229.215},{5897.78,20081.9,228.761},{5896.61,20082.5,229.202},{5897.01,20082.4,228.714}}
				}
			};
			class interactionrequires
			{
				gasmains[] = {};
			};
		};
		class land_factory_conv1_end_f
		{
			interactionitems[] =
			{
				{
					"furnace",
					{{5899.26,20136.3,230.755},{5899.23,20136.3,227.643},{5903.72,20136.2,230.785},{5903.72,20136.2,227.687}}
				}
			};
			class interactionrequires
			{
				furnace[] = {"gasmains","magazines"};
				magazines[] = {"Exile_Item_Matches"};
			};
		};
		class WaterPump_01_sand_F
		{
			interactionitems[] =
			{
				{
					"conveyorbelt01",
					{{5897.05,20181.9,227.408},{5896.99,20182,225.975},{5895.11,20182,227.414},{5895.04,20182,225.831}}
				},
				{
					"conveyorbelt02",
					{{5904.95,20182.3,227.362},{5904.99,20182.4,226.043},{5903.3,20182.3,227.608},{5903.27,20182.4,226.06}}
				}
			};
			class interactionrequires
			{
				conveyorbelt01[] = {"furnace","magazines"};
				conveyorbelt02[] = {"furnace","magazines"};
				magazines[] = {"Exile_Item_FuelCanisterFull"};
			};
		};
		class furnace
		{
			interactiontitle = "Furnace";
			interactionsuccess = "Furnace started!";
			interactionerror = "The furnace isnt burning!";
			interactionmultiuse = 0;
			interactiontimer = 1800;
		};
		class gasmains
		{
			interactiontitle = "Gas Valve";
			interactionsuccess = "The Gasline is open!";
			interactionerror = "There is no gas!";
			interactionmultiuse = 0;
			interactiontimer = 1800;
		};
		class conveyorbelt01
		{
			interactiontitle = "Conveyorbelt";
			interactionsuccess = "Conveyorbelt started!";
			interactionerror = "Needs fuel!";
			interactionmultiuse = 0;
			interactiontimer = 1800;
			emptycontainerpos[] = {5895.27,20187,0.00180054};
			emptypositionclassname = "ExileLife_ConveyorBelt_Static";
			fillcontainerpos[] = {5946.06,20156.7,0.00158691};
			fillpositionclassname = "ExileLife_GarbageBin_Static";
		};
		class conveyorbelt02
		{
			interactiontitle = "Conveyorbelt";
			interactionsuccess = "Conveyorbelt started!";
			interactionerror = "Needs fuel!";
			interactionmultiuse = 0;
			interactiontimer = 1800;
			emptycontainerpos[] = {5905.08,20187.3,0.00154114};
			emptypositionclassname = "ExileLife_ConveyorBelt_Static";
			fillcontainerpos[] = {5946.15,20150,0.00164795};
			fillpositionclassname = "ExileLife_GarbageBin_Static";
		};
		class Exile_Item_FuelCanisterFull
		{
			interactionerror = "No Fuel!";
		};
		class Exile_Item_Matches
		{
			interactionerror = "You need matches!";
		};
	};
};
class CfgExileLifeRewards
{
    goodSamaritanRevive = 100;
    revive = 200; 
};
class CfgExileLifeWorld
{
    class Altis
    {
        prisonLocation[]={16784.1, 13664.2, 2.92955};
        prisonEscape=100; 
        prisonFreeLocation[]={14037.8,18728.9,0};
        GangTerritory[] =
        {
            {"Mafia",{25668.2,21320.7}},
            {"Syndicate",{3852.75,17428.8}},
            {"Cartel",{9045.33,11961.5}},
            {"Yakuza",{20220.4,11684}},
            {"Guard",{14037.1,18729}}
        };
        JobBoards[] =
        {
            {"Mafia",{{25687.6, 21308.6,0}}},
            {"Syndicate",{{3925.24, 17354,0}}},
            {"Cartel",{{9066.57, 11989.1,0}}},
            {"Yakuza",{{20238.9, 11625,0}}},
            {"Guard",{{14323,18932,0},{14037.1, 18729,0}}},
            {"Generic",{{14083.7, 18677.3,0}}}   
        };
        locationMarkers[] =
        {
            {"Fruit", "Apples", {8198.14,17634.2,0.00146484}, 0, 100, "ExileLifeAppleIcon"},
            {"Fruit", "Oranges", {7138.28,11259.1,0.00140953}, 0, 100, "ExileLifeOrangeIcon"},
            {"Mining", "Salt", {23731.3,16205.8,0.00143862}, 0, 100, "ExileLifeSaltMineIcon"},
            {"Mining", "Iron", {17068.9,11374.3,0.00108147}, 0, 100, "ExileLifeMineIcon"},
            {"Mining", "Gold", {18362.9,16787.3,0.00106812}, 0, 100, "ExileLifeMineIcon"},
            {"Artefacts", "Artefacts", {20084.2,20043.1,0.00144005}, 0, 100, "ExileLifeArtefactsIcon"},
            {"Refinery", "ChemicalPlant", {4187.92,15090.1,5.82562}, 1, 100, "ExileLifeRefineryIcon"},
            {"Refinery", "Smelter", {5887.44,20159.9,0.00125122}, 1, 100, "ExileLifeSmelterIcon"},
            {"BlackMarket", "northeastBlackMarket", {21476,19541.2,0},1,100, "ExileLifeBlackMarketIcon"},
            {"BlackMarket", "southeastBlackMarket", {22261.5,8539.27,0},1,100, "ExileLifeBlackMarketIcon"},
            {"BlackMarket", "northwestBlackMarket", {5191.19,21038.3,0},1,100, "ExileLifeBlackMarketIcon"},
            {"BlackMarket", "southwestBlackMarket", {6545,14231.1,0},1,100, "ExileLifeBlackMarketIcon"}
        };
    };
};
class CfgExileLootSettings
{
	lifeTime = 8;
	spawnInterval = 300;
	maximumPositionCoverage = 3;
	maximumNumberOfLootSpotsPerBuilding = 3;
	maximumNumberOfItemsPerLootSpot = 1;
	spawnRadius = 50;
	minimumDistanceToTraderZones = 500;
	minimumDistanceToTerritories = 150;
};
class CfgExileMobileXM8
{
	code = "";
};
class CfgExileMusic
{
	Ambient[] = {"ExileTrack03","ExileTrack04"};
	Combat[] = {"ExileTrack06","ExileTrack07"};
	Intro[] = {"ExileTrack02","ExileTrack03"};
};
class CfgExileParty 
{
	showESP = 1;
	allow3DMarkers = 1;
};
class CfgExileRussianRoulette
{
	buyInAmount = 100;
};
class CfgFlags 
{
	class USA
	{
		name = "USA";
		texture = "\A3\Data_F\Flags\flag_us_co.paa";
		uids[] = {};
	};
};
class CfgGangData
{
	class Blacklist
	{
		gangrecruitmentforfeit[] = {2,0,0};
		gangrecruitmentfailure[] = {2,0,0};		
	};
	class Mafia
	{
		GangTownBorder = 300;
		GangTerritoryUpgrade[] =
		{
			{0, 800, 0},
			{1, 1000, 100000},
			{2, 1500, 300000},
			{3, 2000, 500000},
			{4, 2500, 500000},
			{5, 3000, 500000},
			{6, 3500, 500000},
			{7, 4000, 500000},
			{8, 4500, 500000},
			{9, 5000, 500000}
		};
	};
	class Cartel
	{
		GangTownBorder = 300;
		GangTerritoryUpgrade[] =
		{
			{0, 800, 0},
			{1, 1000, 100000},
			{2, 1500, 300000},
			{3, 2000, 500000},
			{4, 2500, 500000},
			{5, 3000, 500000},
			{6, 3500, 500000},
			{7, 4000, 500000},
			{8, 4500, 500000},
			{9, 5000, 500000}
		};
	};
	class Yakuza
	{
		GangTownBorder = 300;
		GangTerritoryUpgrade[] =
		{
			{0, 800, 0},
			{1, 1000, 100000},
			{2, 1500, 300000},
			{3, 2000, 500000},
			{4, 2500, 500000},
			{5, 3000, 500000},
			{6, 3500, 500000},
			{7, 4000, 500000},
			{8, 4500, 500000},
			{9, 5000, 500000}
		};
	};
	class Syndicate
	{
		GangTownBorder = 300;
		GangTerritoryUpgrade[] =
		{
			{0, 800, 0},
			{1, 1000, 100000},
			{2, 1500, 300000},
			{3, 2000, 500000},
			{4, 2500, 500000},
			{5, 3000, 500000},
			{6, 3500, 500000},
			{7, 4000, 500000},
			{8, 4500, 500000},
			{9, 5000, 500000}
		};
	};
	class Guard
	{
		GangTownBorder = 500; 
		GangTerritoryUpgrade[] =
		{
			{0, 500, 0},
			{1, 1000, 100000},
			{2, 1500, 300000},
			{3, 2000, 500000},
			{4, 2500, 500000},
			{5, 3000, 500000},
			{6, 3500, 500000},
			{7, 4000, 500000},
			{8, 4500, 500000},
			{9, 5000, 500000}
		};
	};	
};
class CfgGrinding
{
	enableGrinding = 1;
	grindDuration = 1;
	failChance = 25;
	breakChance = 20;
	notifyServer = 1;
	notificationCooldown = 30;
};
class ExileLife_AbstractGunRepair
{
	name = "";
	type = "";	
	components[] = {}; 
	tools[] = {"Exile_Item_Hammer","Exile_Item_ScrewDriver"}; 
	requiredInteractionModelGroup = "Workbench"; 
	returnedItems[] = {}; 
	requiredAttributeNameAndValue[] = {}; 
	delayedAction = "";	
};
class CfgGunRepair
{
	removeComponentsOnFailure = 1;
	class Used
	{
		class New_Kit: ExileLife_AbstractGunRepair
		{
			name = "Repair to New (Repair Kit Required)";
			type = "New";
			components[] = 
			{
				{1, "ExileLife_Item_GunRepairKit_Advanced"},
				{1, "Exile_Item_JunkMetal"}
			};
			requiredAttributeNameAndValue[] = 
			{
				{"canRepairGunWithKit", 1},
				{"canRepairToNew", 1}
			};
		};
		class New_NoKit: ExileLife_AbstractGunRepair
		{
			name = "Repair to New";
			type = "New";
			components[] = 
			{
				{4, "Exile_Item_JunkMetal"}
			};
			requiredAttributeNameAndValue[] = 
			{
				{"canRepairGunWithoutKit", 1},
				{"canRepairToNew", 1}
			};
		};
	};
	class Worn
	{
		class Used_Kit: ExileLife_AbstractGunRepair
		{
			name = "Repair to Used (Repair Kit Required)";
			type = "Used";
			components[] = 
			{
				{1, "ExileLife_Item_GunRepairKit_Basic"},
				{1, "Exile_Item_JunkMetal"}
			};
			requiredAttributeNameAndValue[] = {{"canRepairGunWithKit", 1}};
		};
		class Used_NoKit: ExileLife_AbstractGunRepair
		{
			name = "Repair to Used";
			type = "Used";
			components[] = 
			{
				{4, "Exile_Item_JunkMetal"}
			};
			requiredAttributeNameAndValue[] = {{"canRepairGunWithoutKit", 1}};
		};
	};
	class Damaged
	{
		class Used_Kit: ExileLife_AbstractGunRepair
		{
			name = "Repair to Used (Repair Kit Required)";
			type = "Used";
			components[] = 
			{
				{1, "ExileLife_Item_GunRepairKit_Advanced"},
				{1, "Exile_Item_JunkMetal"}
			};
			requiredAttributeNameAndValue[] = {{"canRepairGunWithKit", 1}};
		};
		class Used_NoKit: ExileLife_AbstractGunRepair
		{
			name = "Repair to Used";
			type = "Used";
			components[] = 
			{
				{4, "Exile_Item_JunkMetal"}
			};
			requiredAttributeNameAndValue[] = {{"canRepairGunWithoutKit", 1}};
		};
		class Worn_Kit: ExileLife_AbstractGunRepair
		{
			name = "Repair to Worn (Repair Kit Required)";
			type = "Worn";
			components[] = 
			{
				{1, "ExileLife_Item_GunRepairKit_Basic"},
				{1, "Exile_Item_JunkMetal"}
			};
			requiredAttributeNameAndValue[] = {{"canRepairGunWithKit", 1}};
		};
		class Worn_NoKit: ExileLife_AbstractGunRepair
		{
			name = "Repair to Worn";
			type = "Worn";
			components[] = 
			{
				{4, "Exile_Item_JunkMetal"}
			};
			requiredAttributeNameAndValue[] = {{"canRepairGunWithoutKit", 1}};
		};
	};
	class Broken
	{
		class Worn_Kit: ExileLife_AbstractGunRepair
		{
			name = "Repair to Worn (Repair Kit Required)";
			type = "Worn";
			components[] = 
			{
				{1, "ExileLife_Item_GunRepairKit_Advanced"},
				{1, "Exile_Item_JunkMetal"}
			};
			requiredAttributeNameAndValue[] = {{"canRepairGunWithKit", 1}};
		};
		class Worn_NoKit: ExileLife_AbstractGunRepair
		{
			name = "Repair to Worn";
			type = "Worn";
			components[] = 
			{
				{4, "Exile_Item_JunkMetal"}
			};
			requiredAttributeNameAndValue[] = {{"canRepairGunWithoutKit", 1}};
		};
		class Damaged_Kit: ExileLife_AbstractGunRepair
		{
			name = "Repair to Damaged (Repair Kit Required)";
			type = "Damaged";
			components[] = 
			{
				{1, "ExileLife_Item_GunRepairKit_Basic"},
				{1, "Exile_Item_JunkMetal"}
			};
			requiredAttributeNameAndValue[] = {{"canRepairGunWithKit", 1}};
		};
		class Damaged_NoKit: ExileLife_AbstractGunRepair
		{
			name = "Repair to Damaged";
			type = "Damaged";
			components[] = 
			{
				{4, "Exile_Item_JunkMetal"}
			};
			requiredAttributeNameAndValue[] = {{"canRepairGunWithoutKit", 1}};
		};
	};
};
class CfgHacking 
{
	enableHacking = 1;
	hackDuration = 1;
	failChance = 25;
	removeChance = 5;
	maxHackAttempts = 3;
	notifyServer = 1;
	notificationCooldown = 30;
	minPlayers = 1;
	maxHacks = 5;
	showMapIcon = 1;
};
class CfgHearingLoss
{
	headgearProtection[] = 
	{
		"H_Watchcap_blk",
		"H_Watchcap_cbr",
		"H_Watchcap_camo",
		"H_Watchcap_khk",
		"H_Cap_marshal",
		"H_MilCap_blue",
		"H_MilCap_gen_F",
		"H_MilCap_ghex_F",
		"H_MilCap_gry",
		"H_MilCap_ocamo",
		"H_MilCap_mcamo",
		"H_MilCap_tna_F",
		"H_MilCap_dgtl",
		"H_RacingHelmet_1_black_F",
		"H_RacingHelmet_1_blue_F",
		"H_RacingHelmet_2_F",
		"H_RacingHelmet_1_F",
		"H_RacingHelmet_1_green_F",
		"H_RacingHelmet_1_orange_F",
		"H_RacingHelmet_1_red_F",
		"H_RacingHelmet_3_F",
		"H_RacingHelmet_4_F",
		"H_RacingHelmet_1_white_F",
		"H_RacingHelmet_1_yellow_F",
		"H_HelmetSpecO_blk",
		"H_HelmetSpecO_ghex_F",
		"H_HelmetSpecO_ocamo",
		"H_HelmetCrew_O_ghex_f",
		"H_HelmetCrew_I",
		"H_HelmetCrew_O",
		"H_HelmetCrew_B",
		"H_HelmetLeaderO_ghex_f",
		"H_HelmetLeaderO_ocamo",
		"H_HelmetLeaderO_oucamo",
		"H_HelmetSpecB",
		"H_HelmetSpecB_blk",
		"H_HelmetSpecB_paint2",
		"H_HelmetSpecB_paint1",
		"H_HelmetSpecB_sand",
		"H_HelmetSpecB_snakeskin",
		"H_HelmetB_Enh_tna_F",
		"H_CrewHelmetHeli_I",
		"H_CrewHelmetHeli_O",
		"H_CrewHelmetHeli_B",
		"H_PilotHelmetHeli_I",
		"H_PilotHelmetHeli_O",
		"H_PilotHelmetHeli_B",
		"H_HelmetB_light",
		"H_HelmetB_light_black",
		"H_HelmetB_light_desert",
		"H_HelmetB_light_grass",
		"H_HelmetB_light_sand",
		"H_HelmetB_light_snakeskin",
		"H_HelmetB_Light_tna_F",
		"H_PilotHelmetFighter_I",
		"H_PilotHelmetFighter_O",
		"H_PilotHelmetFighter_B",
		"H_HelmetO_ghex_F",
		"H_HelmetO_ocamo",
		"H_HelmetO_oucamo",
		"H_Cap_headphones",
		"H_HelmetB_TI_tna_F"
	};
	ignoredWeapons[] = 
	{
		"srifle_DMR_04_F",
		"ExileLife_Weapon_DMR_04_F_Used",
		"ExileLife_Weapon_DMR_04_F_Worn",
		"ExileLife_Weapon_DMR_04_F_Damaged",
		"srifle_DMR_04_Tan_F",
		"ExileLife_Weapon_DMR_04_Tan_F_Used",
		"ExileLife_Weapon_DMR_04_Tan_F_Worn",
		"ExileLife_Weapon_DMR_04_Tan_F_Damaged",
		"Exile_Weapon_VSSVintorez",
		"ExileLife_Weapon_VSSVintorez_Used",
		"ExileLife_Weapon_VSSVintorez_Worn",
		"ExileLife_Weapon_VSSVintorez_Damaged",
		"Exile_Weapon_Colt1911",
		"ExileLife_Weapon_Colt1911_Used",
		"ExileLife_Weapon_Colt1911_Worn",
		"ExileLife_Weapon_Colt1911_Damaged",
		"Exile_Weapon_Makarov",
		"ExileLife_Weapon_Makarov_Used",
		"ExileLife_Weapon_Makarov_Worn",
		"ExileLife_Weapon_Makarov_Damaged",
		"Exile_Weapon_SA61",
		"ExileLife_Weapon_SA61_Used",
		"ExileLife_Weapon_SA61_Worn",
		"ExileLife_Weapon_SA61_Damaged",
		"Exile_Weapon_Taurus",
		"ExileLife_Weapon_Taurus_Used",
		"ExileLife_Weapon_Taurus_Worn",
		"ExileLife_Weapon_Taurus_Damaged",
		"Exile_Weapon_TaurusGold",
		"ExileLife_Weapon_TaurusGold_Used",
		"ExileLife_Weapon_TaurusGold_Worn",
		"ExileLife_Weapon_TaurusGold_Damaged",
		"hgun_ACPC2_F",
		"ExileLife_Weapon_ACPC2_F_Used",
		"ExileLife_Weapon_ACPC2_F_Worn",
		"ExileLife_Weapon_ACPC2_F_Damaged",
		"hgun_P07_F",
		"ExileLife_Weapon_P07_F_Used",
		"ExileLife_Weapon_P07_F_Worn",
		"ExileLife_Weapon_P07_F_Damaged",
		"hgun_P07_khk_F",
		"ExileLife_Weapon_P07_khk_F_Used",
		"ExileLife_Weapon_P07_khk_F_Worn",
		"ExileLife_Weapon_P07_khk_F_Damaged",
		"hgun_Pistol_01_F",
		"ExileLife_Weapon_Pistol_01_F_Used",
		"ExileLife_Weapon_Pistol_01_F_Worn",
		"ExileLife_Weapon_Pistol_01_F_Damaged",
		"hgun_Pistol_heavy_01_F",
		"ExileLife_Weapon_Pistol_heavy_01_F_Used",
		"ExileLife_Weapon_Pistol_heavy_01_F_Worn",
		"ExileLife_Weapon_Pistol_heavy_01_F_Damaged",
		"hgun_Pistol_heavy_02_F",
		"ExileLife_Weapon_Pistol_heavy_02_F_Used",
		"ExileLife_Weapon_Pistol_heavy_02_F_Worn",
		"ExileLife_Weapon_Pistol_heavy_02_F_Damaged",
		"hgun_Pistol_Signal_F",
		"ExileLife_Weapon_Pistol_Signal_F_Used",
		"ExileLife_Weapon_Pistol_Signal_F_Worn",
		"ExileLife_Weapon_Pistol_Signal_F_Damaged",
		"hgun_Rook40_F",
		"ExileLife_Weapon_Rook40_F_Used",
		"ExileLife_Weapon_Rook40_F_Worn",
		"ExileLife_Weapon_Rook40_F_Damaged"
	};
};
class CfgHousing
{
	class Tanoa
	{
		Houses[] =
		{
			"Land_House_Small_04_F",
			"Land_House_Small_06_F",
			"Land_Slum_03_F"
		};
	};
	class Altis
	{
		Houses[] =
		{
			"Land_i_House_Big_02_V1_F",
			"Land_i_House_Big_02_V2_F",
			"Land_i_House_Big_02_V3_F",
			"Land_i_House_Big_01_V1_F",
			"Land_i_House_Big_01_V2_F",
			"Land_i_House_Big_01_V3_F",
			"Land_i_House_Small_01_V1_F",
			"Land_i_House_Small_01_V2_F",
			"Land_i_House_Small_01_V3_F",
			"Land_i_House_Small_02_V1_F",
			"Land_i_House_Small_02_V2_F",
			"Land_i_House_Small_02_V3_F",
			"Land_i_House_Small_03_V1_F",
			"Land_i_Stone_HouseSmall_V2_F",
			"Land_i_Stone_HouseSmall_V1_F",
			"Land_i_Stone_HouseSmall_V3_F"
		};
	};
};
class ExileAbstractAction
{
	title = "";
	condition = "true";
	action = "";
	priority = 1.5;
	showWindow = false;
};
class CfgInteractionMenus
{
	class Car
	{
		targetType = 2;
		targets[] = { "Car"};
		class Actions
		{
			class JobCargo: ExileAbstractAction
			{
				title = "Steal Cargo";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && !(ExileClientInteractionObject getVariable ['ExileLifeJobCargo',[]] isEqualTo [])";
				action = "ExileClientInteractionObject call ExileLifeClient_system_jobs_util_stealCargo";
			};
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && !ExilePlayerInSafezone && ((locked ExileClientInteractionObject) != 1)";
				action = "[_this,-1] call ExileClient_object_lock_scan";
			};
			class HackLock: ExileAbstractAction
			{
				title = "Hack Lock";
				condition = "('ExileLife_Item_HashCatXL' in (magazines player)) && ('Exile_Item_Laptop' in (magazines player)) && !ExilePlayerInSafezone && ((locked ExileClientInteractionObject) != 1)";
				action = "4 call ExileLifeClient_gui_keypadHack_show";
			};
			class Lock: ExileAbstractAction
			{
				title = "Lock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
				action = "true spawn ExileClient_object_lock_toggle";
			};
			class Unlock: ExileAbstractAction
			{
				title = "Unlock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};
			class PatchRepair: ExileAbstractAction
			{
				title = "Patch Tyres";
				condition = "([ExileClientInteractionObject,'wheel',0.9] call ExileLifeClient_util_vehicle_isDamagedPart)";
				action = "['PatchRepairVehicle', _this select 0] call ExileClient_action_execute";
			};
			class Repair: ExileAbstractAction
			{
				title = "Repair";
				condition = "('Exile_Item_Foolbox' in (magazines player))";
				action = "['RepairVehicle', _this select 0] call ExileClient_action_execute";
			};
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};
			class Flip: ExileAbstractAction
			{
				title = "Flip";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_flip";
			};
			class Refuel: ExileAbstractAction
			{
				title = "Refuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_refuel";
			};
			class DrainFuel: ExileAbstractAction
			{
				title = "Drain Fuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_drain";
			};
			class ForceOut: ExileAbstractAction
			{
				title = "Force Out";
				condition = "!((locked ExileClientInteractionObject) isEqualTo 2)  && !((ExileClientInteractionObject getVariable ['ExileLifeVehicleCaptives', []]) isEqualTo [])";
				action = "ExileClientInteractionObject call ExileLifeClient_object_handcuffs_forceGetOut";
			};
		};
	};
	class Air
	{
		targets[] = { "Air"};
		targetType = 2;
		class Actions
		{
			class JobCargo: ExileAbstractAction
			{
				title = "Steal Cargo";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && !(ExileClientInteractionObject getVariable ['ExileLifeJobCargo',[]] isEqualTo [])";
				action = "ExileClientInteractionObject call ExileLifeClient_system_jobs_util_stealCargo";
			};
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && !ExilePlayerInSafezone && ((locked ExileClientInteractionObject) != 1)";
				action = "[_this,-1] call ExileClient_object_lock_scan";
			};
			class HackLock: ExileAbstractAction
			{
				title = "Hack Lock";
				condition = "('ExileLife_Item_HashCatXL' in (magazines player)) && ('Exile_Item_Laptop' in (magazines player)) && !ExilePlayerInSafezone && ((locked ExileClientInteractionObject) != 1)";
				action = "4 call ExileLifeClient_gui_keypadHack_show";
			};
			class Lock: ExileAbstractAction
			{
				title = "Lock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
				action = "true spawn ExileClient_object_lock_toggle";
			};
			class Unlock: ExileAbstractAction
			{
				title = "Unlock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};
			class Repair: ExileAbstractAction
			{
				title = "Repair";
				condition = "('Exile_Item_Foolbox' in (magazines player))";
				action = "['RepairVehicle', _this select 0] call ExileClient_action_execute";
			};
			class Flip: ExileAbstractAction
			{
				title = "Flip";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_flip";
			};
			class Refuel: ExileAbstractAction
			{
				title = "Refuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_refuel";
			};
			class DrainFuel: ExileAbstractAction
			{
				title = "Drain Fuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_drain";
			};
			class RotateLeft: ExileAbstractAction
			{
				title = "Rotate Left";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "[ExileClientInteractionObject,-15] call ExileClient_object_vehicle_rotate";
			};
			class RotateRight: ExileAbstractAction
			{
				title = "Rotate Right";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "[ExileClientInteractionObject,15] call ExileClient_object_vehicle_rotate";
			};
			class ForceOut: ExileAbstractAction
			{
				title = "Force Out";
				condition = "!((locked ExileClientInteractionObject) isEqualTo 2)  && !((ExileClientInteractionObject getVariable ['ExileLifeVehicleCaptives', []]) isEqualTo [])";
				action = "ExileClientInteractionObject call ExileLifeClient_object_handcuffs_forceGetOut";
			};
		};
	};
	class Safe
	{
		targetType = 2;
		targets[] = { "Exile_Container_Safe"};
		class Actions
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "[_this,-1] call ExileClient_object_lock_scan";
			};
			class HackLock: ExileAbstractAction
			{
				title = "Hack Lock";
				condition = "('ExileLife_Item_HashCatXL' in (magazines player)) && ('Exile_Item_Laptop' in (magazines player)) && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "4 call ExileLifeClient_gui_keypadHack_show";
			};
			class Lock : ExileAbstractAction
			{
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};
			class Unlock : ExileAbstractAction
			{
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};
			class Pack : ExileAbstractAction
			{
				title = "Pack";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_container_pack";
			};
			class SetPinCode : ExileAbstractAction
			{
				title = "Set PIN";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_lock_setPin";
			};
		};
	};
	class Laptop
	{
		targetType = 2;
		targets[] = { "Exile_Construction_Laptop_Static"};
		class Actions
		{
			class CameraSystem: ExileAbstractAction
			{
				title = "CCTV Access";
				condition = "((ExileClientInteractionObject animationPhase 'LaptopLidRotation') >= 0.5)";
				action = "_this call ExileClient_gui_baseCamera_show";
			};
		};
	};
	class SupplyBox
	{
		targetType = 2;
		targets[] = { "Exile_Container_SupplyBox"};
		class Actions
		{
			class Mount: ExileAbstractAction
			{
				title = "Mount";
				condition = "(isNull (attachedTo ExileClientInteractionObject)) && ((ExileClientInteractionObject getvariable ['ExileOwnerUID',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_supplyBox_mount";
			};
			class Install: ExileAbstractAction
			{
				title = "Install";
				condition = "isNull (attachedTo ExileClientInteractionObject) && ((ExileClientInteractionObject getvariable ['ExileOwnerUID',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_supplyBox_install";
			};
			class Unmount: ExileAbstractAction
			{
				title = "Unmount";
				condition = "!(isNull (attachedTo ExileClientInteractionObject)) && ((ExileClientInteractionObject getvariable ['ExileOwnerUID',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_supplyBox_unmount";
			};
		};
	};
	class Drawbridge
	{
		targetType = 2;
		targets[] = { "Exile_Construction_Abstract_DrawBridge"};
		class Actions
		{
			class Lower: ExileAbstractAction
			{
				title = "Lower";
				condition = "ExileClientInteractionObject call ExileClient_object_construction_openBridgeShow";
				action = "ExileClientInteractionObject animateSource ['DrawBridge_Source', 0];";
			};
			class Raise: ExileAbstractAction
			{
				title = "Raise";
				condition = "((ExileClientInteractionObject animationSourcePhase 'DrawBridge_Source') < 0.5)";
				action = "ExileClientInteractionObject animateSource ['DrawBridge_Source', 2]";
			};
		};
	};
	class Construction
	{
		targetType = 2;
		targets[] = { "Exile_Construction_Abstract_Static"};
		class Actions
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "[_this,-1] call ExileClient_object_lock_scan";
			};
			class HackLock: ExileAbstractAction
			{
				title = "Hack Lock";
				condition = "('ExileLife_Item_HashCatXL' in (magazines player)) && ('Exile_Item_Laptop' in (magazines player)) && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "4 call ExileLifeClient_gui_keypadHack_show";
			};
			class Unlock : ExileAbstractAction
			{
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};
			class Lock : ExileAbstractAction
			{
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};
			class Move: ExileAbstractAction
			{
				title = "Move";
				condition = "(call ExileClient_util_world_isInOwnTerritory) && !(getNumber(configFile >> 'CfgVehicles' >> typeOf ExileClientInteractionObject >> 'ExileLifeDisableMove') isEqualTo 1) && (ExileClientInteractionObject getVariable ['ExileLifeDisableMove',false])";
				action = "_this spawn ExileClient_object_construction_move";
			};
			class Deconstruct: ExileAbstractAction
			{
				title = "Remove";
				condition = "call ExileClient_util_world_isInOwnTerritory && !(getNumber(configFile >> 'CfgVehicles' >> typeOf ExileClientInteractionObject >> 'ExileLifeDisableMove') isEqualTo 1)";
				action = "_this spawn ExileClient_object_construction_deconstruct";
			};
			class AddALock : ExileAbstractAction
			{
				title = "Add a Lock";
				condition = "call ExileClient_object_construction_lockAddShow";
				action = "_this spawn ExileClient_object_construction_lockAdd";
			};
			class Upgrade : ExileAbstractAction
			{
				title = "Upgrade";
				condition = "call ExileClient_object_construction_upgradeShow";
				action = "_this call ExileClient_object_construction_upgrade";
			};
			class MakeBoom : ExileAbstractAction
			{
				title = "Plant charge";
				condition = "call ExileClient_system_breaching_condition";
				action = "_this call ExileClient_system_breaching_action";
			};
			class Repair : ExileAbstractAction
			{
				title = "Repair";
				condition = "(!((ExileClientInteractionObject getVariable ['ExileConstructionDamage',0]) isEqualTo 0)) && (call ExileClient_util_world_isInOwnTerritory)";
				action = "_this call ExileClient_object_construction_repair";
			};
			class GrindLock : ExileAbstractAction
			{
				title = "Grind Lock";
				condition = "(getNumber(missionConfigFile >> 'CfgGrinding' >> 'enableGrinding') isEqualTo 1) && ('Exile_Item_Grinder' in (magazines player)) && ('Exile_Magazine_Battery' in (magazines player)) && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1) && ((ExileClientInteractionObject animationPhase 'DoorRotation') < 0.5)";
				action = "['GrindLock', _this select 0] call ExileClient_action_execute";
			};
		};
	};
	class Container
	{
		targetType = 2;
		targets[] = { "Exile_Container_Abstract"};
		class Actions
		{
			class Pack
			{
				title = "Pack";
				condition = "!((typeOf ExileClientInteractionObject) isEqualTo 'Exile_Container_SupplyBox') && !(getNumber(configFile >> 'CfgVehicles' >> typeOf ExileClientInteractionObject >> 'ExileLifeDisableMove') isEqualTo 1)";
				action = "_this spawn ExileClient_object_container_pack";
			};
			class Move: ExileAbstractAction
			{
				title = "Move";
				condition = "((getNumber(configFile >> 'CfgVehicles' >> typeOf ExileClientInteractionObject >> 'exileIsLockable') isEqualTo 0) || ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)) && !(getNumber(configFile >> 'CfgVehicles' >> typeOf ExileClientInteractionObject >> 'ExileLifeDisableMove') isEqualTo 1)";
				action = "_this spawn ExileClient_object_construction_move";
			};
		};
	};
	class Flag
	{
		targetType = 2;
		targets[] = { "Exile_Construction_Flag_Static"};
		class Actions
		{
			class StealFlag: ExileAbstractAction
			{
				title = "Steal Flag";
				condition = "((ExileClientInteractionObject getvariable ['ExileFlagStolen',1]) isEqualTo 0)";
				action = "['StealFlag', _this select 0] call ExileClient_action_execute";
			};
			class RestoreFlag: ExileAbstractAction
			{
				title = "Restore Flag";
				condition = "((ExileClientInteractionObject getvariable ['ExileFlagStolen',0]) isEqualTo 1)";
				action = "['restoreFlagRequest', [netID ExileClientInteractionObject]] call ExileClient_system_network_send";
			};
		};
	};
	class SleepingBag
	{
		targetType = 2;
		targets[] = { "ExileLife_Construction_SleepingBag_Static"};
		class Actions
		{
			class Rest: ExileAbstractAction
			{
				title = "Rest";
				condition = "!ExileClientIsHandcuffed";
				action = "['Rest', ExileClientInteractionObject] call ExileClient_action_execute";
			};
			class VehicleGarage: ExileAbstractAction
			{
				title = "Vehicle Garage";
				condition = "!ExileClientIsHandcuffed";
				action = "call ExileClient_gui_virtualGarageDialog_show;";
			};
			class HideSnake: ExileAbstractAction
			{
				title = "Hide snake";
				condition = "!ExileClientIsHandcuffed";
				action = "systemchat 'This feature is not yet implemented';";
			};
		};
	};
	class Boat
	{
		targetType = 2;
		targets[] = { "Ship"};
		class Actions
		{
			class JobCargo: ExileAbstractAction
			{
				title = "Steal Cargo";
				condition = "(((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0) && !(ExileClientInteractionObject getVariable ['ExileLifeJobCargo',[]] isEqualTo [])";
				action = "ExileClientInteractionObject call ExileLifeClient_system_jobs_util_stealCargo";
			};
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "[_this,-1] call ExileClient_object_lock_scan";
			};
			class HackLock: ExileAbstractAction
			{
				title = "Hack Lock";
				condition = "('ExileLife_Item_HashCatXL' in (magazines player)) && ('Exile_Item_Laptop' in (magazines player)) && !ExilePlayerInSafezone && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "4 call ExileLifeClient_gui_keypadHack_show";
			};
			class Lock: ExileAbstractAction
			{
				title = "Lock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};
			class Unlock: ExileAbstractAction
			{
				title = "Unlock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};
			class Repair: ExileAbstractAction
			{
				title = "Repair";
				condition = "true";
				action = "['RepairVehicle', _this select 0] call ExileClient_action_execute";
			};
			class Refuel: ExileAbstractAction
			{
				title = "Refuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_refuel";
			};
			class DrainFuel: ExileAbstractAction
			{
				title = "Drain Fuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_drain";
			};
			class Push: ExileAbstractAction
			{
				title = "Fus Ro Dah!";
				condition = "((crew ExileClientInteractionObject) isEqualTo [])";
				action = "_this call ExileClient_object_vehicle_push";
			};
		};
	};
	class Bikes
	{
		targetType = 2;
		targets[] = { "Bicycle"};
		class Actions
		{
			class Flip: ExileAbstractAction
			{
				title = "Flip";
				condition = "true";
				action = "_this call ExileClient_object_vehicle_flip";
			};
		};
	};
	class Player
	{
		targetType = 2;
		targets[] = { "Exile_Unit_Player", "ExileLife_Unit_Guard"};
		class Actions
		{
			class cutZiptie: ExileAbstractAction
			{
				title = "Cut Ziptie";
				condition = "call ExileLifeClient_object_handcuffs_check_cutZiptie";
				action = "_this call ExileClient_object_handcuffs_free";
			};
			class breakCement: ExileAbstractAction
			{
				title = "Break Cement";
				condition = "call ExileLifeClient_object_handcuffs_check_breakCement";
				action = "_this call ExileLifeClient_object_handcuffs_breakCement";
			};
			class Search: ExileAbstractAction
			{
				title = "Search Gear";
				condition = "call ExileLifeClient_object_handcuffs_check_searchGear";
				action = "_this call ExileClient_object_handcuffs_searchGear";
			};
			class Identify: ExileAbstractAction
			{
				title = "Identify Body";
				condition = "(!(alive ExileClientInteractionObject) || (ExileClientInteractionObject getVariable ['ExileLifeClientIncapacitated',false]))";
				action = "_this call ExileClient_object_player_identifyBody";
			};
			class HideCorpse: ExileAbstractAction
			{
				title = "Hide Body";
				condition = "!(alive ExileClientInteractionObject) && ('Exile_Melee_Shovel' isEqualTo (currentWeapon player))";
				action = "['HideBody', (_this select 0)] call ExileClient_action_execute";
			};
			class Restrain: ExileAbstractAction
			{ 
				title = "Restrain";
				condition = "call ExileLifeClient_object_handcuffs_check_use";
				action = "_this call ExileClient_object_handcuffs_use";
			};
			class Escort: ExileAbstractAction
			{
				title = "Escort";
				condition = "call ExileLifeClient_object_handcuffs_check_escort";
				action = "_this call ExileLifeClient_object_handcuffs_escort";
			};
			class ForceUp: ExileAbstractAction
			{
				title = "Force to Stand";
				condition = "call ExileLifeClient_object_handcuffs_check_forceUp";
				action = "_this call ExileLifeClient_object_handcuffs_forceUp";
			};
			class ForceDown: ExileAbstractAction
			{
				title = "Force to Sit";
				condition = "call ExileLifeClient_object_handcuffs_check_forceDown";
				action = "_this call ExileLifeClient_object_handcuffs_forceDown";
			};
			class CementShoes: ExileAbstractAction
			{
				title = "Craft Cement Shoes";
				condition = "call ExileLifeClient_object_handcuffs_check_cementshoes";
				action = "_this call ExileLifeClient_object_handcuffs_cementshoes";
			};
			class Resuscitate: ExileAbstractAction
			{
				title = "Resuscitate";
				condition = "(alive ExileClientInteractionObject) && (ExileClientInteractionObject getVariable ['ExileLifeClientUnconscious',false]) && ([player, 'Exile_Item_Instadoc'] call ExileLifeClient_util_playerCargo_contains)";
				action = "['resuscitate', ExileClientInteractionObject] call ExileClient_action_execute";
			};
			class Revive: ExileAbstractAction
			{
				title = "Revive";
				condition = "(ExileClientInteractionObject getVariable ['ExileLifeClientReviveState', 0] == 1) && (ExileClientInteractionObject getVariable ['ExileLifeClientIncapacitated', false]) && (player getVariable ['ExileLifeClientUberMedic',false])";
				action = "['revive', ExileClientInteractionObject] call ExileClient_action_execute;";
			};
			class Smother: ExileAbstractAction
			{
				title = "Smother";
				condition = "(ExileClientInteractionObject getVariable ['ExileLifeClientReviveState', 0] == 1) && (ExileClientInteractionObject getVariable ['ExileLifeClientIncapacitated', false]) && (player getVariable ['ExileLifeClientUberMedic',false])";
				action = "['smother', ExileClientInteractionObject] call ExileClient_action_execute;";
			};
			class Bandage: ExileAbstractAction
			{
				title = "Bandage";
				condition = "!(ExileClientInteractionObject getVariable ['ExileLifeClientIncapacitated',false]) && (alive ExileClientInteractionObject) && (ExileClientInteractionObject getVariable ['ExileLifeClientBleeding',false]) && ([player, 'Exile_Item_Bandage'] call ExileLifeClient_util_playerCargo_contains)";
				action = "['bandage', ExileClientInteractionObject] call ExileClient_action_execute";
			};
		};
	};
	class Generators
	{
		targetType = 2;
		targets[] = { "ExileLife_Generator"};
		class Actions
		{
			class Refuel: ExileAbstractAction
			{
				title = "<img image='\a3\ui_f\data\IGUI\Cfg\Actions\refuel_ca.paa' size='1' shadow='false' />Refuel Generator";
				condition = "true";
				action = "call ExileLifeClient_system_jobs_scenes_generator_process";
			};
		};
	};
	class FuelStation
	{
		targetType = 1;
		targets[] = { "FuelSource"};
		class Actions
		{
			class FillContainer: ExileAbstractAction
			{
				title = "<img image='\a3\ui_f\data\IGUI\Cfg\Actions\refuel_ca.paa' size='1' shadow='false' />Fill Container";
				condition = "(([player, 'Exile_Item_FuelBarrelEmpty'] call ExileLifeClient_util_playerCargo_contains) || ([player, 'Exile_Item_FuelCanisterEmpty'] call ExileLifeClient_util_playerCargo_contains)) && !(ExileLifeClientResourceZone)";
				action = "call ExileLifeClient_object_player_action_refuelContainer";
			};
			class RefuelStation: ExileAbstractAction
			{
				title = "<img image='\a3\ui_f\data\IGUI\Cfg\Actions\refuel_ca.paa' size='1' shadow='false' />Fill Fuel Station";
					condition = "['fuelstationRefuel', 2] call ExileLifeClient_system_jobs_util_actionChk";
				action = "call ExileLifeClient_system_jobs_scenes_fuelStation_refuelFuelStation";
			};
		};
	};
	class Refinery
	{
		targetType = 2;
		targets[] = { "ExileLife_Refinery_Pump"};
		class Actions
		{
			class FillTanker: ExileAbstractAction
			{
				title = "<img image='\a3\ui_f\data\IGUI\Cfg\Actions\refuel_ca.paa' size='1' shadow='false' />Fill Fuel Tanker";
				condition = "['fuelstationRefuel', 1] call ExileLifeClient_system_jobs_util_actionChk";
				action = "call ExileLifeClient_system_jobs_scenes_refinery_refuelTanker";
			};
		};
	};
	class Stash
	{
		targetType = 1;
		targets[] = { "StashSource"};
		class Actions
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1) && !ExilePlayerInSafezone";
				action = "[ExileClientInteractionObject,-1] call ExileClient_object_lock_scan";
			};
			class HackLock: ExileAbstractAction
			{
				title = "Hack Lock";
				condition = "('ExileLife_Item_HashCatXL' in (magazines player)) && ('Exile_Item_Laptop' in (magazines player)) && ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1) && !ExilePlayerInSafezone";
				action = "4 call ExileLifeClient_gui_keypadHack_show";
			};
			class Lock : ExileAbstractAction
			{
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};
			class Unlock : ExileAbstractAction
			{
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};
		};
	};
	class Animal
	{
		targetType = 2;
		targets[] = { "Exile_Animal_Abstract"};
		class Actions
		{
			class Gut: ExileAbstractAction
			{
				title = "Gut Animal";
				condition = "!(alive ExileClientInteractionObject) && (ExileClientInteractionObject getVariable ['CanBeGutted', false])";
				action = "['GutAnimal', ExileClientInteractionObject] call ExileClient_action_execute";
			};
		};
	};
	class FruitTrees
	{
		targetType = 1;
		targets[] = { "FruitSource"};
		class Actions
		{
			class PickFruit: ExileAbstractAction
			{
				title = "Search for Fruit";
				condition = "(alive ExileClientInteractionObject) && !ExileClientIsHandcuffed";
				action = "call ExileLifeClient_resources_pickfruitRequest";
			};
		};
	};
};
class CfgInteractionModels
{
	class WaterSource
	{
		name = "Water tanks, barrels, coolers or pumps";
		models[] =
		{
			"barrelwater_f",
			"barrelwater_grey_f",
			"waterbarrel_f",
			"watertank_f",
			"stallwater_f",
			"waterpump_01_f",
			"water_source_f",
			"wellpump",
			"Land_jhad_stand_water",
			"Land_Jbad_Misc_Well_L",
			"Land_jbad_Fridge",
			"Land_jbad_reservoir",
			"Land_jbad_teapot",
			"Land_KBud",
			"watertank_01_f",
			"watertank_02_f",
			"watertank_03_f",
			"watertank_04_f"
		};
	};
	class CleanWaterSource
	{
		name = "Water cooler";
		models[] =
		{
			"watercooler"
		};
	};
	class WorkBench
	{
		name = "Work Bench";
		models[] =
		{
			"workstand_f.p3d"
		};
	};
	class ShippingContainerSource
	{
		name = "Shipping Containers";
		models[] =
		{
			"CargoBox_V1_F",
			"Cargo20_blue_F",
			"Cargo20_brick_red_F",
			"Cargo20_cyan_F",
			"Cargo20_grey_F",
			"Cargo20_light_blue_F",
			"Cargo20_light_green_F",
			"Cargo20_military_green_F",
			"Cargo20_military_ruins_F",
			"Cargo20_orange_F",
			"Cargo20_red_F",
			"Cargo20_sand_F",
			"Cargo20_white_F",
			"Cargo20_yellow_F",
			"Cargo40_blue_F",
			"Cargo40_brick_red_F",
			"Cargo40_cyan_F",
			"Cargo40_grey_F",
			"Cargo40_light_blue_F",
			"Cargo40_light_green_F",
			"Cargo40_military_green_F",
			"Cargo40_orange_F",
			"Cargo40_red_F",
			"Cargo40_sand_F",
			"Cargo40_white_F",
			"Cargo40_yellow_F",
			"nam_container.p3d",
			"misc_cargo1d.p3d",
			"misc_cargo1b.p3d",
			"misc_cargo1bo.p3d",
			"misc_cargo2c.p3d",
			"misc_cargo1ao.p3d",
			"Land_ContainerLine_01_F",
			"Land_ContainerLine_02_F",
			"Land_ContainerLine_03_F",
			"wreck_"
		};
	};
	class WoodSource
	{
		name = "Trees";
		models[] =
		{
			" t_",
			" bo_t_",
            " str_",
            " Smrk_",
            " les_",
            " brg_"
		};
	};
	class FuelSource
	{
		name = "Fuel pumps, stations";
		models[] =
		{
			"fuelstation_feed_f.p3d",
			"flexibletank_01_f.p3d",
			"fs_feed_f.p3d",
			"fuelstation_01_pump_f.p3d",
			"fuelstation_02_pump_f.p3d"
		};
	};
	class FruitSource
	{
		name = "FruitTrees";
		models[] =
		{
			"t_broussonetiap1s_f.p3d",
			"t_oleae1s_f.p3d"
		};
	};
	class BrewingSource
	{
		name = "Brewing Barrels";
		models[] =
		{
			"waterbarrel_f"
		};
	};
	class BushSource
	{
		name = "Bushes";
		models[] = {"b_"};
	};
	class StoneSource
	{
		name = "Stones, stone walls or rocks";
		models[] =
		{
			"stone",
			"Stone",
			"Rock",
			"rock",
			"cobble",
			"Cobble",
			"sea_wall_f.p3d",
			"bluntrock_wallv"
		};
	};
	class scrapMetalSource
	{
		name = "Scrap Metal Source";
		models[] =
		{
			"CargoBox_V1_F",
			"Cargo20_blue_F",
			"Cargo20_brick_red_F",
			"Cargo20_cyan_F",
			"Cargo20_grey_F",
			"Cargo20_light_blue_F",
			"Cargo20_light_green_F",
			"Cargo20_military_green_F",
			"Cargo20_military_ruins_F",
			"Cargo20_orange_F",
			"Cargo20_red_F",
			"Cargo20_sand_F",
			"Cargo20_white_F",
			"Cargo20_yellow_F",
			"Cargo40_blue_F",
			"Cargo40_brick_red_F",
			"Cargo40_cyan_F",
			"Cargo40_grey_F",
			"Cargo40_light_blue_F",
			"Cargo40_light_green_F",
			"Cargo40_military_green_F",
			"Cargo40_orange_F",
			"Cargo40_red_F",
			"Cargo40_sand_F",
			"Cargo40_white_F",
			"Cargo40_yellow_F",
			"nam_container.p3d",
			"misc_cargo1d.p3d",
			"misc_cargo1b.p3d",
			"misc_cargo1bo.p3d",
			"misc_cargo2c.p3d",
			"misc_cargo1ao.p3d",
			"Land_ContainerLine_01_F",
			"Land_ContainerLine_02_F",
			"Land_ContainerLine_03_F",
			"wreck_"
		};
	};
	class StashSource
	{
		name = "Stash";
		models[] = 	
		{
			"ExileLife_Stash_Bushes.p3d",
			"ExileLife_Stash_Grass.p3d"
		};
	};
};
class CfgJobs
{
	minTime = 5; 
	maxTime = 30;  
	availableDayJobs[] = {"huntingSmall","fishingSmall","farmingSmall","fuelstationRefuel","metalCollection","lumberCollection","ironMining","goldMining"};
	availableNightJobs[] = {"generatorAthira","generatorRefuel"}; 
	availableConditionalJobs[] = {"prisonCollect"};
	minJobs = 10;
	maxJobs = 20;
	class CfgGenerators
	{
		class CfgElectricalGrid 
		{
			Athira = 2000;
			Kavala = 3000;
			defaultdistance = 1000;
		};
	};
	unrepeatables[] = {"ExileLife_Trader_Receivings"};
};
#define LEVEL_1_PRISON_TIME     {0,0,5}
#define LEVEL_2_PRISON_TIME     {0,0,10}
#define LEVEL_3_PRISON_TIME     {0,0,15}
#define LEVEL_4_PRISON_TIME     {0,0,20}
#define LEVEL_1_PRISON_ORE      20
#define LEVEL_2_PRISON_ORE      30
#define LEVEL_3_PRISON_ORE      40
#define LEVEL_4_PRISON_ORE      50
#define LEVEL_1_FINE_TIME       {2,0,0}
#define LEVEL_2_FINE_TIME       {1,0,0}
#define LEVEL_3_FINE_TIME       {0,8,0}
#define LEVEL_4_FINE_TIME       {0,4,0}
#define LEVEL_5_FINE_TIME       {0,2,0}
#define LEVEL_1_FINE_AMOUNT     1000
#define LEVEL_2_FINE_AMOUNT     5000
#define LEVEL_3_FINE_AMOUNT     10000
#define LEVEL_4_FINE_AMOUNT     20000
#define LEVEL_5_FINE_AMOUNT     50000
#define LEVEL_6_FINE_AMOUNT     100000
#define GO_TO_JAIL              0,{0,0,0}
#define ISSUE_WARNING_ONLY      0,{0,0,0}}, {0,{0,0,0}
class CfgLaws
{
    offences[] = {
        {"Warning",{ISSUE_WARNING_ONLY}},
        {"Disturbing the peace", {LEVEL_1_FINE_AMOUNT,LEVEL_1_FINE_TIME}, {LEVEL_1_PRISON_ORE, LEVEL_1_PRISON_TIME}},
        {"Failure to comply", {LEVEL_1_FINE_AMOUNT,LEVEL_1_FINE_TIME}, {LEVEL_1_PRISON_ORE, LEVEL_1_PRISON_TIME}},
        {"Resisting Arrest", {LEVEL_2_FINE_AMOUNT,LEVEL_2_FINE_TIME}, {LEVEL_1_PRISON_ORE, LEVEL_1_PRISON_TIME}},
        {"Theft", {LEVEL_2_FINE_AMOUNT,LEVEL_2_FINE_TIME}, {LEVEL_1_PRISON_ORE, LEVEL_1_PRISON_TIME}},
        {"Attempted Theft", {LEVEL_1_FINE_AMOUNT,LEVEL_1_FINE_TIME}, {LEVEL_1_PRISON_ORE, LEVEL_1_PRISON_TIME}},
        {"Robbery", {GO_TO_JAIL}, {LEVEL_2_PRISON_ORE, LEVEL_2_PRISON_TIME}},
        {"Attempted Robbery", {GO_TO_JAIL}, {LEVEL_2_PRISON_ORE, LEVEL_2_PRISON_TIME}},
        {"Armed Robbery", {GO_TO_JAIL}, {LEVEL_3_PRISON_ORE, LEVEL_3_PRISON_TIME}},
        {"Attempted Armed Robbery", {GO_TO_JAIL}, {LEVEL_2_PRISON_ORE, LEVEL_2_PRISON_TIME}},
        {"Trespassing", {LEVEL_1_FINE_AMOUNT,LEVEL_1_FINE_TIME}, {LEVEL_1_PRISON_ORE, LEVEL_1_PRISON_TIME}},
        {"Prison Break", {GO_TO_JAIL}, {LEVEL_4_PRISON_ORE, LEVEL_4_PRISON_TIME}},
        {"Murder", {GO_TO_JAIL}, {LEVEL_4_PRISON_ORE, LEVEL_4_PRISON_TIME}},
        {"Conspiring to commit murder", {GO_TO_JAIL}, {LEVEL_3_PRISON_ORE, LEVEL_3_PRISON_TIME}},
        {"Attempted Murder", {GO_TO_JAIL}, {LEVEL_4_PRISON_ORE, LEVEL_4_PRISON_TIME}},
        {"Manslaughter", {GO_TO_JAIL}, {LEVEL_3_PRISON_ORE, LEVEL_3_PRISON_TIME}},
        {"ABH (Actual Bodily Harm)", {GO_TO_JAIL}, {LEVEL_1_PRISON_ORE, LEVEL_2_PRISON_TIME}},
        {"GBH (Grievous Bodily Harm)", {GO_TO_JAIL}, {LEVEL_2_PRISON_ORE, LEVEL_2_PRISON_TIME}},
        {"ABH/GBH of a Guard", {GO_TO_JAIL}, {LEVEL_2_PRISON_ORE, LEVEL_2_PRISON_TIME}},
        {"Kidnapping", {GO_TO_JAIL}, {LEVEL_3_PRISON_ORE, LEVEL_3_PRISON_TIME}},
        {"Attempted Kidnapping", {GO_TO_JAIL}, {LEVEL_2_PRISON_ORE, LEVEL_2_PRISON_TIME}},
        {"Possession of an illegal firearm", {GO_TO_JAIL}, {LEVEL_2_PRISON_ORE, LEVEL_2_PRISON_TIME}},
        {"Possession of an Illegal attachment", {LEVEL_1_FINE_AMOUNT,LEVEL_1_FINE_TIME}, {LEVEL_1_PRISON_ORE, LEVEL_1_PRISON_TIME}},
        {"Possession of an Illegal magazine", {LEVEL_1_FINE_AMOUNT,LEVEL_1_FINE_TIME}, {LEVEL_1_PRISON_ORE, LEVEL_1_PRISON_TIME}},
        {"Dangerous Driving", {LEVEL_1_FINE_AMOUNT,LEVEL_1_FINE_TIME}, {LEVEL_1_PRISON_ORE, LEVEL_1_PRISON_TIME}},
        {"Vehicle Theft", {LEVEL_3_FINE_AMOUNT,LEVEL_3_FINE_TIME}, {LEVEL_2_PRISON_ORE, LEVEL_2_PRISON_TIME}},
        {"Attempted Vehicle Theft", {LEVEL_2_FINE_AMOUNT,LEVEL_2_FINE_TIME}, {LEVEL_2_PRISON_ORE, LEVEL_2_PRISON_TIME}},
        {"Possession Class A Substance", {LEVEL_4_FINE_AMOUNT,LEVEL_4_FINE_TIME}, {LEVEL_2_PRISON_ORE, LEVEL_2_PRISON_TIME}},
        {"Intent to Supply Class A Substance", {LEVEL_5_FINE_AMOUNT,LEVEL_5_FINE_TIME}, {LEVEL_3_PRISON_ORE, LEVEL_3_PRISON_TIME}},
        {"Trafficking Class A Substance", {GO_TO_JAIL}, {LEVEL_4_PRISON_ORE, LEVEL_3_PRISON_TIME}},
        {"Dealing Class A Substance", {GO_TO_JAIL}, {LEVEL_4_PRISON_ORE, LEVEL_3_PRISON_TIME}},
        {"Possession Class B Substance", {LEVEL_1_FINE_AMOUNT,LEVEL_1_FINE_TIME}, {LEVEL_1_PRISON_ORE, LEVEL_1_PRISON_TIME}},
        {"Intent to Supply Class B Substance", {LEVEL_3_FINE_AMOUNT,LEVEL_3_FINE_TIME}, {LEVEL_2_PRISON_ORE, LEVEL_2_PRISON_TIME}},
        {"Trafficking Class B Substance", {LEVEL_4_FINE_AMOUNT,LEVEL_4_FINE_TIME}, {LEVEL_2_PRISON_ORE, LEVEL_2_PRISON_TIME}},
        {"Dealing Class B Substance", {GO_TO_JAIL}, {LEVEL_2_PRISON_ORE, LEVEL_2_PRISON_TIME}}
    };
};
class CfgLifeSkills
{
	maxGainPerRestart = 500; 
	class Lockpick
	{
	    maxLevel = 5;
        class Levels
		{
			class Default_Levels
			{
				requiredExp = 0;
			};
		    class 1: Default_Levels
			{
				requiredExp = 1000;
			};
			class 2: Default_Levels
			{
				requiredExp = 3000;
			};
			class 3: Default_Levels
			{
				requiredExp = 7000;
			};
			class 4: Default_Levels
			{
				requiredExp = 15000;
			};
			class 5: Default_Levels
			{
				requiredExp = 31000;
			};
		};
	};
    class Strength
	{
	    maxLevel = 5;
        class Levels
		{
			class Default_Levels
			{
				requiredExp = 0;
				carryBonusPercent = 0;
			};
		    class 1: Default_Levels
			{
				requiredExp = 1000;
			};
			class 2: Default_Levels
			{
				requiredExp = 3000;
				carryBonusPercent = 100;
			};
			class 3: Default_Levels
			{
				requiredExp = 7000;
				carryBonusPercent = 200;
			};
			class 4: Default_Levels
			{
				requiredExp = 15000;
				carryBonusPercent = 300;
			};
			class 5: Default_Levels
			{
				requiredExp = 31000;
				carryBonusPercent = 400;
			};
		};
	};
    class Speed
	{
	    maxLevel = 5;
        class Levels
		{
			class Default_Levels
			{
				requiredExp = 0;
			};
		    class 1: Default_Levels
			{
				requiredExp = 1000;
			};
			class 2: Default_Levels
			{
				requiredExp = 3000;
			};
			class 3: Default_Levels
			{
				requiredExp = 7000;
			};
			class 4: Default_Levels
			{
				requiredExp = 15000;
			};
			class 5: Default_Levels
			{
				requiredExp = 31000;
			};
		};
	};
    class Heal
	{
	    maxLevel = 5;
        class Levels
		{
			class Default_Levels
			{
				requiredExp = 0;
			};
		    class 1: Default_Levels
			{
				requiredExp = 1000;
			};
			class 2: Default_Levels
			{
				requiredExp = 3000;
			};
			class 3: Default_Levels
			{
				requiredExp = 7000;
			};
			class 4: Default_Levels
			{
				requiredExp = 15000;
			};
			class 5: Default_Levels
			{
				requiredExp = 31000;
			};
		};
	};
    class Repair
	{
	    maxLevel = 5;
        class Levels
		{
			class Default_Levels
			{
				requiredExp = 0;
				canRepairGunWithoutKit = false;
				repairChanceWithoutKit = 0;
				canRepairGunWithKit = true;
				repairChanceWithKit = 0;
				canRepairToNew = false;
				repairChanceForNew = 0;	
			};
		    class 1: Default_Levels
			{
				requiredExp = 1000;
				repairChanceWithKit = 0.7;
			};
			class 2: Default_Levels
			{
				requiredExp = 3000;
				repairChanceWithKit = 0.8;
			};
			class 3: Default_Levels
			{
				requiredExp = 7000;
				canRepairGunWithoutKit = true;
				repairChanceWithoutKit = 0.4;
				repairChanceWithKit = 0.9;
			};
			class 4: 3
			{
				requiredExp = 15000;
				repairChanceWithoutKit = 0.7;
				repairChanceWithKit = 1;
				canRepairToNew = true;
				repairChanceForNew = 0.3;	
			};
			class 5: 4
			{
				requiredExp = 31000;
				repairChanceWithoutKit = 0.9;
				repairChanceWithKit = 1;
				repairChanceForNew = 0.5;	
			};
		};
	};
};
class CfgLocker
{
	numbersOnly = "0123456789";
	maxDeposit = 1000000; 
};
class CfgMap
{
	showPlayerLocationButton = 1;
	showMapTextures = 1;
	showPlayerIcon = 1;
	showGroupMemberIcons = 1;
	showClanMemberIcons = 1;
	showPlayerDeathIcon = 1;
};
class CfgMedical 
{
	class Healing 
	{
		Exile_Item_InstaDoc = 10;
		Exile_Item_Bandage = 5;
		Exile_Item_Vishpirin = 7;
	};
};
class CfgPenalties
{
    class hireVehicleDestruction{
        class max{
            wanted = 1;
            fine = 5000;
            dueDate[] = {1,0,0}; 
        };
        class mid{
            wanted = 0;
            fine = 3000;
            dueDate[] = {3,0,0}; 
        };
        class min{
            wanted = 0;
            fine = 1000;
            dueDate[] = {7,0,0}; 
        };
    };
};
class CfgPlayer
{
	hungerDecay = 90;
	thirstDecay = 60;
	healthDecay = 5.0;
	thirstRegen = 90;
	hungerRegen = 90;
	restingTime = 15;
	healthRegeneration = 5;
	hungerDegradation = 5;
	thirstDegradation = 5;
	enableHearingLoss = 1;
	recoveryPerMinute = 2;
	customAimCoefficient = 0.5;
	enableFatigue = 0;
	enableStamina = 0;
	disableMapDrawing = 1;
	useGradientAffectedAutoRun = 0;
	bloodTypes[] = 
	{
		{"O_Pos", 0.38},
		{"O_Neg", 0.07},
		{"A_Pos", 0.34},
		{"A_Neg", 0.06},
		{"B_Pos", 0.09},
		{"B_Neg", 0.02},
		{"AB_Pos", 0.03},
		{"AB_Neg", 0.01}
	};
	class GasMask
	{
		filterDegradation = 1;
		use3DSound = 1;
		class Filters
		{
			ExileLife_Item_GasMask_Filter = 3;
		};
	};
	class CfgExileLifeCharacterInfo
	{
		ages[] =
		{
			"16","17","18","19","20","21","22","23","24","25",
			"26","27","28","29","30","31","32","33","34","35",
			"36","37","38","39","40","41","42","43","44","45",
			"46","47","48","49","50","51","52","53","54","55",
			"56","57","58","59","60","61","62","63","64","65",
			"66","67","68","69","70","71","72","73","74","75",
			"76","77","78","79","80"
		};
		reasons[] =
		{
			"Testing Reason 1",
			"Testing Reason 2"
		};
	};
	class CfgExileLifeClasses
	{
		class default
		{
			class Skillbonus
			{
				lockpick = 0;
				strength = 0;
				speed = 0;
				health = 0;
				repair = 0;
				stash = 0;
			};
		};
		class Smuggler
		{
			class Skillbonus
			{
				lockpick = 0;
				strength = 500;
				speed = 200;
				health = 0;
				repair = 100;
				stash = 200;
			};
			class Outfit
			{
				headgear = "H_Watchcap_camo";
				goggles = ""; 
				primaryWeapon = "SMG_05_F";
				secondaryWeapon = "";
				handgunWeapon = "";
				primaryWeaponItems = ["muzzle_snds_L","optic_Holosight_blk_F"];
				secondaryWeaponItems = [];
				handgunWeaponItems = [];
				weaponItems = [];
				uniform = "U_BG_Guerilla3_1";
				vest = "V_BandollierB_khk";
				backpack = "B_AssaultPack_rgr";
				currentWeapon = "SMG_05_F";
			};
		};
		class Thief
		{
			class Skillbonus
			{
				lockpick = 500;
				strength = 200;
				speed = 300;
				health = 0;
				repair = 0;
				stash = 0;
			};
			class Outfit
			{
				headgear = "H_Watchcap_blk";
				goggles = "G_Balaclava_TI_blk_F";
				primaryWeapon = "";
				secondaryWeapon = "";
				handgunWeapon = "Makarov";
				primaryWeaponItems = [];
				secondaryWeaponItems = [];
				handgunWeaponItems = ["muzzle_snds_L"];
				weaponItems = [];
				uniform = "U_I_C_Soldier_Bandit_2_F";
				vest = "V_BandollierB_blk";
				backpack = "B_AssaultPack_blk";
				currentWeapon = "Makarov";
			};
		};
		class Thug
		{
			class Skillbonus
			{
				lockpick = 0;
				strength = 500;
				speed = 0;
				health = 0;
				repair = 500;
				stash = 0;
			};
			class Outfit
			{
				headgear = "H_Bandanna_gry";
				goggles = ""; 
				primaryWeapon = "";
				secondaryWeapon = "Exile_Melee_SledgeHammer";
				handgunWeapon = "";
				primaryWeaponItems = [];
				secondaryWeaponItems = [];
				handgunWeaponItems = [];
				weaponItems = [];
				uniform = "U_I_G_resistanceLeader_F";
				vest = "V_BandollierB_rgr";
				backpack = "";
				currentWeapon = "Exile_Melee_SledgeHammer";
			};
		};
 		class Murderer
		{
			class Skillbonus
			{
				lockpick = 100;
				strength = 200;
				speed = 300;
				health = 400;
				repair = 0;
				stash = 0;
			};
			class Outfit
			{
				headgear = "";
				goggles = ""; 
				primaryWeapon = "arifle_AK74";
				secondaryWeapon = "";
				handgunWeapon = "Colt1911";
				primaryWeaponItems = [];
				secondaryWeaponItems = [];
				handgunWeaponItems = [];
				weaponItems = [];
				uniform = "U_I_C_Soldier_Para_4_F";
				vest = "";
				backpack = "";
				currentWeapon = "Colt1911";
			};
		};
		class Guard
		{
			class Skillbonus
			{
				lockpick = 0;
				strength = 250;
				speed = 250;
				health = 250;
				repair = 250;
				stash = 0;
			};
			class Outfit
			{
				headgear = "H_HelmetSpecB";
				goggles = "G_Balaclava_TI_G_blk_F";
				primaryWeapon = "arifle_SPAR_01_blk_F";
				handgunWeapon = "";
				primaryWeaponItems = ["acc_flashlight","optic_Holosight_blk_F"];
				handgunWeaponItems = [];
				weaponItems = [];
				uniform = "U_B_GEN_Commander_F";
				vest = "V_TacVest_gen_F";
				backpack = "";
				currentWeapon = "arifle_SPAR_01_blk_F";
			};
			class Permissions
			{
				setRecords[]={1,2,3,4,5,6}; 
				setWanted[]={3,4,5,6}; 
				setArmed[]={1,2,3,4,5,6}; 
			};
		};
	};
};
class CfgPoptabStorage
{
	class Exile_Container_Safe_Small { max = 25000; };	
};
#define ALL 0
#define CLIENT 1
#define SERVER 2
#define RemoteExec(FUNCTION,TARGET) class FUNCTION {allowedTargets = TARGET;};
class CfgRemoteExec
{
	class Functions
	{
		mode = 1;
		jip = 0;
		RemoteExec(ExileServer_system_network_dispatchIncomingMessage,SERVER)
	};
	class Commands
	{
		mode=0;
		jip=0;
	};
};
class CfgResources
{
	class CfgRefineryResources
	{
		oretypes[] = {"ExileLife_Item_GoldOre","ExileLife_Item_IronOre"};
		class ExileLife_Item_GoldOre						{ refined = "ExileLife_Item_Gold"; };
		class ExileLife_Item_IronOre						{ refined = "ExileLife_Item_Iron"; };
	};
	class CfgPlantResources
	{
		planttypes[] = 
		{
			{"t_oleae1s_f.p3d","Apples"},
			{"t_broussonetiap1s_f.p3d","Oranges"},
			{"t_banana_slim_f.p3d","Bananas"},
			{"t_banana_wild_f.p3d","Bananas"}
		};
	};
	class CfgResourceSurfaces
	{
		badSurfaces[] =	{"#GDTConcrete","#GdtSeabed","#GdtStony","#GdtThorn","#GdtMarsh"};
		class GroundTexture
		{
			GdtDead = "\exilelife_assets\models\Items\Farming\Images\saltsoil_co.paa";
			GdtSoil = "\exilelife_assets\models\Items\Farming\Images\gardensoil_co.paa";
			GdtGrassGreen = "\exilelife_assets\models\Items\Farming\Images\gardensoil_co.paa";
		};
		class Salt_Surface
		{
			name = "Salt Ground Textures";
			surface[] =
			{
				"#GdtDead"
			};
		};
		class Artefacts_Surface
		{
			name = "Ruins Ground Textures";
			surface[] =
			{
				"#GdtSoil"
			};
		};
	};
	class CfgResourceQuantity
	{
		class Salt
		{
			quantity = 1000;
		};
		class Artefacts
		{
			quantity = 50;
		};
		class Oranges
		{
			quantity = 500;
		};
		class Apples
		{
			quantity = 500;
		};
		class cider
		{
			quantity = 15;
		};
		class pruno
		{
			quantity = 15;
		};
	};
	class CfgBrewingRecipes
	{
		TypesofBrew[] =
		{
			"cider","pruno"
		};
		class cider
		{
			ingredients[] =
			{
				{"ExileLife_Item_applejuice",20},
				{"ExileLife_Item_sugar",1},
				{"ExileLife_Item_yeast",1}
			};
			tools[] =
			{
			};
		};
		class pruno
		{
			ingredients[] =
			{
				{"ExileLife_Item_orangejuice",20},
				{"ExileLife_Item_sugar",1},
				{"ExileLife_Item_yeast",1}
			};
			tools[] =
			{
			};
		};
	};
};
class CfgSimulation
{
	enableDynamicSimulation = 1;
	enableGlobalSimulation[] = {
		"Exile_Construction_BaseCamera_Static"
	};
	groupSimulationDistance = 500;
	vehicleSimulationDistance = 250;
	emptyVehicleSimulationDistance = 250;
	propSimulationDistance = 50;
	isMovingSimulationCoef = 2;
};
class CfgSlothMachine
{
	spinCost = 500;
	Jackpot = 10100;
	chances[] = 
	{
		{85, ""}, 					
		{95, "Level1"}, 			
		{96, "Level2"}, 			
		{97, "Level3"}, 			
		{98, "Level4"}, 			
		{99, "Level5"},				
		{100, "Jackpot"} 			
	};
	class Prizes 
	{
		class Level1
		{
			symbol = "\exile_assets\texture\item\Exile_Item_ToiletPaper.paa";
			prize = 101;
		};
		class Level2
		{
			symbol = "\exile_assets\texture\item\Exile_Item_CockONut.paa";
			prize = 110;
		};
		class Level3
		{
			symbol = "\exile_assets\texture\item\Exile_Item_Beer.paa";
			prize = 125;
		};
		class Level4
		{
			symbol = "\exile_assets\texture\item\Exile_Item_Knife.paa";
			prize = 150;
		};
		class Level5
		{
			symbol = "\exile_assets\texture\item\Exile_Item_Safe.paa";
			prize = 200;
		};
		class Jackpot
		{
			symbol = "\exile_assets\texture\item\Exile_Item_XmasPresent.paa";
		};
	};
};
class CfgTerritories
{
	prices[] =
	{
		{5000,					10,			4 					}, 
		{10000,					10,			5 					}, 
		{15000,					10,			6 					}, 
		{20000,					10,			7					}, 
		{25000,					10,			8					}, 
		{30000,					10,			9					}, 
		{35000,					10,			10					}, 
		{40000,					10,			11					}, 
		{45000,					10,			12					}, 
		{50000,					10,			13					}  
	};
	maximumRadius = 10;
	minimumDistanceToOtherTerritories = 20;
	maximumNumberOfTerritoriesPerPlayer = 2;
	minimumDistanceToTraderZones = 500;
	minimumDistanceToSpawnZones = 1000;
	popTabAmountPerObject = 100;
	constructionBlockDuration = 5;
	minPopTabAmount = 500;
	maximumDistanceFromSafeZones = 500;
};
class CfgTraderCategories
{
	class Community
	{
		name = "Community Items";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] =
		{
		};
	};
	class Community2
	{
		name = "Community Items 2";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] =
		{
		};
	};
	class Community3
	{
		name = "Community Items 3";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] =
		{
		};
	};
	class Community4
	{
		name = "Community Items 4";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] =
		{
		};
	};
	class Community5
	{
		name = "Community Items 5";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] =
		{
		};
	};
	class Community6
	{
		name = "Community Items 6";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] =
		{
		};
	};
	class Community7
	{
		name = "Community Items 7";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] =
		{
		};
	};
	class Community8
	{
		name = "Community Items 8";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] =
		{
		};
	};
	class Community9
	{
		name = "Community Items 9";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] =
		{
		};
	};
	class Community10
	{
		name = "Community Items 10";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] =
		{
		};
	};
	class Uniforms
	{
		name = "Uniforms";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] =
		{
			"U_C_Journalist",
			"U_C_Poloshirt_blue",
			"U_C_Poloshirt_burgundy",
			"U_C_Poloshirt_salmon",
			"U_C_Poloshirt_stripped",
			"U_C_Poloshirt_tricolour",
			"U_C_Poor_1",
			"U_C_Poor_2",
			"U_C_Poor_shorts_1",
			"U_C_Scientist",
			"U_OrestesBody",
			"U_Rangemaster",
			"U_NikosAgedBody",
			"U_NikosBody",
			"U_Competitor",
			"U_B_CombatUniform_mcam",
			"U_B_CombatUniform_mcam_tshirt",
			"U_B_CombatUniform_mcam_vest",
			"U_B_CombatUniform_mcam_worn",
			"U_B_CTRG_1",
			"U_B_CTRG_2",
			"U_B_CTRG_3",
			"U_I_CombatUniform",
			"U_I_CombatUniform_shortsleeve",
			"U_I_CombatUniform_tshirt",
			"U_I_OfficerUniform",
			"U_O_CombatUniform_ocamo",
			"U_O_CombatUniform_oucamo",
			"U_O_OfficerUniform_ocamo",
			"U_B_SpecopsUniform_sgg",
			"U_O_SpecopsUniform_blk",
			"U_O_SpecopsUniform_ocamo",
			"U_I_G_Story_Protagonist_F",
			"Exile_Uniform_Woodland",
			"U_C_HunterBody_grn",
			"U_IG_Guerilla1_1",
			"U_IG_Guerilla2_1",
			"U_IG_Guerilla2_2",
			"U_IG_Guerilla2_3",
			"U_IG_Guerilla3_1",
			"U_BG_Guerilla2_1",
			"U_IG_Guerilla3_2",
			"U_BG_Guerrilla_6_1",
			"U_BG_Guerilla1_1",
			"U_BG_Guerilla2_2",
			"U_BG_Guerilla2_3",
			"U_BG_Guerilla3_1",
			"U_BG_leader",
			"U_IG_leader",
			"U_I_G_resistanceLeader_F",
			"U_I_Wetsuit",
			"U_O_Wetsuit",
			"U_B_Wetsuit",
			"U_B_survival_uniform",
			"U_B_HeliPilotCoveralls",
			"U_I_HeliPilotCoveralls",
			"U_B_PilotCoveralls",
			"U_I_pilotCoveralls",
			"U_O_PilotCoveralls",
			"U_B_T_Soldier_F",
			"U_B_T_Soldier_AR_F",
			"U_B_T_Soldier_SL_F",
			"U_B_CTRG_Soldier_F",
			"U_B_CTRG_Soldier_2_F",
			"U_B_CTRG_Soldier_3_F",
			"U_B_GEN_Soldier_F",
			"U_B_GEN_Commander_F",
			"U_O_T_Soldier_F",
			"U_O_T_Officer_F",
			"U_O_V_Soldier_Viper_F",
			"U_O_V_Soldier_Viper_hex_F",
			"U_I_C_Soldier_Para_1_F",
			"U_I_C_Soldier_Para_2_F",
			"U_I_C_Soldier_Para_3_F",
			"U_I_C_Soldier_Para_4_F",
			"U_I_C_Soldier_Para_5_F",
			"U_I_C_Soldier_Bandit_1_F",
			"U_I_C_Soldier_Bandit_2_F",
			"U_I_C_Soldier_Bandit_3_F",
			"U_I_C_Soldier_Bandit_4_F",
			"U_I_C_Soldier_Bandit_5_F",
			"U_I_C_Soldier_Camo_F",
			"U_C_man_sport_1_F",
			"U_C_man_sport_2_F",
			"U_C_man_sport_3_F",
			"U_C_Man_casual_1_F",
			"U_C_Man_casual_2_F",
			"U_C_Man_casual_3_F",
			"U_C_Man_casual_4_F",
			"U_C_Man_casual_5_F",
			"U_C_Man_casual_6_F",
			"U_B_CTRG_Soldier_urb_1_F",
			"U_B_CTRG_Soldier_urb_2_F",
			"U_B_CTRG_Soldier_urb_3_F"
		};
	};
	class Vests
	{
		name = "Vests";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\vest_ca.paa";
		items[] =
		{
			"V_Press_F",
			"V_Rangemaster_belt",
			"V_TacVest_blk",
			"V_TacVest_blk_POLICE",
			"V_TacVest_brn",
			"V_TacVest_camo",
			"V_TacVest_khk",
			"V_TacVest_oli",
			"V_TacVestCamo_khk",
			"V_TacVestIR_blk",
			"V_I_G_resistanceLeader_F",
			"V_BandollierB_blk",
			"V_BandollierB_cbr",
			"V_BandollierB_khk",
			"V_BandollierB_oli",
			"V_BandollierB_rgr",
			"V_Chestrig_blk",
			"V_Chestrig_khk",
			"V_Chestrig_oli",
			"V_Chestrig_rgr",
			"V_HarnessO_brn",
			"V_HarnessO_gry",
			"V_HarnessOGL_brn",
			"V_HarnessOGL_gry",
			"V_HarnessOSpec_brn",
			"V_HarnessOSpec_gry",
			"V_PlateCarrier1_blk",
			"V_PlateCarrier1_rgr",
			"V_PlateCarrier2_rgr",
			"V_PlateCarrier3_rgr",
			"V_PlateCarrierGL_blk",
			"V_PlateCarrierGL_mtp",
			"V_PlateCarrierGL_rgr",
			"V_PlateCarrierH_CTRG",
			"V_PlateCarrierIA1_dgtl",
			"V_PlateCarrierIA2_dgtl",
			"V_PlateCarrierIAGL_dgtl",
			"V_PlateCarrierIAGL_oli",
			"V_PlateCarrierL_CTRG",
			"V_PlateCarrierSpec_blk",
			"V_PlateCarrierSpec_mtp",
			"V_PlateCarrierSpec_rgr",
			"V_TacChestrig_grn_F",
			"V_TacChestrig_oli_F",
			"V_TacChestrig_cbr_F",
			"V_PlateCarrier1_tna_F",
			"V_PlateCarrier2_tna_F",
			"V_PlateCarrierSpec_tna_F",
			"V_PlateCarrierGL_tna_F",
			"V_HarnessO_ghex_F",
			"V_HarnessOGL_ghex_F",
			"V_BandollierB_ghex_F",
			"V_TacVest_gen_F",
			"V_PlateCarrier1_rgr_noflag_F",
			"V_PlateCarrier2_rgr_noflag_F",
			"V_DeckCrew_yellow_F",
			"V_DeckCrew_blue_F",
			"V_DeckCrew_green_F",
			"V_DeckCrew_red_F",
			"V_DeckCrew_white_F",
			"V_DeckCrew_brown_F",
			"V_DeckCrew_violet_F"
		};
	};
	class Headgear
	{
		name = "Headgear";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\headgear_ca.paa";
		items[] =
		{
			"Exile_Headgear_SantaHat",
			"Exile_Headgear_SafetyHelmet",
			"H_Cap_blk",
			"H_Cap_blk_Raven",
			"H_Cap_blu",
			"H_Cap_brn_SPECOPS",
			"H_Cap_grn",
			"H_Cap_headphones",
			"H_Cap_khaki_specops_UK",
			"H_Cap_oli",
			"H_Cap_press",
			"H_Cap_red",
			"H_Cap_tan",
			"H_Cap_tan_specops_US",
			"H_Watchcap_blk",
			"H_Watchcap_camo",
			"H_Watchcap_khk",
			"H_Watchcap_sgg",
			"H_MilCap_blue",
			"H_MilCap_dgtl",
			"H_MilCap_mcamo",
			"H_MilCap_ocamo",
			"H_MilCap_oucamo",
			"H_MilCap_rucamo",
			"H_Bandanna_camo",
			"H_Bandanna_cbr",
			"H_Bandanna_gry",
			"H_Bandanna_khk",
			"H_Bandanna_khk_hs",
			"H_Bandanna_mcamo",
			"H_Bandanna_sgg",
			"H_Bandanna_surfer",
			"H_Booniehat_dgtl",
			"H_Booniehat_dirty",
			"H_Booniehat_grn",
			"H_Booniehat_indp",
			"H_Booniehat_khk",
			"H_Booniehat_khk_hs",
			"H_Booniehat_mcamo",
			"H_Booniehat_tan",
			"H_Hat_blue",
			"H_Hat_brown",
			"H_Hat_camo",
			"H_Hat_checker",
			"H_Hat_grey",
			"H_Hat_tan",
			"H_StrawHat",
			"H_StrawHat_dark",
			"H_Beret_02",
			"H_Beret_blk",
			"H_Beret_blk_POLICE",
			"H_Beret_brn_SF",
			"H_Beret_Colonel",
			"H_Beret_grn",
			"H_Beret_grn_SF",
			"H_Beret_ocamo",
			"H_Beret_red",
			"H_Shemag_khk",
			"H_Shemag_olive",
			"H_Shemag_olive_hs",
			"H_Shemag_tan",
			"H_ShemagOpen_khk",
			"H_ShemagOpen_tan",
			"H_TurbanO_blk",
			"H_HelmetB",
			"H_HelmetB_black",
			"H_HelmetB_camo",
			"H_HelmetB_desert",
			"H_HelmetB_grass",
			"H_HelmetB_light",
			"H_HelmetB_light_black",
			"H_HelmetB_light_desert",
			"H_HelmetB_light_grass",
			"H_HelmetB_light_sand",
			"H_HelmetB_light_snakeskin",
			"H_HelmetB_paint",
			"H_HelmetB_plain_blk",
			"H_HelmetB_sand",
			"H_HelmetB_snakeskin",
			"H_HelmetCrew_B",
			"H_HelmetCrew_I",
			"H_HelmetCrew_O",
			"H_HelmetIA",
			"H_HelmetIA_camo",
			"H_HelmetIA_net",
			"H_HelmetLeaderO_ocamo",
			"H_HelmetLeaderO_oucamo",
			"H_HelmetO_ocamo",
			"H_HelmetO_oucamo",
			"H_HelmetSpecB",
			"H_HelmetSpecB_blk",
			"H_HelmetSpecB_paint1",
			"H_HelmetSpecB_paint2",
			"H_HelmetSpecO_blk",
			"H_HelmetSpecO_ocamo",
			"H_CrewHelmetHeli_B",
			"H_CrewHelmetHeli_I",
			"H_CrewHelmetHeli_O",
			"H_HelmetCrew_I",
			"H_HelmetCrew_B",
			"H_HelmetCrew_O",
			"H_PilotHelmetHeli_B",
			"H_PilotHelmetHeli_I",
			"H_PilotHelmetHeli_O",
			"H_Helmet_Skate",
			"H_HelmetB_TI_tna_F",
			"H_HelmetB_tna_F",
			"H_HelmetB_Enh_tna_F",
			"H_HelmetB_Light_tna_F",
			"H_HelmetSpecO_ghex_F",
			"H_HelmetLeaderO_ghex_F",
			"H_HelmetO_ghex_F",
			"H_HelmetCrew_O_ghex_F",
			"H_MilCap_tna_F",
			"H_MilCap_ghex_F",
			"H_Booniehat_tna_F",
			"H_Beret_gen_F",
			"H_MilCap_gen_F",
			"H_Cap_oli_Syndikat_F",
			"H_Cap_tan_Syndikat_F",
			"H_Cap_blk_Syndikat_F",
			"H_Cap_grn_Syndikat_F"
		};
	};
class Glasses
	{
		name = "Glasses";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\Goggles_ca.paa";
		items[] =
		{
			"G_Spectacles",
			"G_Spectacles_Tinted",
			"G_Combat",
			"G_Lowprofile",
			"G_Shades_Black",
			"G_Shades_Green",
			"G_Shades_Red",
			"G_Squares",
			"G_Squares_Tinted",
			"G_Sport_BlackWhite",
			"G_Sport_Blackyellow",
			"G_Sport_Greenblack",
			"G_Sport_Checkered",
			"G_Sport_Red",
			"G_Tactical_Black",
			"G_Aviator",
			"G_Lady_Mirror",
			"G_Lady_Dark",
			"G_Lady_Red",
			"G_Lady_Blue",
			"G_Diving",
			"G_B_Diving",
			"G_O_Diving",
			"G_I_Diving",
			"G_Goggles_VR",
			"G_Balaclava_blk",
			"G_Balaclava_oli",
			"G_Balaclava_combat",
			"G_Balaclava_lowprofile",
			"G_Bandanna_blk",
			"G_Bandanna_oli",
			"G_Bandanna_khk",
			"G_Bandanna_tan",
			"G_Bandanna_beast",
			"G_Bandanna_shades",
			"G_Bandanna_sport",
			"G_Bandanna_aviator",
			"G_Shades_Blue",
			"G_Sport_Blackred",
			"G_Tactical_Clear",
			"G_Balaclava_TI_blk_F",
			"G_Balaclava_TI_tna_F",
			"G_Balaclava_TI_G_blk_F",
			"G_Balaclava_TI_G_tna_F",
			"G_Combat_Goggles_tna_F"
		};
	};
	class PointerAttachments
	{
		name = "Pointer Attachments";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"acc_flashlight",
			"acc_pointer_IR"
		};
	};
	class BipodAttachments
	{
		name = "Bipod Attachments";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itembipod_ca.paa";
		items[] =
		{
			"bipod_01_F_blk",
			"bipod_01_F_mtp",
			"bipod_01_F_snd",
			"bipod_02_F_blk",
			"bipod_02_F_hex",
			"bipod_02_F_tan",
			"bipod_03_F_blk",
			"bipod_03_F_oli",
			"bipod_01_F_khk"
		};
	};
	class MuzzleAttachments
	{
		name = "Suppressor Attachments";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemmuzzle_ca.paa";
		items[] =
		{
			"muzzle_snds_338_black",
			"muzzle_snds_338_green",
			"muzzle_snds_338_sand",
			"muzzle_snds_93mmg",
			"muzzle_snds_93mmg_tan",
			"muzzle_snds_acp",
			"muzzle_snds_B",
			"muzzle_snds_H",
			"muzzle_snds_H_MG",
			"muzzle_snds_H_SW",
			"muzzle_snds_L",
			"muzzle_snds_M",
			"muzzle_snds_H_khk_F",
			"muzzle_snds_H_snd_F",
			"muzzle_snds_58_blk_F",
			"muzzle_snds_m_khk_F",
			"muzzle_snds_m_snd_F",
			"muzzle_snds_B_khk_F",
			"muzzle_snds_B_snd_F",
			"muzzle_snds_58_wdm_F",
			"muzzle_snds_65_TI_blk_F",
			"muzzle_snds_65_TI_hex_F",
			"muzzle_snds_65_TI_ghex_F",
			"muzzle_snds_H_MG_blk_F",
			"muzzle_snds_H_MG_khk_F"
		};
	};
	class UAVs
	{
		name = "Unmanned Aerial Vehicles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\gps_ca.paa";
		items[] =
		{
			"I_UavTerminal",
			"I_UAV_01_backpack_F"
		};
	};
	class StaticMGs
	{
		name = "Static Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"O_HMG_01_support_F",
			"O_HMG_01_weapon_F"
		};
	};
	class OpticAttachments
	{
		name = "Scopes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemoptic_ca.paa";
		items[] =
		{
			"optic_Aco",
			"optic_ACO_grn",
			"optic_ACO_grn_smg",
			"optic_Aco_smg",
			"optic_AMS",
			"optic_AMS_khk",
			"optic_AMS_snd",
			"optic_Arco",
			"optic_DMS",
			"optic_Hamr",
			"optic_Holosight",
			"optic_Holosight_smg",
			"optic_KHS_blk",
			"optic_KHS_hex",
			"optic_KHS_old",
			"optic_KHS_tan",
			"optic_MRCO",
			"optic_MRD",
			"optic_Yorris"
		};
	};
	class Hardware
	{
		name = "Hardware";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Item_DuctTape",
			"Exile_Item_ExtensionCord",
			"Exile_Item_FuelCanisterEmpty",
			"Exile_Item_JunkMetal",
			"Exile_Item_LightBulb",
			"Exile_Item_MetalBoard",
			"Exile_Item_MetalPole",
			"Exile_Item_SafeKit",
			"Exile_Item_CamoTentKit",
			"Exile_Item_CodeLock",
			"Exile_Item_MetalScrews",
			"Exile_Item_MetalWire",
			"Exile_Item_Laptop",
			"Exile_Item_BaseCameraKit",
			"Exile_Item_Cement",
			"Exile_Item_Sand",
			"Exile_Item_MobilePhone",
			"Exile_Item_SprayCan_Black",
			"Exile_Item_SprayCan_Red",
			"Exile_Item_SprayCan_Green",
			"Exile_Item_SprayCan_White",
			"Exile_Item_SprayCan_Blue",
			"Exile_Item_CordlessScrewdriver",
			"Exile_Item_FireExtinguisher",
			"Exile_Item_OilCanister",
			"Exile_Item_Hammer",
			"Exile_Item_Carwheel",
			"Exile_Item_Wrench",
			"Exile_Item_Rope"
		};
	};
	class Food
	{
		name = "Fast Food";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Item_EMRE",
			"Exile_Item_GloriousKnakworst",
			"Exile_Item_Surstromming",
			"Exile_Item_SausageGravy",
			"Exile_Item_Catfood",
			"Exile_Item_ChristmasTinner",
			"Exile_Item_BBQSandwich",
			"Exile_Item_MacasCheese",
			"Exile_Item_Dogfood",
			"Exile_Item_BeefParts",
			"Exile_Item_Cheathas",
			"Exile_Item_Noodles",
			"Exile_Item_SeedAstics",
			"Exile_Item_Raisins",
			"Exile_Item_Moobar",
			"Exile_Item_InstantCoffee"
		};
	};
	class NonVeganFood
	{
		name = "Non-Vegan Food";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Item_CatSharkFilet_Raw",
			"Exile_Item_TunaFilet_Raw",
			"Exile_Item_AlsatianSteak_Raw",
			"Exile_Item_TurtleFilet_Raw",
			"Exile_Item_SheepSteak_Raw",
			"Exile_Item_FinSteak_Raw",
			"Exile_Item_GoatSteak_Raw",
			"Exile_Item_ChickenFilet_Raw",
			"Exile_Item_RoosterFilet_Raw",
			"Exile_Item_MackerelFilet_Raw",
			"Exile_Item_MulletFilet_Raw",
			"Exile_Item_OrnateFilet_Raw",
			"Exile_Item_RabbitSteak_Raw",
			"Exile_Item_SalemaFilet_Raw",
			"Exile_Item_SnakeFilet_Raw"
		};
	};
	class Drinks
	{
		name = "Drinks";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Item_PlasticBottleCoffee",
			"Exile_Item_PowerDrink",
			"Exile_Item_PlasticBottleFreshWater",
			"Exile_Item_Beer",
			"Exile_Item_EnergyDrink",
			"Exile_Item_ChocolateMilk",
			"Exile_Item_MountainDupe",
			"Exile_Item_PlasticBottleEmpty"
		};
	};
	class Tools
	{
		name = "Tools";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Item_Matches",
			"Exile_Item_CookingPot",
			"Exile_Item_CanOpener",
			"Exile_Item_Handsaw",
			"Exile_Item_Pliers",
			"Exile_Item_Grinder",
			"Exile_Item_Foolbox",
			"Exile_Item_CordlessScrewdriver",
			"Exile_Item_FireExtinguisher",
			"Exile_Item_Hammer",
			"Exile_Item_OilCanister",
			"Exile_Item_Screwdriver",
			"Exile_Item_Shovel",
			"Exile_Item_Wrench",
			"ExileLife_Item_SleepingBag",
			"Exile_Item_ToiletPaper",
			"Exile_Item_ZipTie",
			"Exile_Item_BurlapSack",
			"Exile_Item_Bullets_556",
			"Exile_Item_Bullets_762",
			"Exile_Item_WeaponParts",
			"Binocular",
			"Rangefinder",
			"ItemGPS",
			"ItemMap",
			"ItemCompass",
			"ItemRadio",
			"ItemWatch",
			"Exile_Item_XM8"
		};
	};
	class FirstAid
	{
		name = "FirstAid";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Item_InstaDoc",
			"Exile_Item_Bandage",
			"Exile_Item_Vishpirin",
			"Exile_Item_Heatpack"
		};
	};
	class Navigation
	{
		name = "Special Environment";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"B_Parachute",
			"V_RebreatherB",
			"V_RebreatherIA",
			"V_RebreatherIR",
			"ExileLife_Mask_GasMask",
			"G_Diving",
			"G_B_Diving",
			"G_O_Diving",
			"G_I_Diving",
			"NVGoggles",
			"NVGoggles_INDEP",
			"NVGoggles_OPFOR",
			"O_NVGoggles_hex_F",
			"O_NVGoggles_urb_F",
			"O_NVGoggles_ghex_F",
			"NVGoggles_tna_F"
		};
	};
	class Backpacks
	{
		name = "Backpacks";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
		items[] =
		{
			"B_AssaultPack_blk",
			"B_AssaultPack_cbr",
			"B_AssaultPack_dgtl",
			"B_AssaultPack_khk",
			"B_AssaultPack_mcamo",
			"B_AssaultPack_rgr",
			"B_AssaultPack_sgg",
			"B_Bergen_blk",
			"B_Bergen_mcamo",
			"B_Bergen_rgr",
			"B_Bergen_sgg",
			"B_Carryall_cbr",
			"B_Carryall_khk",
			"B_Carryall_mcamo",
			"B_Carryall_ocamo",
			"B_Carryall_oli",
			"B_Carryall_oucamo",
			"B_FieldPack_blk",
			"B_FieldPack_cbr",
			"B_FieldPack_ocamo",
			"B_FieldPack_oucamo",
			"B_HuntingBackpack",
			"B_Kitbag_cbr",
			"B_Kitbag_mcamo",
			"B_Kitbag_sgg",
			"B_OutdoorPack_blk",
			"B_OutdoorPack_blu",
			"B_OutdoorPack_tan",
			"B_TacticalPack_blk",
			"B_TacticalPack_mcamo",
			"B_TacticalPack_ocamo",
			"B_TacticalPack_oli",
			"B_TacticalPack_rgr",
			"B_Bergen_mcamo_F",
			"B_Bergen_dgtl_F",
			"B_Bergen_hex_F",
			"B_Bergen_tna_F",
			"B_AssaultPack_tna_F",
			"B_Carryall_ghex_F",
			"B_FieldPack_ghex_F",
			"B_ViperHarness_blk_F",
			"B_ViperHarness_ghex_F",
			"B_ViperHarness_hex_F",
			"B_ViperHarness_khk_F",
			"B_ViperHarness_oli_F",
			"B_ViperLightHarness_blk_F",
			"B_ViperLightHarness_ghex_F",
			"B_ViperLightHarness_hex_F",
			"B_ViperLightHarness_khk_F",
			"B_ViperLightHarness_oli_F"
		};
	};
	class Ammunition
	{
		name = "Ammunition";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\CargoMag_ca.paa";
		items[] =
		{
			"100Rnd_65x39_caseless_mag",
			"100Rnd_65x39_caseless_mag_Tracer",
			"10Rnd_127x54_Mag",
			"10Rnd_338_Mag",
			"10Rnd_762x54_Mag",
			"10Rnd_93x64_DMR_05_Mag",
			"11Rnd_45ACP_Mag",
			"150Rnd_762x54_Box",
			"150Rnd_762x54_Box_Tracer",
			"16Rnd_9x21_Mag",
			"200Rnd_65x39_cased_Box",
			"200Rnd_65x39_cased_Box_Tracer",
			"20Rnd_556x45_UW_mag",
			"20Rnd_762x51_Mag",
			"30Rnd_45ACP_Mag_SMG_01",
			"30Rnd_45ACP_Mag_SMG_01_tracer_green",
			"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",
			"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
			"30Rnd_556x45_Stanag",
			"30Rnd_556x45_Stanag_Tracer_Green",
			"30Rnd_556x45_Stanag_Tracer_Red",
			"30Rnd_556x45_Stanag_Tracer_Yellow",
			"30Rnd_65x39_caseless_green",
			"30Rnd_65x39_caseless_green_mag_Tracer",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag_Tracer",
			"30Rnd_9x21_Mag",
			"30Rnd_9x21_Yellow_Mag",
			"30Rnd_9x21_Green_Mag",
			"30Rnd_9x21_Red_Mag",
			"5Rnd_127x108_APDS_Mag",
			"5Rnd_127x108_Mag",
			"6Rnd_45ACP_Cylinder",
			"6Rnd_GreenSignal_F",
			"6Rnd_RedSignal_F",
			"7Rnd_408_Mag",
			"9Rnd_45ACP_Mag",
			"Exile_Magazine_30Rnd_762x39_AK",
			"Exile_Magazine_30Rnd_545x39_AK_Green",
			"Exile_Magazine_30Rnd_545x39_AK_Red",
			"Exile_Magazine_30Rnd_545x39_AK_White",
			"Exile_Magazine_30Rnd_545x39_AK_Yellow",
			"Exile_Magazine_45Rnd_545x39_RPK_Green",
			"Exile_Magazine_75Rnd_545x39_RPK_Green",
			"Exile_Magazine_20Rnd_762x51_DMR",
			"Exile_Magazine_20Rnd_762x51_DMR_Yellow",
			"Exile_Magazine_20Rnd_762x51_DMR_Red",
			"Exile_Magazine_20Rnd_762x51_DMR_Green",
			"Exile_Magazine_10Rnd_303",
			"Exile_Magazine_100Rnd_762x54_PK_Green",
			"Exile_Magazine_7Rnd_45ACP",
			"Exile_Magazine_8Rnd_9x18",
			"Exile_Magazine_30Rnd_545x39_AK",
			"Exile_Magazine_6Rnd_45ACP",
			"Exile_Magazine_5Rnd_22LR",
			"Exile_Magazine_10Rnd_762x54",
			"Exile_Magazine_10Rnd_9x39",
			"Exile_Magazine_20Rnd_9x39",
			"Exile_Magazine_8Rnd_74Slug",
			"30Rnd_9x21_Mag_SMG_02",
			"30Rnd_9x21_Mag_SMG_02_Tracer_Red",
			"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",
			"30Rnd_9x21_Mag_SMG_02_Tracer_Green",
			"30Rnd_580x42_Mag_F",
			"30Rnd_580x42_Mag_Tracer_F",
			"100Rnd_580x42_Mag_F",
			"100Rnd_580x42_Mag_Tracer_F",
			"20Rnd_650x39_Cased_Mag_F",
			"10Rnd_50BW_Mag_F",
			"150Rnd_556x45_Drum_Mag_F",
			"150Rnd_556x45_Drum_Mag_Tracer_F",
			"30Rnd_762x39_Mag_F",
			"30Rnd_762x39_Mag_Green_F",
			"30Rnd_762x39_Mag_Tracer_F",
			"30Rnd_762x39_Mag_Tracer_Green_F",
			"30Rnd_545x39_Mag_F",
			"30Rnd_545x39_Mag_Green_F",
			"30Rnd_545x39_Mag_Tracer_F",
			"30Rnd_545x39_Mag_Tracer_Green_F",
			"200Rnd_556x45_Box_F",
			"200Rnd_556x45_Box_Red_F",
			"200Rnd_556x45_Box_Tracer_F",
			"200Rnd_556x45_Box_Tracer_Red_F",
			"10Rnd_9x21_Mag",
			"Exile_Magazine_5Rnd_127x108_Bullet_Cam_Mag",
			"Exile_Magazine_5Rnd_127x108_APDS_Bullet_Cam_Mag",
			"Exile_Magazine_10Rnd_93x64_DMR_05_Bullet_Cam_Mag",
			"Exile_Magazine_7Rnd_408_Bullet_Cam_Mag",
			"Exile_Magazine_10Rnd_338_Bullet_Cam_Mag",
			"Exile_Magazine_10Rnd_127x99_m107_Bullet_Cam_Mag",
			"Exile_Magazine_5Rnd_127x108_KSVK_Bullet_Cam_Mag",
			"Exile_Magazine_5Rnd_127x108_APDS_KSVK_Bullet_Cam_Mag",
			"Exile_Magazine_10Rnd_765x17_SA61",
			"Exile_Magazine_20Rnd_765x17_SA61",
			"Exile_Magazine_10Rnd_127x99_m107",
			"Exile_Magazine_5Rnd_127x108_APDS_KSVK",
			"Exile_Magazine_5Rnd_127x108_KSVK"
		};
	};
	class Flares
	{
		name = "Flares";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Chemlight_blue",
			"Chemlight_green",
			"Chemlight_red",
			"FlareGreen_F",
			"FlareRed_F",
			"FlareWhite_F",
			"FlareYellow_F",
			"UGL_FlareGreen_F",
			"UGL_FlareRed_F",
			"UGL_FlareWhite_F",
			"UGL_FlareYellow_F",
			"3Rnd_UGL_FlareGreen_F",
			"3Rnd_UGL_FlareRed_F",
			"3Rnd_UGL_FlareWhite_F",
			"3Rnd_UGL_FlareYellow_F"
		};
	};
	class Smokes
	{
		name = "Smokes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"SmokeShell",
			"SmokeShellBlue",
			"SmokeShellGreen",
			"SmokeShellOrange",
			"SmokeShellPurple",
			"SmokeShellRed",
			"SmokeShellYellow",
			"1Rnd_Smoke_Grenade_shell",
			"1Rnd_SmokeBlue_Grenade_shell",
			"1Rnd_SmokeGreen_Grenade_shell",
			"1Rnd_SmokeOrange_Grenade_shell",
			"1Rnd_SmokePurple_Grenade_shell",
			"1Rnd_SmokeRed_Grenade_shell",
			"1Rnd_SmokeYellow_Grenade_shell",
			"3Rnd_Smoke_Grenade_shell",
			"3Rnd_SmokeBlue_Grenade_shell",
			"3Rnd_SmokeGreen_Grenade_shell",
			"3Rnd_SmokeOrange_Grenade_shell",
			"3Rnd_SmokePurple_Grenade_shell",
			"3Rnd_SmokeRed_Grenade_shell",
			"3Rnd_SmokeYellow_Grenade_shell"
		};
	};
	class Explosives
	{
		name = "Explosives";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargothrow_ca.paa";
		items[] =
		{
			"HandGrenade",
			"MiniGrenade",
			"B_IR_Grenade",
			"O_IR_Grenade",
			"I_IR_Grenade",
			"1Rnd_HE_Grenade_shell",
			"3Rnd_HE_Grenade_shell",
			"APERSBoundingMine_Range_Mag",
			"APERSMine_Range_Mag",
			"APERSTripMine_Wire_Mag",
			"ClaymoreDirectionalMine_Remote_Mag",
			"DemoCharge_Remote_Mag",
			"IEDLandBig_Remote_Mag",
			"IEDLandSmall_Remote_Mag",
			"IEDUrbanBig_Remote_Mag",
			"IEDUrbanSmall_Remote_Mag",
			"SatchelCharge_Remote_Mag",
			"SLAMDirectionalMine_Wire_Mag"
		};
	};
	class Pistols
	{
		name = "Pistols";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";
		items[] =
		{
			"hgun_ACPC2_F",
			"hgun_P07_F",
			"hgun_Pistol_heavy_01_F",
			"hgun_Pistol_heavy_02_F",
			"hgun_Pistol_Signal_F",
			"hgun_Rook40_F",
			"Exile_Weapon_Colt1911",
			"Exile_Weapon_Makarov",
			"Exile_Weapon_Taurus",
			"Exile_Weapon_TaurusGold",
			"hgun_Pistol_01_F",
			"hgun_P07_khk_F",
			"Exile_Weapon_SA61"
		};
	};
	class SubMachineGuns
	{
		name = "Sub Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"hgun_PDW2000_F",
			"SMG_01_F",
			"SMG_02_F",
			"SMG_05_F"
		};
	};
	class LightMachineGuns
	{
		name = "Light Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"arifle_MX_SW_Black_F",
			"arifle_MX_SW_F",
			"LMG_Mk200_F",
			"LMG_Zafir_F",
			"LMG_03_F",
			"Exile_Weapon_RPK",
			"Exile_Weapon_PK",
			"Exile_Weapon_PKP"
		};
	};
	class AssaultRifles
	{
		name = "Assault Rifles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"arifle_Katiba_C_F",
			"arifle_Katiba_F",
			"arifle_Katiba_GL_F",
			"arifle_Mk20_F",
			"arifle_Mk20_GL_F",
			"arifle_Mk20_GL_plain_F",
			"arifle_Mk20_plain_F",
			"arifle_Mk20C_F",
			"arifle_Mk20C_plain_F",
			"arifle_MX_Black_F",
			"arifle_MX_F",
			"arifle_MX_GL_Black_F",
			"arifle_MX_GL_F",
			"arifle_MXC_Black_F",
			"arifle_MXC_F",
			"arifle_SDAR_F",
			"arifle_TRG20_F",
			"arifle_TRG21_F",
			"arifle_TRG21_GL_F",
			"Exile_Weapon_AK107",
			"Exile_Weapon_AK107_GL",
			"Exile_Weapon_AK74",
			"Exile_Weapon_AK74_GL",
			"Exile_Weapon_AK47",
			"Exile_Weapon_AKS_Gold",
			"arifle_AK12_F",
			"arifle_AK12_GL_F",
			"arifle_AKM_F",
			"arifle_AKM_FL_F",
			"arifle_AKS_F",
			"arifle_ARX_blk_F",
			"arifle_ARX_ghex_F",
			"arifle_ARX_hex_F",
			"arifle_CTAR_blk_F",
			"arifle_CTAR_hex_F",
			"arifle_CTAR_ghex_F",
			"arifle_CTAR_GL_blk_F",
			"arifle_CTARS_blk_F",
			"arifle_CTARS_hex_F",
			"arifle_CTARS_ghex_F",
			"arifle_MX_khk_F",
			"arifle_MX_GL_khk_F",
			"arifle_MXC_khk_F",
			"arifle_MXM_khk_F",
			"Exile_Weapon_M4",
			"Exile_Weapon_M16A4",
			"Exile_Weapon_M16A2"
		};
	};
	class Shotguns
	{
		name = "Shotguns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Weapon_M1014"
		};
	};
	class SniperRifles
	{
		name = "Sniper Rifles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"arifle_MXM_Black_F",
			"arifle_MXM_F",
			"srifle_DMR_01_F",
			"srifle_DMR_02_camo_F",
			"srifle_DMR_02_F",
			"srifle_DMR_02_sniper_F",
			"srifle_DMR_03_F",
			"srifle_DMR_03_khaki_F",
			"srifle_DMR_03_multicam_F",
			"srifle_DMR_03_tan_F",
			"srifle_DMR_03_woodland_F",
			"srifle_DMR_04_F",
			"srifle_DMR_04_Tan_F",
			"srifle_DMR_05_blk_F",
			"srifle_DMR_05_hex_F",
			"srifle_DMR_05_tan_f",
			"srifle_DMR_06_camo_F",
			"srifle_DMR_06_olive_F",
			"srifle_EBR_F",
			"srifle_GM6_camo_F",
			"srifle_GM6_F",
			"srifle_LRR_camo_F",
			"srifle_LRR_F",
			"Exile_Weapon_CZ550",
			"Exile_Weapon_SVD",
			"Exile_Weapon_SVDCamo",
			"Exile_Weapon_VSSVintorez",
			"Exile_Weapon_DMR",
			"Exile_Weapon_LeeEnfield",
			"srifle_LRR_tna_F",
			"srifle_GM6_ghex_F",
			"srifle_DMR_07_blk_F",
			"srifle_DMR_07_hex_F",
			"srifle_DMR_07_ghex_F",
			"Exile_Weapon_m107",
			"Exile_Weapon_ksvk"
		};
	};
	class Bikes
	{
		name = "Bikes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Bike_OldBike",
			"Exile_Bike_MountainBike"
		};
	};
	class Cars
	{
		name = "Cars";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Car_Kart_Black",
			"Exile_Bike_QuadBike_Black",
			"Exile_Car_OldTractor_Red",
			"Exile_Car_TowTractor_White",
			"Exile_Car_Tractor_Red",
			"Exile_Car_UAZ_Green",
			"Exile_Car_UAZ_Open_Green",
			"Exile_Car_Octavius_White",
			"Exile_Car_Golf_Red",
			"Exile_Car_LandRover_Green",
			"Exile_Car_LandRover_Ambulance_Green",
			"Exile_Car_Lada_Green",
			"Exile_Car_Volha_White",
			"Exile_Car_Hatchback_Rusty1",
			"Exile_Car_Hatchback_Rusty2",
			"Exile_Car_Hatchback_Rusty3",
			"Exile_Car_Hatchback_Sport_Red",
			"Exile_Car_SUV_Red",
			"Exile_Car_SUVXL_Black",
			"Exile_Car_SUV_Armed_Black",
			"Exile_Car_Offroad_Rusty1",
			"Exile_Car_Offroad_Rusty2",
			"Exile_Car_Offroad_Rusty3",
			"Exile_Car_Offroad_Repair_Civillian",
			"Exile_Car_Offroad_Armed_Guerilla01",
			"Exile_Car_BRDM2_HQ",
			"Exile_Car_BTR40_MG_Green",
			"Exile_Car_BTR40_Green",
			"Exile_Car_HMMWV_M134_Green",
			"Exile_Car_HMMWV_M2_Green",
			"Exile_Car_HMMWV_MEV_Green",
			"Exile_Car_HMMWV_UNA_Green",
			"Exile_Car_Strider",
			"Exile_Car_Hunter",
			"Exile_Car_Ifrit",
			"Exile_Car_ProwlerLight",
			"Exile_Car_ProwlerUnarmed",
			"Exile_Car_QilinUnarmed",
			"Exile_Car_MB4WD",
			"Exile_Car_MB4WDOpen"
		};
	};
	class SafezoneCars
	{
		name = "Cars";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Car_Kart_Black",
			"Exile_Bike_QuadBike_Black",
			"Exile_Car_OldTractor_Red",
			"Exile_Car_TowTractor_White",
			"Exile_Car_Tractor_Red",
			"Exile_Car_UAZ_Green",
			"Exile_Car_UAZ_Open_Green",
			"Exile_Car_Octavius_White",
			"Exile_Car_Golf_Red",
			"Exile_Car_LandRover_Green",
			"Exile_Car_LandRover_Ambulance_Green",
			"Exile_Car_Lada_Green",
			"Exile_Car_Volha_White",
			"Exile_Car_Hatchback_Rusty1",
			"Exile_Car_Hatchback_Rusty2",
			"Exile_Car_Hatchback_Rusty3",
			"Exile_Car_Hatchback_Sport_Red",
			"Exile_Car_SUV_Red",
			"Exile_Car_SUVXL_Black",
			"Exile_Car_Offroad_Rusty1",
			"Exile_Car_Offroad_Rusty2",
			"Exile_Car_Offroad_Rusty3",
			"Exile_Car_Offroad_Repair_Civillian"
		};
	};
	class Trucks
	{
		name = "Trucks";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Car_Van_Black",
			"Exile_Car_Van_Box_Black",
			"Exile_Car_Van_Fuel_Black",
			"Exile_Car_Ural_Open_Worker",
			"Exile_Car_Ural_Covered_Worker",
			"Exile_Car_V3S_Covered",
			"Exile_Car_Zamak",
			"Exile_Car_Tempest",
			"Exile_Car_HEMMT",
			"Exile_Car_Ikarus_Blue"
		};
	};
	class Choppers
	{
		name = "Helicopters";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Chopper_Hummingbird_Green",
			"Exile_Chopper_Hummingbird_Civillian_Wasp",
			"Exile_Chopper_Huey_Green",
			"Exile_Chopper_Huey_Armed_Green",
			"Exile_Chopper_Taru_Black",
			"Exile_Chopper_Taru_Covered_Black",
			"Exile_Chopper_Taru_Transport_Black",
			"Exile_Chopper_Orca_BlackCustom",
			"Exile_Chopper_Mohawk_FIA",
			"Exile_Chopper_Huron_Black",
			"Exile_Chopper_Hellcat_Green"
		};
	};
	class Boats
	{
		name = "Boats";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Boat_RubberDuck_CSAT",
			"Exile_Boat_RubberDuck_Digital",
			"Exile_Boat_RubberDuck_Orange",
			"Exile_Boat_RubberDuck_Blue",
			"Exile_Boat_RubberDuck_Black",
			"Exile_Boat_MotorBoat_Police",
			"Exile_Boat_MotorBoat_Orange",
			"Exile_Boat_MotorBoat_White",
			"Exile_Boat_SDV_CSAT",
			"Exile_Boat_SDV_Digital",
			"Exile_Boat_SDV_Grey",
			"Exile_Boat_WaterScooter",
			"Exile_Boat_RHIB"
		};
	};
	class Planes
	{
		name = "Planes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Plane_Cessna",
			"Exile_Plane_AN2_Green",
			"Exile_Plane_Ceasar",
			"Exile_Plane_BlackfishInfantry",
			"Exile_Plane_BlackfishVehicle"
		};
	};
	class Diving
	{
		name = "Diving";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"G_B_Diving",
			"G_O_Diving",
			"G_I_Diving",
			"V_RebreatherB",
			"V_RebreatherIA",
			"V_RebreatherIR",
			"U_I_Wetsuit",
			"U_O_Wetsuit",
			"U_B_Wetsuit"
		};
	};
};
class CfgTraders
{
	class Exile_Trader_Armory
	{
		name = "ARMORY";
		showWeaponFilter = 1;
		categories[] = 
		{
			"PointerAttachments",
			"BipodAttachments",
			"MuzzleAttachments",
			"OpticAttachments",
			"Ammunition",
			"Pistols",
			"Shotguns",
			"SubMachineGuns",
			"LightMachineGuns",
			"AssaultRifles",
			"SniperRifles"
		};
	};
	class Exile_Trader_SpecialOperations
	{
		name = "SPECIAL OPERATIONS";
		showWeaponFilter = 1; 
		categories[] = 
		{
			"Flares",
			"Smokes",
			"UAVs",
			"StaticMGs",
			"Explosives",
			"Navigation"
		};
	};
	class Exile_Trader_Equipment
	{	
		name = "EQUIPMENT";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Headgear",
			"Glasses",
			"Uniforms",
			"Vests",
			"Backpacks",
			"FirstAid",
			"Navigation"			
		};
	};
	class ExileLife_Safezone_Trader_Equipment
	{	
		name = "EQUIPMENT";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Headgear",
			"Glasses",
			"Uniforms",
			"Vests",
			"Backpacks",
			"FirstAid"
		};
	};
	class Exile_Trader_Food
	{
		name = "FAST FOOD";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Food",
			"Drinks",
			"NonVeganFood"
		};
	};
	class ExileLife_Safezone_Trader_Food
	{
		name = "FAST FOOD";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Food",
			"Drinks"
		};
	};
	class Exile_Trader_Hardware
	{
		name = "HARDWARE";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Hardware",
			"Tools"
		};
	};
	class ExileLife_Safezone_Trader_Hardware
	{
		name = "HARDWARE";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Hardware",
			"Tools"
		};
	};	
	class Exile_Trader_Vehicle
	{
		name = "VEHICLE";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Cars",
			"Trucks"
		};
	};
	class ExileLife_Safezone_Trader_Vehicle
	{
		name = "VEHICLE";
		showWeaponFilter = 0;
		categories[] = 
		{
			"SafeZoneCars",
			"Trucks"
		};
	};	
	class Exile_Trader_Aircraft
	{
		name = "AIRCRAFT";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Choppers", 
			"Planes"
		};
	};
	class Exile_Trader_Boat
	{
		name = "BOAT";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Boats"
		};
	};
	class Exile_Trader_Diving
	{
		name = "DIVERS";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Diving"
		};
	};
	class Exile_Trader_CommunityCustoms
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community"
		};
	};
	class Exile_Trader_CommunityCustoms2
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community2"
		};
	};
	class Exile_Trader_CommunityCustoms3
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community3"
		};
	};
	class Exile_Trader_CommunityCustoms4
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community4"
		};
	};
	class Exile_Trader_CommunityCustoms5
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community5"
		};
	};
	class Exile_Trader_CommunityCustoms6
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community6"
		};
	};
	class Exile_Trader_CommunityCustoms7
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community7"
		};
	};
	class Exile_Trader_CommunityCustoms8
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community8"
		};
	};
	class Exile_Trader_CommunityCustoms9
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community9"
		};
	};
	class Exile_Trader_CommunityCustoms10
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community10"
		};
	};
};
class CfgTrading 
{
	sellPriceFactor = 0.7;
	rekeyPriceFactor = 0.1;
	class requiredRespect 
	{
		Level1 = 0;
		Level2 = 1000;
		Level3 = 5000;
		Level4 = 12000;
		Level5 = 20000;
		Level6 = 30000;
	};
};
class CfgVehicleCustoms
{
	class Exile_Bike_QuadBike_Abstract
	{
		skins[] =
		{
			{"Exile_Bike_QuadBike_Blue",		100, "Blue",		{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLUE_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLUE_CO.paa"}},
			{"Exile_Bike_QuadBike_Red",			100, "Red",			{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_RED_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVRED_CO.paa"}},
			{"Exile_Bike_QuadBike_White",		100, "White",		{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_WHITE_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVWHITE_CO.paa"}},
			{"Exile_Bike_QuadBike_Nato",		150, "NATO",		{"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","\A3\Soft_F\Quadbike_01\Data\Quadbike_01_wheel_co.paa"}},
			{"Exile_Bike_QuadBike_Csat",		150, "CSAT",		{"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_OPFOR_CO.paa","\A3\Soft_F\Quadbike_01\Data\Quadbike_01_wheel_OPFOR_CO.paa"}},
			{"Exile_Bike_QuadBike_Fia",			150, "FIA",			{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_INDP_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_INDP_CO.paa"}},
			{"Exile_Bike_QuadBike_Guerilla01",	150, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_IG_CO.paa","\A3\soft_f_gamma\Quadbike_01\Data\Quadbike_01_wheel_IG_CO.paa"}},
			{"Exile_Bike_QuadBike_Guerilla02",	150, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_INDP_Hunter_CO.paa","\A3\soft_f_gamma\Quadbike_01\Data\Quadbike_01_wheel_INDP_Hunter_CO.paa"}},
			{"Exile_Bike_QuadBike_Black",		100, "Black",		{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLACK_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLACK_CO.paa"}},
			{"Exile_Bike_QuadBike_Black",		100, "Hex",		{"\A3\Soft_f_Exp\Quadbike_01\data\Quadbike_01_ghex_CO.paa","\A3\Soft_f_Exp\Quadbike_01\data\Quadbike_01_wheel_ghex_CO.paa"}}
		};
	};
	class Exile_Boat_MotorBoat_Abstract
	{
		skins[] =
		{
			{"Exile_Boat_MotorBoat_Police",		350, "Police", {"\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_police_co.paa","\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_police_co.paa"}},
			{"Exile_Boat_MotorBoat_Orange",		300, "Orange", {"\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_rescue_co.paa","\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_rescue_co.paa"}},
			{"Exile_Boat_MotorBoat_White",		300, "White",  {"\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_co.paa","\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_co.paa"}}
		};
	};
	class Exile_Boat_RubberDuck_Abstract
	{
		skins[] =
		{
			{"Exile_Boat_RubberDuck_CSAT",		200, "CSAT", {"\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_OPFOR_CO.paa"}},
			{"Exile_Boat_RubberDuck_Digital",	200, "Digital",{"\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_INDP_CO.paa"}},
			{"Exile_Boat_RubberDuck_Orange",	150, "Orange", {"\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_rescue_CO.paa"}},
			{"Exile_Boat_RubberDuck_Blue",		150, "Blue", {"\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_civilian_CO.paa"}},
			{"Exile_Boat_RubberDuck_Black",		150, "Black", {"\A3\boat_F\Boat_Transport_01\data\boat_transport_01_co.paa"}}
		};
	};
	class Exile_Boat_SDV_Abstract
	{
		skins[] =
		{
			{"Exile_Boat_SDV_CSAT",		200, "CSAT", {"\A3\boat_f_beta\SDV_01\data\SDV_ext_opfor_CO.paa"}},
			{"Exile_Boat_SDV_Digital",	200, "Digital", {"\A3\boat_f_beta\SDV_01\data\SDV_ext_INDP_CO.paa"}},
			{"Exile_Boat_SDV_Grey",		100, "Grey", {"\A3\boat_f_beta\SDV_01\data\SDV_ext_CO.paa"}}
		};
	};
	class Exile_Chopper_Hellcat_Abstract
	{
		skins[] =
		{
			{"Exile_Chopper_Hellcat_Green", 350, "Green", 	{"\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_CO.paa"}},
			{"Exile_Chopper_Hellcat_FIA", 	500, "FIA", 	{"\A3\Air_F_EPB\Heli_Light_03\data\heli_light_03_base_indp_co.paa"}}
		};
	};
	class Exile_Car_Kart_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Kart_BluKing", 				100, "Bluking", 	{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_blu_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"}},
			{"Exile_Car_Kart_RedStone", 			100, "RedStone", 	{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_black_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_black_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"}},
			{"Exile_Car_Kart_Vrana", 				100, "Vrana", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_vrana_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_vrana_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"}},
			{"Exile_Car_Kart_Green", 				100, "Green", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_green_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"}},
			{"Exile_Car_Kart_Blue", 				100, "Blue", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_blue_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"}},
			{"Exile_Car_Kart_Orange", 				100, "Orange",		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_orange_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"}},
			{"Exile_Car_Kart_White", 				100, "White", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_white_CO.paa","","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"}},
			{"Exile_Car_Kart_Yellow", 				100, "Yellow", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_yellow_CO.paa","","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"}},
			{"Exile_Car_Kart_Black", 				100, "Black", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_black_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_black_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"}}
		};
	};
	class Exile_Chopper_Hummingbird_Civillian_Abstract
	{
		skins[] =
		{
			{"Exile_Chopper_Hummingbird_Civillian_Blue", 		350, "Blue", 		{"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_Red", 		350, "Red", 		{"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_ION", 		350, "ION", 		{"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_BlueLine", 	350, "BlueLine", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueLine_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_Digital", 	350, "Digital", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_Elliptical", 	350, "Elliptical", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_Furious", 	350, "Furious", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_GrayWatcher", 350, "GrayWatcher",	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_Jeans", 		350, "Jeans", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_Light", 		350, "Light", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_Shadow", 		350, "Shadow", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_Sheriff", 	350, "Sheriff", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_Speedy", 		350, "Speedy", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_Sunset", 		350, "Sunset", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_Vrana", 		350, "Vrana", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_Wasp", 		350, "Wasp", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"}},
			{"Exile_Chopper_Hummingbird_Civillian_Wave", 		350, "Wave", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"}}
		};
	};
	class Exile_Chopper_Huron_Abstract
	{
		skins[] =
		{
			{"Exile_Chopper_Huron_Black", 	450, "Black", {"\A3\Air_F_Heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_black_CO.paa","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_black_co.paa"}},
			{"Exile_Chopper_Huron_Green", 	450, "Green", {"\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"}}
		};
	};
	class Exile_Chopper_Orca_Abstract
	{
		skins[] =
		{
			{"Exile_Chopper_Orca_CSAT", 		350, "CSAT", 			{"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_CO.paa"}},
			{"Exile_Chopper_Orca_Black", 		350, "Black", 			{"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_CO.paa"}},
			{"Exile_Chopper_Orca_BlackCustom", 	350, "Black Custom", 	{"\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa"}}
		};
	};
	class Exile_Chopper_Taru_Abstract
	{
		skins[] =
		{
			{"Exile_Chopper_Taru_CSAT",		500, "CSAT", 	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_co.paa"}},
			{"Exile_Chopper_Taru_Black",	500, "BLACK", 	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_black_CO.paa"}}
		};
	};
	class Exile_Chopper_Taru_Transport_Abstract
	{
		skins[] =
		{
			{"Exile_Chopper_Taru_Transport_CSAT",	500, "CSAT", 	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_co.paa"}},
			{"Exile_Chopper_Taru_Transport_Black",	500, "Black", 	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_black_CO.paa"}}
		};
	};
	class Exile_Chopper_Taru_Covered_Abstract
	{
		skins[] =
		{
			{"Exile_Chopper_Taru_Covered_CSAT",		500, "CSAT",	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_CO.paa"}},
			{"Exile_Chopper_Taru_Covered_Black",	500, "Black",	{"A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_black_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_black_co.paa"}}
		};
	};
	class Exile_Car_Hatchback_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Hatchback_Rusty1", 			50, "Rusty White",		{"\exile_assets\model\RTV\Exile_Car_Hatchback_01_co.paa"}},
			{"Exile_Car_Hatchback_Rusty2", 			50, "Rusty Red",		{"\exile_assets\model\RTV\Exile_Car_Hatchback_02_co.paa"}},
			{"Exile_Car_Hatchback_Rusty3", 			50, "Rusty Yellow",		{"\exile_assets\model\RTV\Exile_Car_Hatchback_03_co.paa"}},
			{"Exile_Car_Hatchback_Beige", 			100, "Beige",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE01_CO.paa"}},
			{"Exile_Car_Hatchback_Green", 			100, "Green",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE02_CO.paa"}},
			{"Exile_Car_Hatchback_Blue", 			100, "Blue",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE03_CO.paa"}},
			{"Exile_Car_Hatchback_BlueCustom", 		100, "Blue Custom",		{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE04_CO.paa"}},
			{"Exile_Car_Hatchback_BeigeCustom", 	100, "Beige Custom",	{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE05_CO.paa"}},
			{"Exile_Car_Hatchback_Yellow", 			100, "Yellow",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE06_CO.paa"}},
			{"Exile_Car_Hatchback_Grey", 			100, "Grey",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE07_CO.paa"}},
			{"Exile_Car_Hatchback_Black", 			100, "Black",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE08_CO.paa"}},
			{"Exile_Car_Hatchback_Dark", 			100, "Dark",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE09_CO.paa"}}
		};
	};
	class Exile_Car_Hatchback_Sport_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Hatchback_Sport_Red", 		100, "Red",		{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT01_CO.paa"}},
			{"Exile_Car_Hatchback_Sport_Blue", 		100, "Blue",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT02_CO.paa"}},
			{"Exile_Car_Hatchback_Sport_Orange", 	100, "Orange",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT03_CO.paa"}},
			{"Exile_Car_Hatchback_Sport_White", 	100, "White",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT04_CO.paa"}},
			{"Exile_Car_Hatchback_Sport_Beige", 	100, "Beige",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT05_CO.paa"}},
			{"Exile_Car_Hatchback_Sport_Green", 	100, "Green",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT06_CO.paa"}}
		};
	};
	class Exile_Car_Offroad_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Offroad_Rusty1", 		50, "Rusty White",	{"\exile_assets\model\RTV\Exile_offroad_03_co.paa","\exile_assets\model\RTV\Exile_offroad_03_co.paa"}},
			{"Exile_Car_Offroad_Rusty2", 		50, "Rusty Red",	{"\exile_assets\model\RTV\Exile_offroad_01_co.paa","\exile_assets\model\RTV\Exile_offroad_01_co.paa"}},
			{"Exile_Car_Offroad_Rusty3", 		50, "Rusty Blue",	{"\exile_assets\model\RTV\Exile_offroad_02_co.paa","\exile_assets\model\RTV\Exile_offroad_02_co.paa"}},
			{"Exile_Car_Offroad_Red", 			500, "Red",			{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa"}},
			{"Exile_Car_Offroad_Beige", 		500, "Beige",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa"}},
			{"Exile_Car_Offroad_White", 		500, "White",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa"}},
			{"Exile_Car_Offroad_Blue", 			500, "Blue",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa"}},
			{"Exile_Car_Offroad_DarkRed", 		500, "Dark Red",	{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa"}},
			{"Exile_Car_Offroad_BlueCustom", 	500, "Blue Custom",	{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa"}},
			{"Exile_Car_Offroad_Guerilla01", 	700, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"}},
			{"Exile_Car_Offroad_Guerilla02", 	700, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"}},
			{"Exile_Car_Offroad_Guerilla03", 	700, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"}},
			{"Exile_Car_Offroad_Guerilla04", 	700, "Guerilla 04",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"}},
			{"Exile_Car_Offroad_Guerilla05", 	700, "Guerilla 05",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"}},
			{"Exile_Car_Offroad_Guerilla06", 	700, "Guerilla 06",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"}},
			{"Exile_Car_Offroad_Guerilla07", 	700, "Guerilla 07",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"}},
			{"Exile_Car_Offroad_Guerilla08", 	700, "Guerilla 08",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"}},
			{"Exile_Car_Offroad_Guerilla09", 	700, "Guerilla 09",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"}},
			{"Exile_Car_Offroad_Guerilla10", 	700, "Guerilla 10",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"}},
			{"Exile_Car_Offroad_Guerilla11", 	700, "Guerilla 11",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"}},
			{"Exile_Car_Offroad_Guerilla12", 	700, "Guerilla 12",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"}},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Black", {"exile_assets\texture\vehicle\Exile_Offroad_Black_co.paa"}},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Light Blue", {"exile_assets\texture\vehicle\Exile_Offroad_LightBlue_co.paa"}},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Orange",{"exile_assets\texture\vehicle\Exile_Offroad_Orange_co.paa"}},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Pink",	{"exile_assets\texture\vehicle\Exile_Offroad_Pink_co.paa"}},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile White",	{"exile_assets\texture\vehicle\Exile_Offroad_White_co.paa"}},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Yellow",{"exile_assets\texture\vehicle\Exile_Offroad_Yellow_co.paa"}}
		};
	};
	class Exile_Car_LandRover_Abstract
	{
		skins[] =
		{
			{"Exile_Car_LandRover_Red", 250, "Red", {"Exile_psycho_LRC\data\r_lr_base_co.paa","Exile_psycho_LRC\data\r_lr_special_co.paa"}},
			{"Exile_Car_LandRover_Urban", 250, "Urban", {"Exile_psycho_LRC\data\textures\lr_base_urbancamo_co.paa","Exile_psycho_LRC\data\textures\lr_special_urbancamo_co.paa"}},
			{"Exile_Car_LandRover_Green", 250, "Green", {"Exile_psycho_LRC\data\lr_acr_base_co.paa","Exile_psycho_LRC\data\lr_acr_spec_co.paa"}},
			{"Exile_Car_LandRover_Sand", 250, "Sand", {"Exile_psycho_LRC\data\lr_acr_sand_base_co.paa","Exile_psycho_LRC\data\lr_special_acr_co.paa"}},
			{"Exile_Car_LandRover_Desert", 250, "Desert", {"Exile_psycho_LRC\data\lr_acrs_base_co.paa","Exile_psycho_LRC\data\lr_special_acr_co.paa"}}
		};
	};
	class Exile_Car_LandRover_Ambulance_Abstract
	{
		skins[] =
		{
			{"Exile_Car_LandRover_Ambulance_Green", 250, "Green", {"Exile_psycho_LRC\data\lr_acr_base_co.paa","Exile_psycho_LRC\data\lr_amb_ext_co.paa","Exile_psycho_LRC\data\lr_acr_spec_co.paa"}},
			{"Exile_Car_LandRover_Ambulance_Desert", 250, "Desert", {"Exile_psycho_LRC\data\lr_acrs_base_co.paa","Exile_psycho_LRC\data\lr_amb_ext_co.paa","Exile_psycho_LRC\data\lr_special_acr_co.paa"}},
			{"Exile_Car_LandRover_Ambulance_Sand", 250, "Sand", {"Exile_psycho_LRC\data\lr_acr_sand_base_co.paa","Exile_psycho_LRC\data\lr_amb_ext_co.paa","Exile_psycho_LRC\data\lr_special_acr_co.paa"}}
		};
	};
	class Exile_Car_Octavius_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Octavius_White", 250, "White", {"exile_psycho_Octavia\Data\car_body_co.paa"}},
			{"Exile_Car_Octavius_Black", 250, "Black", {"exile_psycho_Octavia\Data\car_body_bl_co.paa"}}
		};
	};
	class Exile_Chopper_Huey_Abstract
	{
		skins[] =
		{
			{"Exile_Chopper_Huey_Green", 700, "Green", {"Exile_psycho_UH1H\data\uh1h_co.paa","Exile_psycho_UH1H\data\uh1h_in_co.paa","Exile_psycho_UH1H\data\default_co.paa","Exile_psycho_UH1H\data\alpha_ca.paa"}},
			{"Exile_Chopper_Huey_Desert", 700, "Desert", {"Exile_psycho_UH1H\data\uh1d_tka_co.paa","Exile_psycho_UH1H\data\uh1d_in_tka_co.paa","Exile_psycho_UH1H\data\default_co.paa","Exile_psycho_UH1H\data\alpha_ca.paa"}}
		};
	};
	class Exile_Chopper_Huey_Armed_Abstract
	{
		skins[] =
		{
			{"Exile_Chopper_Huey_Armed_Green", 700, "Green", {"Exile_psycho_UH1H\data\uh1h_co.paa","Exile_psycho_UH1H\data\uh1h_in_co.paa","Exile_psycho_UH1H\data\default_co.paa","Exile_psycho_UH1H\data\alpha_ca.paa"}},
			{"Exile_Chopper_Huey_Armed_Desert", 700, "Desert", {"Exile_psycho_UH1H\data\uh1d_tka_co.paa","Exile_psycho_UH1H\data\uh1d_in_tka_co.paa","Exile_psycho_UH1H\data\default_co.paa","Exile_psycho_UH1H\data\alpha_ca.paa"}}
		};
	};
	class Exile_Car_Offroad_Armed_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Offroad_Armed_Guerilla01",	250, "Guerilla 01", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"}},
			{"Exile_Car_Offroad_Armed_Guerilla02",	250, "Guerilla 02", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"}},
			{"Exile_Car_Offroad_Armed_Guerilla03",	250, "Guerilla 03", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"}},
			{"Exile_Car_Offroad_Armed_Guerilla04",	250, "Guerilla 04", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"}},
			{"Exile_Car_Offroad_Armed_Guerilla05",	250, "Guerilla 05", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"}},
			{"Exile_Car_Offroad_Armed_Guerilla06",	250, "Guerilla 06", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"}},
			{"Exile_Car_Offroad_Armed_Guerilla07",	250, "Guerilla 07", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"}},
			{"Exile_Car_Offroad_Armed_Guerilla08",	250, "Guerilla 08", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"}},
			{"Exile_Car_Offroad_Armed_Guerilla09",	250, "Guerilla 09", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"}},
			{"Exile_Car_Offroad_Armed_Guerilla10",	250, "Guerilla 10", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"}},
			{"Exile_Car_Offroad_Armed_Guerilla11",	250, "Guerilla 11", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"}},
			{"Exile_Car_Offroad_Armed_Guerilla12",	250, "Guerilla 12", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"}}
		};
	};
	class Exile_Car_Offroad_Repair_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Offroad_Repair_Civillian",		150, "Civillian",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\Offroad_01_ext_repair_CIV_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\Offroad_01_ext_repair_CIV_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Red",			150, "Red",			{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Beige",			150, "Beige",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa"}},
			{"Exile_Car_Offroad_Repair_White",			150, "White",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Blue",			150, "Blue",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa"}},
			{"Exile_Car_Offroad_Repair_DarkRed",		150, "DarkRed",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa"}},
			{"Exile_Car_Offroad_Repair_BlueCustom",		150, "BlueCustom",	{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Guerilla01",		250, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Guerilla02",		250, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Guerilla03",		250, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Guerilla04",		250, "Guerilla 04",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Guerilla05",		250, "Guerilla 05",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Guerilla06",		250, "Guerilla 06",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Guerilla07",		250, "Guerilla 07",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Guerilla08",		250, "Guerilla 08",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Guerilla09",		250, "Guerilla 09",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Guerilla10",		250, "Guerilla 10",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Guerilla11",		250, "Guerilla 11",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"}},
			{"Exile_Car_Offroad_Repair_Guerilla12",		250, "Guerilla 12",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"}}
		};
	};
	class Exile_Car_SUV_Abstract
	{
		skins[] =
		{
			{"Exile_Car_SUV_Red", 		100, "Red",					{"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_CO.paa"}},
			{"Exile_Car_SUV_Black", 	150, "Black",				{"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_02_CO.paa"}},
			{"Exile_Car_SUV_Grey", 		100, "Grey",				{"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_03_CO.paa"}},
			{"Exile_Car_SUV_Orange", 	100, "Orange",				{"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_04_CO.paa"}},
			{"Exile_Car_SUV_Black", 	150, "Snow Camo",			{"exile_assets\texture\vehicle\Exile_SUV_Snow_co.paa"}},
			{"Exile_Car_SUV_Black", 	150, "Leaf Camo",			{"exile_assets\texture\vehicle\Exile_SUV_Leaf_Light_co.paa"}},
			{"Exile_Car_SUV_Black", 	150, "Leaf Camo (Dark)",	{"exile_assets\texture\vehicle\Exile_SUV_Leaf_Dark_co.paa"}}
		};
	};
	class Exile_Car_SUVXL_Abstract
    {
        skins[] = 
        {
            {"Exile_Car_SUVXL_Black", 100, "Black", {"\Exile_psycho_SUV_a3\Data\suv_body_co.paa"}},
            {"Exile_Car_SUVXL_Black", 150, "Blue White", {"\Exile_psycho_SUV_a3\Data\textures\suv_body_bluewhite.paa"}},
            {"Exile_Car_SUVXL_Black", 150, "Charcoal", {"\Exile_psycho_SUV_a3\Data\textures\suv_body_charcoal_co.paa"}},
            {"Exile_Car_SUVXL_Black", 150, "Orange", {"\Exile_psycho_SUV_a3\Data\textures\suv_body_orange_co.paa"}},
            {"Exile_Car_SUVXL_Black", 200, "Hello Kitty", {"\Exile_psycho_SUV_a3\Data\textures\suv_body_Pink_hello_co.paa"}},
            {"Exile_Car_SUVXL_Black", 150, "Red", {"\Exile_psycho_SUV_a3\Data\textures\suv_body_red_co.paa"}},
            {"Exile_Car_SUVXL_Black", 150, "Silver", {"\Exile_psycho_SUV_a3\Data\textures\suv_body_silver_co.paa"}},
            {"Exile_Car_SUVXL_Black", 100, "White", {"\Exile_psycho_SUV_a3\Data\textures\suv_body_white_co.paa"}},
            {"Exile_Car_SUVXL_Black", 150, "Yellow", {"\Exile_psycho_SUV_a3\Data\textures\suv_body_yellow_co.paa"}}
        };
    };
	class Exile_Car_Van_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Van_Black",			100, "Black",		{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"}},
			{"Exile_Car_Van_White",			100, "White",		{"\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"}},
			{"Exile_Car_Van_Red",			100, "Red",			{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"}},
			{"Exile_Car_Van_Guerilla01",	150, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_01_CO.paa"}},
			{"Exile_Car_Van_Guerilla02",	150, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_02_CO.paa"}},
			{"Exile_Car_Van_Guerilla03",	150, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_03_CO.paa"}},
			{"Exile_Car_Van_Guerilla04",	150, "Guerilla 04",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_04_CO.paa"}},
			{"Exile_Car_Van_Guerilla05",	150, "Guerilla 05",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_05_CO.paa"}},
			{"Exile_Car_Van_Guerilla06",	150, "Guerilla 06",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_06_CO.paa"}},
			{"Exile_Car_Van_Guerilla07",	150, "Guerilla 07",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_07_CO.paa"}},
			{"Exile_Car_Van_Guerilla08",	150, "Guerilla 08",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_08_CO.paa"}},
			{"Exile_Car_Van_Black",	150, "Brown",	{"\A3\Soft_F_Exp\Van_01\Data\Van_01_ext_brn_co.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa","\A3\Soft_F_Exp\Van_01\Data\Van_01_int_base_2_CO.paa"}},
			{"Exile_Car_Van_Black",	150, "Olive",	{"\A3\Soft_F_Exp\Van_01\Data\Van_01_ext_oli_co.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa","\A3\Soft_F_Exp\Van_01\Data\Van_01_int_base_3_CO.paa"}}
		};
	};
	class Exile_Car_Van_Box_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Van_Box_Black",				100, "Black",		{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"}},
			{"Exile_Car_Van_Box_White",				100, "White",		{"\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"}},
			{"Exile_Car_Van_Box_Red",				100, "Red",			{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"}},
			{"Exile_Car_Van_Box_Guerilla01",		150, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_01_CO.paa"}},
			{"Exile_Car_Van_Box_Guerilla02",		150, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_02_CO.paa"}},
			{"Exile_Car_Van_Box_Guerilla03",		150, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_03_CO.paa"}},
			{"Exile_Car_Van_Box_Guerilla04",		150, "Guerilla 04",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_04_CO.paa"}},
			{"Exile_Car_Van_Box_Guerilla05",		150, "Guerilla 05",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_05_CO.paa"}},
			{"Exile_Car_Van_Box_Guerilla06",		150, "Guerilla 06",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_06_CO.paa"}},
			{"Exile_Car_Van_Box_Guerilla07",		150, "Guerilla 07",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_07_CO.paa"}},
			{"Exile_Car_Van_Box_Guerilla08",		150, "Guerilla 08",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_08_CO.paa"}}
		};
	};
	class Exile_Car_Van_Fuel_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Van_Fuel_Black",			100, "Black",		{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"}},
			{"Exile_Car_Van_Fuel_White",			100, "White",		{"\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"}},
			{"Exile_Car_Van_Fuel_Red",				100, "Red",			{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"}},
			{"Exile_Car_Van_Fuel_Guerilla01",		150, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_01_CO.paa"}},
			{"Exile_Car_Van_Fuel_Guerilla02",		150, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_02_CO.paa"}},
			{"Exile_Car_Van_Fuel_Guerilla03",		150, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_03_CO.paa"}}
		};
	};
	class Exile_Car_Tempest_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Tempest", 		200, "Green Hex",	{"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa"}}
		};
	};
	class Exile_Car_Ikarus_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Ikarus_Blue", 		200, "Blue",	{"Exile_psycho_Ikarus\Data\bus_exterior_co.paa"}},
			{"Exile_Car_Ikarus_Red", 		200, "Red",		{"Exile_psycho_Ikarus\Data\bus_exterior_eciv_co.paa"}},
			{"Exile_Car_Ikarus_Party", 		500, "Party",	{"Exile_psycho_Ikarus\Data\bus_exterior_eciv_co.paa"}}
		};
	};
	class Exile_Car_Ural_Open_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Ural_Open_Blue",			300, "Blue",		{"Exile_psycho_Ural\data\Ural_kabina_civil_co.paa","Exile_psycho_Ural\data\ural_plachta_civil_co.paa"}},
			{"Exile_Car_Ural_Open_Yellow",			300, "Yellow",		{"Exile_psycho_Ural\data\ural_kabina_civ1_co.paa","Exile_psycho_Ural\data\ural_plachta_civ1_co.paa"}},
			{"Exile_Car_Ural_Open_Worker",			300, "Worker",		{"Exile_psycho_Ural\data\ural_kabina_civ2_co.paa","Exile_psycho_Ural\data\Ural_plachta_civil_co.paa"}},
			{"Exile_Car_Ural_Open_Military",		300, "Military",	{"Exile_psycho_Ural\data\ural_kabina_khk_co.paa","Exile_psycho_Ural\data\ural_plachta_co.paa"}}
		};
	};
	class Exile_Car_Ural_Covered_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Ural_Covered_Blue",			300, "Blue",		{"Exile_psycho_Ural\data\ural_kabina_civil_co.paa","Exile_psycho_Ural\data\ural_plachta_civil_co.paa"}},
			{"Exile_Car_Ural_Covered_Yellow",		300, "Yellow",		{"Exile_psycho_Ural\data\ural_kabina_civ1_co.paa","Exile_psycho_Ural\data\ural_plachta_civ1_co.paa"}},
			{"Exile_Car_Ural_Covered_Worker",		300, "Worker",		{"Exile_psycho_Ural\data\ural_kabina_civ2_co.paa","Exile_psycho_Ural\data\Ural_plachta_civil_co.paa"}},
			{"Exile_Car_Ural_Covered_Military",		300, "Military",	{"Exile_psycho_Ural\data\ural_kabina_khk_co.paa","Exile_psycho_Ural\data\ural_plachta_co.paa"}}
		};
	};
	class Exile_Car_Lada_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Lada_Green", 		100, "Green",	{"exile_psycho_lada\data\lada_eciv1_co.paa","exile_psycho_lada\data\Lada_glass_ECIV1_CA.paa"}},
			{"Exile_Car_Lada_Taxi", 		100, "Taxi",	{"exile_psycho_lada\data\Lada_red_CO.paa"}},
			{"Exile_Car_Lada_Red", 			100, "Red",		{"exile_psycho_lada\data\Lada_red_CO.paa"}},
			{"Exile_Car_Lada_Hipster", 		100, "Hipster",	{"exile_psycho_lada\data\lada_eciv2_co.paa","exile_psycho_lada\data\Lada_glass_ECIV2_CA.paa"}}
		};
	};
	class Exile_Car_Volha_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Volha_Blue", 		100, "Blue",	{"Exile_psycho_Gaz_volha\data\Volha_ECIV_CO.paa"}},
			{"Exile_Car_Volha_White", 		100, "White",	{"Exile_psycho_Gaz_volha\data\Volha_Gray_ECIV_CO.paa"}},
			{"Exile_Car_Volha_Black",		100, "Black",	{"Exile_psycho_Gaz_volha\data\Volha_Black_ECIV_CO.paa"}}
		};
	};
	class Exile_Car_Hunter_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Hunter",		1000, "Exile White Edition",	{"exile_assets\texture\vehicle\Exile_Hunter_Snow_co.paa","exile_assets\texture\vehicle\Exile_Hunter_Snow_Back_co.paa"}},
			{"Exile_Car_Hunter",		1000, "Exile Hex",				{"exile_assets\texture\vehicle\Exile_Hunter_Hex_co.paa","exile_assets\texture\vehicle\Exile_Hunter_Black_Back_co.paa"}},
			{"Exile_Car_Hunter",		1000, "Exile Black",			{"exile_assets\texture\vehicle\Exile_Hunter_Black_co.paa","exile_assets\texture\vehicle\Exile_Hunter_Black_Back_co.paa"}}
		};
	};
	class Exile_Car_Ifrit_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Ifrit",		1000, "Green Hex",	{"\A3\Soft_F_Exp\MRAP_02\data\MRAP_02_ext_01_ghex_CO.paa","\A3\Soft_F_Exp\MRAP_02\data\MRAP_02_ext_02_ghex_CO.paa","\A3\Data_F_Exp\Vehicles\Turret_ghex_CO.paa"}}
		};
	};
	class Exile_Car_HMMWV_M2_Abstract
	{
		skins[] =
		{
			{"Exile_Car_HMMWV_M2_Green",		1000, "Green",	{"Exile_psycho_hmmw\data\hmmwv_body_co.paa"}},
			{"Exile_Car_HMMWV_M2_Desert",		1000, "Desert",	{"Exile_psycho_hmmw\data\des\hmmwv_body_co.paa"}}
		};
	};
	class Exile_Car_HMMWV_M134_Abstract
	{
		skins[] =
		{
			{"Exile_Car_HMMWV_M134_Green",		1000, "Green",	{"Exile_psycho_hmmw\data\hmmwv_body_co.paa"}},
			{"Exile_Car_HMMWV_M134_Desert",		1000, "Desert",	{"Exile_psycho_hmmw\data\des\hmmwv_body_co.paa"}}
		};
	};
	class Exile_Car_HMMWV_MEV_Abstract
	{
		skins[] =
		{
			{"Exile_Car_HMMWV_MEV_Green",		1000, "Green",	{"Exile_psycho_hmmw\data\hmmwv_body_cm.paa"}},
			{"Exile_Car_HMMWV_MEV_Desert",		1000, "Desert",	{"Exile_psycho_hmmw\data\des\hmmwv_body_cm.paa"}}
		};
	};
	class Exile_Car_HMMWV_UNA_Abstract
	{
		skins[] =
		{
			{"Exile_Car_HMMWV_UNA_Green",		1000, "Green",	{"Exile_psycho_hmmw\data\hmmwv_body_co.paa"}},
			{"Exile_Car_HMMWV_UNA_Desert",		1000, "Desert",	{"Exile_psycho_hmmw\data\des\hmmwv_body_co.paa"}}
		};
	};
	class Exile_Car_BTR40_MG_Abstract
	{
		skins[] =
		{
			{"Exile_Car_BTR40_MG_Green",		1000, "Green",	{"exile_psycho_btr40\data\btr40ext_co.paa"}},
			{"Exile_Car_BTR40_MG_Camo",			1000, "Camo",	{"exile_psycho_btr40\data\btr40extcamo_co.paa"}}
		};
	};
	class Exile_Car_BTR40_Abstract
	{
		skins[] =
		{
			{"Exile_Car_BTR40_Green",			1000, "Green",	{"exile_psycho_btr40\data\btr40ext_co.paa"}},
			{"Exile_Car_BTR40_Camo",			1000, "Camo",	{"exile_psycho_btr40\data\btr40extcamo_co.paa"}}
		};
	};
	class Exile_Car_Golf_Abstract
	{
		skins[] =
		{
			{"Exile_Car_Golf_Red",				1000, "Red",	{"exile_psycho_VWGolf\data\vwgolf_body_co.paa"}},
			{"Exile_Car_Golf_Black",			1000, "Black",	{"exile_psycho_VWGolf\data\texture\black_co.paa"}}
		};
	};
	class Exile_Plane_AN2_Abstract
	{
		skins[] =
		{
			{"Exile_Plane_AN2_Green", 700, "Green", {"Exile_psycho_An2\data\an2_1_co.paa","Exile_psycho_An2\data\an2_2_co.paa","Exile_psycho_An2\data\an2_wings_co.paa"}},
			{"Exile_Plane_AN2_White", 700, "Red, White & Blue", {"Exile_psycho_An2\data\an2_1_a_co.paa",
		"Exile_psycho_An2\data\an2_2_a_co.paa","Exile_psycho_An2\data\an2_wings_a_co.paa"}},
			{"Exile_Plane_AN2_Stripe", 700, "Green Stripe", {"Exile_psycho_An2\data\an2_1_b_co.paa","Exile_psycho_An2\data\an2_2_b_co.paa","Exile_psycho_An2\data\an2_wings_b_co.paa"}}
		};
	};
	class B_G_Boat_Transport_02_F
	{
		skins[] =
		{
			{"Exile_Boat_RHIB",		150, "Blue", {"\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_exterior_civilian_CO.paa","\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_interior_2_civilian_CO.paa"}}
		};
	};
	class Exile_Boat_WaterScooter_Abstract
	{
		skins[] =
		{
			{"Exile_Boat_WaterScooter",		150, "Blue", {"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Blue_co.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Blue_co.paa"}},
			{"Exile_Boat_WaterScooter",		150, "Grey", {"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Grey_co.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Grey_co.paa"}},
			{"Exile_Boat_WaterScooter",		150, "Lime", {"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Lime_co.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Lime_co.paa"}},
			{"Exile_Boat_WaterScooter",		150, "Red", {"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Red_CO.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"}},
			{"Exile_Boat_WaterScooter",		150, "White", {"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_CO.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"}},
			{"Exile_Boat_WaterScooter",		150, "Yellow", {"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Yellow_CO.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Yellow_CO.paa"}}
		};
	};
	class C_Plane_Civil_01_F
	{
		skins[] =
		{
			{"Exile_Plane_Ceasar",		150, "Racing (Tan Interior)", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"}},
			{"Exile_Plane_Ceasar",		150, "Racing", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"}},
			{"Exile_Plane_Ceasar",		150, "Red Line (Tan Interior)", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"}},
			{"Exile_Plane_Ceasar",		150, "Tribal (Tan Interior)", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"}},
			{"Exile_Plane_Ceasar",		150, "Tribal", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"}},
			{"Exile_Plane_Ceasar",		150, "Blue Wave (Tan Interior)", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"}},
			{"Exile_Plane_Ceasar",		150, "Blue Wave", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"}}
		};
	};
	class B_T_VTOL_01_infantry_F
	{
		skins[] =
		{
			{"Exile_Plane_BlackfishInfantry",		150, "Blue", {"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"}}
		};
	};
	class B_T_VTOL_01_vehicle_F
	{
		skins[] =
		{
			{"Exile_Plane_BlackfishVehicle",		150, "Blue", {"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"}}
		};
	};
	class B_CTRG_LSV_01_light_F
	{
		skins[] =
		{
			{"Exile_Car_ProwlerLight",		150, "Black", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_black_CO.paa"}},
			{"Exile_Car_ProwlerLight",		150, "Dazzle", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_dazzle_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"}},
			{"Exile_Car_ProwlerLight",		150, "Sand", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_sand_CO.paa"}}
		};
	};
	class B_T_LSV_01_unarmed_black_F
	{
		skins[] =
		{
			{"Exile_Car_ProwlerUnarmed",		150, "Olive", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"}},
			{"Exile_Car_ProwlerUnarmed",		150, "Dazzle", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_dazzle_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"}},
			{"Exile_Car_ProwlerUnarmed",		150, "Sand", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_sand_CO.paa"}}
		};
	};
	class O_T_LSV_02_unarmed_black_F
	{
		skins[] =
		{
			{"Exile_Car_QilinUnarmed",		150, "Arid", {"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_arid_CO.paa"}},
			{"Exile_Car_QilinUnarmed",		150, "Green Hex", {"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_ghex_CO.paa"}}
		};
	};
	class C_Offroad_02_unarmed_orange_F
	{
		skins[] =
		{
			{"Exile_Car_MB4WD",		150, "Black", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa"}},
			{"Exile_Car_MB4WD",		150, "Blue", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa"}},
			{"Exile_Car_MB4WD",		150, "Brown", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa"}},
			{"Exile_Car_MB4WD",		150, "Green", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa"}},
			{"Exile_Car_MB4WD",		150, "Olive", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"}},
			{"Exile_Car_MB4WD",		150, "Red", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa"}},
			{"Exile_Car_MB4WD",		150, "White", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa"}}
		};
	};
	class I_C_Offroad_02_unarmed_F
	{
		skins[] =
		{
			{"Exile_Car_MB4WDOpen",		150, "Black", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa"}},
			{"Exile_Car_MB4WDOpen",		150, "Blue", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa"}},
			{"Exile_Car_MB4WDOpen",		150, "Brown", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa"}},
			{"Exile_Car_MB4WDOpen",		150, "Green", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa"}},
			{"Exile_Car_MB4WDOpen",		150, "Orange", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa"}},
			{"Exile_Car_MB4WDOpen",		150, "Red", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa"}},
			{"Exile_Car_MB4WDOpen",		150, "White", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa"}},
			{"Exile_Car_MB4WDOpen",		150, "Olive", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"}}
		};
	};
};
class CfgVehicleTransport 
{
	class Exile_Container_SupplyBox
	{
		vehicles[] = {"Exile_Car_Van_Abstract", "Exile_Car_Offroad_Abstract", "Exile_Car_Zamak_Abstract", "Exile_Car_HEMMT_Abstract", "Exile_Car_Tempest_Abstract"};
		class Exile_Car_Van_Abstract
		{
			attachPosition[] = {0, -1.1, 0.2};
			cargoIndizes[] = {2, 3, 4, 5, 6, 7}; 
			detachPosition[] = {0, -4.4};
		};
		class Exile_Car_Offroad_Abstract
		{
			attachPosition[] = {0, -1.6, 0.4};
			cargoIndizes[] = {1, 2, 3, 4}; 
			detachPosition[] = {0, -4};
		};
		class Exile_Car_Zamak_Abstract
		{
			attachPosition[] = {0.03, 0.3, 0};
			cargoIndizes[] = {2, 3, 4, 5, 6, 7}; 
			detachPosition[] = {0.03, -4.8};
		};
		class Exile_Car_HEMMT_Abstract
		{
			attachPosition[] = {0.05, -0.1, 0.3};
			cargoIndizes[] = {1, 2, 8, 9}; 
			detachPosition[] = {0.05, -6.1};
		};
		class Exile_Car_Tempest_Abstract
		{
			attachPosition[] = {0.08, -0.85, 0.4};
			cargoIndizes[] = {1, 6, 7, 9}; 
			detachPosition[] = {0.08, -6};
		};
	};
};
class CfgVirtualGarage
{
	enableVirtualGarage = 1;
	canAccessGarageInCombat = 0;
	clearInventoryOnStore = 1;
	numberOfVehicles[] =
	{
		1,			
		2, 			
		3, 			
		4, 			
		5, 			
		6, 			
		8, 			
		10, 		
		15, 		
		20 			
	};
	allowedVehicleTypes[] = {"Car"};
	class Prices
	{
		class Storage
		{
			Level1 = 100;
			Level2 = 200;
			Level3 = 300;
			Level4 = 400;
			Level5 = 500;
		};
	};
	class Capacity
	{
		Level1 = 5;
		Level2 = 10;
		Level3 = 15;
		Level4 = 20;
		Level5 = 25;
	};
	class SpawnPositions
	{
		class Spot1
		{
			spawnPoint[] = {13864,18563.2,0};
			direction = 17;
			boundries[] =
			{
				{13865.4,18558.3,0},
				{13862,18565.2,0}
			};
		};
		class Spot2
		{
			spawnPoint[] = {13859.6,18564.9,0};
			direction = 17;
			boundries[] =
			{
				{13860.4,18559.5,0},
				{13857.8,18566.4,0}
			};
		};
		class Spot3
		{
			spawnPoint[] = {13855.1,18566,0};
			direction = 17;
			boundries[] =
			{
				{13856.1,18560.6,0},
				{13853.2,18567.7,0}
			};
		};
		class Spot4
		{
			spawnPoint[] = {13850.6,18567,0};
			direction = 17;
			boundries[] =
			{
				{13851.6,18561.7,0},
				{13848.7,18568.8,0}
			};
		};
		class Spot5
		{
			spawnPoint[] = {13838.6,18570,0};
			direction = 17;
			boundries[] =
			{
				{13839.3,18564.9,0},
				{13836.7,18571.6,0}
			};
		};
		class Spot6
		{
			spawnPoint[] = {13834.1,18571.1,0};
			direction = 17;
			boundries[] =
			{
				{13835,18565.7,0},
				{13832.2,18572.8,0}
			};
		};
		class Spot7
		{
			spawnPoint[] = {13829.6,18572.2,0};
			direction = 17;
			boundries[] =
			{
				{13830.6,18566.8,0},
				{13827.6,18573.9,0}
			};
		};
		class Spot8
		{
			spawnPoint[] = {13825.2,18573.2,0};
			direction = 17;
			boundries[] =
			{
				{13825.9,18567.9,0},
				{13823.9,18574.6,0}
			};
		};
	};
};
class CfgXM8
{
};
class XM8_App_KillDeathRatio_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_bounties_ca.paa";
    text = "Health";
};
class XM8_App_PopTabs_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\poptab_notification_ca.paa";
    text = "PopTabs";
};
class XM8_App_Respect_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_user_ca.paa";
    text = "Respect";
};
class XM8_App_criminalHistory_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_settings_ca.paa";
    text = "Criminal Records";
    onButtonClick = "['criminalHistory', 0] call ExileClient_gui_xm8_slide";
};
class XM8_App_bugReport_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_settings_ca.paa";
    text = "Bug Report";
    onButtonClick = "['bugReport', 0] call ExileClient_gui_xm8_slide";
};
class XM8_App_slothMachine_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_slothMachine_ca.paa";
    text = "Sloth Machine";
    onButtonClick = "['slothMachine', 0] call ExileClient_gui_xm8_slide";
};
class XM8_App_Party_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_party_ca.paa";
    text = "Party";
    onButtonClick = "[] spawn ExileClient_gui_xm8_showPartySlides";
};
class XM8_App_Family_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_clan_ca.paa";
    text = "Family";
    onButtonClick = "[] spawn ExileClient_gui_xm8_showClanSlide";
};
class XM8_App_Territory_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_territory_ca.paa";
    text = "Territory";
    onButtonClick = "call ExileClient_gui_xm8_showTerritorySlide";
};
class XM8_App_Mobile_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_mobile_xm8_ca.paa";
    text = "Mobile XM8";
    onButtonClick = "\
    \
    if((getText(missionConfigFile >> 'CfgExileMobileXM8' >> 'code')) isEqualTo '')then \
    {\
        ['This server does not support the mobile XM8 app yet.<br/>Contact server admin for support.', 'Okay'] call ExileClient_gui_xm8_showWarning;\
    }\
    else\
    {\
            ['mobileXm8', 0] call ExileClient_gui_xm8_slide;\
    };";
};
class XM8_App_Health_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_health_scanner_ca.paa";
    text = "Health Scanner";
    onButtonClick = "['healthScanner', 0] call ExileClient_gui_xm8_slide;";
};
class XM8_App_Server_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_cosa_nostra_ca.paa";
    text = "Server Rules";
    onButtonClick = "['server', 0] call ExileClient_gui_xm8_slide";
};
class XM8_App_Test1_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_extra_apps_ca.paa";
    text = "Test1";
    onButtonClick = "['extraApps', 0] call ExileClient_gui_xm8_slide";
};
class XM8_App_Test2_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_extra_apps_ca.paa";
    text = "Test2";
    onButtonClick = "['extraApps', 0] call ExileClient_gui_xm8_slide";
};
class XM8_App_Test3_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_extra_apps_ca.paa";
    text = "Test3";
    onButtonClick = "['extraApps', 0] call ExileClient_gui_xm8_slide";
};
class XM8_App_Notifications_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exilelife_assets\texture\ui\xm8_app_notification_ca.paa";
    text = "Notifications";
    onButtonClick = "['notify', 0] call ExileClient_gui_xm8_slide";
};
class XM8_App_Messages_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exilelife_assets\texture\ui\xm8_app_messages_ca.paa";
    text = "Messages";
    onButtonClick = "['messages', 0] call ExileClient_gui_xm8_slide";
};
class XM8_App_Jobs_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exilelife_assets\texture\ui\xm8_app_job_management_ca.paa";
    text = "Job Management";
    onButtonClick = "call ExileLifeClient_gui_xm8_showJobManagementSlide";
};
class XM8_App_8GNetwork_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_network_ca.paa";
    text = "8G Network";
    onButtonClick = "['players', 0] call ExileClient_gui_xm8_slide";
};
class XM8_App_Settings_Button: RscExileXM8AppButton1x1
{
    textureNoShortcut = "\exile_assets\texture\ui\xm8_app_settings_ca.paa";
    text = "Settings";
    onButtonClick = "['settings', 0] call ExileClient_gui_xm8_slide";
};
class CfgXM8AppSettings
{
	class Rogue
	{
		Rank0[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank1[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank2[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank3[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank4[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank5[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank6[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
	};
	class Guard
	{
		Rank0[] =
		{
			"KillDeathRatio","PopTabs","Respect","criminalHistory","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank1[] =
		{
			"KillDeathRatio","PopTabs","Respect","criminalHistory","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank2[] =
		{
			"KillDeathRatio","PopTabs","Respect","criminalHistory","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank3[] =
		{
			"KillDeathRatio","PopTabs","Respect","criminalHistory","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank4[] =
		{
			"KillDeathRatio","PopTabs","Respect","criminalHistory","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank5[] =
		{
			"KillDeathRatio","PopTabs","Respect","criminalHistory","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank6[] =
		{
			"KillDeathRatio","PopTabs","Respect","criminalHistory","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
	};
	class Cartel
	{
		Rank0[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank1[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank2[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank3[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank4[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank5[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank6[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
	};
	class Mafia
	{
		Rank0[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank1[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank2[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank3[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank4[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank5[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank6[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
	};
	class Syndicate
	{
		Rank0[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank1[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank2[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank3[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank4[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank5[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank6[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
	};
	class Yakuza
	{
		Rank0[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank1[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank2[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank3[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank4[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank5[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
		Rank6[] =
		{
			"KillDeathRatio","PopTabs","Respect","bugReport","Party","8GNetwork","Jobs","Messages",
			"Notifications","Server","Health","Mobile","Territory","Family","Settings"
		};
	};
};
