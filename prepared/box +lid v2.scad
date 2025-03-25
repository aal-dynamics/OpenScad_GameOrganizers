//include <hashedSquare.scad>;
include <cube+Support.scad>
include <box.scad>;

module boxWithLid(x = 0.0, y = 0.0, z = 0.0, material = 1.2, eco = [false, false, false, false, true, true], hashSpace = 7, toleranceSpace = 0.3) {
	// eco[0] = front	// eco[1] = left	// eco[2] = back	// eco[3] = right	// eco[4] = bottom	// eco[5] = lid

	translate(v = [x + 10, 0 , 0])
		lid(x = x - toleranceSpace * 2, y = y, z = z, hashSpace = hashSpace);
	//todo: kanten der oberen seite mit 45° versehen, weil oberer einschub rahmen stärker ist (material * 1.5)
	
	difference() {
		box(x = x, y = y, z = z, material = material, eco = eco, hashSpace = hashSpace);
		//translate(v = [material, -material, z - material * 2 - toleranceSpace]) 
		translate(v = [material, -material, z - material * 2])
			#cube(size = [x - material *2, material * 3, material * 3]);
	}
	//translate(v = [material, 0, z - material * 4 - toleranceSpace])
	translate(v = [material, 0, z - material * 4])
		cubeLeftSupported(y = y, z = material * 2);
	translate(v = [material, 0, z - material * 1.5])
		cubeLeftSupported(y = y, z = material * 1.5, material = material  * 1.5);
	
	//translate(v = [x - material * 2, 0, z- material * 4 - toleranceSpace])
	translate(v = [x - material * 2, 0, z- material * 4])
		cubeRightSupported(y = y, z = material * 2);
	translate(v = [x - material * 2.5, 0, z - material - 0.6])
		cubeRightSupported(y = y, z = material * 1.5, material = material * 1.5);
	
	//todo: wölbung am hinteren teil des einschubes, damit der deckel nicht raus rutscht
	
}

module lid(x = 0.0, y = 0.0, z = 0.0, material = 1.2, eco = [false, false, false, false, true, true], hashSpace = 7) {
	//translate([x + 20 + material, material, 0]){
	lidX = x - material * 2;
	lidY = y - material;
	
	box(x = lidX, y = lidY, z = material, eco = [eco[0], eco[1], eco[2], eco[3], eco[5]], hashSpace = hashSpace);
	

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