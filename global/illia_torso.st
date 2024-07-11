////////////////////////////////////////////////////////////////
//
// Starting State: The code will come here first.
//
////////////////////////////////////////////////////////////////

state START
   {
   states
      {
      STAND : default
      }
   }

////////////////////////////////////////////////////////////////
//
// Standing
//
////////////////////////////////////////////////////////////////

state STAND
   {
//   movetype legs

   entrycommands
      {
      takepain 1
      }

   torso
      {
      phaser_idle				: IS_WEAPON_ACTIVE "dualhand" "Phaser"
      phaser_idle				: IS_WEAPON_ACTIVE "dualhand" "Phaser-stx"
	  photonburst_idle	: IS_WEAPON_ACTIVE "dualhand" "FieldAssaultRifle"
	  romulandisruptorrifle_idle	: IS_WEAPON_ACTIVE "dualhand" "RomulanRadGun"
	  i-mod-idle				: IS_WEAPON_ACTIVE "dualhand" "AttrexianRifle"
      i-mod-idle				: IS_WEAPON_ACTIVE "dualhand" "I-Mod"
      compressionrifle_idle		: IS_WEAPON_ACTIVE "dualhand" "CompressionRifle"
      grenadelauncher_idle		: IS_WEAPON_ACTIVE "dualhand" "GrenadeLauncher"
      photonburst_idle			: IS_WEAPON_ACTIVE "dualhand" "PhotonBurst"
      tetryongatlinggun_idle		: IS_WEAPON_ACTIVE "dualhand" "TetryonGatlingGun"
      photonburst_idle			: IS_WEAPON_ACTIVE "dualhand" "BurstRifle"
      photonburst_idle			: IS_WEAPON_ACTIVE "dualhand" "FederationSniperRifle"
      romulandisruptorrifle_idle	: IS_WEAPON_ACTIVE "dualhand" "RomulanDisruptor"
      1hand_smallarms_idle		: IS_WEAPON_ACTIVE "dualhand" "Tricorder"
      1hand_smallarms_idle		: IS_WEAPON_ACTIVE "dualhand" "Tricorder-stx"
      1hand_smallarms_idle		: IS_WEAPON_ACTIVE "dualhand" "Tricorder-rom"
      batleth_idle			: IS_WEAPON_ACTIVE "dualhand" "Batleth"
      staff_idle			: IS_WEAPON_ACTIVE "dualhand" "DrullStaff"
      }

   states
      {
      // Weapon States
      PUTAWAY                    : PUTAWAYBOTH
      RAISE_WEAPON               : NEW_WEAPON

	WEAPON_RELOAD			: IS_WEAPON_RELOADING

      CHECK_LEFT_BUTTON          : ATTACKLEFT
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT
      FORCE_RELOAD               : !WEAPON_FULLCLIP WEAPON_FORCERELOAD HAS_INVAMMO "dualhand" WEAPON_CAN_RELOAD
      
   	// Misc States
      FAKEPLAYER                 : FAKEPLAYERACTIVE ONGROUND !HAS_WEAPON LEGS "STAND"
      KILLED                     : KILLED

	WEAPON_HOLSTER			: HAS_WEAPON HOLSTERWEAPON
      }
   }

////////////////////////////////////////////////////////////////
//
// Player died
//
////////////////////////////////////////////////////////////////
state KILLED
   {
//   movetype anim

   torso
    {
//      death : default
      }

   states
      {
//      KILLED_DONE : ANIMDONE_TORSO
      }

   exitcommands
      {
//      dead
      }
   }
   
state KILLED_DONE
   {
   movetype anim

   torso
      {
      death : default
      }

//   camera topdown
   }

////////////////////////////////////////////////////////////////
//
// Player is about to become a fakeplayer
//
////////////////////////////////////////////////////////////////

state FAKEPLAYER
   {
   movetype fakeplayer

   states
      {
      STAND                   : !FAKEPLAYERACTIVE
      }
   }

////////////////////////////////////////////////////////////////
//
// Phaser 
//
////////////////////////////////////////////////////////////////
state PHASER_MODE1_PREFIRE
   {
	
   entrycommands
      {
      animateweapon pre_fire
      }	

   torso
      {
      phaser_fire      : default
      }
   
   states
      {
      PHASER_MODE1_FIRE  : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      RAISE_WEAPON       : NEW_WEAPON ANIMDONE_TORSO
      PHASER_EXIT_FIRE			: LEAN_LEFT
      PHASER_EXIT_FIRE			: LEAN_RIGHT
//      PHASER_MODE1_FIRE : default
      }
   }

state PHASER_MODE2_PREFIRE
   {
   	
   entrycommands
      {
      animateweapon pre_fire
      }	

   torso
      {

      phaser_fire      : default
      }
   
   states
      {
      PHASER_MODE2_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      RAISE_WEAPON               : NEW_WEAPON ANIMDONE_TORSO
      PHASER_EXIT_FIRE			: LEAN_LEFT
      PHASER_EXIT_FIRE			: LEAN_RIGHT
//      PHASER_MODE2_FIRE : default
      }
   }
      
state PHASER_MODE1_FIRE
   {
   
   entrycommands
      {
      fire dualhand primary
      }

   torso
      {

      phaser_fire      : default
      }

   states
      {
//      PHASER_EXIT_RELOADING      : !ATTACKLEFT IS_WEAPON_RELOADING
	PUTAWAY                    : PUTAWAYBOTH
      PHASER_EXIT_FIRE           : !HAS_AMMO "dualhand" "MODE1"
      PHASER_EXIT_FIRE           : !ATTACKLEFT
      PHASER_EXIT_FIRE			: LEAN_LEFT
      PHASER_EXIT_FIRE			: LEAN_RIGHT
      }
   }
   
state PHASER_MODE2_FIRE
   {
      	
   entrycommands
      {
      fire dualhand alternate
      }

   torso
      {

      phaser_fire      : default
      }

   states
      {
//      PHASER_EXIT_RELOADING      : !ATTACKRIGHT IS_WEAPON_RELOADING
	PUTAWAY                    : PUTAWAYBOTH
      PHASER_EXIT_FIRE           : !HAS_AMMO "dualhand" "MODE2"
      PHASER_EXIT_FIRE           : !ATTACKRIGHT
      PHASER_EXIT_FIRE			: LEAN_LEFT
      PHASER_EXIT_FIRE			: LEAN_RIGHT
      }
   }

state PHASER_MODE3_FIRE
   {
   entrycommands
      {
      fire dualhand primary
      }

   torso
      {
      phaser_fire      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      PHASER_EXIT_FIRE           : !ATTACKLEFT
      PHASER_EXIT_FIRE			: LEAN_LEFT
      PHASER_EXIT_FIRE			: LEAN_RIGHT
      }
   }

state PHASER_MODE4_FIRE
   {
   entrycommands
      {
      fire dualhand alternate
      }

   torso
      {
      phaser_fire      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      PHASER_EXIT_FIRE           : !ATTACKRIGHT
      PHASER_EXIT_FIRE			: LEAN_LEFT
      PHASER_EXIT_FIRE			: LEAN_RIGHT
      }
   }

