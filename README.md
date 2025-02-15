# IcyDraw Plugins Collection 🎨

A collection of powerful plugins for IcyDraw, the modern ANSI art editor - successor to the classic MysticDraw (1996-2003).

[Lua Parameters Documentation](https://github.com/hellocodelinux/plugins_icy_draw/blob/main/LUA_PARAMETERS.txt) - Detailed documentation of global parameters and methods available in Lua scripts.

## 🚀 Available Plugins

- **chessboard.lua**
  - This script draws a chessboard pattern using alternating block characters (`█` and ` `). Ideal for creating classic board game visuals.

- **color_transformer.lua**
  - Transforms the colors by inverting them. Uses standard ANSI color codes.

- **double_line_frame.lua**
  - Draws a double-line frame using double-line box-drawing characters (`╔`, `╗`, `╚`, `╝`, `═`, `║`). Perfect for highlighting sections.

- **elite-writing.lua**
  - Converts text to the Elite typewriter font, giving a retro typewriter effect. Uses a custom set of characters for authenticity (e.g., `ε`, `Σ`, `¡`).

- **grid_pattern.lua**
  - Draws a grid pattern using plus, minus, and pipe characters (`┼`). Useful for creating structured layouts.

- **horizontal_gradient.lua**
  - Draws a horizontal gradient pattern using a range of block characters with varying densities (`█`, `▓`, `▒`, `░`). Ideal for smooth transitions.

- **horizontal_stripes.lua**
  - Draws a horizontal striped pattern using block characters (`█` and ` `). Adds a layered look to your artwork.

- **increase_intensity.lua**
  - Replaces blocks with a more dense block, respecting the original block's color. Useful for enhancing the intensity of your artwork.
  - ` ` → `░`, `░` → `▒`, `▒` → `▓`, `▓` → `█`

- **lower_intensity.lua**
  - Replaces blocks with a less dense block, respecting the original block's color. Useful for reducing the intensity of your artwork.
  - `█` → `▓`, `▓` → `▒`, `▒` → `░`, `░` → ` `

- **random_blocks.lua**
  - Draws a random block fill pattern using various block characters (`█`, `▓`, `▒`, `░`). Creates a chaotic, pixelated effect.

- **random_half_blocks.lua**
  - Draws a random half-block fill pattern using half-block characters (`▀`, `▄`, `▌`, `▐`). Adds a textured, semi-transparent look.

- **random-colors.lua**
  - Draws a random color fill pattern using ANSI color codes. Perfect for vibrant, colorful backgrounds.

- **shadow_effect.lua**
  - This script creates a shadow effect by adding a dotted block (`░`) to the right of each solid block (`█`). Enhances depth and dimension.

- **vertical_gradient.lua**
  - Draws a vertical gradient pattern using a range of block characters with varying densities (`█`, `▓`, `▒`, `░`). Ideal for smooth vertical transitions.

- **vertical_stripes.lua**
  - Draws a vertical striped pattern using block characters (`█` and ` `). Adds a layered look to your artwork.

- **matrix_pattern.lua**
  - Creates the iconic Matrix digital rain effect using Japanese katakana and Latin characters in bright green. Perfect for cyberpunk-style animations and backgrounds (`ﾊ`, `ﾐ`, `ﾋ`, `ｰ`, `ｳ`, `ｼ`, etc.).

- **vertical_mirror.lua**
  - Creates a vertical mirror copy outside of a rectangular region. Useful for creating symmetrical designs.

- **radial_gradient.lua**
  - Draws a radial gradient pattern from a central point using block characters with varying densities (`█`, `▓`, `▒`, `░`). Ideal for smooth, circular transition effects.

- **lowercase_to_uppercase.lua**
  - Converts all lowercase letters (a-z) to uppercase (A-Z). Useful for standardizing text to uppercase.

- **uppercase_to_lowercase.lua**
  - Converts all uppercase letters (A-Z) to lowercase (a-z). Useful for standardizing text to lowercase.

- **barcode_pattern.lua**
  - Generates a barcode-like pattern using half-block characters (`▌`, `▐`).
  Creates realistic-looking barcode effects.

## 🔧 Usage
These plugins work in two modes:
- On a selected area (when you make a selection)
- On the entire workspace (when no selection is made)
- Some plugins use the foreground and background colors that are currently selected

## 🔗 Links
- [IcyDraw GitHub Repository](https://github.com/mkrueger/icy_tools/tree/master/crates/icy_draw)

## 💡 Tips
- Combine plugins for unique effects
- Use patterns as backgrounds for your artwork
- Experiment with different color combinations

## 🤝 Contribute!

Join our community! If you have an idea for a plugin or want to improve existing ones:

1. Fork the repository
2. Create your plugin
3. Submit a pull request

All contributions are welcome. Together we can make IcyDraw even better!

---
*Created with ❄️ for the ANSI art community*