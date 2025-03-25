module hashedSquare(x, y, z = 1.2, space = 7) {
    angle = 30;
	steps = space + z;

	count = round((x + y) / steps) + 1;

    difference() {
        cube([x, y, z *3]);

		for (i = [0: 1: count]) {
			translate([i * steps, -z, 0])
				rotate([0, 0, angle])
					cube([z, y / cos(angle) + z *2, z *3]);
			translate([x - i * steps, -z, 0])
				rotate([0, 0, -angle])
					cube([z, y / cos(angle) + z *2, z *3]);
		}
    }
}