state PHASER_EXIT_FIRE
   {
   entrycommands
      {
      stopfire dualhand
      animateweapon exit_fire
      }
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state PHASER_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state PHASER_EXIT_RELOADING
   {
   states
      {
      PHASER_EXIT_FIRE_NO_STOP  : !IS_WEAPON_RELOADING
      }
   }

////////////////////////////////////////////////////////////////
//
// Field Assault Rifle (burst)
//
////////////////////////////////////////////////////////////////

state BURSTRIFLE_MODE1_PREFIRE
   {
   	
   
   entrycommands
      {
//     animateweapon pre_fire
      }	

   torso
      {
      compressionrifle_fire      			: default
      }
   
   states
      {
//      ASSAULTRIFLE_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      BURSTRIFLE_MODE1_FIRE : default
      }
   }
   
state BURSTRIFLE_MODE2_PREFIRE
   {
   	
  	
   entrycommands
      {
      //animateweapon pre_fire
//      startcharge MODE2
      }	

   torso
      {

      compressionrifle_fire      			: default
      }
   
   states
      {
//      ASSAULTRIFLE_MODE2_FIRE : !ATTACKRIGHT
      BURSTRIFLE_MODE2_FIRE : default
      }
   }   
   
state BURSTRIFLE_MODE1_FIRE
   {
      	
   entrycommands
      {
      fire dualhand primary
      }

   torso
      {
      compressionrifle_fire      			: default
      }

   states
      {
//      ASSAULTRIFLE_EXIT_RELOADING      : !ATTACKLEFT IS_WEAPON_RELOADING
//      ASSAULTRIFLE_MODE1_FIRE_RELOAD   : IS_WEAPON_RELOADING
	PUTAWAY                    : PUTAWAYBOTH
      WEAPON_RELOAD			: IS_WEAPON_RELOADING
      BURSTRIFLE_MODE1_FIRE_RESET           : IS_WEAPON_FINISHED_FIRING
      }
   }

state BURSTRIFLE_MODE1_FIRE_RESET
   {      	
   torso
      {
      compressionrifle_fire      			: default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      WEAPON_RELOAD			: IS_WEAPON_RELOADING
//      ASSAULTRIFLE_MODE1_FIRE_RELOAD   : IS_WEAPON_RELOADING
      BURSTRIFLE_EXIT_FIRE           : !ATTACKLEFT
      BURSTRIFLE_EXIT_FIRE           : !HAS_AMMO "dualhand" "MODE1"
      BURSTRIFLE_MODE1_FIRE_LOOP     : default
      }
   }

state BURSTRIFLE_MODE1_FIRE_RELOAD
   {      	
   torso
      {
      compressionrifle_fire      			: default
      }

   states
      {
      BURSTRIFLE_MODE1_FIRE_RESET    : !IS_WEAPON_RELOADING
      }
   }

state BURSTRIFLE_MODE1_FIRE_LOOP
   {
   entrycommands
      {
      stopfire dualhand
      fire dualhand primary
      }

   torso
      {
      compressionrifle_fire      			: default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      BURSTRIFLE_MODE1_FIRE_RESET           : IS_WEAPON_FINISHED_FIRING
      }
   }
   
state BURSTRIFLE_MODE2_FIRE
   {
   	
     	
   entrycommands
      {
      fire dualhand alternate
//      releasefire dualhand MODE2
      }

   torso
      {
      compressionrifle_fire      			: default
      }

   states
      {
//      WEAPON_RELOAD			: IS_WEAPON_RELOADING
//      ASSAULTRIFLE_EXIT_RELOADING       : IS_WEAPON_RELOADING
//      BURSTRIFLE_EXIT_FIRE            : IS_WEAPON_FINISHED_FIRING !ATTACKRIGHT 
	PUTAWAY                    : PUTAWAYBOTH
      BURSTRIFLE_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
      }
   }

state BURSTRIFLE_EXIT_FIRE
   {
   entrycommands
      {
      stopfire dualhand
      animateweapon exit_fire
      }

   torso
      {
      compressionrifle_fire      : default
      }

   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }

state BURSTRIFLE_EXIT2_FIRE
   {
   entrycommands
      {
      animateweapon exit_fire
      }

   torso
      {
      compressionrifle_fire      : default
      }

   states
      {
      STAND                      : default
      }
   }
   
state BURSTRIFLE_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      STAND                      : default
      }
   }

////////////////////////////////////////////////////////////////
//
// Attrexian Rifle
//
////////////////////////////////////////////////////////////////
state ATTREX_MODE1_PREFIRE
   {
	
   entrycommands
      {
//      animateweapon pre_fire
      }	

   torso
      {
      fieldassaultrifle_fire      : default
      }
   
   states
      {
//      ATTREX_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
	ATTREX_MODE1_FIRE_NEW : default
      }
   }

state ATTREX_MODE2_PREFIRE
   {
   	
   entrycommands
      {
//      animateweapon pre_alt_fire
//      startcharge
      }	

   torso
      {
      fieldassaultrifle_fire      : default
      }
   
   states
      {
//      ATTREX_MODE2_PREFIRE2       : IS_DUALWEAPON_READY_TO_FIRE "MODE2"
//      ATTREX_MODE2_FIRE           : !ATTACKRIGHT
      ATTREX_MODE2_FIRE           : default
      }
   }

state ATTREX_MODE2_PREFIRE2
   {
   	
   entrycommands
      {
      animateweapon pre_alt_idle
      }	

   torso
      {
      fieldassaultrifle_fire      : default
      }
   
   states
      {
      ATTREX_MODE2_FIRE           : !ATTACKRIGHT
      }
   }

state ATTREX_MODE1_FIRE_NEW
   {
      	
   entrycommands
      {
      weaponCommand dual startFiring
      fire dualhand primary
      }

   torso
      {
      fieldassaultrifle_fire      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      ATTREX_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
      ATTREX_EXIT_FIRE		 : IS_DUALWEAPON_READY_TO_FIRE "MODE1" ATTACKLEFT
      ATTREX_EXIT_FIRE		 : !HAS_AMMO "dualhand" "MODE1"
      }
   }
      
state ATTREX_MODE1_FIRE
   {
   
   entrycommands
      {
      fire dualhand primary
      }

   torso
      {

      fieldassaultrifle_fire      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      ATTREX_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
      ATTREX_EXIT_FIRE		 : IS_DUALWEAPON_READY_TO_FIRE "MODE1" ATTACKLEFT
      ATTREX_EXIT_FIRE		 : IS_DUALWEAPON_READY_TO_FIRE "MODE2" ATTACKRIGHT
      ATTREX_EXIT_FIRE		 : !HAS_AMMO "dualhand" "MODE1"
      }
   }
   
state ATTREX_MODE2_FIRE
   {
      	
   entrycommands
      {
//      fire dualhand alternate
      releasefire dualhand alternate
      }

   torso
      {

      fieldassaultrifle_fire      : default
      }

   states
      {
//      ATTREX_EXIT_RELOADING       : !ATTACKRIGHT IS_WEAPON_RELOADING
//      ATTREX_EXIT_FIRE            : !ATTACKRIGHT
	PUTAWAY                    : PUTAWAYBOTH
      ATTREX_EXIT_FIRE            : IS_WEAPON_FINISHED_FIRING
      }
   }

