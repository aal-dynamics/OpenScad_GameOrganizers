include <touchGap.scad>;
include <hashedSquare.scad>;
include <box.scad>;

module cardBox_63x88(y = 0.0, material = 1.2, touchGaps = [false, false, false, false], eco = [false, false, false, false, true]) {
	x = 73.0;
	z = 95.0;

	box(x = x, y = y, z = z, touchGaps = touchGaps, eco = eco);
}

//cardBox_63x88(y = 65.0, touchGaps = [true, false, true, false]);