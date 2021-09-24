//--unitgear.sqf--
/*
Wygenerowano: 02.02.2021 23:40:55*/

private ["_unit", "_type", "_randomHeadgear"];
	_unit = _this select 0;
	_type = _this select 1;
	if (!local _unit) exitWith {};

//Uuswanie pozostałych wyposażeń
	removeGoggles _unit;
	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeAllItemsWithMagazines _unit;
	removeHeadgear _unit;
	removeAllContainers _unit;

//Wyłączenie losowosci wyposażeń
	_unit setVariable ["BIS_enableRandomization", false];

	_randomHeadgear = selectRandom ["rhsgref_helmet_M1_bare","rhsgref_helmet_M1_bare_alt01","rhsgref_helmet_M1_painted","rhsgref_helmet_M1_painted_alt01"];
	[_unit, 'Head_Euro'] remoteExecCall ["rtk_fnc_setRandFace", 0];

//Wybór konkretnego loadoutu
switch (_type) do {
case "HEER_PL": {
    //Umundurowanie
    _unit forceAddUniform "usm_bdu_odg";
    _unit addHeadgear _randomHeadgear;
    _unit addVest "rhsgref_alice_webbing";
    _unit addBackpack "UK3CB_B_Alice_K";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_MapTools",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACRE_PRC343",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",4];
    (vestContainer _unit) addItemCargoGlobal ["ACE_Flashlight_MX991",1];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",5];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_mkii_mag",2];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_anm8_mag",2];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_mag_m18_green",1];
    
    //Broń i dodatki
    _unit addWeapon "UK3CB_G3A3";
    _unit addWeapon "rhs_weap_rsp30_red";
    _unit addWeapon "Binocular";
    _unit addPrimaryWeaponItem "UK3CB_G3_20rnd_762x51_RT";
    };
case "HEER_MED": {
    //Umundurowanie
    _unit forceAddUniform "usm_bdu_odg";
    _unit addHeadgear _randomHeadgear;
    _unit addVest "rhsgref_alice_webbing";
    _unit addBackpack "UK3CB_B_Alice_K";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",4];
    (vestContainer _unit) addItemCargoGlobal ["ACE_Flashlight_MX991",1];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",10];
    (backpackContainer _unit) addItemCargoGlobal ["ACE_packingBandage",10];
    (backpackContainer _unit) addItemCargoGlobal ["ACE_quikclot",10];
    (backpackContainer _unit) addItemCargoGlobal ["ACE_morphine",10];
    (backpackContainer _unit) addItemCargoGlobal ["ACE_epinephrine",10];
    (backpackContainer _unit) addItemCargoGlobal ["ACE_personalAidKit",5];
    (backpackContainer _unit) addItemCargoGlobal ["ACE_salineIV_250",6];
    (backpackContainer _unit) addItemCargoGlobal ["ACE_tourniquet",5];
    (backpackContainer _unit) addItemCargoGlobal ["ACE_adenosine",10];
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",2];
    (backpackContainer _unit) addItemCargoGlobal ["ACE_surgicalKit",1];
    
    //Broń i dodatki
    _unit addWeapon "UK3CB_G3A3";
    _unit addPrimaryWeaponItem "UK3CB_G3_20rnd_762x51_RT";
    };
case "HEER_RTO": {
    //Umundurowanie
    _unit forceAddUniform "usm_bdu_odg";
    _unit addHeadgear _randomHeadgear;
    _unit addVest "rhsgref_alice_webbing";
    _unit addBackpack "usm_pack_st128_prc77";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",5];
    (vestContainer _unit) addItemCargoGlobal ["ACE_Flashlight_MX991",1];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",3];
    (backpackContainer _unit) addItemCargoGlobal ["ACRE_PRC77",1];
    
    //Broń i dodatki
    _unit addWeapon "UK3CB_G3A3";
    _unit addPrimaryWeaponItem "UK3CB_G3_20rnd_762x51_RT";
    };
case "HEER_SNP": {
    //Umundurowanie
    _unit forceAddUniform "usm_bdu_odg";
    _unit addHeadgear _randomHeadgear;
    _unit addVest "rhsgref_alice_webbing";
    _unit addBackpack "UK3CB_B_Alice_K";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",5];
    (vestContainer _unit) addItemCargoGlobal ["ACE_Flashlight_MX991",1];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",8];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_mkii_mag",2];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_anm8_mag",1];
    
    //Broń i dodatki
    _unit addWeapon "UK3CB_G3A3";
    _unit addPrimaryWeaponItem "uk3cb_optic_STANAGZF_G3";
    _unit addPrimaryWeaponItem "UK3CB_G3_20rnd_762x51_RT";
    };
