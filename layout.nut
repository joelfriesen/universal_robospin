////////////////////////////////////////////////////////////////////////////////////////////////////////
// Updated 04/08/2017 by murfburffle                                                                      
// Attract-Mode "Robospin" layout. Thanks to verion for cleaning cab skins and to malfacine's for glogos                             
// notes: Lots of changes...  
// When game marquee is turned off, console marquees will be turned on.     
////////////////////////////////////////////////////////////////////////////////////////////////////////   

class UserConfig {
    </ label="Select BG art",                        help="Blur enables art for all consoles",  options="blur,blue,retro,black,flyer,room",                 order=1 />      enable_bg="room";   
    </ label="Select cab skin",                      help="Select a cab skin image",            options="robo,moon,90s,tv,gamegear,gba,lynx,neopocket",     order=2 />      enable_cab="robo";
    </ label="Select spinwheel art",                 help="The artwork to spin",                options="marquee, wheel",                                   order=3 />      orbit_art="wheel";
    </ label="Select listbox, wheel, vert_wheel",    help="Select wheel type or listbox",       options="listbox, wheel, vert_wheel",                       order=4 />      enable_list_type="wheel";  
    </ label="Enble background overlay",             help="Select overlay effect",              options="mask,scanlines,aperture,none",                     order=5 />      enable_overlay="mask";
    </ label="Transition Time",                      help="Time in milliseconds for wheel spin",                                                            order=6 />      transition_ms="35";  
    </ label="Enable MFR game logos",                help="Select game logos",                  options="yes,no",                                           order=7 />      enable_mlogos="yes"; 
    </ label="Enable game marquees",                 help="Show game marquees",                 options="yes,no",                                           order=8 />      enable_marquee="yes";
    </ label="Enable text frame",                    help="Show text frame",                    options="yes,no",                                           order=9 />      enable_frame="yes"; 
    </ label="Display box art",                      help="The box art hovers above the TV",    options="yes,no",                                           order=10 />     enable_boxart="yes";
   
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

// ---------------------------------------------------------------------------------------------------
// -----------------------------------------  Background Art  ----------------------------------------
// ---------------------------------------------------------------------------------------------------
if ( my_config["enable_bg"] == "blur") 
{
local b_art = fe.add_image("bg/[Emulator]", 0, 0, flw, flh );
b_art.alpha=255;
}

if ( my_config["enable_bg"] == "blue") 
{
local b_art = fe.add_image("blue.png", 0, 0, flw, flh );
b_art.alpha=255;
}

if ( my_config["enable_bg"] == "retro") 
{
local b_art = fe.add_image("retro.png", 0, 0, flw, flh );
b_art.alpha=255;
}

if ( my_config["enable_bg"] == "black") 
{
local b_art = fe.add_image("black.png", 0, 0, flw, flh );
b_art.alpha=255;
}

if ( my_config["enable_bg"] == "room") 
{
local b_art = fe.add_image("room.jpg", 0, 0, flw, flh );
b_art.alpha=255;
}
if ( my_config["enable_bg"] == "flyer") 
{
local surface_flyer = fe.add_surface( 640, 480 );
local b_art = FadeArt( "flyer", 0, 0, 640, 480, surface_flyer );
b_art.trigger = Transition.EndNavigation;
b_art.preserve_aspect_ratio = true;
b_art.alpha=75;
surface_flyer.set_pos(flx*0.4, 0, flw*0.6, flh);
surface_flyer.rotation = 5;
}

// ---------------------------------------------------------------------------------------------------
// -----------------------------------------  Background Mask  ---------------------------------------
// ---------------------------------------------------------------------------------------------------
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








// ---------------------------------------------------------------------------------------------------
// -----------------------------------------  robo Snap  ---------------------------------------------
// ---------------------------------------------------------------------------------------------------
if ( my_config["enable_cab"] == "robo" )
{

    local bg_snap = fe.add_image("black.png", 0, 0, 640, 480);
    bg_snap.set_pos(flx*0.092, fly*0.38, flw*0.226, flh*0.267 );
    bg_snap.skew_y               = -fly*0.002;
    bg_snap.skew_x               = flx*0.009;
    bg_snap.pinch_y              = 7;
    bg_snap.pinch_x              = 0;
    bg_snap.rotation             = -4.7;

    local surface_snap = fe.add_surface( 640, 480 );
    local snap = FadeArt("snap", 0, 0, 640, 480, surface_snap);
    snap.trigger = Transition.EndNavigation;
    snap.preserve_aspect_ratio = true;
    surface_snap.set_pos(flx*0.092, fly*0.38, flw*0.226, flh*0.267);
    surface_snap.skew_y         = -fly*0.002;
    surface_snap.skew_x         = flx*0.009;
    surface_snap.pinch_y        = 7;
    surface_snap.pinch_x        = 0;
    surface_snap.rotation       = -4.7;



    if ( my_config["enable_marquee"] == "yes" )
    {
    local marquee = fe.add_artwork("marquee", flx*0.117, fly*0.086, flw*0.35, flh*0.14 );
     marquee.trigger = Transition.EndNavigation;
     marquee.skew_x         = 11;
     marquee.pinch_x        = -2;
     marquee.pinch_y        = 3;
     marquee.rotation       = -1.5;
    }
    else 
    {
    local clogos = fe.add_image("clogos/[Emulator]", flx*0.117, fly*0.086, flw*0.35, flh*0.14 );
    clogos.trigger = Transition.EndNavigation;
    clogos.skew_x           = 11;
    clogos.pinch_x          = -2;
    clogos.pinch_y          = 3;
    clogos.rotation         = -1.5;
    }

    local cab = fe.add_image( "robo.png", 0, 0, flw, flh );
}

// ---------------------------------------------------------------------------------------------------
// -----------------------------------------  moon Snap  ---------------------------------------------
// ---------------------------------------------------------------------------------------------------
if ( my_config["enable_cab"] == "moon" )
{
    local bg_snap = fe.add_image("black.png", 0, 0, 640, 480);
    bg_snap.set_pos(flx*0.092, fly*0.378, flw*0.226, flh*0.267 );
    bg_snap.skew_y               = 0;
    bg_snap.skew_x               = flx*0.009;
    bg_snap.pinch_y              = 4;
    bg_snap.pinch_x              = 0;
    bg_snap.rotation             = -4.7;

    local surface_snap = fe.add_surface( 640, 480 );
    local snap = FadeArt("snap", 0, 0, 640, 480, surface_snap);
    snap.trigger = Transition.EndNavigation;
    snap.preserve_aspect_ratio = true;
    surface_snap.set_pos(flx*0.092, fly*0.378, flw*0.226, flh*0.267);
    surface_snap.skew_y         = 0;
    surface_snap.skew_x         = flx*0.009;
    surface_snap.pinch_y        = 4;
    surface_snap.pinch_x        = 0;
    surface_snap.rotation       = -4.7;

    if ( my_config["enable_marquee"] == "yes" )
    {
    local marquee = fe.add_artwork("marquee", flx*0.117, fly*0.086, flw*0.35, flh*0.14 );
     marquee.trigger = Transition.EndNavigation;
     marquee.skew_x = 11;
     marquee.pinch_x = -2;
     marquee.pinch_y = 3;
     marquee.rotation = -1.5;
    }
    else 
    {
    local clogos = fe.add_image("clogos/[Emulator]", flx*0.117, fly*0.086, flw*0.35, flh*0.14 );
    clogos.trigger = Transition.EndNavigation;
    clogos.skew_x = 11;
    clogos.pinch_x = -2;
    clogos.pinch_y = 3;
    clogos.rotation = -1.5;
    }

    local cab = fe.add_image( "moon.png", 0, 0, flw, flh );
} 

// ---------------------------------------------------------------------------------------------------
// -----------------------------------------  90s Snap  ----------------------------------------------
// ---------------------------------------------------------------------------------------------------
if ( my_config["enable_cab"] == "90s" )
{
    local bg_snap = fe.add_image("black.png", 0, 0, 640, 480);
    bg_snap.set_pos(flx*0.11, fly*0.24, flw*0.39, flh*0.35);
    bg_snap.skew_y              = 19;
    bg_snap.skew_x              = 10;
    bg_snap.pinch_y             = 15;
    bg_snap.pinch_x             = -10;
    bg_snap.rotation            = -5;

    local surface_snap = fe.add_surface( 640, 480 );
    local snap = FadeArt("snap", 0, 0, 640, 480, surface_snap);
    snap.trigger = Transition.EndNavigation;
    snap.preserve_aspect_ratio = true;
    surface_snap.set_pos(flx*0.11, fly*0.24, flw*0.39, flh*0.35);
    surface_snap.skew_y         = 19;
    surface_snap.skew_x         = 10;
    surface_snap.pinch_y        = 15;
    surface_snap.pinch_x        = -10;
    surface_snap.rotation       = -5;

    if ( my_config["enable_marquee"] == "yes" )
    {
    local marquee = fe.add_artwork("marquee", flx*0.1032, fly*0.0763, flw*0.3984, flh*0.1349 );
    marquee.trigger = Transition.EndNavigation;
    marquee.skew_x              = 7;
    marquee.skew_y              = -05;
    marquee.pinch_x             = -2;
    marquee.pinch_y             = 7;
    marquee.rotation            = 6.2;
    }
    else 
    {
    local clogos = fe.add_image("clogos/[Emulator]", flx*0.117, fly*0.086, flw*0.35, flh*0.14 );
    clogos.trigger = Transition.EndNavigation;
    clogos.skew_x               = 7;
    clogos.pinch_x              = -05;
    clogos.pinch_y              = 7;
    clogos.rotation             = 6.2;
    }

    local cab = fe.add_image( "90s.png", 0, 0, flw, flh );
} 


// ---------------------------------------------------------------------------------------------------
// -----------------------------------------  tv Snap  -----------------------------------------------
// ---------------------------------------------------------------------------------------------------
if ( my_config["enable_cab"] == "tv" )
{
    
    local bg_snap = fe.add_image("black.png", 0, 0, 640, 480);
    bg_snap.set_pos(75, 180, 200, 225 );
    bg_snap.skew_y              = -27;
    bg_snap.skew_x              = 10;
    bg_snap.pinch_y             = 17;
    bg_snap.pinch_x             = 10;
    bg_snap.rotation            = 0;

    local surface_snap = fe.add_surface( 640, 480 );
    local snap = FadeArt("snap", 0, 0, 640, 480, surface_snap);
    snap.trigger = Transition.EndNavigation;
    snap.preserve_aspect_ratio = false;
    surface_snap.set_pos(75, 180, 200, 225 );
    surface_snap.skew_y         = -27;
    surface_snap.skew_x         = 10;
    surface_snap.pinch_y        = 17;
    surface_snap.pinch_x        = 10;
    surface_snap.rotation       = 0;

    if ( my_config["enable_marquee"] == "yes" )
    {
    local marquee = fe.add_artwork("marquee", flx*0.05, fly*0.02,flw*0.5, flh*0.3 );
     marquee.trigger = Transition.EndNavigation;
     marquee.preserve_aspect_ratio = true;
    }
    else 
    {
    local surface_slogos = fe.add_surface( 350, 150 );
    local slogos = fe.add_image("slogos/[Emulator]", flx*0.05, fly*0.02,flw*0.5, flh*0.3 );
    slogos.trigger = Transition.EndNavigation;
    slogos.preserve_aspect_ratio = true;
    slogos.alpha=128;
    }

    local cab = fe.add_image( "tv.png", 0, -50, 640 , 580  );
    cab.alpha = 255;

    if ( my_config["enable_boxart"] == "yes" )
    {
    local surface_boxart = fe.add_surface( 480, 480 );
    local boxart = FadeArt("flyer", 0,0, 480, 480, surface_boxart);
    boxart.trigger = Transition.EndNavigation;
    boxart.preserve_aspect_ratio = true;
    surface_boxart.set_pos(flx*0.35, fly*0.05, 250,250 );
    surface_boxart.rotation = 12;
    }
}

// ---------------------------------------------------------------------------------------------------
// -----------------------------------------  gamegear Snap  -----------------------------------------
// ---------------------------------------------------------------------------------------------------
if ( my_config["enable_cab"] == "gamegear" )
{
    local bg_snap = fe.add_image("black.png", 0, 0, 640, 480);
    bg_snap.set_pos(flx*0.28, fly*0.40, flw*0.23, flh*0.24);
    bg_snap.rotation            = 10;

    local surface_snap = fe.add_surface( 640, 480 );
    local snap = FadeArt("snap", 0, 0, 640, 480, surface_snap);
    snap.trigger = Transition.EndNavigation;
    snap.preserve_aspect_ratio = false;
    surface_snap.set_pos(flx*0.28, fly*0.40, flw*0.23, flh*0.24);
    surface_snap.rotation       = 10;

    if ( my_config["enable_marquee"] == "yes" )
    {
    local marquee = fe.add_artwork("marquee", flx*0.05, fly*0.02,flw*0.5, flh*0.3 );
     marquee.trigger = Transition.EndNavigation;
     marquee.preserve_aspect_ratio = true;
    }
    else 
    {
    local surface_slogos = fe.add_surface( 350, 150 );
    local slogos = fe.add_image("slogos/[Emulator]", flx*0.05, fly*0.02,flw*0.5, flh*0.3 );
    slogos.trigger = Transition.EndNavigation;
    slogos.preserve_aspect_ratio = true;
    slogos.alpha=128;
    }

    local cab = fe.add_image( "gamegear.png", 0, 0, flw, flh );

    if ( my_config["enable_boxart"] == "yes" )
    {
    local surface_boxart = fe.add_surface( 400, 560 );
    local boxart = FadeArt("flyer", 0,0, 400, 560, surface_boxart);
    boxart.trigger = Transition.EndNavigation;
    boxart.preserve_aspect_ratio = true;
    surface_boxart.set_pos(flx*0.45, fly*0.03, flw*0.25, flh*0.35 );
    surface_boxart.rotation = 12;
    surface_boxart.pinch_y = -6;
    surface_boxart.pinch_x = 5;
    }
}

// ---------------------------------------------------------------------------------------------------
// -----------------------------------------  gba Snap  ----------------------------------------------
// ---------------------------------------------------------------------------------------------------
if ( my_config["enable_cab"] == "gba" )
{
    local bg_snap = fe.add_image("black.png", 0, 0, 640, 480);
    bg_snap.set_pos             (flx*0.25, fly*0.43, flw*0.27, flh*0.25);
    bg_snap.skew_y              = -fly*0.048;
    bg_snap.skew_x              = -flx*0.01;
    bg_snap.pinch_y             = -1;
    bg_snap.pinch_x             = -2;
    bg_snap.rotation            = 18;

    local surface_snap = fe.add_surface( 640, 480 );
    local snap = FadeArt("snap", 0, 0, 640, 480, surface_snap);
    snap.trigger = Transition.EndNavigation;
    snap.preserve_aspect_ratio = true;
    surface_snap.set_pos        (flx*0.25, fly*0.43, flw*0.27, flh*0.25 );
    surface_snap.skew_y         = -fly*0.048;
    surface_snap.skew_x         = -flx*0.01;
    surface_snap.pinch_y        = -1;
    surface_snap.pinch_x        = -2;
    surface_snap.rotation       = 18;

    if ( my_config["enable_marquee"] == "yes" )
    {
    local marquee = fe.add_artwork("marquee", flx*0.05, fly*0.02,flw*0.5, flh*0.3 );
     marquee.trigger = Transition.EndNavigation;
     marquee.preserve_aspect_ratio = true;
    }
    else 
    {
    local surface_slogos = fe.add_surface( 350, 150 );
    local slogos = fe.add_image("slogos/[Emulator]", flx*0.05, fly*0.02,flw*0.5, flh*0.3 );
    slogos.trigger = Transition.EndNavigation;
    slogos.preserve_aspect_ratio = true;
    slogos.alpha=128;
    }

    local cab = fe.add_image( "gba.png", 0, 0, flw, flh );

    if ( my_config["enable_boxart"] == "yes" )
    {
    local surface_boxart = fe.add_surface( 400, 600 );
    local boxart = FadeArt("flyer", 0,0, 400, 600, surface_boxart);
    boxart.trigger = Transition.EndNavigation;
    boxart.preserve_aspect_ratio = true;
    surface_boxart.set_pos(flx*0.44, fly*-0.10, flw*0.32, flh*0.65 );
    surface_boxart.rotation = 12;
    }
}

// ---------------------------------------------------------------------------------------------------
// -----------------------------------------  lynx Snap  ---------------------------------------------
// ---------------------------------------------------------------------------------------------------
if ( my_config["enable_cab"] == "lynx" )
{
    local bg_snap = fe.add_image("black.png", 0, 0, 640, 480);
    bg_snap.set_pos             (flx*0.22, fly*0.43, flw*0.335, flh*0.26);
    bg_snap.skew_x              = -flx*0.03;
    bg_snap.rotation            = 17;

    local surface_snap = fe.add_surface( 640, 480 );
    local snap = FadeArt("snap", 0, 0, 640, 480, surface_snap);
    snap.trigger = Transition.EndNavigation;
    snap.preserve_aspect_ratio = true;
    surface_snap.set_pos(flx*0.22, fly*0.43, flw*0.335, flh*0.26);
    surface_snap.skew_x         = -flx*0.03;
    surface_snap.rotation       = 17;

    if ( my_config["enable_marquee"] == "yes" )
    {
    local marquee = fe.add_artwork("marquee", flx*0.05, fly*0.02,flw*0.5, flh*0.3 );
     marquee.trigger = Transition.EndNavigation;
     marquee.preserve_aspect_ratio = true;
    }
    else 
    {
    local surface_slogos = fe.add_surface( 350, 150 );
    local slogos = fe.add_image("slogos/[Emulator]", flx*0.05, fly*0.02,flw*0.5, flh*0.3 );
    slogos.trigger = Transition.EndNavigation;
    slogos.preserve_aspect_ratio = true;
    slogos.alpha=128;
    }

    local cab = fe.add_image( "lynx.png", 0, 0, flw, flh );

    if ( my_config["enable_boxart"] == "yes" )
    {
    local surface_boxart = fe.add_surface( 400, 560 );
    local boxart = FadeArt("flyer", 0,0, 400, 560, surface_boxart);
    boxart.trigger = Transition.EndNavigation;
    boxart.preserve_aspect_ratio = true;
    surface_boxart.set_pos(flx*0.35, -fly*0.14, flw*0.45, flh*0.70 );
    surface_boxart.rotation = 12;
    }
}

// ---------------------------------------------------------------------------------------------------
// -----------------------------------------  neopocket Snap  ----------------------------------------
// ---------------------------------------------------------------------------------------------------
if ( my_config["enable_cab"] == "neopocket" )
{
    local bg_snap = fe.add_image("black.png", 0, 0, 640, 480);
    bg_snap.set_pos             (flx*0.265, fly*0.45, flw*0.21, flh*0.25  );
    bg_snap.skew_y              = -fly*0.042;
    bg_snap.rotation            = 14;

    local surface_snap = fe.add_surface( 640, 480 );
    local snap = FadeArt("snap", 0, 0, 640, 480, surface_snap);
    snap.trigger = Transition.EndNavigation;
    snap.preserve_aspect_ratio = true;
    surface_snap.set_pos(flx*0.265, fly*0.45, flw*0.21, flh*0.25  );
    surface_snap.skew_y         = -fly*0.042;
    surface_snap.rotation       = 14;

    if ( my_config["enable_marquee"] == "yes" )
    {
    local marquee = fe.add_artwork("marquee", flx*0.05, fly*0.02,flw*0.5, flh*0.3 );
     marquee.trigger = Transition.EndNavigation;
     marquee.preserve_aspect_ratio = true;
    }
    else 
    {
    local surface_slogos = fe.add_surface( 350, 150 );
    local slogos = fe.add_image("slogos/[Emulator]", flx*0.05, fly*0.02,flw*0.5, flh*0.3 );
    slogos.trigger = Transition.EndNavigation;
    slogos.preserve_aspect_ratio = true;
    slogos.alpha=128;
    }

    local cab = fe.add_image( "neopocket.png", 0, 0, flw, flh );

    if ( my_config["enable_boxart"] == "yes" )
    {
    local surface_boxart = fe.add_surface( 500, 540 );
    local boxart = FadeArt("flyer", 0,0, 500, 540, surface_boxart);
    boxart.trigger = Transition.EndNavigation;
    boxart.preserve_aspect_ratio = true;
    surface_boxart.set_pos(flx*0.30, fly*0.03, flw*0.45, flh*0.47 );
    }
}

// ---------------------------------------------------------------------------------------------------
// -----------------------------------------  Filter text  -------------------------------------------
// ---------------------------------------------------------------------------------------------------


//For the top of the page
local filter = fe.add_text( "[DisplayName] - [ListFilterName]: [ListEntry]/[ListSize]", flx*0.02, fly*0.02, flw*0.45, flh*0.04 );
filter.set_rgb( 255, 255, 255 );
filter.style = Style.Bold;
filter.align = Align.Left;
filter.font="digital-7 (italic)"; 
filter.rotation = 0;
 
// ---------------------------------------------------------------------------------------------------
// -----------------------------------------  Wheel  -------------------------------------------------
// ---------------------------------------------------------------------------------------------------


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




// ---------------------------------------------------------------------------------------------------
// -----------------------------------------  Footer  ------------------------------------------------
// ---------------------------------------------------------------------------------------------------

if ( my_config["enable_frame"] == "yes" )
{
local frame = fe.add_image( "frame.png", 0, fly*0.94, flw, flh*0.06 );
frame.alpha = 255;
}

//Game MFR Logos
if ( my_config["enable_mlogos"] == "yes")  
{
local mlogos = fe.add_image("mlogos/[Manufacturer]", flx*0.02, fly*0.945, flw*0.1, flh*0.05 );
mlogos.trigger = Transition.EndNavigation;
mlogos.preserve_aspect_ratio = true;
}

//category icons 
local glogo1 = fe.add_image("glogos/unknown1.png", flx*0.15, fly*0.945, flw*0.05, flh*0.05);
glogo1.trigger = Transition.EndNavigation;
glogo1.preserve_aspect_ratio = true;

//Year text info
local texty = fe.add_text("[Year]", flx*0.205, fly*0.94, flw*0.15, flh*0.06 );
texty.set_rgb( 211, 211, 211 );
texty.style = Style.Bold; 
texty.align = Align.Left;



//Title text info
local textt = fe.add_text( "- [Title]", flx*0.30, fly*0.94, flw*0.68, flh*0.06  );
textt.set_rgb( 211, 211, 211 );
textt.style = Style.Bold; 
textt.align = Align.Left;
textt.rotation = 0;
textt.word_wrap = false;

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


//function transition_callback(ttype, var, ttime)
//  {
//    switch ( ttype )
//    {
//        case Transition.ToNewList:
//            switch ( fe.list.name )
//
//            {              
//        case "Nintendo Entertainment System":
//                
//            local textnestest = fe.add_text( "nes test", flx*0.30, fly*0.88, flw*0.68, flh*0.06  );
//            textnestest.set_rgb( 211, 211, 211 );
//            break;  
//
//        case "Super Nintendo":
//                
//            local textnestest = fe.add_text( "snes test", flx*0.30, fly*0.88, flw*0.68, flh*0.06  );
//            textnestest.set_rgb( 211, 211, 211 );
//            break;  
//            
//            }
//        break;
//    }
//}
//fe.add_transition_callback("transition_callback" );



