void()CheckImpulses;
// Called when a client first connects to a server. Sets parm1...parm16 so that they can be saved off for restarts
void() SetNewParms = 
{

};

// Call to set parms for self so they can be restored.
void() SetChangeParms = 
{

};
//player jump code
void() PlayerJump =
{

	if (self.flags & FL_WATERJUMP)
		return;

	if (self.waterlevel >= 2)
	{
		if (self.watertype == CONTENT_WATER)
			self.velocity_z = 100;
		else if (self.watertype == CONTENT_SLIME)
			self.velocity_z = 80;
		else
			self.velocity_z = 50;
		return;
	}

	if (!(self.flags & FL_ONGROUND))
		return;

	if ( !(self.flags & FL_JUMPRELEASED) )
		return;		// don't pogo stick

	self.flags = self.flags - (self.flags & FL_JUMPRELEASED);
	self.flags = self.flags - FL_ONGROUND;	// don't stairwalk

	self.button2 = 0;
	self.velocity_z = self.velocity_z + 270;
};
//Called when a client issues the 'kill' command
void() ClientKill = {};
//Called when a client connected to the server
void() ClientConnect = {};
//Called when a client disconnects from the server
void() ClientDisconnect = {};
//Called every frame, before physics.
void() PlayerPreThink = 
{
	//SetClientFrame ();
	WaterMove ();
	CheckImpulses();
};
//Called every frame, AFTER physics.
void() PlayerPostThink = 
{
	if (self.button2)
	{
		PlayerJump ();
	}
	else
		self.flags = self.flags | FL_JUMPRELEASED;
};
//Called to spawn the clients player entity
void() PutClientInServer =
{
	local entity spawn_spot;             // This holds where we want to spawn
	spawn_spot = find (world, classname, "info_player_start"); // Find it :)

	self.classname = "player";           // I'm a player!
	self.health = self.max_health = 100; // My health (and my max) is 100
	self.takedamage = DAMAGE_AIM;        // I can be fired at
	self.solid = SOLID_SLIDEBOX;         // Things sort of 'slide' past me
	self.movetype = MOVETYPE_WALK;       // Yep, I want to walk.
	self.flags = FL_CLIENT;              // Yes, I'm a client.
	self.hull = 2;
	self.origin = spawn_spot.origin + '0 0 1'; // Move to the spawnspot location
	self.angles = spawn_spot.angles;     // Face the angle the spawnspot indicates
	self.fixangle = TRUE;                // Turn this way immediately
	setmodel (self, "progs/player.mdl"); // Set my player to the player model
	setsize (self, VEC_HULLHL_MIN, VEC_HULLHL_MAX); // Set my size to Half-Life style
	self.view_ofs = '0 0 28';            // Center my view Half-Life style
	self.velocity = VEC_ORIGIN;             // Stop any old movement,VEC_ORIGIN = '0 0 0'
	self.th_die = PlayerDie;
};
void()info_player_start={};