// This code taken from http://www.thingiverse.com/thing:811030
// Licenced as Creative Commons - Attribution - Share Alike

baseHeight=0;           //Base Height mm
keySize=cube_size;               //Base Size mm^2
cornerRadius=cube_size/5;         // How round to make the corners?
scaleBraille=cube_size/11;

// Braille medical standards
std_a = 2.5*scaleBraille;    // Horzontal dot to dot
std_b = 2.5*scaleBraille;    // vertical dot to dot
std_c = 6*scaleBraille;      // from cell to cell
std_d = 2.5*scaleBraille;    // from cell to cell with single space between
std_e = 10*scaleBraille;     // line spacing
std_f = 0.3*scaleBraille;    // raised Height
std_g = 1.4*scaleBraille;    // Dot Size

dotRadius = .7;          // Dot Size Multiplier
dotDepth = 1;// How much to raise the braille mm
_0=[0,0,0];     // Per dot | Depth, Size, Offset
_1 = [dotDepth/2,dotRadius/.5,dotRadius*.3];
_2 = [dotDepth,dotRadius,0];


blank = [_0,_0,_0,_0,_0,_0];        // Selecting per dot settings above
//    1  2  3  4  5  6
a = [_2,_1,_1,_1,_1,_1];
b = [_2,_2,_1,_1,_1,_1];
c = [_2,_1,_1,_2,_1,_1];
d = [_2,_1,_1,_2,_2,_1];
e = [_2,_1,_1,_1,_2,_1];
f = [_2,_2,_1,_2,_1,_1];
g = [_2,_2,_1,_2,_2,_1];
h = [_2,_2,_1,_1,_2,_1];
i = [_1,_2,_1,_2,_1,_1];
j = [_1,_2,_1,_2,_2,_1];
k = [_2,_1,_2,_1,_1,_1];
l = [_2,_2,_2,_1,_1,_1];
m = [_2,_1,_2,_2,_1,_1];
n = [_2,_1,_2,_2,_2,_1];
o = [_2,_1,_2,_1,_2,_1];
p = [_2,_2,_2,_2,_1,_1];
q = [_2,_2,_2,_2,_2,_1];
r = [_2,_2,_2,_1,_2,_1];
s = [_1,_2,_2,_2,_1,_1];
t = [_1,_2,_2,_2,_2,_1];
u = [_2,_1,_2,_1,_1,_2];
v = [_2,_2,_2,_1,_1,_2];
w = [_1,_2,_1,_2,_2,_2];
x = [_2,_1,_2,_2,_1,_2];
y = [_2,_1,_2,_2,_2,_2];
z = [_2,_1,_2,_1,_2,_2];
//     1  2  3  4  5  6
numbersign = [_1,_1,_2,_2,_2,_2];
n1 = [_2,_1,_1,_1,_1,_1];
n2 = [_2,_2,_1,_1,_1,_1];
n3 = [_2,_1,_1,_2,_1,_1];
n4 = [_2,_1,_1,_2,_2,_1];
n5 = [_2,_1,_1,_1,_2,_1];
n6 = [_2,_2,_1,_2,_1,_1];
n7 = [_2,_2,_1,_2,_2,_1];
n8 = [_2,_2,_1,_1,_2,_1];
n9 = [_1,_2,_1,_2,_1,_1];
n0 = [_1,_2,_1,_2,_2,_1];

nums=[[_1,_2,_1,_2,_2,_1],[_2,_1,_1,_1,_1,_1],[_2,_2,_1,_1,_1,_1],[_2,_1,_1,_2,_1,_1],
        [_2,_1,_1,_2,_2,_1],[_2,_1,_1,_1,_2,_1],[_2,_2,_1,_2,_1,_1],[_2,_2,_1,_2,_2,_1],
        [_2,_2,_1,_1,_2,_1],[_1,_2,_1,_2,_1,_1]];

alphabet=[a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z];

numbers=[n1,n2,n3,n4,n5,n6,n7,n8,n9,n0];

module placeDot (placeX, placeY, dotSize, dotHeight) {
    translate([placeX,placeY,baseHeight]){
        sphere(r=dotRadius*scaleBraille/dotSize);
    }
}



module Char_display_single(glyph1){
    for (i=[0:2]){
        placeDot(((keySize/2)-((std_a)*.5))+glyph1[i][2],
            ((keySize*.5)+((std_a))-i*(std_a))-glyph1[i][2],
            glyph1[i][1],
            glyph1[i][1]);
    }
    for (i=[3:5]){
        placeDot(((keySize/2)+((std_a)*.5))+glyph1[i][2],
            ((keySize*.5)+((std_a))-(i-3)*(std_a))-glyph1[i][2],
            glyph1[i][1],
            glyph1[i][1]);
    }
}

module Char_display_standard2(glyph1,glyph2){
    for (i=[0:2]){
        placeDot(((keySize/2)-(std_a*1.5))+glyph1[i][2],((keySize*.5)+(std_a)-i*std_a)-glyph1[i][2],glyph1[i][1],glyph1[i][1]);
    }
    for (i=[3:5]){
        placeDot(((keySize/2)-(std_a*.5))+glyph1[i][2],((keySize*.5)+(std_a)-(i-3)*std_a)-glyph1[i][2],glyph1[i][1],glyph1[i][1]);
    }


        for (i=[0:2]){
        placeDot(((keySize/2)+(std_a)*.5)+glyph2[i][2],((keySize*.5)+(std_a)-i*std_a)-glyph2[i][2],glyph2[i][1],glyph2[i][1]);
    }
    for (i=[3:5]){
        placeDot(((keySize/2)+(std_a)*1.5)+glyph2[i][2],((keySize*.5)+(std_a)-(i-3)*std_a)-glyph2[i][2],glyph2[i][1],glyph2[i][1]);
    }
}

module braille_number(num){
    if(num<10)
        translate([-keySize/2,-keySize/2,0])
            Char_display_standard2(numbersign,nums[num]);}
