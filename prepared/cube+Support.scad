module cubeLeftSupported(y = 0.0, z = 1.2, angle = 45, material = 1.2) {
	x = material;
	difference() {
		cube(size = [x, y, z]);
			translate(v = [0, -material, 0])
				rotate(a = [0, angle, 0])
					cube(size = [x, y + material * 2, material * 2]);
	}
}

module cubeRightSupported(y = 0.0, z = 1.2, angle = 45, material = 1.2) {
	translate(v = [material, y, 0]) 
		rotate(a = [0, 0, 180])
			cubeLeftSupported(y = y, z = z, angle = angle, material = material);
}

// material = 1.2;
// y = 37;
// z = 35;

// cubeLeftSupported(angle = 45, y = y, z = z, material = material);

// translate(v = [15, 0 , 0]) 
// 	cubeRightSupported(angle = 45, y = y, z = z, material = material);