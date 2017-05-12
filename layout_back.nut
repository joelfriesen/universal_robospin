////////////////////////////////////////////////////////////////////////////////////////////////////////
// Updated 9/08/2016 by omegaman                                                                      
// Attract-Mode "Robospin" layout. Thanks to verion for cleaning cab skins and to malfacine's for glogos                             
// Notes: Lots of changes...  
// When game marquee is turned off, console marquees will be turned on.     
////////////////////////////////////////////////////////////////////////////////////////////////////////   

class UserConfig {
   </ label="Select BG art", help="Blur enables art for all consoles; otherwise choose blue, retro, black or flyer for bg", options="blur,blue,retro,black,flyer,room", order=1 /> enable_bg="blur";   
   </ label="Select cab skin", help="Select a cab skin image", options="robo,moon,tv", order=2 /> enable_cab="robo";
   </ label="Select spinwheel art", help="The artwork to spin", options="marquee, wheel", order=3 /> orbit_art="wheel";
   </ label="Transition Time", help="Time in milliseconds for wheel spin.", order=4 /> transition_ms="35";  
   </ label="Select listbox, wheel, vert_wheel", help="Select wheel type or listbox", options="listbox, wheel, vert_wheel", order=5 /> enable_list_type="wheel";
   </ label="Enable snap bloom shader effect", help="Bloom effect uses shader", options="Yes,No", order=6 /> enable_bloom="No";
   </ label="Display box art", help="The box art hovers above the TV", options="Yes,No", order=7 /> enable_boxart="No";
   </ label="Enable crt shader effect", help="CRT effect uses shader", options="Yes,No", order=8 /> enable_crt="No";
   </ label="Enable random text colors", help=" Select random text colors.", options="yes,no", order=9 /> enable_colors="yes";
   </ label="Enable system logos", help="Select system logos", options="Yes,No", order=10 /> enable_slogos="Yes"; 
   </ label="Enable MFR game logos", help="Select game logos", options="Yes,No", order=11 /> enable_mlogos="Yes"; 
   </ label="Enable game marquees", help="Show game marquees", options="Yes,No", order=12 /> enable_marquee="Yes";
   </ label="Enable lighted marquee effect", help="show lighted Marquee", options="Yes,No", order=13 /> enable_Lmarquee="No";
   </ label="Select pointer", help="Select animated pointer", options="rocket,hand,none", order=14 /> enable_pointer="rocket"; 
   </ label="Enable text frame", help="Show text frame", options="yes,no", order=15 /> enable_frame="yes"; 
   </ label="Enble background overlay", help="Select overlay effect; options are masking, scanlines, aperture", options="mask,scanlines,aperture,none", order=16 /> enable_overlay="mask";
   </ label="Monitor static effect", help="Show static effect when snap is null", options="yes,no", order=17 /> enable_static="yes"; 
}  

local my_config = fe.get_config();
local flx = fe.layout.width=640;
local fly = fe.layout.height=480;
local flw = fe.layout.width;
local flh = fe.layout.height;
//fe.layout.font="Roboto";

// modules
fe.load_module("fade");
fe.load_module( "animate" );

// Background Art 
if ( my_config["enable_bg"] == "blur") 
{
local b_art = fe.add_image("bg/[Emulator]", 0, 0, flw, flh );
b_art.alpha=255;
}

if ( my_config["enable_bg"] == "blue") 
{
local b_art = fe.add_image("bg1.png", 0, 0, flw, flh );
b_art.alpha=255;
}

if ( my_config["enable_bg"] == "retro") 
{
local b_art = fe.add_image("bg2.png", 0, 0, flw, flh );
b_art.alpha=255;
}

if ( my_config["enable_bg"] == "room") 
{
local b_art = fe.add_image("room.jpg", 0, 0, flw, flh );
b_art.alpha=255;
}

if ( my_config["enable_bg"] == "black") 
{
local b_art = fe.add_image("bg4.png", 0, 0, flw, flh );
b_art.alpha=255;
}

if ( my_config["enable_bg"] == "flyer") 
{
local surface_flyer = fe.add_surface( 640, 480 );
local b_art = FadeArt( "flyer", 0, 0, 640, 480, surface_flyer );
b_art.trigger = Transition.EndNavigation;
b_art.preserve_aspect_ratio = false;
b_art.alpha=127;

//now position and rotate surface for flyer
surface_flyer.set_pos(flx*0.4, 0, flw*0.6, flh);
surface_flyer.rotation = 0;
}

