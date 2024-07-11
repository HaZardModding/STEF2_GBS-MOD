////////////////////////////////////////////////////////////////
//
// Standing
//
////////////////////////////////////////////////////////////////

state STAND
   {
   legs
      {
      stand_idle           : default
      }

   states
      {
      KILLED               : KILLED

      LADDER	           : ON_LADDER

      START_STANDING_JUMP  : JUMP HAS_ANIM "jump_stand_start"

      RUNNING_JUMP         : !ONGROUND
      DUCK_DOWN		   	: DUCK
      
      IN_TURRET				: IN_VEHICLE "turret"

      RUN_FORWARD          : FORWARD !BACKWARD RUN  !FAKEPLAYERACTIVE ONGROUND //!BLOCKED "2"
      WALK_FORWARD         : FORWARD !BACKWARD !CAN_FALL  !FAKEPLAYERACTIVE ONGROUND //!BLOCKED "2"

      STRAFE_RIGHT         : STRAFE_RIGHT !BACKWARD !FORWARD !BLOCKED "2" !FAKEPLAYERACTIVE
      STRAFE_LEFT          : STRAFE_LEFT !BACKWARD !FORWARD !BLOCKED "2" !FAKEPLAYERACTIVE

      RUN_FORWARD          : STRAFE_RIGHT !BACKWARD RUN !BLOCKED "2" !FAKEPLAYERACTIVE ONGROUND
      WALK_FORWARD         : STRAFE_RIGHT FORWARD !BACKWARD !CAN_FALL !BLOCKED "2" !FAKEPLAYERACTIVE ONGROUND

      RUN_FORWARD          : STRAFE_LEFT !BACKWARD RUN !BLOCKED "2" !FAKEPLAYERACTIVE ONGROUND
      WALK_FORWARD         : STRAFE_LEFT FORWARD !BACKWARD !CAN_FALL !BLOCKED "2" !FAKEPLAYERACTIVE ONGROUND

      RUN_BACKWARD         : BACKWARD !FORWARD RUN !BLOCKED "2" !FAKEPLAYERACTIVE ONGROUND
      WALK_BACKWARD        : BACKWARD !FORWARD !BLOCKED "2" !FAKEPLAYERACTIVE ONGROUND
      

// Turn back on later, if we get turning animations
//      STAND_TURN_LEFT      : TURNED_LEFT ONGROUND
//      STAND_TURN_RIGHT     : TURNED_RIGHT ONGROUND
      }
   }

state DUCK_DOWN
   {
   legs
      {
      duck_down : default
      }

   states
      {
      KILLED               : KILLED
      DUCK_GETUP                : +JUMP
      DUCK_WALK                : +FORWARD
      DUCK_WALK                : +BACKWARD
      DUCK_WALK                : +STRAFE_LEFT
      DUCK_WALK                : +STRAFE_RIGHT
      DUCK_WALK					  : FORWARD
      DUCK_WALK					  : BACKWARD
      DUCK_WALK_LEFT				  : STRAFE_LEFT
      DUCK_WALK_RIGHT				  : STRAFE_RIGHT
      DUCK                 		: ANIMDONE_LEGS
      }
   }

state DUCK
   {
   legs
      {
      duck : default
      }

   states
      {
      KILLED               : KILLED
      DUCK_GETUP                : +JUMP
      DUCK_WALK					  : FORWARD
      DUCK_WALK					  : BACKWARD
      DUCK_WALK_LEFT				  : STRAFE_LEFT
      DUCK_WALK_RIGHT				  : STRAFE_RIGHT
      DUCK_GETUP		: !DUCK
      }
   }

state DUCK_WALK
   {
   legs
      {
//      duck_walk : default
      duck_walk_codedriven : default
      }

   states
      {
      KILLED			: KILLED
      LADDER	           	: ON_LADDER
      DUCK_GETUP		: +JUMP
      DUCK_GETUP		: !DUCK
      DUCK_WALK_LEFT		: !FORWARD !BACKWARD STRAFE_LEFT
      DUCK_WALK_RIGHT		: !FORWARD !BACKWARD STRAFE_RIGHT
      DUCK		  	: !FORWARD !BACKWARD !STRAFE_LEFT !STRAFE_RIGHT
      }
   }

