//include <hashedSquare.scad>;
include <cube+Support.scad>
include <box.scad>;

module boxWithLid(x = 0.0, y = 0.0, z = 0.0, material = 1.2, eco = [false, false, false, false, true, true], hashSpace = 7, toleranceSpace = 0.3) {
	// eco[0] = front	// eco[1] = left	// eco[2] = back	// eco[3] = right	// eco[4] = bottom	// eco[5] = lid

	translate(v = [x + 10, 0 , 0])
		lid(x = x - toleranceSpace * 2, y = y, z = z, hashSpace = hashSpace);
	
	difference() {
		box(x = x, y = y, z = z, material = material, eco = eco, hashSpace = hashSpace);
		translate(v = [material, -material, z - material])
			cube(size = [x - material *2, material * 3, material * 2]);
	}
	
	translate(v = [material, 0, z - material * 2.5])
		cubeLeftSupported(y = y, z = material * 1.5);
	translate(v = [material, 0, z - material])
		cubeLeftSupported(y = y, z = material);
	
	translate(v = [x - material * 2, 0, z- material * 2.5])
		cubeRightSupported(y = y, z = material * 1.5);
	translate(v = [x - material * 2, 0, z - material])
		cubeRightSupported(y = y, z = material);
	
	//todo: wölbung am hinteren teil des einschubes, damit der deckel nicht raus rutscht
	
}

module lid(x = 0.0, y = 0.0, z = 0.0, material = 1.2, eco = [false, false, false, false, true, true], hashSpace = 7) {
	//translate([x + 20 + material, material, 0]){
	lidX = x - material * 2;
	lidY = y - material;
	
	difference() {
		box(x = lidX, y = lidY, z = material, eco = [eco[0], eco[1], eco[2], eco[3], eco[5]], hashSpace = hashSpace);
		translate(v = [0, -material, material * 0.5])
			rotate(a = [0, -45, 0])
				cube(size = [material, lidY + material * 2, material]);
		translate(v = [lidX, -material, material * 0.5])
			rotate(a = [0, -45, 0])
				cube(size = [material, lidY + material * 2, material]);
	}
}

// x = 100;
// y = 100;
// z = 100;

// x = 73;
// y = 65;
// z = 95;

x = 67;
y = 95;
z = 32;

boxWithLid(x = x, y = y, z = z, hashSpace = 10);