//masking effect overlay for bg art

if ( my_config["enable_overlay"] == "mask" )
{
local overlay = fe.add_image( "mask.png", 0, 0, flw, flh );
overlay.preserve_aspect_ratio = false;
overlay.alpha = 200;
}

if ( my_config["enable_overlay"] == "scanlines" )
{
local overlay = fe.add_image( "scanlines.png", 0, 0, flw, flh );
overlay.preserve_aspect_ratio = false;
overlay.alpha = 200;
}

if ( my_config["enable_overlay"] == "aperture" )
{
local overlay = fe.add_image( "aperture.png", 0, 0, flw, flh );
overlay.preserve_aspect_ratio = false;
overlay.alpha = 200;
}

if ( my_config["enable_overlay"] == "none" )
{
local overlay = fe.add_image( "none.png", 0, 0, 0, 0 );
overlay.preserve_aspect_ratio = false;
overlay.alpha = 0;
}




if ( my_config["enable_static"] == "yes" )
{
	const SNAPBG_ALPHA = 200;
	local snapbg=null;
	snapbg = fe.add_image( "static.mp4", flx*0.125, fly*0.40, flw*0.300, flh*0.39 );
    snapbg.trigger = Transition.EndNavigation;
	snapbg.skew_y = -fly*0.055;
    snapbg.skew_x = flx*0.020;
    snapbg.pinch_y = 10;
    snapbg.pinch_x = 12;
    snapbg.rotation = 0;
	snapbg.set_rgb( 155, 155, 155 );
	snapbg.alpha = SNAPBG_ALPHA;
}



//create surface for snap
local surface_snap = fe.add_surface( 640, 480 );
local snap = FadeArt("snap", 0, 0, 640, 480, surface_snap);
snap.trigger = Transition.EndNavigation;
snap.preserve_aspect_ratio = false;

//now position and pinch surface of snap
surface_snap.set_pos(flx*0.125, fly*0.40, flw*0.300, flh*0.39 );
surface_snap.skew_y = -fly*0.055;
surface_snap.skew_x = flx*0.020;
surface_snap.pinch_y = 10;
surface_snap.pinch_x = 12;
surface_snap.rotation = 0;

// add shader support because I can
if ( my_config["enable_bloom"] == "Yes" )
{
    local sh = fe.add_shader( Shader.Fragment, "bloom_shader.frag" );
	sh.set_texture_param("bgl_RenderedTexture"); 
	surface_snap.shader = sh;
}

if ( my_config["enable_crt"] == "Yes" )
{
    local sh = fe.add_shader( Shader.VertexAndFragment, "crt.vert", "crt.frag" );
	sh.set_param( "rubyInputSize", 640, 480 );
    sh.set_param( "rubyOutputSize", ScreenWidth, ScreenHeight );
    sh.set_param( "rubyTextureSize", 640, 480 );
	sh.set_texture_param("rubyTexture"); 
	surface_snap.shader = sh;
}

if ( my_config["enable_marquee"] == "Yes" )
{
local marquee = fe.add_artwork("marquee", flx*0.05, fly*0.02,flw*0.5, flh*0.3 );
 marquee.trigger = Transition.EndNavigation;
 marquee.alpha=128;
   
   if ( my_config["enable_Lmarquee"] == "Yes" )
    {
    local shader = fe.add_shader( Shader.Fragment "bloom_shader.frag" );
	shader.set_texture_param("bgl_RenderedTexture"); 
	marquee.shader = shader;
    }

}


//cabinet image
if ( my_config["enable_cab"] == "robo" )
{
 local cab = fe.add_image( "robo.png", 0, 0, flw, flh );
}

if ( my_config["enable_cab"] == "tv" )
{
 local cab = fe.add_image( "tv.png", 0, 0, flw, flh );
}

if ( my_config["enable_cab"] == "moon" )
{
  local cab = fe.add_image( "moon.png", 0, 0, flw, flh );
} 


//System Logos
if ( my_config["enable_slogos"] == "Yes")  
{
local surface_slogos = fe.add_surface( 350, 150 );
local slogos = fe.add_image("slogos/[Emulator]", flx*0.05, fly*0.02,flw*0.5, flh*0.3 );
slogos.trigger = Transition.EndNavigation;
slogos.preserve_aspect_ratio = true;
slogos.alpha=128;
} 