state ATTREX_EXIT_FIRE
   {
   entrycommands
      {
     weaponCommand dual finishedfiring 1
      stopfire dualhand
//      animateweapon idle
      }
   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      STAND                      : !HAS_AMMO "dualhand" "MODE1"
      ATTREX_MODE1_FIRE       : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1" "AttrexianRifle"      	IS_WEAPON_ACTIVE "dualhand" "AttrexianRifle"
//      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
//      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state ATTREX_EXIT_FIRE_NO_STOP
   {
   states
      {
//      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
//      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state ATTREX_EXIT_RELOADING
   {
   states
      {
      ATTREX_EXIT_FIRE_NO_STOP  : !IS_WEAPON_RELOADING
      }
   }

////////////////////////////////////////////////////////////////
//
// Enterprise Cannon
//
////////////////////////////////////////////////////////////////
state ENTERPRISE_MODE1_PREFIRE
   {
	
   entrycommands
      {
      animateweapon pre_fire
      }	

   torso
      {
      compressionrifle_fire      : default
      }
   
   states
      {
      ENTERPRISE_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      }
   }

state ENTERPRISE_MODE2_PREFIRE
   {
   	
   entrycommands
      {
 //     animateweapon pre_fire
      }	

   torso
      {

      compressionrifle_fire      : default
      }
   
   states
      {
      ENTERPRISE_MODE2_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      }
   }
      
state ENTERPRISE_MODE1_FIRE
   {
   entrycommands
      {
      fire dualhand primary
      }

   torso
      {
      compressionrifle_fire      : default
      }

   states
      {
      ENTERPRISE_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
      }
   }
   
state ENTERPRISE_MODE2_FIRE
   {
      	
   entrycommands
      {
      fire dualhand alternate
      }

   torso
      {
      compressionrifle_fire      : default
      }

   states
      {
      ENTERPRISE_MODE2_FIRE2            : IS_WEAPON_FINISHED_FIRING
      }
   }

state ENTERPRISE_MODE2_FIRE2
   {
      	
   entrycommands
      {
      stopfire dualhand
      fire dualhand alternate
      }

   torso
      {
      compressionrifle_fire      : default
      }

   states
      {
      ENTERPRISE_MODE2_FIRE3            : IS_WEAPON_FINISHED_FIRING
      }
   }

state ENTERPRISE_MODE2_FIRE3
   {
      	
   entrycommands
      {
      stopfire dualhand
      fire dualhand alternate
      }

   torso
      {
      compressionrifle_fire      : default
      }

   states
      {
      ENTERPRISE_EXIT_FIRE            : IS_WEAPON_FINISHED_FIRING
      }
   }

state ENTERPRISE_EXIT_FIRE
   {
   entrycommands
      {
      stopfire dualhand
//      animateweapon exit_fire
      }
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state ENTERPRISE_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state ENTERPRISE_EXIT_RELOADING
   {
   states
      {
      ENTERPRISE_EXIT_FIRE_NO_STOP  : !IS_WEAPON_RELOADING
      }
   }

////////////////////////////////////////////////////////////////
//
// Romulan radiation gun
//
////////////////////////////////////////////////////////////////
state ROMRAD_MODE1_PREFIRE
   {
	
   entrycommands
      {
      animateweapon pre_fire
      }	

   torso
      {
      fieldassaultrifle_fire      : default
      }
   
   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      ROMRAD_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      RAISE_WEAPON               : NEW_WEAPON ANIMDONE_TORSO
      }
   }

state ROMRAD_MODE2_PREFIRE
   {
   	
   entrycommands
      {
      animateweapon pre_fire
      }	

   torso
      {
	  fieldassaultrifle_fire      : default
      }
   
   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      ROMRAD_MODE2_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      }
   }
      
state ROMRAD_MODE1_FIRE
   {
   
   entrycommands
      {
      fire dualhand primary
      }

   torso
      {
      fieldassaultrifle_fire      : default
      }

   states
      {
//      ROMRAD_EXIT_RELOADING      : !ATTACKLEFT IS_WEAPON_RELOADING
//      ROMRAD_EXIT_FIRE           : !ATTACKLEFT
	PUTAWAY                    : PUTAWAYBOTH
      ROMRAD_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
      }
   }
   
state ROMRAD_MODE2_FIRE
   {
      	
   entrycommands
      {
      fire dualhand alternate
      }

   torso
      {
      fieldassaultrifle_fire      : default
      }

   states
      {
//      ROMRAD_EXIT_RELOADING       : !ATTACKRIGHT IS_WEAPON_RELOADING
//      ROMRAD_EXIT_FIRE            : !ATTACKRIGHT
	PUTAWAY                    : PUTAWAYBOTH
      ROMRAD_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
      }
   }

state ROMRAD_EXIT_FIRE
   {
   entrycommands
      {
      stopfire dualhand
      animateweapon exit_fire
      }
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state ROMRAD_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state ROMRAD_EXIT_RELOADING
   {

   torso
      {
      romulandisruptorrifle_idle      : default
      }

   states
      {
      ROMRAD_EXIT_FIRE_NO_STOP  : !IS_WEAPON_RELOADING
      }
   }


////////////////////////////////////////////////////////////////
//
// Drull staff
//
////////////////////////////////////////////////////////////////
state DRULLSTAFF_MODE1_PREFIRE
   {
	
   entrycommands
      {
      animateweapon pre_fire
      }	

   torso
      {
      phaser_fire      : default
      }
   
   states
      {
      PUTAWAY                    : PUTAWAYBOTH
      DRULLSTAFF_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      RAISE_WEAPON               : NEW_WEAPON
      }
   }

state DRULLSTAFF_MODE2_PREFIRE
   {
   	
   entrycommands
      {
      animateweapon pre_fire
      }	

   torso
      {

      phaser_fire      : default
      }
   
   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      DRULLSTAFF_MODE2_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      }
   }
      
state DRULLSTAFF_MODE1_FIRE
   {
   
   entrycommands
      {
      fire dualhand primary
      }

   torso
      {
      staff_fire_swipe      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      DRULLSTAFF_EXIT_RELOADING      : !ATTACKLEFT IS_WEAPON_RELOADING
      DRULLSTAFF_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING !ATTACKLEFT
      }
   }
   
state DRULLSTAFF_MODE2_FIRE
   {
      	
   entrycommands
      {
      fire dualhand alternate
      }

   torso
      {
      staff_fire_freeze      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      DRULLSTAFF_EXIT_RELOADING       : !ATTACKRIGHT IS_WEAPON_RELOADING
//      DRULLSTAFF_EXIT_FIRE            : !ATTACKRIGHT
      DRULLSTAFF_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
      }
   }

state DRULLSTAFF_EXIT_FIRE
   {
   entrycommands
      {
      stopfire dualhand
      animateweapon exit_fire
      }
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state DRULLSTAFF_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state DRULLSTAFF_EXIT_RELOADING
   {
   states
      {
      DRULLSTAFF_EXIT_FIRE_NO_STOP  : !IS_WEAPON_RELOADING
      }
   }

////////////////////////////////////////////////////////////////
//
// Field Assault Rifle 
//
////////////////////////////////////////////////////////////////
state ASSAULTRIFLE_MODE1_PREFIRE
   {
   	
   
   entrycommands
      {
//     animateweapon pre_fire
      }	

   torso
      {
      compressionrifle_fire      			: default
      }
   
   states
      {
//      ASSAULTRIFLE_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      ASSAULTRIFLE_MODE1_FIRE : default
      }
   }
   
state ASSAULTRIFLE_MODE2_PREFIRE
   {
   	
  	
   entrycommands
      {
      //animateweapon pre_fire
//      startcharge MODE2
      }	

   torso
      {

      compressionrifle_fire      			: default
      }
   
   states
      {
//      ASSAULTRIFLE_MODE2_FIRE : !ATTACKRIGHT
      ASSAULTRIFLE_MODE2_FIRE : default
      }
   }   
   
state ASSAULTRIFLE_MODE1_FIRE
   {
      	
   entrycommands
      {
      fire dualhand primary
      }

   torso
      {
      compressionrifle_fire      			: default
      }

   states
      {
//      ASSAULTRIFLE_EXIT_RELOADING      : !ATTACKLEFT IS_WEAPON_RELOADING
//      ASSAULTRIFLE_MODE1_FIRE_RELOAD   : IS_WEAPON_RELOADING
	PUTAWAY                    : PUTAWAYBOTH
      WEAPON_RELOAD			: IS_WEAPON_RELOADING
      ASSAULTRIFLE_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
      }
   }

state ASSAULTRIFLE_MODE1_FIRE_RESET
   {      	
   torso
      {
      compressionrifle_fire      			: default
      }

   states
      {
	STAND : default
//      WEAPON_RELOAD			: IS_WEAPON_RELOADING
//      ASSAULTRIFLE_EXIT_FIRE           : !ATTACKLEFT
//      ASSAULTRIFLE_EXIT_FIRE           : !HAS_AMMO "dualhand" "MODE1"
//      ASSAULTRIFLE_MODE1_FIRE_LOOP     : default
      }
   }

state ASSAULTRIFLE_MODE1_FIRE_RELOAD
   {      	
   torso
      {
      compressionrifle_fire      			: default
      }

   states
      {
      ASSAULTRIFLE_MODE1_FIRE_RESET    : !IS_WEAPON_RELOADING
      }
   }

state ASSAULTRIFLE_MODE1_FIRE_LOOP
   {
   entrycommands
      {
      stopfire dualhand
      fire dualhand primary
      }

   torso
      {
      compressionrifle_fire      			: default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      ASSAULTRIFLE_MODE1_FIRE_RESET           : IS_WEAPON_FINISHED_FIRING
      }
   }
   
state ASSAULTRIFLE_MODE2_FIRE
   {
   	
     	
   entrycommands
      {
      fire dualhand alternate
//      releasefire dualhand MODE2
      }

   torso
      {

      compressionrifle_fire      			: default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      WEAPON_RELOAD			: IS_WEAPON_RELOADING
//      ASSAULTRIFLE_EXIT_RELOADING       : IS_WEAPON_RELOADING
//      ASSAULTRIFLE_EXIT_FIRE            : IS_WEAPON_FINISHED_FIRING !ATTACKRIGHT 
//      ASSAULTRIFLE_EXIT_FIRE            : IS_WEAPON_FINISHED_FIRING !ATTACKRIGHT 
      ASSAULTRIFLE_EXIT_FIRE            : IS_WEAPON_FINISHED_FIRING
      }
   }

state ASSAULTRIFLE_EXIT_FIRE
   {
   entrycommands
      {
      stopfire dualhand
      animateweapon exit_fire
      }

   torso
      {
      compressionrifle_fire      : default
      }

   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }

state ASSAULTRIFLE_EXIT2_FIRE
   {
   entrycommands
      {
      animateweapon exit_fire
      }

   torso
      {
      compressionrifle_fire      : default
      }

   states
      {
      STAND                      : default
      }
   }
   
state ASSAULTRIFLE_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      STAND                      : default
      }
   }

////////////////////////////////////////////////////////////////
//
// IMod 
//
////////////////////////////////////////////////////////////////
state IMOD_MODE1_PREFIRE
   {
   entrycommands
      {
      animateweapon pre_fire
      }	

   torso
      {
      i-mod_fire      : default
      }
   
   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      IMOD_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      }
   }

