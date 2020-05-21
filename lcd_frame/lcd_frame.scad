outer_x =  76.75;
outer_y = 44.25;

height = 9;
lug_thickness = 2;


viewport_x = 59.49;
viewport_y = 29.73+2;
screen_clearance = 4;
$fn=50;

screen_shift_x = -1;
screen_shift_y = -2;

translate([0,0,height]) rotate([180,0,0])  

difference() {
    
union() {
    
    
    
    cube([outer_x, outer_y, height]);
   




 translate([(outer_x - viewport_x) /2, (outer_y - viewport_y)/2,-0.1])  {
     
translate([13.07-4.26 + screen_shift_x, screen_shift_y + (29.73 /2) +  53.2/2,height - lug_thickness] ) difference() {
hull(){
translate([0,-6,0]) cylinder(d=5, h=lug_thickness);
cylinder(d=5,h=lug_thickness);
}
cylinder(d=1.5, h=10);
    
}    


translate([13.07-4.26+43.4 + screen_shift_x, screen_shift_y +  (29.73 /2) +  53.2/2 ,height - lug_thickness] ) difference() {
hull(){
translate([0,-6,0]) cylinder(d=5, h=lug_thickness);
cylinder(d=5,h=lug_thickness);
}
cylinder(d=1.5, h=10);
    
}    


translate([13.07-4.26+43.4 + screen_shift_x,screen_shift_y +  (29.73 /2) -  53.2/2,height - lug_thickness] ) difference() {
hull(){
translate([0,7,0]) cylinder(d=5, h=lug_thickness);
cylinder(d=5,h=lug_thickness);
}
cylinder(d=1.5, h=10);
    
}    




translate([13.07-4.26 + screen_shift_x,screen_shift_y +  (29.73 /2) -  53.2/2,height - lug_thickness] ) difference() {
hull(){
translate([0,7,0]) cylinder(d=5, h=lug_thickness);
cylinder(d=5,h=lug_thickness);
}
cylinder(d=1.5, h=10);
    
}    


     
     
}
}

 translate([(0 + outer_x - (viewport_x+ screen_clearance)) /2, -1 + (outer_y - (viewport_y + screen_clearance))/2,-0.1]) cube([viewport_x + screen_clearance, viewport_y + screen_clearance, height+1]);

   translate([outer_x/2 - 7,outer_y-4.5,height-0.4]) linear_extrude(height=10) text(size=4, text="TOP");
}



//53.2 apart.