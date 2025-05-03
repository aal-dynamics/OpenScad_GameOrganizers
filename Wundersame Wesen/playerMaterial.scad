include <../prepared/box.scad>;
include <../prepared/box +lid.scad>;

material = 1.2;
playerBoxX = 60;
playerBoxY = 70;
boxWithLid(x = playerBoxX, y = playerBoxY, z = 25, hashSpace = 10, print = true);
translate(v = [playerBoxX/2, 0 , 0])
	cube(size = [material, playerBoxY, 20]);

translate(v = [0, playerBoxY + 10, 0]) {
	boxWithLid(x = playerBoxX, y = playerBoxY, z = 25, hashSpace = 10, print = true);
	translate(v = [playerBoxX/2, 0 , 0])
		cube(size = [material, playerBoxY, 20]);
}

crewX = 120;
crewY = 65;
crewZ = 40;

translate(v = [playerBoxX * 2 + 10, 0, 0]) 
	box(x = crewX, y = crewY, z = crewZ);
translate(v = [playerBoxX * 2 + 10, crewY + 10, 0]) 
	box(x = crewX, y = crewY, z = crewZ);