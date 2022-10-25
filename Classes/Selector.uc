//    DNFSelect.Selector 
//    Version: 0.7D
//    Nax/Knifeworld: 14 Feb 18 - 2 Apr 19 (Made the original mutator for Deus Ex, WepSelectMut)
//    Dark1: 05 Sept 22 - 24 Oct 22 (Ported mutator to DNF2k1 and improved on it)
//
class Selector extends Mutator
    Config(Mutators);
    
Var() config bool bNukeAll;
Var() config bool bNukeAllWeapons;
Var() config bool bNukeAllAmmo;
Var() config bool bNukeAllSnacks;
Var() config bool bKeepRPG;
Var() config bool bKeepFlamethrower;
Var() config bool bKeepFreezer;
Var() config bool bKeepShrinkray;
Var() config bool bKeepM16;
Var() config bool bKeepChainsaw;
Var() config bool bKeepPistol;
Var() config bool bKeepShotgun;
Var() config bool bKeepSniperRifle;
Var() config bool bKeepTripMine;
Var() config bool bKeepHypoGun;
Var() config bool bKeepMultiBomb;
Var() config bool bKeepChainsawFuel;
Var() config bool bKeepFreezerAmmo;
Var() config bool bKeepHypoVial_Antidote;
Var() config bool bKeepHypoVial_Health;
Var() config bool bKeepHypoVial_Steroids;
Var() config bool bKeepM16Ammo;
Var() config bool bKeepM16GAmmo;
Var() config bool bKeepPistolClip;
Var() config bool bKeepPistolClipHP;
Var() config bool bKeepPistolClipAP;
Var() config bool bKeepRocketPack;
Var() config bool bKeepNukeCannister;
Var() config bool bKeepShotgunAmmoAcid;
Var() config bool bKeepShotgunAmmo;
Var() config bool bKeepShrinkAmmo;
Var() config bool bKeepSniperCell;
Var() config bool bKeepTripMineAmmo;
Var() config bool bKeepJetpack;
Var() config bool bKeepMedKit;
Var() config bool bKeepSteroids;
Var() config bool bKeepRiotShield;
Var() config bool bKeepRebreather;
Var() config bool bKeepBurrito;
Var() config bool bKeepChips;
Var() config bool bKeepCowPie;
Var() config bool bKeepMRE;
Var() config bool bKeepMRE_Veggie;
Var() config bool bKeepPowerbar;
Var() config bool bKeepPowerTrip;
Var() config bool bKeepSandwich;
Var() config bool bKeepSportsdrink;

function PostBeginPlay()
{
    local dnWeapon W;
    local Ammo Am;
    local Inventory I;
    local VendSnack V;
    
    Super.PostBeginPlay();
   
   foreach AllActors( Class'dnWeapon', W )
	{
        if ( W != None ){
          if ( bNukeAllWeapons )
            Nuke(W);
          else 
            NukeWeapons(W);
        }
     }
     
   foreach AllActors( Class'Ammo', Am )
	{
        if ( Am != None ){  
          if ( bNukeAllWeapons )
            NukeMultiBomb(Am);
          else if ( bNukeAllAmmo )
            Nuke(Am);
          else 
            NukeAmmo(Am);
        }
    }
    
   foreach AllActors( Class'Inventory', I )
	{
        if ( I != None ){
          if ( bNukeAll)
            Nuke(I);
          else
            NukeItem(I);
        }
    }
          
   foreach AllActors( Class'VendSnack', V )
	{
        if ( V != None ){
          if ( bNukeAllSnacks )
            Nuke(V);
          else
            NukeSnacks(V);
        }
    }
}

function Nuke(Actor A)
{
    if ( (A != None) && (A.bNoDelete == False) )
        A.Destroy();
}

