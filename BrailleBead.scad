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

cube_size=25;
hole_size=cube_size/2;
fillet=cube_size/20;
font_size=cube_size*4/5;
font_roundness=cube_size/20;
font_height=cube_size/10;
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
module braille_bead(number){
    basic_shape();
    translate([0,-cube_size/2,0])
        rotate([90,0,0])
            standard_text(str(number));
    translate([0,cube_size/2,0])
        rotate([90,0,180])
            braille_number(number);
}
module braille_letter_bead(number){
    basic_shape();
    translate([0,-cube_size/2,0])
        rotate([90,0,0])
            standard_text(chr(number+65));
    translate([0,cube_size/2,0])
        rotate([90,0,180])
            braille_letter(number);
}
braille_letter_bead(0);
//for(i=[0:9])
//    translate([(i*1.5)*cube_size,0,0])
//        braille_bead(i);
