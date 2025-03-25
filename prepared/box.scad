include <touchGap.scad>;
include <hashedSquare.scad>;

module box(x = 0.0, y = 0.0, z = 0.0, material = 1.2, touchGaps = [false, false, false, false], eco = [false, false, false, false, true], hashSpace = 7) {
	echo("######### BOX size X = ", x, ", Y = ", y, ", Z = ", z, " #########");

	tempX = x * 0.6 ;
	tempY = y * 0.6;
		
	xDiameter = tempX > 40.0 ? 40.0 : tempX;
	yDiameter = tempY > 40.0 ? 40.0 : tempY;
	
	difference() {
		cube(size = [x, y, z]);
		
		translate([material, material, material]) {
			//cube(size = [x - (material * 2), y - (material * 2), z - material]);
			if (z > material)
				cube(size = [x - (material * 2), y - (material * 2), z]);
			if (z <= material)
				cube(size = [x - (material * 2), y - (material * 2), z - material]);
		}
		
		if (touchGaps[0]) //front
			translate([xDiameter + (x - xDiameter) /2, -material, z  + 0.1])
				rotate([0,0,90])
					touchGap(width = xDiameter, height = xDiameter * 0.5, material = material);

		if (touchGaps[1]) //left
			translate([0, (y - yDiameter) /2, z])
				touchGap(width = yDiameter, height = yDiameter * 0.5, material = material);

		if (touchGaps[2]) //back
			translate([xDiameter + (x - xDiameter) /2, y - material *2, z + 0.1])
				rotate([0,0,90])
					touchGap(width = xDiameter, height = xDiameter * 0.5, material = material);

		if (touchGaps[3]) //right
			translate([x - material * 2, (y - yDiameter) /2, z])
				touchGap(width = yDiameter, height = yDiameter * 0.5, material = material);
		
		ecoDistance = 10;
		ecoX = x - ecoDistance * 2;
		ecoY = y - ecoDistance * 2;
		
		frontY = touchGaps[0] ? z - xDiameter - ecoDistance * 2: z - ecoDistance * 2;
		leftY = touchGaps[1] ? z - xDiameter - ecoDistance * 2: z - ecoDistance * 2;
		backY = touchGaps[2] ? z - xDiameter - ecoDistance * 2: z - ecoDistance * 2;
		rightY = touchGaps[3] ? z - xDiameter - ecoDistance * 2: z - ecoDistance * 2;
		
		if (eco) {
			sideWidth = y - ecoDistance * 2;
			sideHeight = z - ecoDistance * 2;

			//front
			if (eco[0])
				translate([ecoDistance, material *2, ecoDistance])
					rotate([90, 0, 0])
						hashedSquare(x = ecoX, y = frontY, z = material, space = hashSpace);

			//left
			if (eco[1])
				translate([0, ecoDistance, ecoDistance])
					rotate([90, 0, 90])
						hashedSquare(x = ecoY, y = leftY, z = material, space = hashSpace);

			//back
			if (eco[2])
				translate([ecoDistance, y + material, ecoDistance])
					rotate([90, 0, 0])
						hashedSquare(x = ecoX, y = backY, z = material, space = hashSpace);

			//right
			if (eco[3])
				translate([x - material *2, ecoDistance, ecoDistance])
					rotate([90, 0, 90])
						hashedSquare(x = ecoY, y = rightY, z = material, space = hashSpace);

			//bottom
			if (eco[4])
				translate([ecoDistance, ecoDistance, -0.1])
					hashedSquare(x = x - ecoDistance * 2, y = y - ecoDistance * 2, z = material, space = hashSpace);
		}
	}
}

// x = 100;
// y = 100;
// z = 100;

// x = 73;
// y = 65;
// z = 95;

// box(v = [x, y , z], touchGaps = [true, false, true, false], eco = [true, true, true, true, true]);

// translate([x + 30, 0, 0])
// 	box(v = [x, y , z], touchGaps = [false, false, false, false], eco = [true, true, true, true, true]);