case "HEER_AT_SPEC": {
    //Umundurowanie
    _unit forceAddUniform "usm_bdu_odg";
    _unit addHeadgear _randomHeadgear;
    _unit addVest "rhsgref_alice_webbing";
    _unit addBackpack "UK3CB_B_Alice_K";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",4];
    (vestContainer _unit) addItemCargoGlobal ["ACE_Flashlight_MX991",1];
    (vestContainer _unit) addItemCargoGlobal ["rhs_grenade_mkii_mag",1];
    (vestContainer _unit) addItemCargoGlobal ["rhs_grenade_anm8_mag",1];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",3];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_mag_maaws_HEDP",1];
    
    //Broń i dodatki
    _unit addWeapon "UK3CB_G3A3";
    _unit addWeapon "rhs_weap_maaws";
    _unit addPrimaryWeaponItem "UK3CB_G3_20rnd_762x51_RT";
    _unit addSecondaryWeaponItem "rhs_optic_maaws";
    _unit addSecondaryWeaponItem "rhs_mag_maaws_HEAT";
    };
case "HEER_AT_ASST": {
    //Umundurowanie
    _unit forceAddUniform "usm_bdu_odg";
    _unit addHeadgear _randomHeadgear;
    _unit addVest "rhsgref_alice_webbing";
    _unit addBackpack "UK3CB_B_Alice_K";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",4];
    (vestContainer _unit) addItemCargoGlobal ["ACE_Flashlight_MX991",1];
    (vestContainer _unit) addItemCargoGlobal ["rhs_grenade_mkii_mag",1];
    (vestContainer _unit) addItemCargoGlobal ["rhs_grenade_anm8_mag",1];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",7];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_mag_maaws_HE",1];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_mag_maaws_HEDP",1];
    
    //Broń i dodatki
    _unit addWeapon "UK3CB_G3A3";
    _unit addPrimaryWeaponItem "UK3CB_G3_20rnd_762x51_RT";
    };
case "HEER_MG": {
    //Umundurowanie
    _unit forceAddUniform "usm_bdu_odg";
    _unit addHeadgear _randomHeadgear;
    _unit addVest "rhsgref_alice_webbing";
    _unit addBackpack "UK3CB_B_Alice_K";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["UK3CB_MG3_100rnd_762x51_RT",2];
    (vestContainer _unit) addItemCargoGlobal ["ACE_Flashlight_MX991",1];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_mkii_mag",2];
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_MG3_100rnd_762x51_RT",4];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_anm8_mag",1];
    
    //Broń i dodatki
    _unit addWeapon "UK3CB_MG3";
    _unit addPrimaryWeaponItem "UK3CB_MG3_100rnd_762x51_RT";
    };
case "HEER_MG_ASST": {
    //Umundurowanie
    _unit forceAddUniform "usm_bdu_odg";
    _unit addHeadgear _randomHeadgear;
    _unit addVest "rhsgref_alice_webbing";
    _unit addBackpack "UK3CB_B_Alice_K";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",4];
    (vestContainer _unit) addItemCargoGlobal ["ACE_Flashlight_MX991",1];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",5];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_mkii_mag",2];
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_MG3_100rnd_762x51_RT",3];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_anm8_mag",1];
    
    //Broń i dodatki
    _unit addWeapon "UK3CB_G3A3";
    _unit addPrimaryWeaponItem "UK3CB_G3_20rnd_762x51_RT";
    };
case "HEER_GL": {
    //Umundurowanie
    _unit forceAddUniform "usm_bdu_odg";
    _unit addHeadgear _randomHeadgear;
    _unit addVest "rhsgref_alice_webbing";
    _unit addBackpack "UK3CB_B_Alice_K";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",4];
    (vestContainer _unit) addItemCargoGlobal ["ACE_Flashlight_MX991",1];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",5];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_mkii_mag",2];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_mag_M585_white",5];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_mag_M441_HE",4];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_mag_M433_HEDP",4];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_mag_M397_HET",2];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_mag_m713_Red",5];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_anm8_mag",1];
    
    //Broń i dodatki
    _unit addWeapon "UK3CB_G3A3";
    _unit addWeapon "rhs_weap_M320";
    _unit addPrimaryWeaponItem "UK3CB_G3_20rnd_762x51_RT";
    _unit addHandgunItem "rhs_mag_M441_HE";
    };
