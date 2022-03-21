size = 80;

height = 10;

wall_thickness = 1.5;

cord_thickness = 5;

difference() {
  cube([size, size, height]);

  translate([wall_thickness, wall_thickness, wall_thickness])
  cube([size - wall_thickness * 2, size - wall_thickness * 2, height - wall_thickness / 2]);

  // The cutout for the first connector on the cord
  translate([height, -wall_thickness / 2, (height - cord_thickness) / 2])
  cube([cord_thickness * 2, wall_thickness * 2, cord_thickness]);

  // The cutout to make the first connector slidable into the wall
  translate([height + cord_thickness, -wall_thickness / 2, (height - cord_thickness) / 2])
  cube([cord_thickness, wall_thickness * 2, height - cord_thickness / 2 + wall_thickness]);

  // The cutout for the second connector on the cord
  translate([size - height * 2, -wall_thickness / 2, (height - cord_thickness) / 2])
  cube([cord_thickness * 2, wall_thickness * 2, cord_thickness]);

  // The cutout to make the second connector slidable into the wall
  translate([size - height * 2, -wall_thickness / 2, (height - cord_thickness) / 2])
  cube([cord_thickness, wall_thickness * 2, height - cord_thickness / 2 + wall_thickness]);
}