if ( my_config["enable_boxart"] == "Yes" )
{
//create surface for box
local surface_boxart = fe.add_surface( 850, 850 );
local boxart = FadeArt("flyer", 0,0, 850, 850, surface_boxart);
boxart.trigger = Transition.EndNavigation;
boxart.preserve_aspect_ratio = true;

//now position and pinch surface of boxart
surface_boxart.set_pos(flx*0.35, fly*0.05, flw*0.40, flh*0.40 );
surface_boxart.rotation = 12;
}

//add frame to make text standout 
if ( my_config["enable_frame"] == "yes" )
{
local frame = fe.add_image( "frame.png", 0, fly*0.94, flw, flh*0.06 );
frame.alpha = 255;
}

//Year text info
local texty = fe.add_text("[Year]", flx*0.18, fly*0.94, flw*0.13, flh*0.06 );
texty.set_rgb( 211, 211, 211 );
texty.style = Style.Bold; 
//texty.align = Align.Left;

//Title text info
local textt = fe.add_text( "[Title]", flx*0.315, fly*0.94, flw*0.6, flh*0.06  );
textt.set_rgb( 211, 211, 211 );
textt.style = Style.Bold; 
textt.align = Align.Left;
textt.rotation = 0;
textt.word_wrap = true;

//Display filter info
local filter = fe.add_text( "[DisplayName] - [ListFilterName]: [ListEntry]/[ListSize]", flx*0.02, fly*0.02, flw*0.45, flh*0.04 );
filter.set_rgb( 255, 255, 255 );
filter.style = Style.Bold;
filter.align = Align.Left;
filter.font="digital-7 (italic)"; 
filter.rotation = 0;
 

//Listbox
if ( my_config["enable_list_type"] == "listbox" )
{
local listbox = fe.add_listbox( flx*0.53, fly*0.09, flw*0.45, flh*0.86 );
listbox.rows = 11;
listbox.charsize = 24;
listbox.set_rgb( 211, 211, 211 );
listbox.bg_alpha = 0;
//listbox.align = Align.Right;
listbox.selbg_alpha = 90;
listbox.sel_red = 255;
listbox.sel_green = 255;
listbox.sel_blue = 0;
}

//This enables vertical art instead of default wheel
if ( my_config["enable_list_type"] == "vert_wheel" )
{
fe.load_module( "conveyor" );
local wheel_x = [ flx*0.71, flx*0.71, flx*0.71, flx*0.71, flx*0.71, flx*0.71, flx*0.68, flx*0.71, flx*0.71, flx*0.71, flx*0.71, flx*0.71, ]; 
local wheel_y = [ -fly*0.22, -fly*0.105, fly*0.0, fly*0.105, fly*0.215, fly*0.325, fly*0.436, fly*0.61, fly*0.72 fly*0.83, fly*0.935, fly*0.99, ];
local wheel_w = [ flw*0.18, flw*0.18, flw*0.18, flw*0.18, flw*0.18, flw*0.18, flw*0.24, flw*0.18, flw*0.18, flw*0.18, flw*0.18, flw*0.18, ];
local wheel_a = [  80,  80,  80,  80,  80,  80, 255,  80,  80,  80,  80,  80, ];
local wheel_h = [  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11, flh*0.168,  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11, ];
local wheel_r = [  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ];
local num_arts = 8;

class WheelEntry extends ConveyorSlot
{
	constructor()
	{
		base.constructor( ::fe.add_artwork( my_config["orbit_art"] ) );
	}

	function on_progress( progress, var )
	{
		local p = progress / 0.1;
		local slot = p.tointeger();
		p -= slot;
		
		slot++;

		if ( slot < 0 ) slot=0;
		if ( slot >=10 ) slot=10;

		m_obj.x = wheel_x[slot] + p * ( wheel_x[slot+1] - wheel_x[slot] );
		m_obj.y = wheel_y[slot] + p * ( wheel_y[slot+1] - wheel_y[slot] );
		m_obj.width = wheel_w[slot] + p * ( wheel_w[slot+1] - wheel_w[slot] );
		m_obj.height = wheel_h[slot] + p * ( wheel_h[slot+1] - wheel_h[slot] );
		m_obj.rotation = wheel_r[slot] + p * ( wheel_r[slot+1] - wheel_r[slot] );
		m_obj.alpha = wheel_a[slot] + p * ( wheel_a[slot+1] - wheel_a[slot] );
	}
};

local wheel_entries = [];
for ( local i=0; i<num_arts/2; i++ )
	wheel_entries.push( WheelEntry() );

local remaining = num_arts - wheel_entries.len();

// we do it this way so that the last wheelentry created is the middle one showing the current
// selection (putting it at the top of the draw order)
for ( local i=0; i<remaining; i++ )
	wheel_entries.insert( num_arts/2, WheelEntry() );

local conveyor = Conveyor();
conveyor.set_slots( wheel_entries );
conveyor.transition_ms = 50;
try { conveyor.transition_ms = my_config["transition_ms"].tointeger(); } catch ( e ) { }
}
 