case "HEER_RFL": {
    //Umundurowanie
    _unit forceAddUniform "usm_bdu_odg";
    _unit addHeadgear _randomHeadgear;
    _unit addVest "rhsgref_alice_webbing";
    _unit addBackpack "UK3CB_B_Alice_K";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",4];
    (vestContainer _unit) addItemCargoGlobal ["ACE_Flashlight_MX991",1];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",5];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_mkii_mag",2];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_anm8_mag",1];
    
    //Broń i dodatki
    _unit addWeapon "UK3CB_G3A3";
    _unit addPrimaryWeaponItem "UK3CB_G3_20rnd_762x51_RT";
    };
case "HEER_RFL_AMMO": {
    //Umundurowanie
    _unit forceAddUniform "usm_bdu_odg";
    _unit addHeadgear _randomHeadgear;
    _unit addVest "rhsgref_alice_webbing";
    _unit addBackpack "UK3CB_B_Alice_K";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",5];
    (vestContainer _unit) addItemCargoGlobal ["ACE_Flashlight_MX991",1];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",6];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_mkii_mag",1];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_anm8_mag",1];
    
    //Broń i dodatki
    _unit addWeapon "UK3CB_G3A3";
    _unit addPrimaryWeaponItem "UK3CB_G3_20rnd_762x51_RT";
    };
case "HEER_RFL_AT": {
    //Umundurowanie
    _unit forceAddUniform "usm_bdu_odg";
    _unit addHeadgear _randomHeadgear;
    _unit addVest "rhsgref_alice_webbing";
    _unit addBackpack "UK3CB_B_Alice_K";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",4];
    (vestContainer _unit) addItemCargoGlobal ["ACE_Flashlight_MX991",1];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_G3_20rnd_762x51_RT",5];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_mkii_mag",2];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_grenade_anm8_mag",2];
    (backpackContainer _unit) addItemCargoGlobal ["UK3CB_MG3_100rnd_762x51_RT",2];
    
    //Broń i dodatki
    _unit addWeapon "UK3CB_G3A3";
    _unit addWeapon "rhs_weap_m72a7";
    _unit addPrimaryWeaponItem "UK3CB_G3_20rnd_762x51_RT";
    };
case "NVA_SL": {
    //Umundurowanie
    _unit forceAddUniform "UK3CB_TKA_I_U_CrewUniform_01_KHK";
    _unit addHeadgear "rhsgref_M56";
    _unit addVest "UK3CB_V_Belt_Rig_KHK";
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_MapTools",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_Flashlight_KSF1",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["rhs_30Rnd_545x39_AK_green",7];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_9x18_8_57N181S",2];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rdg2_white",2];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rgd5",2];
    (vestContainer _unit) addItemCargoGlobal ["ACRE_PRC343",1];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rdg2_black",1];
    
    //Broń i dodatki
    _unit addWeapon "rhs_weap_ak74";
    _unit addWeapon "rhs_weap_makarov_pm";
    _unit addWeapon "Binocular";
    _unit addPrimaryWeaponItem "rhs_acc_dtk1983";
    _unit addPrimaryWeaponItem "rhs_30Rnd_545x39_AK_green";
    _unit addHandgunItem "rhs_mag_9x18_8_57N181S";

    _unit setObjectTextureGlobal [0, "textures\rain.paa"];
    };
case "NVA_TL": {
    //Umundurowanie
    _unit forceAddUniform "UK3CB_TKA_I_U_CrewUniform_01_KHK";
    _unit addHeadgear "rhsgref_M56";
    _unit addVest "UK3CB_V_Belt_Rig_KHK";
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_Flashlight_KSF1",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["rhs_30Rnd_545x39_AK_green",7];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rdg2_white",2];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rgd5",2];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rdg2_black",1];
    
    //Broń i dodatki
    _unit addWeapon "rhs_weap_ak74";
    _unit addPrimaryWeaponItem "rhs_acc_dtk1983";
    _unit addPrimaryWeaponItem "rhs_30Rnd_545x39_AK_green";

    _unit setObjectTextureGlobal [0, "textures\rain.paa"];
    };
case "NVA_RPG": {
    //Umundurowanie
    _unit forceAddUniform "UK3CB_TKA_I_U_CrewUniform_01_KHK";
    _unit addHeadgear "rhsgref_M56";
    _unit addVest "UK3CB_V_Belt_Rig_Lite_KHK";
    _unit addBackpack "UK3CB_B_Fieldpack";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_Flashlight_KSF1",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["rhs_30Rnd_545x39_AK_green",7];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rdg2_white",2];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rgd5",3];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["rhs_rpg7_OG7V_mag",2];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_rpg7_PG7VL_mag",2];
    
    //Broń i dodatki
    _unit addWeapon "rhs_weap_ak74";
    _unit addWeapon "rhs_weap_rpg7";
    _unit addPrimaryWeaponItem "rhs_acc_dtk1983";
    _unit addPrimaryWeaponItem "rhs_30Rnd_545x39_AK_green";

    _unit setObjectTextureGlobal [0, "textures\rain.paa"];
    };
