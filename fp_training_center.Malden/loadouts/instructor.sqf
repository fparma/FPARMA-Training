params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Handgun
_unit addMagazine "16Rnd_9x21_Mag";
_unit addWeapon "hgun_P07_F";
// Binoc
_unit addWeapon "Binocular";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "H_Beret_02";
_unit forceAddUniform "U_B_CombatUniform_mcam_vest";
_unit addVest "V_BandollierB_oli";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_INDEP"];

// Uniform items
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_DefusalKit";
_unit addItemToUniform "ACE_epinephrine";
_unit addItemToUniform "ACE_Flashlight_MX991";
{_unit addItemToUniform "ACE_morphine"} count [1,2,3];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
{_unit addItemToUniform "ACE_CableTie"} count [1,2,3,4,5,6,7,8,9,10,11,12];
// Vest items
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellRed";
_unit addItemToVest "CUP_HandGrenade_M67";
{_unit addItemToVest "16Rnd_9x21_Mag"} count [1,2,3];
{_unit addItemToVest "ACE_Chemlight_HiRed"} count [1,2,3];
// Radios
_unit addItemToUniform "ACRE_PRC148";