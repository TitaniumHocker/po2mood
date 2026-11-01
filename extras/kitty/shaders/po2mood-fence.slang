#language slang 2026
// PO-2 concrete fence relief on the terminal background.
//
// Each square cell is a hip roof: a horizontal ridge one third of the cell
// wide, one third down from the top (450 mm cell, 150 mm modules in the
// IZh 31-77 drawing). The ridge splits the cell into four faces, lit from
// the top-left. Only pixels showing the default background are touched, so
// text, selections and colored cells stay as they are.

import kitty_custom_shader_types;

// Cell size in pixels.
static const float CELL_SIZE = 96.0;
// Brightness change of the brightest/darkest face, as a fraction of the
// background. 0.04 keeps every palette color above 4.5:1 contrast.
static const float RELIEF = 0.04;
// Face shading in [-1, 1].
static const float SHADE_LEFT = 1.0;
static const float SHADE_TOP = 0.5;
static const float SHADE_BOTTOM = -0.25;
static const float SHADE_RIGHT = -1.0;

public float4
fragment_main(float4 color, KittyTextures t, KittyCustomShaderData d) {
    float mask = 1.0 - smoothstep(0.0, 0.02, distance(color.rgb, d.background.rgb));
    if (mask <= 0.0) return color;

    // Position inside the cell, origin at the top-left, v growing downwards.
    float2 dims = float2(d.viewport_size_pixels) * t.viewport.zw;
    float2 px = float2(t.pos.x, 1.0 - t.pos.y) * dims;
    float2 q = frac(px / CELL_SIZE);
    float u = q.x, v = q.y;

    // Side triangles: bounded by the lines from the cell corners to the ridge
    // ends at (1/3, 1/3) and (2/3, 1/3).
    float side = v < 1.0 / 3.0 ? v : (1.0 - v) * 0.5;
    float shade;
    if (u < side) shade = SHADE_LEFT;
    else if (1.0 - u < side) shade = SHADE_RIGHT;
    else shade = v < 1.0 / 3.0 ? SHADE_TOP : SHADE_BOTTOM;

    return float4(color.rgb * (1.0 + RELIEF * shade * mask), color.a);
}
