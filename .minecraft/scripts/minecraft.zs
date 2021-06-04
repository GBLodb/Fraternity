#no_fix_recipe_book
#priority -1

import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import scripts.grassUtils.RecipeUtils;

furnace.removeAll();

var metalListOne as string[] = [
    "Gold", "Silver", "Tungsten", "Zinc", "Platinum", "Copper", "Brass",
    "Steel", "Nickel", "Lead", "Aluminum", "Electrum", "Constantan"
];

<ore:ingotIron>.add(<tfc:metal/ingot/wrought_iron>);
<ore:plateIron>.add(<tfc:metal/sheet/wrought_iron>);

for metal in metalListOne {
    val plateOd as IOreDictEntry = oreDict.get("plate" ~ metal);
    val sheetOd as IOreDictEntry = oreDict.get("sheet" ~ metal);
    val ingotOd as IOreDictEntry = oreDict.get("ingot" ~ metal);
    val nuggetOd as IOreDictEntry = oreDict.get("nugger" ~ metal);
    val gearOd as IOreDictEntry = oreDict.get("gear" ~ metal);

    plateOd.add(sheetOd.firstItem);
    furnace.remove(ingotOd);
    furnace.remove(nuggetOd);
}

recipes.removeByRegex("immersiveengineering:material/plate_.*");
recipes.removeByRegex("immersiveengineering:hammercrushing_.*");
recipes.removeByRegex("embers:ingot.*_.*");

recipes.replaceAllOccurences(<immersiveintelligence:material_ingot:3>, <ore:ingotTungsten>);
recipes.replaceAllOccurences(<immersiveintelligence:material_nugget:1>, <ore:nuggetBrass>);

recipes.replaceAllOccurences(<railcraft:gear>, <ore:gearBrass>);
recipes.replaceAllOccurences(<railcraft:gear:1>, <ore:gearIron>);
recipes.replaceAllOccurences(<railcraft:gear:2>, <ore:gearSteel>);
recipes.replaceAllOccurences(<railcraft:gear:4>, <ore:gearBronze>);
recipes.replaceAllOccurences(<railcraft:gear:5>, <ore:gearInvar>);

recipes.replaceAllOccurences(<minecraft:iron_ingot>, <ore:ingotIron>);
recipes.replaceAllOccurences(<minecraft:gold_ingot>, <ore:ingotGold>);

recipes.removeByRecipeName("railcraft:cart_bronze");
recipes.removeByRecipeName("railcraft:cart_steel");

recipes.remove(<railcraft:gear:3>);

recipes.addShaped(<minecraft:furnace>, RecipeUtils.createSurround(null, <ore:cobblestone>));

recipes.addShapeless(<tfc:wooden_bucket>.withTag({Fluid: {FluidName: "water", Amount: 1000}}), 
    [<tfc:wooden_bucket>.withTag({Fluid: {FluidName: "fresh_water", Amount: 1000}})]);
recipes.addShapeless(<tfc:wooden_bucket>.withTag({Fluid: {FluidName: "water", Amount: 1000}}), 
    [<tfc:wooden_bucket>.withTag({Fluid: {FluidName: "salt_water", Amount: 1000}})]);

recipes.addShapeless(<tfc:metal/bucket/red_steel>.withTag({Fluid: {FluidName: "water", Amount: 1000}}),
    [<tfc:metal/bucket/red_steel>.withTag({Fluid: {FluidName: "fresh_water", Amount: 1000}})]);
recipes.addShapeless(<tfc:metal/bucket/red_steel>.withTag({Fluid: {FluidName: "water", Amount: 1000}}),
    [<tfc:metal/bucket/red_steel>.withTag({Fluid: {FluidName: "salt_water", Amount: 1000}})]);