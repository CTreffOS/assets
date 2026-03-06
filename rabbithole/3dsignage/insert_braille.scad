// Sign frame insert
// Units: mm

// --- Dimensions ---
// Bottom part (fits into notch)
bottom_width     = 152.9;
bottom_height    = 64.9;
bottom_thickness = 1.5;
bottom_color = "white";

// Top lip (prevents falling through)
top_width     = 159;
top_height    = 69;
top_thickness = 1.0;

// Window cutout from top lip
cutout_width  = 149;
cutout_height = 60;
cutout_depth = 0.32;

// SVG settings
svg_filename = "sign-braille.svg";
svg_scale    = 0.9;
text_color   = "white";
text_height  = 0.5;

epsilon = 0.01;

// --- Main module ---
module sign_insert() {
    color(bottom_color)
    union() {
        // 1. Bottom box — the part that slides into the notch
        cube([bottom_width, bottom_height, bottom_thickness]);
        // 2. Top lip box — centered over the bottom box, sits on top
        translate([
            (bottom_width - top_width) / 2,
            (bottom_height - top_height) / 2,
            bottom_thickness
        ])
        difference() {
            // Solid top lip
            cube([top_width, top_height, top_thickness]);

            // Remove the window cutout (centered)
            translate([
                (top_width  - cutout_width)  / 2,
                (top_height - cutout_height) / 2,
                top_thickness - cutout_depth
            ])
    
            cube([cutout_width, cutout_height, top_thickness + 2*epsilon]);
        }
    }
}

// --- SVG label, centered in the window ---
module svg_label() {
    // Z: sit on top surface of the top lip
    // X/Y: center of the top lip, which is centered over the bottom box
    lip_offset_x = (bottom_width - top_width)   / 2;
    lip_offset_y = (bottom_height - top_height) / 2;

    translate([
        lip_offset_x + top_width  / 2,
        lip_offset_y + top_height / 2,
        bottom_thickness + top_thickness - cutout_depth
    ])
    color(text_color)
    linear_extrude(height = text_height, convexity = 10)
        offset(delta = 0.001)
            scale([svg_scale, svg_scale])
                import(svg_filename, center = true);
}

// --- Render ---
$fn = 40;
sign_insert();
svg_label();