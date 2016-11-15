// Braille Bead Making Tool (Numbers Only)
// 2016 by Evan Thomas
/* 
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE":
 * <pieis2pi@u.washington.edu> wrote this file.  As long as you retain this
 * notice you can do whatever you want with this stuff. If we meet some day,
 * and you think this stuff is worth it, you can buy me a beer in return.
 * -Evan Thomas
 * ----------------------------------------------------------------------------
 */
use <./LiberationSans.ttf>

cube_size=10;
hole_size=5;
fillet=0.5;
font_size=cube_size*4/5;
font_roundness=0.3;
font_height=0.6;
$fn = 20;

include <./BrailleGlyphs.scad>

module basic_shape(){
    minkowski(){
		difference(){
			cube(size=cube_size-2*fillet,center=true);
			cylinder(d=hole_size+2*fillet,h=cube_size,center=true);}
		sphere(r=fillet);}}
module standard_text(symbol){
    minkowski(){
        linear_extrude(height=font_height-font_roundness)
            text(symbol,font="Liberation Sans",
                size=font_size,valign="center",halign="center",center=true);
            sphere(r=font_roundness);}
}
module braille_bead(num){
	basic_shape();
    translate([0,-cube_size/2,0])
        rotate([90,0,0])
            standard_text(str(num));
    translate([0,cube_size/2,0])
        rotate([90,0,180])
            braille_number(num);
}

braille_bead(6);