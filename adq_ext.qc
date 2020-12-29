float(float l, float h)randomlong = #33; // randomlong
float(float l, float h)randomfloat = #50; // randomfloat
string( entity e, vector start, vector end ) tracetexture = #42; //texture trace
void (vector a, vector b, vector c, vector d, float e, entity f)tracearea = #39; //tracearea
float(entity s) etoi	                = #71;
float(vector v) vlen2d				    = #79;	
string( entity e, vector start, vector end ) tracematerial = #80; //material trace
float(string s) stof = #81;	// 2001-09-20 QuakeC string manipulation by FrikaC
string(float num) argv = #91;
//QuakeC file access by FrikaC  start
float FILE_READ = 0;
float FILE_APPEND = 1;
float FILE_WRITE = 2;
float(string filename, float mode) fopen = #110;
void(float fhandle) fclose = #111;
string(float fhandle) fgets = #112;
void(float fhandle, string s) fputs = #113;
float(string s) strlen = #114;
string(string s1, string s2) strcat = #115;
string(string s, float start, float length) substring = #116;
vector(string s) stov = #117; //string to vector
string(string s) strzone = #118; //zone string in temp buffer
string(string s) strunzone = #119; //unzone string
//QuakeC string manipulation by FrikaC  end
float tokenize (string s) = #5;
float(string s) getsoundlen = #82;	//get sound length in seconds
float AdvanceFrame(float start, float end)= #83;	
string(entity ent) etos = #65; //entity to string