state IMOD_MODE2_PREFIRE
   {
   entrycommands
      {
      animateweapon pre_fire
      }	

   torso
      {
      i-mod_fire      : default
      }
   
   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      IMOD_MODE2_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      }
   }
   
state IMOD_MODE1_FIRE
   {
   entrycommands
      {
      fire dualhand primary
      }

   torso
      {
      i-mod_fire      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      IMOD_EXIT_RELOADING      : !ATTACKLEFT IS_WEAPON_RELOADING
      IMOD_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
      }
   }
   
state IMOD_MODE2_FIRE
   {
   entrycommands
      {
      fire dualhand alternate
      }

   torso
      {
      i-mod_fire      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      IMOD_EXIT_RELOADING       : !ATTACKRIGHT IS_WEAPON_RELOADING
      IMOD_EXIT_FIRE            : IS_WEAPON_FINISHED_FIRING
      }
   }

state IMOD_EXIT_FIRE
   {
   entrycommands
      {
      stopfire dualhand
      animateweapon exit_fire
      }

   torso
      {
      i-mod-idle      : default
      }


   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      STAND                      : default
      }
   }
   
state IMOD_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      STAND                      : default
      }
   }
   
state IMOD_EXIT_RELOADING
   {
   torso
      {
      i-mod-idle      : default
      }

   states
      {
      IMOD_EXIT_FIRE_NO_STOP  : !IS_WEAPON_RELOADING
      }
   }
   
////////////////////////////////////////////////////////////////
//
// Compression Rifle 
//
////////////////////////////////////////////////////////////////
state COMPRESSIONRIFLE_MODE1_PREFIRE
   {
   entrycommands
      {
//      animateweapon pre_fire
      }	

   torso
      {
      compressionrifle_fire      : default
      }
   
   states
      {
//      COMPRESSIONRIFLE_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      COMPRESSIONRIFLE_MODE1_FIRE : default
      }
   }

state COMPRESSIONRIFLE_MODE2_PREFIRE
   {
   entrycommands
      {
//      animateweapon pre_fire
      }	

   torso
      {
      compressionrifle_fire      : default
      }
   
   states
      {
//      COMPRESSIONRIFLE_MODE2_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      COMPRESSIONRIFLE_MODE2_FIRE : default
      }
   }
      
state COMPRESSIONRIFLE_MODE1_FIRE
   {
   entrycommands
      {
      fire dualhand primary
      }

   torso
      {
      compressionrifle_fire      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      WEAPON_RELOAD			: IS_WEAPON_RELOADING
      COMPRESSIONRIFLE_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING !ATTACKLEFT
      }
   }
   
state COMPRESSIONRIFLE_MODE2_FIRE
   {
   entrycommands
      {
      fire dualhand alternate
      }

   torso
      {
      compressionrifle_fire      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      WEAPON_RELOAD			: IS_WEAPON_RELOADING
//      COMPRESSIONRIFLE_EXIT_FIRE            : IS_WEAPON_FINISHED_FIRING !ATTACKRIGHT
      COMPRESSIONRIFLE_EXIT_FIRE            : IS_WEAPON_FINISHED_FIRING
      }
   }

state COMPRESSIONRIFLE_EXIT_FIRE
   {
   entrycommands
      {
      stopfire dualhand
//      animateweapon exit_fire
      }
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state COMPRESSIONRIFLE_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      STAND                      : default
      }
   }   

////////////////////////////////////////////////////////////////
//
// Grenade
//
////////////////////////////////////////////////////////////////

state GRENADE_MODE1_PREFIRE
   {
   entrycommands
      {
      animateweapon charge
      startcharge
      }	

   torso
      {
      compressionrifle_fire      : default
      }
   
   states
      {
//      GRENADE_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
//      GRENADE_MODE1_FIRE : default
      GRENADE_MODE1_FIRE           : !ATTACKLEFT
	PUTAWAY                    : PUTAWAYBOTH
      GRENADE_MODE1_PREFIRE2       : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      }
   }

state GRENADE_MODE1_PREFIRE2
   {
   entrycommands
      {
      animateweapon charge_idle
      }	

   torso
      {
      compressionrifle_fire      : default
      }
   
   states
      {
      GRENADE_MODE1_FIRE           : !ATTACKLEFT
      }
   }

state GRENADE_MODE2_PREFIRE
   {
   entrycommands
      {
      }	

   torso
      {
      grenadelauncher_idle      : default
      }
   
   states
      {
      STAND : !ATTACKRIGHT
      }
   }
      
state GRENADE_MODE1_FIRE
   {
   entrycommands
      {
//      fire dualhand primary
      releasefire dualhand primary
	projdetonate 0
      }

   torso
      {
      compressionrifle_fire      : default
      }

   states
      {
//      GRENADE_EXIT_RELOADING      : !ATTACKLEFT IS_WEAPON_RELOADING

//	GRENADE_MODE2_PREFIRE		: ATTACKRIGHT

      GRENADE_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
      }
   }
   
state GRENADE_MODE2_FIRE
   {
   entrycommands
      {
//      fire dualhand alternate
      releasefire dualhand alternate
//      fire dualhand primary
//      projdetonate 0
      }

   torso
      {
      grenadelauncher_idle      : default
      }

   states
      {
//      GRENADE_EXIT_RELOADING       : !ATTACKRIGHT IS_WEAPON_RELOADING

      GRENADE_EXIT_FIRE2            : IS_WEAPON_FINISHED_FIRING
      }
   }

state GRENADE_EXIT_FIRE
   {
   entrycommands
      {
      stopfire dualhand
//      animateweapon exit_fire
//	animateweapon idle-A
      }
   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }

state GRENADE_EXIT_FIRE2
   {
   entrycommands
      {
      stopfire dualhand
//      animateweapon exit_fire
//	animateweapon idle
//      projdetonate 1
      }
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state GRENADE_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state GRENADE_EXIT_RELOADING
   {
   states
      {
      GRENADE_EXIT_FIRE_NO_STOP  : !IS_WEAPON_RELOADING
      }
   }

////////////////////////////////////////////////////////////////
//
// Photon
//
////////////////////////////////////////////////////////////////

state PHOTON_MODE1_PREFIRE
   {
   entrycommands
      {
//      animateweapon pre_fire
      }	

   torso
      {
      2hand_rifle_idle      : default
      }
   
   states
      {
//      PHOTON_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      PHOTON_MODE1_FIRE1 : default
//      PHOTON_MODE1_PAUSE : default
      }
   }

state PHOTON_MODE2_PREFIRE
   {   
   states
      {
      PHOTON_MODE2_FIRE : default
      }
   }

state PHOTON_MODE1_PAUSE
   {
   entrycommands
      {
      animateweapon pause
      }

   torso
      {
      photonburst_fire      : default
      }

   states
      {
      PHOTON_MODE1_FIRE1	: !ATTACKLEFT
      PHOTON_MODE1_LOAD2	: IS_DUALWEAPON_READY_TO_FIRE "MODE1" HAS_AMMO "dual" "MODE1" "2"
      PHOTON_MODE1_FIRE1	: IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      }
   }

state PHOTON_MODE1_LOAD1
   {
   entrycommands
      {
      animateweapon load_1
      }

   torso
      {
      photonburst_fire      : default
      }

   states
      {
      PHOTON_MODE1_FIRE1	: !ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      PHOTON_MODE1_LOAD2	: IS_DUALWEAPON_READY_TO_FIRE "MODE1" HAS_AMMO "dual" "MODE1" "2"
      PHOTON_MODE1_FIRE1	: IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      }
   }

state PHOTON_MODE1_LOAD2
   {
   entrycommands
      {
      animateweapon load_1
      }

   torso
      {
      photonburst_fire      : default
      }

   states
      {
      PHOTON_MODE1_FIRE2	: !ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      PHOTON_MODE1_LOAD3	: IS_DUALWEAPON_READY_TO_FIRE "MODE1" HAS_AMMO "dual" "MODE1" "3"
      PHOTON_MODE1_FIRE2	: IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      }
   }

state PHOTON_MODE1_LOAD3
   {
   entrycommands
      {
      animateweapon load_1
      }

   torso
      {
      photonburst_fire      : default
      }

   states
      {
      PHOTON_MODE1_FIRE3	: IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      }
   }
      
state PHOTON_MODE1_FIRE1
   {
   entrycommands
      {
      animateweapon fire
      }

   torso
      {
      photonburst_fire      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
//      PHOTON_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
      PHOTON_MODE1_LOAD_AT_END		: IS_WEAPON_FINISHED_FIRING
      }
   }

state PHOTON_MODE1_FIRE2
   {
   entrycommands
      {
      animateweapon fire
      }

   torso
      {
      photonburst_fire      : default
      }

   states
      {
      PHOTON_MODE1_FIRE1           : IS_WEAPON_FINISHED_FIRING
      }

   exitcommands
      {
      stopfire dualhand
      animateweapon exit_fire
      }

   }

state PHOTON_MODE1_FIRE3
   {
   entrycommands
      {
      animateweapon fire
      }

   torso
      {
      photonburst_fire      : default
      }

   states
      {
      PHOTON_MODE1_FIRE2           : IS_WEAPON_FINISHED_FIRING
      }

   exitcommands
      {
      stopfire dualhand
      animateweapon exit_fire
      }
   }
   
state PHOTON_MODE2_FIRE
   {
   states
      {
      PHOTON_BEAM_OFF          : IS_WEAPON_CONTROLLING_PROJECTILE
      PHOTON_BEAM_ON           : default
      }
   }

state PHOTON_BEAM_ON
   {
   entrycommands
      {
      animateweapon beam_on
      }

   torso
      {
      photonburst_fire      : default
      }

   states
      {
      PHOTON_EXIT_FIRE            : IS_DUALWEAPON_READY_TO_FIRE "MODE2" !ATTACKRIGHT
      }
   }

state PHOTON_BEAM_OFF
   {
   entrycommands
      {
      animateweapon beam_off
      }

   torso
      {
      photonburst_fire      : default
      }

   states
      {
      PHOTON_EXIT_FIRE            : IS_DUALWEAPON_READY_TO_FIRE "MODE2" !ATTACKRIGHT
      }
   }

state PHOTON_MODE1_LOAD_AT_END
   {
   entrycommands
      {
      animateweapon load_1
      }

   torso
      {
      photonburst_fire      : default
      }

   states
      {
      PHOTON_EXIT_FIRE	: default
//      PHOTON_EXIT_FIRE	: IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      }
   }

state PHOTON_EXIT_FIRE
   {
   entrycommands
      {
      stopfire dualhand
      animateweapon exit_fire
      }
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state PHOTON_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state PHOTON_EXIT_RELOADING
   {
   states
      {
      PHOTON_EXIT_FIRE_NO_STOP  : !IS_WEAPON_RELOADING
      }
   }

////////////////////////////////////////////////////////////////
//
// Tetryon
//
////////////////////////////////////////////////////////////////

state TETRYON_MODE2_PREFIRE
   {	
   torso
      {
      tetryongatlinggun_fire      : default
      }
   
   states
      {
      TETRYON_MODE2_FIRE : default
      }
   }

state TETRYON_MODE1_PREFIRE
   {	
   torso
      {
      tetryongatlinggun_fire      : default
      }
   
   states
      {
      TETRYON_MODE1_FIRE : default
      }
   }
      
state TETRYON_MODE2_FIRE
   {
   entrycommands
      {
      fire dualhand alternate
      }

   torso
      {
      tetryongatlinggun_fire      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      TETRYON_EXIT_FIRE2            : IS_WEAPON_FINISHED_FIRING
      }
   }
   
state TETRYON_MODE1_FIRE
   {
   entrycommands
      {
      fire dualhand primary
      }

   torso
      {
      tetryongatlinggun_fire      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      TETRYON_EXIT_FIRE1            : IS_WEAPON_RELOADING
      TETRYON_EXIT_FIRE1            : !HAS_AMMO "dualhand" "MODE1"
      TETRYON_EXIT_FIRE1            : !ATTACKLEFT
      }
   }

state TETRYON_EXIT_FIRE2
   {
   torso
      {
      tetryongatlinggun_idle      : default
      }

   states
      {
      TETRYON_BACK_TO_IDLE            : default
      }
   }

state TETRYON_EXIT_FIRE1
   {
   torso
      {
      tetryongatlinggun_idle      : default
      }

   states
      {
      TETRYON_BACK_TO_IDLE            : default
      }
   }

state TETRYON_BACK_TO_IDLE
   {
   entrycommands
      {
      stopfire dualhand
      }
   states
      {
      STAND                      : default
      }
   }
   
state TETRYON_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }

////////////////////////////////////////////////////////////////
//
// SniperRifle
//
////////////////////////////////////////////////////////////////

state SNIPERRIFLE_MODE1_PREFIRE
   {
   entrycommands
      {
      animateweapon pre_fire
      }	

   torso
      {
      photonburst_idle      : default
      }
   
   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      SNIPERRIFLE_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      }
   }

state SNIPERRIFLE_MODE2_PREFIRE
   {
   entrycommands
      {
      animateweapon pre_fire
      }	

   torso
      {
      photonburst_idle      : default
      }
   
   states
      {
      SNIPERRIFLE_MODE2_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      }
   }
      
state SNIPERRIFLE_MODE1_FIRE
   {
   entrycommands
      {
      fire dualhand primary
      }

   torso
      {
      photonburst_idle      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
//      SNIPERRIFLE_EXIT_RELOADING      : !ATTACKLEFT IS_WEAPON_RELOADING
      SNIPERRIFLE_HOLD           : IS_WEAPON_FINISHED_FIRING
      }
   }
   
state SNIPERRIFLE_MODE2_FIRE
   {
   entrycommands
      {
      fire dualhand alternate
      }

   torso
      {
      photonburst_idle      : default
      }

   states
      {
//      SNIPERRIFLE_EXIT_RELOADING       : !ATTACKRIGHT IS_WEAPON_RELOADING
      SNIPERRIFLE_EXIT_FIRE            : !ATTACKRIGHT
      }
   }

state SNIPERRIFLE_HOLD
   {
   entrycommands
      {
      animateweapon hold
//      stopfire dualhand
      }
   states
      {
	PUTAWAY                    : PUTAWAYBOTH
//      SNIPERRIFLE_RELOAD	: !ATTACKLEFT
      STAND                      : !ATTACKLEFT
      }
   exitcommands
      {
      stopfire dualhand
      weaponCommand dual endZoom
      }
   }

state SNIPERRIFLE_RELOAD
   {
   entrycommands
      {
      animateweapon reload
      }
   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      SNIPERRIFLE_EXIT_FIRE	: IS_WEAPON_FINISHED_FIRING
//      SNIPERRIFLE_EXIT_FIRE	: IS_WEAPON_RELOADING
      }
   }