case "NVA_RPG_ASST": {
    //Umundurowanie
    _unit forceAddUniform "UK3CB_TKA_I_U_CrewUniform_01_KHK";
    _unit addHeadgear "rhsgref_M56";
    _unit addVest "UK3CB_V_Belt_Rig_KHK";
    _unit addBackpack "UK3CB_B_Fieldpack";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_Flashlight_KSF1",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["rhs_30Rnd_545x39_AK_green",7];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rdg2_white",2];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rgd5",3];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["rhs_rpg7_PG7VL_mag",2];
    (backpackContainer _unit) addItemCargoGlobal ["rhs_rpg7_OG7V_mag",1];
    
    //Broń i dodatki
    _unit addWeapon "rhs_weap_ak74";
    _unit addPrimaryWeaponItem "rhs_acc_dtk1983";
    _unit addPrimaryWeaponItem "rhs_30Rnd_545x39_AK_green";

    _unit setObjectTextureGlobal [0, "textures\rain.paa"];
    };
case "NVA_RPK": {
    //Umundurowanie
    _unit forceAddUniform "UK3CB_TKA_I_U_CrewUniform_01_KHK";
    _unit addHeadgear "rhsgref_M56";
    _unit addVest "UK3CB_V_Belt_Rig_KHK";
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_Flashlight_KSF1",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rdg2_white",2];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rgd5",3];
    (vestContainer _unit) addItemCargoGlobal ["rhs_45Rnd_545X39_AK_Green",7];
    
    //Broń i dodatki
    _unit addWeapon "UK3CB_RPK_74";
    _unit addPrimaryWeaponItem "rhs_45Rnd_545X39_AK_Green";

    _unit setObjectTextureGlobal [0, "textures\rain.paa"];
    };
case "NVA_PKM": {
    //Umundurowanie
    _unit forceAddUniform "UK3CB_TKA_I_U_CrewUniform_01_KHK";
    _unit addHeadgear "rhsgref_M56";
    _unit addVest "UK3CB_V_Belt_Rig_KHK";
    _unit addBackpack "UK3CB_B_Fieldpack";
    clearAllItemsFromBackpack _unit;
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_Flashlight_KSF1",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rdg2_white",2];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rgd5",3];
    (vestContainer _unit) addItemCargoGlobal ["rhs_100Rnd_762x54mmR_green",2];
    
    //Przedmioty i magazynki w plecaku
    (backpackContainer _unit) addItemCargoGlobal ["rhs_100Rnd_762x54mmR_green",4];
    
    //Broń i dodatki
    _unit addWeapon "rhs_weap_pkm";
    _unit addPrimaryWeaponItem "rhs_100Rnd_762x54mmR_green";

    _unit setObjectTextureGlobal [0, "textures\rain.paa"];
    };
case "NVA_RFL": {
    //Umundurowanie
    _unit forceAddUniform "UK3CB_TKA_I_U_CrewUniform_01_KHK";
    _unit addHeadgear "rhsgref_M56";
    _unit addVest "UK3CB_V_Belt_Rig_KHK";
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_Flashlight_KSF1",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["rhs_30Rnd_545x39_AK_green",7];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rdg2_white",2];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rgd5",3];
    
    //Broń i dodatki
    _unit addWeapon "rhs_weap_ak74";
    _unit addPrimaryWeaponItem "rhs_acc_dtk1983";
    _unit addPrimaryWeaponItem "rhs_30Rnd_545x39_AK_green";

    _unit setObjectTextureGlobal [0, "textures\rain.paa"];
    };
case "NVA_CREW": {
    //Umundurowanie
    _unit forceAddUniform "UK3CB_TKA_I_U_CrewUniform_01_KHK";
    _unit addHeadgear "rhs_tsh4";
    _unit addVest "UK3CB_V_Belt_KHK";
    
    //Przypisane przedmioty
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    
    //Przedmioty i magazynki w mundurze
    (uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage",3];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_morphine",2];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];
    (uniformContainer _unit) addItemCargoGlobal ["ACE_Flashlight_KSF1",1];
    
    //Przedmioty i magazynki w kamizelce
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_rdg2_white",2];
    (vestContainer _unit) addItemCargoGlobal ["rhs_mag_9x18_8_57N181S",2];
    
    //Broń i dodatki
    _unit addWeapon "rhs_weap_makarov_pm";
    _unit addWeapon "Binocular";
    _unit addHandgunItem "rhs_mag_9x18_8_57N181S";

    _unit setObjectTextureGlobal [0, "textures\rain.paa"];
    };

};
