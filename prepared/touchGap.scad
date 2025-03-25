module touchGap(width, height, material = 1.2) {
	translate([0, 0, -height]) {
		cube (size = [material *3, width, height]);
	
	translate([0, width /2, 0])
		rotate([0, 90, 0]) 
			cylinder(h = material *3, d = width);
	}
}