state SNIPERRIFLE_EXIT_FIRE
   {
   entrycommands
      {
      stopfire dualhand
//      animateweapon exit_fire
      }
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state SNIPERRIFLE_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state SNIPERRIFLE_EXIT_RELOADING
   {
   states
      {
      SNIPERRIFLE_EXIT_FIRE_NO_STOP  : !IS_WEAPON_RELOADING
      }
   }

////////////////////////////////////////////////////////////////
//
// Disrupter
//
////////////////////////////////////////////////////////////////

state DISRUPTER_MODE1_PREFIRE
   {
   entrycommands
      {
      animateweapon pre_fire
      }	

   torso
      {
      romulandisruptorrifle_fire      : default
      }
   
   states
      {
//      DISRUPTER_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      DISRUPTER_MODE1_FIRE : default
      }
   }

state DISRUPTER_MODE2_PREFIRE
   {
   entrycommands
      {
      animateweapon charge
      startcharge
      }	

   torso
      {
      romulandisruptorrifle_fire      : default
      }
   
   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      DISRUPTER_MODE2_PREFIRE2       : IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      DISRUPTER_MODE2_FIRE : !ATTACKRIGHT
      }
   }

state DISRUPTER_MODE2_PREFIRE2
   {
   entrycommands
      {
      animateweapon charge_idle
      }	

   torso
      {
      romulandisruptorrifle_fire      : default
      }
   
   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      DISRUPTER_MODE2_FIRE : !ATTACKRIGHT
      }
   }
      
state DISRUPTER_MODE1_FIRE
   {
   entrycommands
      {
      fire dualhand primary
      }

   torso
      {
      romulandisruptorrifle_fire      : default
      }

   states
      {
//      DISRUPTER_EXIT_RELOADING      : !ATTACKLEFT IS_WEAPON_RELOADING
	PUTAWAY                    : PUTAWAYBOTH
      DISRUPTER_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
      }
   }
   
state DISRUPTER_MODE2_FIRE
   {
   entrycommands
      {
//      fire dualhand primary
      releasefire dualhand alternate
      }

   torso
      {
      romulandisruptorrifle_fire      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
//      DISRUPTER_EXIT_RELOADING       : !ATTACKRIGHT IS_WEAPON_RELOADING
//      DISRUPTER_EXIT_FIRE            : !ATTACKRIGHT
      DISRUPTER_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
//      DISRUPTER_EXIT_FIRE           : default
      }
   }

state DISRUPTER_EXIT_FIRE
   {
   entrycommands
      {
      stopfire dualhand
//      animateweapon idle
      }
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state DISRUPTER_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state DISRUPTER_EXIT_RELOADING
   {
   states
      {
      DISRUPTER_EXIT_FIRE_NO_STOP  : !IS_WEAPON_RELOADING
      }
   }


////////////////////////////////////////////////////////////////
//
// Tricorder
//
////////////////////////////////////////////////////////////////
state TRICORDER_MODE1_PREFIRE
   {
   entrycommands
      {
      animateweapon pre_fire
      }	
   
	torso
		{
		1hand_smallarms_idle      : default
		}

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      TRICORDER_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      TRICORDER_EXIT_FIRE			: LEAN_LEFT
      TRICORDER_EXIT_FIRE			: LEAN_RIGHT
      }
   }

state TRICORDER_MODE2_PREFIRE
   {
   entrycommands
      {
      animateweapon pre_fire
      }	

   torso
      {
      1hand_smallarms_idle      : default
      }
   
   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      TRICORDER_MODE2_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      TRICORDER_EXIT_FIRE			: LEAN_LEFT
      TRICORDER_EXIT_FIRE			: LEAN_RIGHT
      }
   }
      
state TRICORDER_MODE1_FIRE
   {
   entrycommands
      {
      fire dualhand primary
      }

	   torso
      {
      1hand_smallarms_idle      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      TRICORDER_EXIT_RELOADING      : !ATTACKLEFT IS_WEAPON_RELOADING
      TRICORDER_EXIT_FIRE           : !ATTACKLEFT
      TRICORDER_EXIT_FIRE			: LEAN_LEFT
      TRICORDER_EXIT_FIRE			: LEAN_RIGHT
      }
   }
   
state TRICORDER_MODE2_FIRE
   {
   entrycommands
      {
      fire dualhand alternate
      }

   torso
      {
      1hand_smallarms_idle      : default
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
//      TRICORDER_EXIT_RELOADING       : !ATTACKRIGHT IS_WEAPON_RELOADING
      TRICORDER_EXIT_FIRE            : !ATTACKRIGHT
      TRICORDER_EXIT_FIRE			: LEAN_LEFT
      TRICORDER_EXIT_FIRE			: LEAN_RIGHT
      }
   }

