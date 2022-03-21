size = 80;

height = 15;

wall_thickness = 2;

slot_thickness = .5;

cord_thickness = 5;

slot_depth = (height - cord_thickness) / 2;
slot_level = height - slot_depth;

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

  // The slot in the wall for the cover to slide into and hold by friction
  translate([0, 0, slot_level])
  scale([1, 1, 2])
  slot(1.5);
}

module slot(multiplier = 1) {
  slot_shift = (wall_thickness - (slot_thickness * multiplier)) / 2;

  // Front slot
  translate([slot_shift, slot_shift, 0])
  cube([size - slot_shift - slot_shift, slot_thickness * multiplier, slot_depth]);

  // Back slot
  translate([slot_shift, size - slot_shift - slot_thickness * multiplier, 0])
  cube([size - slot_shift - slot_shift, slot_thickness * multiplier, slot_depth]);

  // Left slot
  translate([slot_shift, slot_shift, 0])
  cube([slot_thickness * multiplier, size - slot_shift - slot_shift, slot_depth]);

  // Right slot
  translate([size - slot_shift - slot_thickness * multiplier, slot_shift, 0])
  cube([slot_thickness * multiplier, size - slot_shift - slot_shift, slot_depth]);
}

difference() {
  // The cover plate
  translate([size + height, 0, 0])
  cube([size, size, wall_thickness]);

  // The hole in the slot cover plate for the winding hole to fit through
  translate([size + height + (size / 2 - wall_thickness), size / 2 - wall_thickness, -wall_thickness])
  cube([wall_thickness * 2, wall_thickness * 2, height]);
}

// The slot in the cover that friction-sticks to the slot in the box itself
translate([size + height, 0, wall_thickness])
slot();

// The pole to help wind the cable around
translate([size / 2 - wall_thickness, size / 2 - wall_thickness])
cube([wall_thickness * 2, wall_thickness * 2, height]);