if ( my_config["enable_list_type"] == "wheel" )
{
fe.load_module( "conveyor" );
local wheel_x = [ flx*0.80, flx*0.795, flx*0.756, flx*0.725, flx*0.70, flx*0.68, flx*0.64, flx*0.68, flx*0.70, flx*0.725, flx*0.756, flx*0.76, ]; 
local wheel_y = [ -fly*0.22, -fly*0.105, fly*0.0, fly*0.105, fly*0.215, fly*0.325, fly*0.436, fly*0.61, fly*0.72 fly*0.83, fly*0.935, fly*0.99, ];
local wheel_w = [ flw*0.18, flw*0.18, flw*0.18, flw*0.18, flw*0.18, flw*0.18, flw*0.24, flw*0.18, flw*0.18, flw*0.18, flw*0.18, flw*0.18, ];
local wheel_a = [  80,  80,  80,  80,  80,  80, 255,  80,  80,  80,  80,  80, ];
local wheel_h = [  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11, flh*0.17,  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11,  flh*0.11, ];
local wheel_r = [  30,  25,  20,  15,  10,   5,   0, -10, -15, -20, -25, -30, ];
local num_arts = 8;

class WheelEntry extends ConveyorSlot
{
	constructor()
	{
		base.constructor( ::fe.add_artwork( my_config["orbit_art"] ) );
	}

	function on_progress( progress, var )
	{
		local p = progress / 0.1;
		local slot = p.tointeger();
		p -= slot;
		
		slot++;

		if ( slot < 0 ) slot=0;
		if ( slot >=10 ) slot=10;

		m_obj.x = wheel_x[slot] + p * ( wheel_x[slot+1] - wheel_x[slot] );
		m_obj.y = wheel_y[slot] + p * ( wheel_y[slot+1] - wheel_y[slot] );
		m_obj.width = wheel_w[slot] + p * ( wheel_w[slot+1] - wheel_w[slot] );
		m_obj.height = wheel_h[slot] + p * ( wheel_h[slot+1] - wheel_h[slot] );
		m_obj.rotation = wheel_r[slot] + p * ( wheel_r[slot+1] - wheel_r[slot] );
		m_obj.alpha = wheel_a[slot] + p * ( wheel_a[slot+1] - wheel_a[slot] );
        m_obj.preserve_aspect_ratio = true;
	}
};

local wheel_entries = [];
for ( local i=0; i<num_arts/2; i++ )
	wheel_entries.push( WheelEntry() );

local remaining = num_arts - wheel_entries.len();

// we do it this way so that the last wheelentry created is the middle one showing the current
// selection (putting it at the top of the draw order)
for ( local i=0; i<remaining; i++ )
wheel_entries.insert( num_arts/2, WheelEntry() );

local conveyor = Conveyor();
conveyor.set_slots( wheel_entries );
conveyor.transition_ms = 50;
try { conveyor.transition_ms = my_config["transition_ms"].tointeger(); } catch ( e ) { }
}

//property animation - wheel pointers
if ( my_config["enable_pointer"] == "rocket") 
{
local point = fe.add_image("pointers/pointer.png", flx*0.88, fly*0.34, flw*0.2, flh*0.35);

local alpha_cfg = {
    when = Transition.ToNewSelection,
    property = "alpha",
    start = 110,
    end = 255,
    time = 300
}
animation.add( PropertyAnimation( point, alpha_cfg ) );

local movey_cfg = {
    when = Transition.ToNewSelection,
    property = "y",
    start = point.y,
    end = point.y,
    time = 200
}
animation.add( PropertyAnimation( point, movey_cfg ) );

local movex_cfg = {
    when = Transition.ToNewSelection,
    property = "x",
    start = flx*0.83,
    end = point.x,
    time = 200	
}	
animation.add( PropertyAnimation( point, movex_cfg ) );
}

