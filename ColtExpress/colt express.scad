include <../prepared/touchGap.scad>;
include <../prepared/hashedSquare.scad>;
include <../prepared/cardBoxes.scad>;
include <../prepared/box +lid.scad>;

boxX = 143;
boxY = 193;
boxZ = 65;
material = 1.2;

lidBoxX = 67;
lidBoxY = 95;
lidBoxZ = 32;

//x = 73, y = 65, z= 95
cardBox_63x88(y = 65, touchGaps = [true, false, true, false]);

translate([0, 80, 0])
cardBox_63x88(y = 65, touchGaps = [true, false, true, false]);

translate([0, 160, 0])
cardBox_63x88(y = 65, touchGaps = [true, false, true, false]);

translate([80, 0, 0]){
	box(x = boxX, y = boxY, z = boxZ);
	translate([0, 125 + material, 0]) {
		difference() {
			cube([boxX, material, boxZ]);
		}
		translate([0, -10, 0])
		cube([boxX, 20+ material, material]);
	}
}

translate([230, 0, 0]){
	box(x = boxX, y = boxY, z = boxZ);
	translate([0, 125 + material, 0]) {
		difference() {
			cube([boxX, material, boxZ]);
		}
		translate([0, -10, 0])
		cube([boxX, 20+ material, material]);
	}
}

translate([380, 0, 0]){
	boxWithLid(x = lidBoxX, y = lidBoxY, z = lidBoxZ, hashSpace = 10, print = true);

	translate(v = [0, lidBoxY + 10, 0]) 
		boxWithLid(x = lidBoxX, y = lidBoxY, z = lidBoxZ, hashSpace = 10, print = true);
}