function NukeWeapons(dnWeapon Wep)
{
    if (!bKeepFlamethrower && (Wep.Class == Class'Flamethrower') )
        Nuke(Wep);
        
    if (!bKeepRPG && (Wep.Class == Class'RPG') )
        Nuke(Wep);
        
    if (!bKeepShrinkray && (Wep.Class == Class'Shrinkray') )
        Nuke(Wep);
        
    if (!bKeepFreezer && (Wep.Class == Class'Freezer') )
        Nuke(Wep);
        
    if (!bKeepM16 && (Wep.Class == Class'M16') )
        Nuke(Wep);
        
    if (!bKeepChainsaw && (Wep.Class == Class'DukeChainsaw') )
        Nuke(Wep);
        
    if (!bKeepPistol && (Wep.Class == Class'Pistol') )
        Nuke(Wep);
        
    if (!bKeepShotgun && (Wep.Class == Class'Shotgun') )
        Nuke(Wep);
        
    if (!bKeepSniperRifle && (Wep.Class == Class'SniperRifle') )
        Nuke(Wep);
        
    if (!bKeepHypoGun && (Wep.Class == Class'HypoGun') )
        Nuke(Wep);
        
    if (!bKeepTripMine && (Wep.Class == Class'TripMine') )
        Nuke(Wep);
        
    if (!bKeepMultiBomb && (Wep.Class == Class'MultiBomb') )
        Nuke(Wep);
}

function NukeAmmo(Ammo Am)
{
    if (!bKeepChainsawFuel && (Am.Class == Class'ChainsawFuel') )
        Nuke(Am);
        
    if (!bKeepChainsawFuel && (Am.Class == Class'ChainsawFuel_Dirty') )
        Nuke(Am);

    if (!bKeepFreezerAmmo && (Am.Class == Class'FreezerAmmo') )
        Nuke(Am);

    if (!bKeepHypoVial_Health && (Am.Class == Class'HypoVial_Health') )
        Nuke(Am);

    if (!bKeepHypoVial_Antidote && (Am.Class == Class'HypoVial_Antidote') )
        Nuke(Am);
        
    if (!bKeepHypoVial_Antidote && (Am.Class == Class'HypoVial_Antidote_Side') )
        Nuke(Am);

    if (!bKeepHypoVial_Health && (Am.Class == Class'HypoVial_Health_Side') )
        Nuke(Am);

    if (!bKeepHypoVial_Steroids && (Am.Class == Class'HypoVial_Steroids') )
        Nuke(Am);

    if (!bKeepHypoVial_Steroids && (Am.Class == Class'HypoVial_Steroids_Side') )
        Nuke(Am);
        
    if (!bKeepM16Ammo && (Am.Class == Class'M16Clip') )
        Nuke(Am);

    if (!bKeepM16GAmmo && (Am.Class == Class'M16GAmmo') )
        Nuke(Am);

    if (!bKeepMultiBomb && (Am.Class == Class'MultiBombAmmo') )
        Nuke(Am);

    if (!bKeepPistolClip && (Am.Class == Class'PistolClip') )
        Nuke(Am);
        
    if (!bKeepPistolClipAP && (Am.Class == Class'PistolClipAP') )
        Nuke(Am);

    if (!bKeepPistolClipAP && (Am.Class == Class'PistolClipAP_Gold') )
        Nuke(Am);

    if (!bKeepPistolClipHP && (Am.Class == Class'PistolClipHP') )
        Nuke(Am);

    if (!bKeepPistolClipHP && (Am.Class == Class'pistolClipHP_Gold') )
        Nuke(Am);
        
    if (!bKeepRocketPack && (Am.Class == Class'RocketPack') )
        Nuke(Am);

    if (!bKeepNukeCannister && (Am.Class == Class'NukeCannister') )
        Nuke(Am);

    if (!bKeepRocketPack && (Am.Class == Class'RocketPackB') )
        Nuke(Am);

    if (!bKeepShotgunAmmo && (Am.Class == Class'ShotgunAmmo') )
        Nuke(Am);
        
    if (!bKeepShotgunAmmoAcid && (Am.Class == Class'ShotgunAmmoAcid') )
        Nuke(Am);

    if (!bKeepShotgunAmmoAcid && (Am.Class == Class'ShotgunAmmoAcid_Open') )
        Nuke(Am);

    if (!bKeepShotgunAmmo && (Am.Class == Class'ShotgunAmmo_Open') )
        Nuke(Am);

    if (!bKeepShrinkAmmo && (Am.Class == Class'ShrinkAmmo') )
        Nuke(Am);
        
    if (!bKeepSniperCell && (Am.Class == Class'SniperCell') )
        Nuke(Am);

    if (!bKeepTripMineAmmo && (Am.Class == Class'TripMineAmmo') )
        Nuke(Am);
}

