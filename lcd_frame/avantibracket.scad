$fn=50;
outer_x = 60;
outer_y = 72;

aperture_x = 50.3;
aperture_y = 69.6;

height = 4;


viewport_x = 29.73+2;
viewport_y =59.49;
screen_clearance = 4;

rim_thickness = 6;

module mounting_lug(ht) {
    difference() {
       hull() {
        cylinder(d=6,h=ht);
        translate([6,0,0]) cylinder(d=6,h=ht);
       }
       translate([0,0,3.5]) cylinder(d=5,h=10);
       translate([0,0,-1]) cylinder(d=2,h=10);
   }
}

module main_bracket() {
difference() {
union() {
    translate([-1,-3,0]) cube([outer_x,outer_y+2,height+2.5]);




//50mm apart

//outer y= 72. So, 11 in.
/*translate([-4,(outer_y - 50)/2,0]) {
    mounting_lug(height+2.5);
    translate([0,50,0]) mounting_lug(height+2.5);
}*/


//holes are 80mm apart.

translate([0,-5.25,0]) {
    translate([38,0,0]) rotate(90) mounting_lug(height+2.5);
    translate([38,81.5,0]) rotate(270) mounting_lug(height+2.5);
}

//the raised lip
 translate([(0 + outer_x - (viewport_x+ screen_clearance)) /2 - 12, -1 + (outer_y - (viewport_y + screen_clearance))/2-5.5,height+2.5]) cube([viewport_x + screen_clearance + rim_thickness, viewport_y + screen_clearance + rim_thickness + 6, height+2.5]);


}






//the screen viewing window

 translate([(0 + outer_x - (viewport_x+ screen_clearance)) /2 - 7, -1 + (outer_y - (viewport_y + screen_clearance))/2,]) cube([viewport_x + screen_clearance, viewport_y + screen_clearance, 50]);


//the aperture
    translate([(outer_x - aperture_x) /2 -10 ,-1  +(outer_y - aperture_y) /2 ,-0.1]) cube([aperture_x, aperture_y, height + 2.5 -1]);
    
    

//chops the bottom off.
translate([52,-5,-0.1]) cube([100,100,100]);

//for the f4...
//translate([42,-3,0]) #cube([12,10,10]);
//translate([42,65,0]) #cube([12,10,10]);
translate([46,-10,0]) #cube([10,100,10]);



}
}


main_bracket();