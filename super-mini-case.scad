// Copyright 2025, Jeroen van Grondelle
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>
include <hex-grid.scad>
include <fastvoronoi_func_bosl2.scad>

// corner definition
//
cut = 1.5;
k=.7;

// snugness of the fit
delta=.15;

module case(width, length, height) {
    difference() {
        linear_extrude(height=height) {
            polygon(round_corners(rect([width+4,length+4]),  method="smooth", k=k, cut=cut, $fn=96));
        }

        up(1) cuboid([width+delta,length+delta,height], anchor=BOTTOM);
        up(2) fwd(length/2) cuboid($fn=20,[9.5, 20, 3.9], rounding=1.4, anchor=BOTTOM); // Usb-c
        up(height-1.5) prismoid(size2=[width+delta,length+delta], size1=[width+delta +.5,length+delta+.5], h=1.5, anchor=BOTTOM);
        up(height-1) fwd(-1* length/2) cuboid([4,4, 4], anchor=BOTTOM); // Nook
    }
}

module lid(width, length) { 
    union() {
         linear_extrude(height=1.5) {
            polygon(round_corners(rect([width+4,length+4]),  method="smooth", k=k, cut=cut, $fn=96));
         }
         
         up(1.4) cuboid([width,length,1.6], anchor=BOTTOM);
         up(1.5) prismoid(size1=[width/1.5,length], size2=[width/1.5,length+.7], h=1.5, anchor=BOTTOM);
         up(1.5) prismoid(size1=[width,length/1.5], size2=[width+.7,length/1.5], h=1.5, anchor=BOTTOM);
    }
}

module lid_hex(width, length) {
    difference() {
        lid(width, length);
        down(3) cuboid($fn=30, [width-2,length-2,10], rounding=1, anchor=BOTTOM);
    }
    intersection() {
        up(0.5) rotate([0,0, 20]) create_grid(size=[2*width,2.1*length,1],SW=4,wall=.8);
        down(3) cuboid($fn=30, [width-2+delta, length-2+delta, 10], rounding=1, anchor=BOTTOM);
    }
}

module cable_case(width, length, height)
{
    difference() {
        case(width, length, height);
        up(height-5.5) fwd(-.5*length-1) cuboid([1.5, 14, 5], rounding=.5, anchor=BOTTOM);
    }
}

// first version of a vornoic based lid
//points = voronoi_array(cellsize, xmin=-20, xmax=20, ymin=-30, ymax=30);

// 2. Generate array of polygon vertices for voronoi pattern
//polygon_vertices = fastvoronoi(points, 8, rcorner=1);

//linear_extrude(height=1.5) {
//    polygon(polygon_vertices);
//}




// EXAMPLES
//
left(75) case(18, 24.2, 18.5);
left(50) cable_case(18, 24.2, 13.5);
left(25) case(18, 24.2, 8.5);
cable_case(18, 24.2, 8.5);

right(25) lid(18, 24.2);
right(50) lid_hex(18, 24.2);
