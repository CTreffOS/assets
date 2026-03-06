// Pocket dimensions from sign_base.scad
pocket_width = 154; // Long side (horizontal)
pocket_height = 65; // Short side (vertical)

// Box dimensions
box_width = 2 + 154 + 2; // 158mm
box_height = 2 + 65 + 2; // 69mm
box_thickness = 1.0; // 1mm

epsilon = 0.1;

// Cutout dimensions
cutout_width = 154 - 2 - 1 - 2; // 149mm
cutout_height = 65 - 2 - 1 - 2; // 60mm

// Bar on top
bar_width = 154;
bar_height = 65;
bar_thickness = 3.5;

// Inner cutout dimensions
inner_cutout_width = 154 - 1 - 1; // 152mm
inner_cutout_height = 65 - 1 - 1; // 63mm

// Card holder boxes
holder_width = 65;
holder_height = 20;
holder_thickness = 2.5;

module sign_frame() {
    union() {
        difference() {
            union() {
                difference() {
                    // Simple box
                    cube([box_width, box_height, box_thickness]);
                    
                    // Cut out box (centered)
                    translate([(box_width - cutout_width) / 2, (box_height - cutout_height) / 2, -epsilon])
                        cube([cutout_width, cutout_height, box_thickness + 2*epsilon]);
                }
                
                // Bar on top (154x65mm, centered)
                translate([(box_width - bar_width) / 2, (box_height - bar_height) / 2, box_thickness])
                    cube([bar_width, bar_height, bar_thickness]);
            }
            
            // Cut out from the bar (centered)
            translate([(box_width - inner_cutout_width) / 2, (box_height - inner_cutout_height) / 2, box_thickness - epsilon])
                cube([inner_cutout_width, inner_cutout_height, bar_thickness + 2*epsilon]);
        }
        
        // Left holder (20mm wide x 65mm high, 45mm left of center)
        translate([(box_width - holder_height) / 2 - 45, (box_height - holder_width) / 2, box_thickness + bar_thickness - holder_thickness])
            cube([holder_height, holder_width, holder_thickness]);
        
        // Center holder (20mm wide x 65mm high, centered)
        translate([(box_width - holder_height) / 2, (box_height - holder_width) / 2, box_thickness + bar_thickness - holder_thickness])
            cube([holder_height, holder_width, holder_thickness]);
        
        // Right holder (20mm wide x 65mm high, 45mm right of center)
        translate([(box_width - holder_height) / 2 + 45, (box_height - holder_width) / 2, box_thickness + bar_thickness - holder_thickness])
            cube([holder_height, holder_width, holder_thickness]);
    }
}

// Render settings
$fn = 40;

// Generate the frame
sign_frame();
