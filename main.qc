void() precaches;
void() LightStyles_setup;

void() main = {};
void() worldspawn = 
{
	precaches();
	LightStyles_setup();
};

void() StartFrame = {};
 
void() precaches =
{
	//models
	precache_model ("progs/player.mdl");
	//sounds
	precache_sound("player/jump.wav");
};