state DUCK_WALK_LEFT
   {
   entrycommands
      {
      dontturnlegs 1
      }

   legs
      {
      duck_walk_left : default
      }

   states
      {
      KILLED			: KILLED
      LADDER	           	: ON_LADDER
      DUCK_GETUP		: +JUMP
      DUCK_GETUP		: !DUCK
      DUCK_WALK		  	: FORWARD
      DUCK_WALK		  	: BACKWARD
      DUCK_WALK_RIGHT	  	: !STRAFE_LEFT STRAFE_RIGHT
      DUCK		  	: !FORWARD !BACKWARD !STRAFE_LEFT !STRAFE_RIGHT
      }

   exitcommands
      {
      dontturnlegs 0
      }
   }

state DUCK_WALK_RIGHT
   {

   entrycommands
      {
      dontturnlegs 1
      }

   legs
      {
      duck_walk_right : default
      }

   states
      {
      KILLED			: KILLED
      LADDER	           	: ON_LADDER
      DUCK_GETUP		: +JUMP
      DUCK_GETUP		: !DUCK
      DUCK_WALK		  	: FORWARD
      DUCK_WALK		  	: BACKWARD
      DUCK_WALK_LEFT	  	: STRAFE_LEFT !STRAFE_RIGHT
      DUCK		  	: !FORWARD !BACKWARD !STRAFE_LEFT !STRAFE_RIGHT
      }

   exitcommands
      {
      dontturnlegs 0
      }

   }

state DUCK_GETUP
   {
   legs
      {
      duck_getup : default
      }

   states
      {
      KILLED               : KILLED
      START_STANDING_JUMP  : JUMP HAS_ANIM "jump_stand_start"
      STAND                : ANIMDONE_LEGS
      }
   }

state STAND_TURN_LEFT
   {
   legs
      {
      turn_left : default
      }

   states
      {
      KILLED               : KILLED
      STAND                : +FORWARD
      STAND                : +BACKWARD
      STAND                : +STRAFE_LEFT
      STAND                : +STRAFE_RIGHT
      STAND                : +JUMP
      STAND                : !TURNED_LEFT
      STAND                : ANIMDONE_LEGS
      }
   }

state STAND_TURN_RIGHT
   {
   legs
      {
      turn_right : default
      }

   states
      {
      KILLED               : KILLED
      STAND                : +FORWARD
      STAND                : +BACKWARD
      STAND                : +STRAFE_LEFT
      STAND                : +STRAFE_RIGHT
      STAND                : +JUMP
      STAND                : !TURNED_RIGHT
      STAND                : ANIMDONE_LEGS
      }
   }



////////////////////////////////////////////////////////////////
//
// Running
//
////////////////////////////////////////////////////////////////

state RUN_FORWARD
   {
   legs
      {
      run_codedriven          : default
//      run          : default
      }

   states
      {
      KILLED               : KILLED
      LADDER	           : ON_LADDER
      RUNNING_JUMP         : !ONGROUND
      DUCK_DOWN		   : DUCK
      STAND             : FAKEPLAYERACTIVE
      STAND             : !FORWARD
      RUN_BACKWARD      : BACKWARD !FORWARD
      WALK_FORWARD      : !RUN
      START_RUNNING_JUMP : JUMP HAS_ANIM "jump_run_start"
      }
   }

state RUN_BACKWARD
   {
   legs
      {
//      run_codedriven            : default
	runback_codedriven	: default
//      run            : default
      }

   states
      {
      KILLED               : KILLED
      LADDER	           : ON_LADDER
      RUNNING_JUMP         : !ONGROUND
      DUCK_DOWN		   : DUCK
      STAND                : FAKEPLAYERACTIVE
      STAND                : !BACKWARD
      WALK_BACKWARD        : !RUN
      START_RUNNING_JUMP   : JUMP HAS_ANIM "jump_run_start"
      }
   }

////////////////////////////////////////////////////////////////
//
// Walking
//
////////////////////////////////////////////////////////////////

state WALK_FORWARD
   {
   legs
      {
      walk_codedriven         : default
//      walk         : default
      }

   states
      {
      KILLED               : KILLED
      LADDER	           : ON_LADDER
      RUNNING_JUMP         : !ONGROUND
      DUCK_DOWN		   : DUCK
      STAND                : FAKEPLAYERACTIVE
      STAND                : CAN_FALL
      STAND                : !FORWARD
      RUN_FORWARD          : RUN
      START_WALKING_JUMP   : JUMP HAS_ANIM "jump_walk_start"
      }
   }

state WALK_BACKWARD
   {
   legs
      {
      walkback_codedriven                 : default
//      walk                 : default
      }

   states
      {
      KILLED               : KILLED
      LADDER	           : ON_LADDER
      RUNNING_JUMP         : !ONGROUND
      DUCK_DOWN		   : DUCK
      STAND                : FAKEPLAYERACTIVE
      STAND                : !BACKWARD
      RUN_BACKWARD         : RUN
      START_WALKING_JUMP   : JUMP HAS_ANIM "jump_walk_start"
      }
   }

