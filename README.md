# ❄️ IcyDraw Plugins Collection 🎨

A collection of powerful plugins for IcyDraw, the modern ANSI art editor - successor to the classic MysticDraw (1996-2003).

[Lua Parameters Documentation](https://github.com/hellocodelinux/plugins_icy_draw/blob/main/LUA_PARAMETERS.txt) - Detailed documentation of global parameters and methods available in Lua scripts.

### !Combine plugins for unique effects!

## 💝 Support the Project

If you find these plugins useful and want to support their continued development, consider making a donation! Every contribution helps maintain and improve the project.

[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://paypal.me/eduardocastillo1170) 

Your support keeps this project alive! 🙏 Thank you!

## 🚀 Available Plugins

- **chessboard.lua**
  - This script draws a chessboard pattern using alternating block characters (`█` and ` `). Ideal for creating classic board game visuals.

- **color_transformer.lua**
  - Transforms the colors by inverting them. Uses standard ANSI color codes.

- **double_line_frame.lua**
  - Draws a double-line frame using double-line box-drawing characters (`╔`, `╗`, `╚`, `╝`, `═`, `║`). Perfect for highlighting sections.

- **single_line_frame.lua**
  - Draws a single-line frame using single-line box-drawing characters (`┌`, `┐`, `└`, `┘`, `─`, `│`). Perfect for highlighting sections.

- **elite-writing.lua**
  - Converts text to the Elite typewriter font, giving a retro typewriter effect. Uses a custom set of characters for authenticity (e.g., `ε`, `Σ`, `¡`).

- **grid_pattern.lua**
  - Draws a grid pattern using plus, minus, and pipe characters (`┼`). Useful for creating structured layouts.

- **horizontal_gradient.lua**
  - Draws a horizontal gradient pattern using a range of block characters with varying densities (`█`, `▓`, `▒`, `░`). Ideal for smooth transitions.

- **horizontal_stripes.lua**
  - Draws a horizontal striped pattern using block characters (`█` and ` `). Adds a layered look to your artwork.

- **increase_intensity.lua**
  - Replaces blocks with a more dense block, respecting the original block's color. Useful for enhancing the intensity of your artwork. - ` ` → `░`, `░` → `▒`, `▒` → `▓`, `▓` → `█`

- **lower_intensity.lua**
  - Replaces blocks with a less dense block, respecting the original block's color. Useful for reducing the intensity of your artwork. - `█` → `▓`, `▓` → `▒`, `▒` → `░`, `░` → ` `

- **random_blocks.lua**
  - Draws a random block fill pattern using various block characters (`█`, `▓`, `▒`, `░`). Creates a chaotic, pixelated effect.

- **random_half_blocks.lua**
  - Draws a random half-block fill pattern using half-block characters (`▀`, `▄`, `▌`, `▐`). Adds a textured, semi-transparent look.

- **random-colors.lua**
  - Applies random foreground colors while maintaining background. Automatically uses bright on dark backgrounds and dark colors on bright backgrounds for optimal contrast.

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
  - Generates a barcode-like pattern using half-block characters (`▌`, `▐`). Creates realistic-looking barcode effects.

- **rainbow_gradient.lua**
  - Applies a rainbow gradient to the foreground colors (red, yellow, green, cyan, blue, magenta). Creates vibrant effects while preserving characters.

- **grayscale_gradient.lua**
  - Applies a grayscale gradient using white, gray, and dark gray. Ideal for subtle, monochromatic transitions.

- **random_mandala.lua**
  - Generates a symmetrical mandala pattern using block characters. Creates beautiful, randomized mandala designs.

- **date_today.lua**
  - Inserts today's date into the screen

## 🔧 Usage
These plugins work in two modes:
- On a selected area (when you make a selection)
- On the entire workspace (when no selection is made)
- Some plugins use the foreground and background colors that are currently selected

## 🔗 Links
- [IcyDraw GitHub Repository](https://github.com/mkrueger/icy_tools/tree/master/crates/icy_draw) - IcyDraw is a full features ansi drawing tool doing things a bit different than other tools.
- [IcyDraw Compatible Fonts](https://github.com/hellocodelinux/fonts_icy_draw) - Collection of fonts compatible with both THEDRAW (MSDOS) and ICY_DRAW

## 💡 Tips and Idea
- Combine plugins for unique effects
- Use patterns as backgrounds for your artwork
- Experiment with different color combinations

- Share your artwork created with IcyDraw plugins on our Facebook group: [ANSI ASCII Art Community](https://www.facebook.com/groups/ansiascii)
- Get feedback, tips, and inspiration from fellow artists
- Showcase your unique creations and see what others are making with IcyDraw
- Join the conversation and be part of the ANSI art community!

## 🤝 Contribute!

Join our community! If you have an idea for a plugin or want to improve existing ones:

1. Fork the repository
2. Create your plugin
3. Submit a pull request

All contributions are welcome. Together we can make IcyDraw even better!

---
*Created with ❄️ for the ANSI art community*