state TRICORDER_EXIT_FIRE
   {
   entrycommands
      {
      stopfire dualhand
//      animateweapon exit_fire
      }
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state TRICORDER_EXIT_FIRE_NO_STOP
   {
   states
      {
      CHECK_LEFT_BUTTON          : ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      CHECK_RIGHT_BUTTON         : ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND                      : default
      }
   }
   
state TRICORDER_EXIT_RELOADING
   {
   states
      {
      TRICORDER_EXIT_FIRE_NO_STOP  : !IS_WEAPON_RELOADING
      }
   }

////////////////////////////////////////////////////////////////
//
// Batleth
//
////////////////////////////////////////////////////////////////

state BATLETH_MODE1_PREFIRE
   {
   entrycommands
      {
//      animateweapon pre_fire
      }	
   
	torso
	{
//	2hand_rifle_idle      : default
	}

   states
      {
//      BATLETH_MODE1_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      BATLETH_MODE1_FIRE : default
      }
   }

state BATLETH_MODE2_PREFIRE
   {
   entrycommands
      {
//      animateweapon pre_fire
      }	

   torso
      {
//      2hand_rifle_idle      : default
      }
   
   states
      {
//      BATLETH_MODE2_FIRE : IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      BATLETH_MODE2_FIRE : default
      }
   }
      
state BATLETH_MODE1_FIRE
   {
   entrycommands
      {
//      fire dualhand primary
      }

      torso
      {
//      batleth_small      : default
      }

   states
      {
//      BATLETH_EXIT_FIRE           : IS_WEAPON_FINISHED_FIRING
	PUTAWAY                    : PUTAWAYBOTH
      BATLETH_MODE1_FIRE_LEFT	: STRAFE_LEFT
      BATLETH_MODE1_FIRE_RIGHT	: STRAFE_RIGHT
      BATLETH_MODE1_FIRE_CENTER	: FORWARD
      BATLETH_MODE1_FIRE_RANDOM	: default
      }
   }

state BATLETH_MODE1_FIRE_LEFT
	{
	entrycommands
		{
		animateweapon fire1
		meleeattackstart
		}

	torso
		{
		batleth_small : default
		}

	states
		{
	PUTAWAY                    : PUTAWAYBOTH
		BATLETH_EXIT_FIRE : IS_WEAPON_FINISHED_FIRING
		}
	}

state BATLETH_MODE1_FIRE_RIGHT
	{
	entrycommands
		{
		animateweapon fire2
		meleeattackstart
		}

	torso
		{
		batleth_small : default
		}

	states
		{
	PUTAWAY                    : PUTAWAYBOTH
		BATLETH_EXIT_FIRE : IS_WEAPON_FINISHED_FIRING
		}
	}

state BATLETH_MODE1_FIRE_CENTER
	{
	entrycommands
		{
		animateweapon fire3
		meleeattackstart
		}

	torso
		{
		batleth_small : default
		}

	states
		{
	PUTAWAY                    : PUTAWAYBOTH
		BATLETH_EXIT_FIRE : IS_WEAPON_FINISHED_FIRING
		}
	}

state BATLETH_MODE1_FIRE_RANDOM
	{
	entrycommands
		{
		fire dualhand primary
		meleeattackstart
		}

	torso
		{
		batleth_small : default
		}

	states
		{
	PUTAWAY                    : PUTAWAYBOTH
		BATLETH_EXIT_FIRE : IS_WEAPON_FINISHED_FIRING
		}
	}

state BATLETH_MODE2_FIRE
	{
	entrycommands
		{
		fire dualhand alternate
		meleeattackstart
		}

	torso
		{
		batleth_large : default
		}

	states
		{
	PUTAWAY                    : PUTAWAYBOTH
		BATLETH_EXIT_FIRE : IS_WEAPON_FINISHED_FIRING
		}
	}

state BATLETH_EXIT_FIRE
	{
	entrycommands
		{
		stopfire dualhand
		meleeattackend
		}
	states
		{
		CHECK_LEFT_BUTTON		: ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
		CHECK_RIGHT_BUTTON		: ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
		STAND					: default
		}
	}

state BATLETH_EXIT_FIRE_NO_STOP
	{
	states
		{
		CHECK_LEFT_BUTTON		: ATTACKLEFT IS_DUALWEAPON_READY_TO_FIRE "MODE1"
		CHECK_RIGHT_BUTTON		: ATTACKRIGHT IS_DUALWEAPON_READY_TO_FIRE "MODE2"
		STAND					: default
		}
	}

state BATLETH_EXIT_RELOADING
	{
	states
		{
		BATLETH_EXIT_FIRE_NO_STOP : !IS_WEAPON_RELOADING
		}
	}

////////////////////////////////////////////////////////////////
//
// Attacks
//
////////////////////////////////////////////////////////////////

state CHECK_LEFT_BUTTON
   {
   torso
      {
      phaser_idle				: IS_WEAPON_ACTIVE "dualhand" "Phaser"
      phaser_idle				: IS_WEAPON_ACTIVE "dualhand" "Phaser-stx"
      batleth_idle				: IS_WEAPON_ACTIVE "dualhand" "Batleth"
      photonburst_idle				: IS_WEAPON_ACTIVE "dualhand" "FieldAssaultRifle"
      romulandisruptorrifle_idle		: IS_WEAPON_ACTIVE "dualhand" "RomulanRadGun"
      i-mod-idle				: IS_WEAPON_ACTIVE "dualhand" "AttrexianRifle"
      i-mod-idle				: IS_WEAPON_ACTIVE "dualhand" "I-Mod"
      compressionrifle_idle			: IS_WEAPON_ACTIVE "dualhand" "CompressionRifle"
      grenadelauncher_idle			: IS_WEAPON_ACTIVE "dualhand" "GrenadeLauncher"
      photonburst_idle				: IS_WEAPON_ACTIVE "dualhand" "PhotonBurst"
      tetryongatlinggun_idle			: IS_WEAPON_ACTIVE "dualhand" "TetryonGatlingGun"
      photonburst_idle				: IS_WEAPON_ACTIVE "dualhand" "BurstRifle"
      photonburst_idle				: IS_WEAPON_ACTIVE "dualhand" "FederationSniperRifle"
      romulandisruptorrifle_idle		: IS_WEAPON_ACTIVE "dualhand" "RomulanDisruptor"
      1hand_smallarms_idle			: IS_WEAPON_ACTIVE "dualhand" "Tricorder"
      1hand_smallarms_idle			: IS_WEAPON_ACTIVE "dualhand" "Tricorder-stx"
      1hand_smallarms_idle			: IS_WEAPON_ACTIVE "dualhand" "Tricorder-rom"
      staff_idle				: IS_WEAPON_ACTIVE "dualhand" "DrullStaff"
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      PHASER_MODE3_FIRE                : !HAS_AMMO "dualhand" "MODE1"          	                        IS_WEAPON_ACTIVE "dualhand" "Phaser"
      PHASER_MODE3_FIRE                : !HAS_AMMO "dualhand" "MODE1"          	                        IS_WEAPON_ACTIVE "dualhand" "Phaser-stx"
      PHASER_MODE1_PREFIRE             : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "Phaser"           	IS_WEAPON_ACTIVE "dualhand" "Phaser"
      PHASER_MODE1_PREFIRE             : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "Phaser-stx"           	IS_WEAPON_ACTIVE "dualhand" "Phaser-stx"
      ATTREX_MODE1_PREFIRE             : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "AttrexianRifle"      	IS_WEAPON_ACTIVE "dualhand" "AttrexianRifle"
      ENTERPRISE_MODE1_PREFIRE         : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "EnterpriseCannon"      	IS_WEAPON_ACTIVE "dualhand" "EnterpriseCannon"
      ROMRAD_MODE1_PREFIRE             : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "RomulanRadGun"      		IS_WEAPON_ACTIVE "dualhand" "RomulanRadGun"
      DRULLSTAFF_MODE1_PREFIRE         : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "DrullStaff"      		IS_WEAPON_ACTIVE "dualhand" "DrullStaff"
      ASSAULTRIFLE_MODE1_PREFIRE        : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "FieldAssaultRifle" 	IS_WEAPON_ACTIVE "dualhand" "FieldAssaultRifle"
      BURSTRIFLE_MODE1_PREFIRE         : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "BurstRifle" 	        IS_WEAPON_ACTIVE "dualhand" "BurstRifle"
      IMOD_MODE1_PREFIRE               : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "I-Mod"             	IS_WEAPON_ACTIVE "dualhand" "I-Mod"
      COMPRESSIONRIFLE_MODE1_PREFIRE   : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "CompressionRifle" 	IS_WEAPON_ACTIVE "dualhand" "CompressionRifle"
      GRENADE_MODE1_PREFIRE            : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "GrenadeLauncher"  	IS_WEAPON_ACTIVE "dualhand" "GrenadeLauncher"
      PHOTON_MODE1_PREFIRE             : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "PhotonBurst"           	IS_WEAPON_ACTIVE "dualhand" "PhotonBurst"
      TETRYON_MODE1_PREFIRE            : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "TetryonGatlingGun"     	IS_WEAPON_ACTIVE "dualhand" "TetryonGatlingGun"
      SNIPERRIFLE_MODE1_PREFIRE        : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "FederationSniperRifle"	IS_WEAPON_ACTIVE "dualhand" "FederationSniperRifle"
      DISRUPTER_MODE1_PREFIRE          : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "RomulanDisruptor"         IS_WEAPON_ACTIVE "dualhand" "RomulanDisruptor"
      TRICORDER_MODE1_PREFIRE	       : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "Tricorder"		IS_WEAPON_ACTIVE "dualhand" "Tricorder"
      TRICORDER_MODE1_PREFIRE	       : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "Tricorder-stx"		IS_WEAPON_ACTIVE "dualhand" "Tricorder-stx"
      TRICORDER_MODE1_PREFIRE	       : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "Tricorder-rom"		IS_WEAPON_ACTIVE "dualhand" "Tricorder-rom"
      BATLETH_MODE1_PREFIRE	       : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "Batleth"			IS_WEAPON_ACTIVE "dualhand" "Batleth"
      STAND                            : !ATTACKLEFT
      }
   }

state CHECK_RIGHT_BUTTON
   {
   torso
      {
      phaser_idle				: IS_WEAPON_ACTIVE "dualhand" "Phaser"
      phaser_idle				: IS_WEAPON_ACTIVE "dualhand" "Phaser-stx"
      batleth_idle				: IS_WEAPON_ACTIVE "dualhand" "Batleth"
      photonburst_idle				: IS_WEAPON_ACTIVE "dualhand" "FieldAssaultRifle"
      romulandisruptorrifle_idle		: IS_WEAPON_ACTIVE "dualhand" "RomulanRadGun"
      i-mod-idle				: IS_WEAPON_ACTIVE "dualhand" "AttrexianRifle"
      i-mod-idle				: IS_WEAPON_ACTIVE "dualhand" "I-Mod"
      compressionrifle_idle			: IS_WEAPON_ACTIVE "dualhand" "CompressionRifle"
      grenadelauncher_idle			: IS_WEAPON_ACTIVE "dualhand" "GrenadeLauncher"
      photonburst_idle				: IS_WEAPON_ACTIVE "dualhand" "PhotonBurst"
      tetryongatlinggun_idle			: IS_WEAPON_ACTIVE "dualhand" "TetryonGatlingGun"
      photonburst_idle				: IS_WEAPON_ACTIVE "dualhand" "BurstRifle"
      photonburst_idle				: IS_WEAPON_ACTIVE "dualhand" "FederationSniperRifle"
      romulandisruptorrifle_idle		: IS_WEAPON_ACTIVE "dualhand" "RomulanDisruptor"
      1hand_smallarms_idle			: IS_WEAPON_ACTIVE "dualhand" "Tricorder"
      1hand_smallarms_idle			: IS_WEAPON_ACTIVE "dualhand" "Tricorder-stx"
      1hand_smallarms_idle			: IS_WEAPON_ACTIVE "dualhand" "Tricorder-rom"
      staff_idle				: IS_WEAPON_ACTIVE "dualhand" "DrullStaff"
      }

   states
      {
	PUTAWAY                    : PUTAWAYBOTH
      PHASER_MODE4_FIRE                : !HAS_AMMO "dualhand" "MODE2"          	                        IS_WEAPON_ACTIVE "dualhand" "Phaser"
      PHASER_MODE4_FIRE                : !HAS_AMMO "dualhand" "MODE2"          	                        IS_WEAPON_ACTIVE "dualhand" "Phaser-stx"
      PHASER_MODE2_PREFIRE             : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "Phaser"           	IS_WEAPON_ACTIVE "dualhand" "Phaser"
      PHASER_MODE2_PREFIRE             : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "Phaser-stx"           	IS_WEAPON_ACTIVE "dualhand" "Phaser-stx"
      ATTREX_MODE2_PREFIRE             : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "AttrexianRifle"       IS_WEAPON_ACTIVE "dualhand" "AttrexianRifle"
	  ENTERPRISE_MODE2_PREFIRE         : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "EnterpriseCannon"       IS_WEAPON_ACTIVE "dualhand" "EnterpriseCannon" HAS_FULLAMMO "EnterpriseAlt"
      ROMRAD_MODE2_PREFIRE             : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "RomulanRadGun"			IS_WEAPON_ACTIVE "dualhand" "RomulanRadGun"
      DRULLSTAFF_MODE2_PREFIRE         : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "DrullStaff"			IS_WEAPON_ACTIVE "dualhand" "DrullStaff"
      ASSAULTRIFLE_MODE2_PREFIRE        : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "FieldAssaultRifle" 	IS_WEAPON_ACTIVE "dualhand" "FieldAssaultRifle"
      BURSTRIFLE_MODE2_PREFIRE         : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "BurstRifle" 		IS_WEAPON_ACTIVE "dualhand" "BurstRifle"
//      BURSTRIFLE_MODE1_PREFIRE         : IS_DUALWEAPON_READY_TO_FIRE "MODE1" "BurstRifle" 		IS_WEAPON_ACTIVE "dualhand" "BurstRifle"
      IMOD_MODE2_PREFIRE               : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "I-Mod"             	IS_WEAPON_ACTIVE "dualhand" "I-Mod"
      COMPRESSIONRIFLE_MODE2_PREFIRE   : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "CompressionRifle" 	IS_WEAPON_ACTIVE "dualhand" "CompressionRifle"
      GRENADE_MODE2_PREFIRE            : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "GrenadeLauncher"  	IS_WEAPON_ACTIVE "dualhand" "GrenadeLauncher"
//      PHOTON_MODE2_PREFIRE             : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "PhotonBurst"           	IS_WEAPON_ACTIVE "dualhand" "PhotonBurst"
      TETRYON_MODE2_PREFIRE            : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "TetryonGatlingGun"     	IS_WEAPON_ACTIVE "dualhand" "TetryonGatlingGun"
      SNIPERRIFLE_MODE2_PREFIRE        : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "FederationSniperRifle" 	IS_WEAPON_ACTIVE "dualhand" "FederationSniperRifle"
      DISRUPTER_MODE2_PREFIRE          : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "RomulanDisruptor"         IS_WEAPON_ACTIVE "dualhand" "RomulanDisruptor"
      TRICORDER_MODE2_PREFIRE	       : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "Tricorder"		IS_WEAPON_ACTIVE "dualhand" "Tricorder"
      TRICORDER_MODE2_PREFIRE	       : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "Tricorder-stx"		IS_WEAPON_ACTIVE "dualhand" "Tricorder-stx"
      TRICORDER_MODE2_PREFIRE	       : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "Tricorder-rom"		IS_WEAPON_ACTIVE "dualhand" "Tricorder-rom"
      BATLETH_MODE2_PREFIRE	       : IS_DUALWEAPON_READY_TO_FIRE "MODE2" "Batleth"			IS_WEAPON_ACTIVE "dualhand" "Batleth"
      STAND                            : !ATTACKRIGHT
      }
   }

state FORCE_RELOAD
   {
   entrycommands
      {
      forcereload
      }
   states
      {
      STAND          : !IS_WEAPON_RELOADING
      }
   }

//======================================================================
// PUTAWAY_WEAPON
//======================================================================

state PUTAWAY
   {
   entrycommands
      {
      weaponCommand dual displayeffect TransportOut FederationWeapons
      putawayweapon dual
      }

//   torso
//      {
//      unequip_big_gun     : IS_WEAPON_ACTIVE "dualhand" "QGun"
//      unequip_bow         : IS_WEAPON_ACTIVE "dualhand" "MedicineBow"
//      unequip_one_handed  : IS_WEAPON_ACTIVE "dualhand" "PeaceMaker"
//      unequip_one_handed  : IS_WEAPON_ACTIVE "dualhand" "SymBlaster"
//      unequip_big_gun     : IS_WEAPON_ACTIVE "dualhand" "TOW"
//      unequip_big_gun	  : IS_WEAPON_ACTIVE "dualhand" "30mm"
//      unequip_one_handed  : IS_WEAPON_ACTIVE "dualhand" "Rifle"
//      null                : default
//      }

   states
      {
      STAND              : WEAPON_LOWERED
      }
   
   exitcommands
      {
      deactivateweapon dualhand
      }
   }

//======================================================================
// RAISE_WEAPON
//======================================================================

state RAISE_WEAPON
   {
   entrycommands
      {
      activatenewweapon
      weaponCommand dual displayeffect TransportIn FederationWeapons
      }

   states
      {
      RAISING_WEAPON     : default
      }
   }

state RAISING_WEAPON
   {

   states
      {
      RAISE_WEAPON       : NEW_WEAPON
      STAND              : IS_DUALWEAPON_READY_TO_FIRE "MODE1"
      STAND              : IS_DUALWEAPON_READY_TO_FIRE "MODE2"
      STAND              : !HAS_AMMO "MODE1" !HAS_AMMO "MODE2"
      }
   }

state WEAPON_RELOAD
   {      	
   torso
      {
      phaser_idle				: IS_WEAPON_ACTIVE "dualhand" "Phaser"
      phaser_idle				: IS_WEAPON_ACTIVE "dualhand" "Phaser-stx"
      batleth_idle				: IS_WEAPON_ACTIVE "dualhand" "Batleth"
      photonburst_idle				: IS_WEAPON_ACTIVE "dualhand" "FieldAssaultRifle"
      romulandisruptorrifle_idle		: IS_WEAPON_ACTIVE "dualhand" "RomulanRadGun"
      i-mod-idle				: IS_WEAPON_ACTIVE "dualhand" "AttrexianRifle"
      i-mod-idle				: IS_WEAPON_ACTIVE "dualhand" "I-Mod"
      compressionrifle_idle			: IS_WEAPON_ACTIVE "dualhand" "CompressionRifle"
      grenadelauncher_idle			: IS_WEAPON_ACTIVE "dualhand" "GrenadeLauncher"
      photonburst_idle				: IS_WEAPON_ACTIVE "dualhand" "PhotonBurst"
      tetryongatlinggun_idle			: IS_WEAPON_ACTIVE "dualhand" "TetryonGatlingGun"
      photonburst_idle				: IS_WEAPON_ACTIVE "dualhand" "BurstRifle"
      photonburst_idle				: IS_WEAPON_ACTIVE "dualhand" "FederationSniperRifle"
      romulandisruptorrifle_idle		: IS_WEAPON_ACTIVE "dualhand" "RomulanDisruptor"
      1hand_smallarms_idle			: IS_WEAPON_ACTIVE "dualhand" "Tricorder"
      1hand_smallarms_idle			: IS_WEAPON_ACTIVE "dualhand" "Tricorder-stx"
      1hand_smallarms_idle			: IS_WEAPON_ACTIVE "dualhand" "Tricorder-rom"
      staff_idle				: IS_WEAPON_ACTIVE "dualhand" "DrullStaff"
      }

   states
      {
      STAND   : !IS_WEAPON_RELOADING
      }
   }

state WEAPON_HOLSTER
   {      	
   entrycommands
      {
      safeholster 1
      }

   states
      {
      STAND   : default
      }
   }