////////////////////////////////////////////////////////////////
//
// Strafing
//
////////////////////////////////////////////////////////////////

state STRAFE_LEFT
   {
   entrycommands
      {
      dontturnlegs 1
      }

   legs
      {
      //walk        : !RUN
      strafe_left      : default
      }

   states
      {
      KILLED               : KILLED
      LADDER	           : ON_LADDER
      RUNNING_JUMP         : !ONGROUND
      DUCK_DOWN		   : DUCK
      STAND                : FAKEPLAYERACTIVE
      STAND                : !STRAFE_LEFT
      STAND                : STRAFE_RIGHT
      STAND                : FORWARD
      STAND                : BACKWARD
//      STAND                : +RUN
//      STAND                : -RUN
      STRAFEWALK_LEFT         : !RUN
      START_RUNNING_JUMP   : JUMP HAS_ANIM "jump_run_start"
      }

   exitcommands
      {
      dontturnlegs 0
      }
   }

state STRAFE_RIGHT
   {
   entrycommands
      {
      dontturnlegs 1
      }

   legs
      {
      //walk          : !RUN
      strafe_right        : default
      }

   states
      {
      KILLED               : KILLED
      LADDER	           : ON_LADDER
      RUNNING_JUMP         : !ONGROUND
      DUCK_DOWN		   : DUCK
      STAND                : FAKEPLAYERACTIVE
      STAND                : !STRAFE_RIGHT
      STAND                : STRAFE_LEFT
      STAND                : FORWARD
      STAND                : BACKWARD
//      STAND                : +RUN
//      STAND                : -RUN
      STRAFEWALK_RIGHT         : !RUN
      START_RUNNING_JUMP   : JUMP HAS_ANIM "jump_run_start"
      }

   exitcommands
      {
      dontturnlegs 0
      }
   }

state STRAFEWALK_LEFT
   {
   entrycommands
      {
      dontturnlegs 1
      }

   legs
      {
      //walk        : !RUN
      strafewalk_left      : default
      }

   states
      {
      KILLED               : KILLED
      LADDER	           : ON_LADDER
      RUNNING_JUMP         : !ONGROUND
      DUCK_DOWN		   : DUCK
      STAND                : FAKEPLAYERACTIVE
      STAND                : !STRAFE_LEFT
      STAND                : STRAFE_RIGHT
      STAND                : FORWARD
      STAND                : BACKWARD
//      STAND                : +RUN
//      STAND                : -RUN
      STRAFE_LEFT         : RUN
      START_RUNNING_JUMP   : JUMP HAS_ANIM "jump_run_start"
      }

   exitcommands
      {
      dontturnlegs 0
      }
   }

state STRAFEWALK_RIGHT
   {
   entrycommands
      {
      dontturnlegs 1
      }

   legs
      {
      //walk          : !RUN
      strafewalk_right        : default
      }

   states
      {
      KILLED               : KILLED
      LADDER	           : ON_LADDER
      RUNNING_JUMP         : !ONGROUND
      DUCK_DOWN		   : DUCK
      STAND                : FAKEPLAYERACTIVE
      STAND                : !STRAFE_RIGHT
      STAND                : STRAFE_LEFT
      STAND                : FORWARD
      STAND                : BACKWARD
//      STAND                : +RUN
//      STAND                : -RUN
      STRAFE_RIGHT         : RUN
      START_RUNNING_JUMP   : JUMP HAS_ANIM "jump_run_start"
      }

   exitcommands
      {
      dontturnlegs 0
      }
   }

////////////////////////////////////////////////////////////////
//
// Jumping
//
////////////////////////////////////////////////////////////////

state START_STANDING_JUMP
   {
   	
   legs
      {
      jump_stand_start          : default
      }

   states
      {
      KILLED               : KILLED
      STANDING_CROUCH_JUMP		: DUCK ANIMDONE_LEGS
      STANDING_JUMP				: ANIMDONE_LEGS
      
      }
   }

state STANDING_JUMP
   {
   legs
      {
      jump_stand_middle		: default
      }

   states
      {
      KILLED               : KILLED
      LADDER	: ON_LADDER
      DUCK_DOWN				: DUCK ONGROUND
      END_STANDING_JUMP		: ONGROUND
      }
   }

state END_STANDING_JUMP
   {
   legs
      {
      jump_stand_end		: default
      }

   states
      {
      KILLED               : KILLED
      STAND			: ANIMDONE_LEGS
//      STAND			: JUMP
      }
   }