if ( my_config["enable_pointer"] == "hand") 

 {
 local point = fe.add_image("pointers/pointer2.png", flx*0.88, fly*0.34, flw*0.2, flh*0.35);
 local alpha_cfg = {
    when = Transition.ToNewSelection,
    property = "alpha",
    start = 110,
    end = 255,
    time = 300
}
animation.add( PropertyAnimation( point, alpha_cfg ) );

local movey_cfg = {
    when = Transition.ToNewSelection,
    property = "y",
    start = point.y,
    end = point.y,
    time = 200
}
animation.add( PropertyAnimation( point, movey_cfg ) );

local movex_cfg = {
    when = Transition.ToNewSelection,
    property = "x",
    start = flx*0.83,
    end = point.x,
    time = 200	
}	
animation.add( PropertyAnimation( point, movex_cfg ) );
}

if ( my_config["enable_pointer"] == "none") 
{
 local point = fe.add_image( "", 0, 0, 0, 0 );
}

//category icons 

local glogo1 = fe.add_image("glogos/unknown1.png", flx*0.12, fly*0.945, flw*0.045, flh*0.05);
glogo1.trigger = Transition.EndNavigation;

class GenreImage1
{
    mode = 1;       //0 = first match, 1 = last match, 2 = random
    supported = {
        //filename : [ match1, match2 ]
        "action": [ "action" ],
        "adventure": [ "adventure" ],
        "fighting": [ "fighting", "fighter", "beat'em up" ],
        "platformer": [ "platformer", "platform" ],
        "puzzle": [ "puzzle" ],
        "maze": [ "maze" ],
		"paddle": [ "paddle" ],
		"rhythm": [ "rhythm" ],
		"pinball": [ "pinball" ],
		"racing": [ "racing", "driving" ],
        "rpg": [ "rpg", "role playing", "role-playing" ],
        "shooter": [ "shooter", "shmup" ],
        "sports": [ "sports", "boxing", "golf", "baseball", "football", "soccer" ],
        "strategy": [ "strategy"]
    }

    ref = null;
    constructor( image )
    {
        ref = image;
        fe.add_transition_callback( this, "transition" );
    }
    
    function transition( ttype, var, ttime )
    {
        if ( ttype == Transition.ToNewSelection || ttype == Transition.ToNewList )
        {
            local cat = " " + fe.game_info(Info.Category, var).tolower();
            local matches = [];
            foreach( key, val in supported )
            {
                foreach( nickname in val )
                {
                    if ( cat.find(nickname, 0) ) matches.push(key);
                }
            }
            if ( matches.len() > 0 )
            {
                switch( mode )
                {
                    case 0:
                        ref.file_name = "glogos/" + matches[0] + "1.png";
                        break;
                    case 1:
                        ref.file_name = "glogos/" + matches[matches.len() - 1] + "1.png";
                        break;
                    case 2:
                        local random_num = floor(((rand() % 1000 ) / 1000.0) * ((matches.len() - 1) - (0 - 1)) + 0);
                        ref.file_name = "glogos/" + matches[random_num] + "1.png";
                        break;
                }
            } else
            {
                ref.file_name = "glogos/unknown1.png";
            }
        }
    }
}
GenreImage1(glogo1);

//Game MFR Logos
if ( my_config["enable_mlogos"] == "Yes")  
{
local mlogos = fe.add_image("mlogos/[Manufacturer]", flx*0.01, fly*0.945, flw*0.06, flh*0.05 );
mlogos.trigger = Transition.EndNavigation;
}		

// random number for the RGB levels
if ( my_config["enable_colors"] == "yes" )
{
function brightrand() {
 return 255-(rand()/255);
}

local red = brightrand();
local green = brightrand();
local blue = brightrand();

// Color Transitions
fe.add_transition_callback( "color_transitions" );
function color_transitions( ttype, var, ttime ) {
 switch ( ttype )
 {
  case Transition.StartLayout:
  case Transition.ToNewSelection:
  red = brightrand();
  green = brightrand();
  blue = brightrand();
  //listbox.set_rgb(red,green,blue);
  texty.set_rgb (red,green,blue);
  textt.set_rgb (red,green,blue);
  break;
 }
 return false;
 }
}
