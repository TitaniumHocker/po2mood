#language slang 2026
// PO-2 concrete fence relief on the terminal background: a grid of pyramids
// lit from the top-left. Only pixels showing the default background are
// touched, so text, selections and colored cells stay as they are.

import kitty_custom_shader_types;

// Pyramid size in pixels.
static const float CELL_SIZE = 64.0;
// Brightness change of the lit/shaded faces, as a fraction of the background.
// 0.04 keeps every palette color above 4.5:1 contrast on the darkest face.
static const float RELIEF = 0.04;

public float4
fragment_main(float4 color, KittyTextures t, KittyCustomShaderData d) {
    float mask = 1.0 - smoothstep(0.0, 0.02, distance(color.rgb, d.background.rgb));
    if (mask <= 0.0) return color;

    // Pixel position with the origin at the top-left, so the grid stays put
    // when the window is resized from the bottom.
    float2 dims = float2(d.viewport_size_pixels) * t.viewport.zw;
    float2 px = float2(t.pos.x, 1.0 - t.pos.y) * dims;
    float2 q = frac(px / CELL_SIZE) - 0.5;

    // Top face is lit, bottom is in shadow, left and right sit in between.
    float shade = abs(q.y) > abs(q.x) ? -sign(q.y) : -0.5 * sign(q.x);

    return float4(color.rgb * (1.0 + RELIEF * shade * mask), color.a);
}
