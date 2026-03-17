// sign
width = 181.56; 
length = 255; 
depth = 3.5;
block_color = "gray";

// Magnet parameters
magnet_diameter = 15.2;
magnet_thickness = 2.2;
edge_margin = 10;

// Configuration for magnet distribution
magnets_horizontal_count = 3; 
magnets_vertical_count = 5;

// SVG parameters
svg_filename = "sign-text.svg";
text_color = "orange";
text_height = 0.4;
svg_scale = 1.0;
svg_offset_x = 0;
svg_offset_y = 82;

// Second Card Pocket parameters
enable_second_pocket = true;
card_pocket2_width = 154;
card_pocket2_height = 65;
card_pocket2_depth = 5;
card_pocket2_pos_x = 0; // Offset from center
card_pocket2_pos_y = -75; // Offset from center

// Frame parameters
enable_frame = true;
frame_padding = 2; // Padding from outer edge of sign
frame_height = 0.4; // Extruded height of frame
frame_thickness = 1; // Width/thickness of the frame border

// Card Pocket parameters
enable_card_pocket = true;
card_pocket_width = 154;
card_pocket_height = 65 ;
card_pocket_depth = 5;
card_pocket_pos_x = 0 ; // Offset from center
card_pocket_pos_y = 5; // Offset from center

// Small overlap for clean boolean operations
epsilon = 0.1;

module sign_base() {
    difference() {
        // Main block + Text + Pocket Logic
        union() {
            // Logic: Block MINUS Pocket Air
            difference() {
                color(block_color)
                cube([width, length, depth]);

                if (enable_card_pocket) {
                    // Calculate pocket position (centered + offset)
                    px = (width - card_pocket_width) / 2 + card_pocket_pos_x;
                    py = (length - card_pocket_height) / 2 + card_pocket_pos_y;
                    pz = depth - card_pocket_depth;

                    // The "Air" to subtract
                    // Simple rectangular pocket without lips
                    translate([px, py, pz + epsilon]) // +epsilon to ensure top surface cut
                        translate([0, 0, -epsilon])
                            cube([card_pocket_width, card_pocket_height, card_pocket_depth + epsilon]);
                }
                
                if (enable_second_pocket) {
                    // Calculate second pocket position (centered + offset)
                    px2 = (width - card_pocket2_width) / 2 + card_pocket2_pos_x;
                    py2 = (length - card_pocket2_height) / 2 + card_pocket2_pos_y;
                    pz2 = depth - card_pocket2_depth;

                    // The "Air" to subtract for second pocket
                    // Simple rectangular pocket without lips
                    translate([px2, py2, pz2 + epsilon]) // +epsilon to ensure top surface cut
                        translate([0, 0, -epsilon])
                            cube([card_pocket2_width, card_pocket2_height, card_pocket2_depth + epsilon]);
                }
            }
            
            // Extruded SVG Text
            // We use center=true to center the SVG geometry at [0,0], 
            // then translate it to the center of the block face.
            // Added offset() to fix potential non-manifold/open mesh errors from the SVG
            translate([width/2 + svg_offset_x, length/2 + svg_offset_y, depth])
                color(text_color)
                linear_extrude(height = text_height, convexity = 10)
                    offset(delta = 0.001)
                        scale([svg_scale, svg_scale])
                            import(svg_filename, center = true);



            // Optional Frame
            if (enable_frame) {
                // Frame is positioned at the same Z height as the first SVG
                translate([frame_padding, frame_padding, depth])
                    color(text_color)
                    linear_extrude(height = frame_height, convexity = 10)
                        difference() {
                            // Outer rectangle (full sign size minus padding)
                            square([width - 2*frame_padding, length - 2*frame_padding]);
                            // Inner rectangle (offset by frame thickness to create frame outline)
                            translate([frame_thickness, frame_thickness, 0])
                                square([width - 2*frame_padding - 2*frame_thickness, length - 2*frame_padding - 2*frame_thickness]);
                        }
            }
        }

        // Magnet holes
        // Holes are placed on the bottom face (z=0)
        union() {
            // Horizontal rows (Bottom and Top edges)
            if (magnets_horizontal_count >= 2) {
                x_step = (width - 2 * edge_margin) / (magnets_horizontal_count - 1);
                
                for (i = [0 : magnets_horizontal_count - 1]) {
                    
                    
                    x_pos = edge_margin + i * x_step;
                    
                    // Bottom edge
                    translate([x_pos, edge_margin, -epsilon])
                        cylinder(d = magnet_diameter, h = magnet_thickness + epsilon);
                        
                    // Top edge
                    translate([x_pos, length - edge_margin, -epsilon])
                        cylinder(d = magnet_diameter, h = magnet_thickness + epsilon);
                    }
               
            }

            // Vertical rows (Left and Right edges)
            // Skip the first and last indices as they are covered by the horizontal rows
            if (magnets_vertical_count > 2) {
                y_step = (length - 2 * edge_margin) / (magnets_vertical_count - 1);
                
                for (i = [1 : magnets_vertical_count - 2]) {
                    
                    if (i!=1 && i!=2){
                        y_pos = edge_margin + i * y_step;

                        // Left edge
                        translate([edge_margin, y_pos, -epsilon])
                            cylinder(d = magnet_diameter, h = magnet_thickness + epsilon);
                            
                        // Right edge
                        translate([width - edge_margin, y_pos, -epsilon])
                            cylinder(d = magnet_diameter, h = magnet_thickness + epsilon);
                     }
                }
            }
        }
    }
}

// Render settings
$fn = 40; // Resolution for circles

// Generate the part
sign_base();