function NukeMultiBomb(Ammo Am)
{
    if (bNukeAllWeapons && (Am.Class == Class'MultiBombAmmo') )
        Nuke(Am);
}

function NukeItem(Inventory I)
{
    if (!bKeepJetpack && (I.Class == Class'Jetpack') )
        Nuke(I);
        
    if (!bKeepMedKit && (I.Class == Class'MedKit') )
        Nuke(I);

    if (!bKeepSteroids && (I.Class == Class'Steroids') )
        Nuke(I);
        
    if (!bKeepRiotShield && (I.Class == Class'RiotShield') )
        Nuke(I);

    if (!bKeepRebreather && (I.Class == Class'Rebreather') )
        Nuke(I);
}

function NukeSnacks(VendSnack V)
{
    if (!bKeepBurrito && (V.Class == Class'Snack_Burrito') )
        Nuke(V);

    if (!bKeepChips && (V.Class == Class'Snack_Chips') )
        Nuke(V);

    if (!bKeepCowPie && (V.Class == Class'Snack_CowPie') )
        Nuke(V);
        
    if (!bKeepMRE && (V.Class == Class'Snack_MRE') )
        Nuke(V);

    if (!bKeepMRE_Veggie && (V.Class == Class'Snack_MRE_Veggie') )
        Nuke(V);
        
    if (!bKeepPowerbar && (V.Class == Class'Snack_Powerbar') )
        Nuke(V);

    if (!bKeepPowerTrip && (V.Class == Class'Snack_PowerTrip') )
        Nuke(V);
        
    if (!bKeepSandwich && (V.Class == Class'Snack_Sandwich') )
        Nuke(V);

    if (!bKeepSportsdrink && (V.Class == Class'Snack_Sportsdrink') )
        Nuke(V);
}

defaultproperties
{
    bNukeAll=False
    bNukeAllWeapons=False
    bNukeAllAmmo=False
    bNukeAllSnacks=False
    bKeepRPG=True
    bKeepFlamethrower=True
    bKeepFreezer=True
    bKeepShrinkray=True
    bKeepM16=True
    bKeepChainsaw=True
    bKeepPistol=True
    bKeepShotgun=True
    bKeepSniperRifle=True
    bKeepTripMine=True
    bKeepHypoGun=True
    bKeepMultiBomb=True
    bKeepChainsawFuel=True
    bKeepFreezerAmmo=True
    bKeepHypoVial_Antidote=True
    bKeepHypoVial_Health=True
    bKeepHypoVial_Steroids=True
    bKeepM16Ammo=True
    bKeepM16GAmmo=True
    bKeepPistolClip=True
    bKeepPistolClipHP=True
    bKeepPistolClipAP=True
    bKeepRocketPack=True
    bKeepNukeCannister=True
    bKeepShotgunAmmoAcid=True
    bKeepShotgunAmmo=True
    bKeepShrinkAmmo=True
    bKeepSniperCell=True
    bKeepTripMineAmmo=True
    bKeepJetpack=True
    bKeepMedKit=True
    bKeepSteroids=True
    bKeepRiotShield=True
    bKeepRebreather=True
    bKeepBurrito=True
    bKeepChips=True
    bKeepCowPie=True
    bKeepMRE=True
    bKeepMRE_Veggie=True
    bKeepPowerbar=True
    bKeepPowerTrip=True
    bKeepSandwich=True
    bKeepSportsdrink=True
}