state STANDING_CROUCH_JUMP
	{
	
	legs
		{
			jump_crouch	: default
		}
		
	states
		{
	        KILLED               : KILLED
      LADDER	: ON_LADDER
		DUCK_DOWN			: DUCK ONGROUND
		END_STANDING_JUMP	: ONGROUND
		}
	}
	
state WALKING_CROUCH_JUMP
{
	legs
	{
		jump_crouch : default
	}
	
	states
	{
	        KILLED               : KILLED
      LADDER	: ON_LADDER
		DUCK_DOWN			: DUCK ONGROUND
		END_WALKING_JUMP 	: ONGROUND
	}
}	
	
state RUNNING_CROUCH_JUMP
{
	legs
	{
		jump_crouch : default
	}
	
	states
	{
	        KILLED               : KILLED
      LADDER	: ON_LADDER
		DUCK_DOWN				: DUCK ONGROUND	
      END_RUNNING_JUMP		: ONGROUND
	}
}
	
state START_WALKING_JUMP
   {
   legs
      {
      jump_walk_start          : default
      }

   states
      {
      KILLED               : KILLED
      WALKING_CROUCH_JUMP	: DUCK ANIMDONE_LEGS
      WALKING_JUMP			: ANIMDONE_LEGS
      }
   }

state WALKING_JUMP
   {
   legs
      {
      jump_walk_middle		: default
      }

   states
      {
                KILLED               : KILLED
      LADDER	: ON_LADDER
		DUCK_DOWN			: DUCK ONGROUND      	
      END_WALKING_JUMP	: ONGROUND
      }
   }

state END_WALKING_JUMP
   {
   legs
      {
      jump_walk_end		: default
      }

   states
      {
      KILLED               : KILLED
      STAND			: ANIMDONE_LEGS
//      STAND			: JUMP
      }
   }

state START_RUNNING_JUMP
   {
   legs
      {
      jump_run_start          : default
      }

   states
      {
      KILLED               : KILLED
      RUNNING_CROUCH_JUMP 	: DUCK ANIMDONE_LEGS 
      RUNNING_JUMP			: ANIMDONE_LEGS
      }
   }

state RUNNING_JUMP
   {
   legs
      {
      jump_run_middle		: default
      }

   states
      {
      KILLED               : KILLED
      LADDER	: ON_LADDER
		DUCK_DOWN			: DUCK ONGROUND      
      END_RUNNING_JUMP	: ONGROUND
      }
   }

state END_RUNNING_JUMP
   {
   legs
      {
      jump_run_end		: default
      }

   states
      {
      KILLED               : KILLED
      STAND			: ANIMDONE_LEGS
//      STAND			: JUMP
      }
   }

state KILLED
   {
   movetype anim

   entrycommands
      {
      animateweapon idle
      }

   legs
      {
      death : default
      }

   states
      {
      KILLED_DONE : ANIMDONE_LEGS
      }

   exitcommands
      {
      dead
      }
   }
   
state KILLED_DONE
   {
   movetype anim

   legs
      {
      death : default
      }
   }
   
   
state IN_TURRET
	{
		entrycommands
	   {
	      disableuseweapon 1
	   }
   
		//movetype anim
		legs
		{
			idle : default
			turn_left : TURNED_LEFT
			turn_right : TURNED_RIGHT
		}
		
		states
		{
			STAND						   : -USE
			KILLED					   : KILLED
		}
		
		exitcommands
		{
	      disableuseweapon 0
		}
	}

state LADDER
{
   states
      {
      LADDER_STAND	: ON_LADDER !FORWARD !BACKWARD !STRAFE_LEFT !STRAFE_RIGHT
      LADDER_CLIMB	: default
      }
}

state LADDER_CLIMB
{
   legs
      {
	climb_ladder	: default
      }

   states
      {
      STAND 		: !ON_LADDER
      LADDER_STAND	: ON_LADDER !FORWARD !BACKWARD !STRAFE_LEFT !STRAFE_RIGHT
      }
}

state LADDER_STAND
{
   legs
      {
//      idle_ladder	: default
      idle	: default
      }

   states
      {
      STAND 		: !ON_LADDER
      LADDER_CLIMB	: ON_LADDER FORWARD
      LADDER_CLIMB	: ON_LADDER BACKWARD
      LADDER_CLIMB	: ON_LADDER STRAFE_LEFT
      LADDER_CLIMB	: ON_LADDER STRAFE_RIGHT
      }
}
