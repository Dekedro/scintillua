-- Copyright 2007-2022 Mitchell. See LICENSE.
-- Curses theme for Lua lexers.
-- Contributions by Ana Balan.

local lexer = require('lexer')
local colors, styles = lexer.colors, lexer.styles

-- Normal colors.
colors.black = '#000000'
colors.red = '#800000'
colors.green = '#008000'
colors.yellow = '#808000'
colors.blue = '#000080'
colors.magenta = '#800080'
colors.cyan = '#008080'
colors.white = '#C0C0C0'

-- Light colors. (16 color terminals only.)
-- These only apply to 16 color terminals. For other terminals, set the style's `bold` attribute
-- to use the light color variant.
colors.light_black = '#404040'
colors.light_red = '#FF0000'
colors.light_green = '#00FF00'
colors.light_yellow = '#FFFF00'
colors.light_blue = '#0000FF'
colors.light_magenta = '#FF00FF'
colors.light_cyan = '#0000FF'
colors.light_white = '#FFFFFF'

-- Predefined styles.
styles.default = {fore = colors.white, back = colors.black}
styles.line_number = {fore = colors.black, bold = true}
styles.brace_light = {fore = colors.black, back = colors.white}
styles.control_char = {}
styles.indent_guide = {}
styles.call_tip = {}
styles.fold_display_text = {fore = colors.black, bold = true}

-- Token styles.
styles.class = {fore = colors.yellow}
styles.comment = {fore = colors.black, bold = true}
styles.constant = {fore = colors.red}
styles.embedded = {fore = colors.white, bold = true, back = colors.black}
styles.error = {fore = colors.red, bold = true}
styles['function'] = {fore = colors.blue}
styles.identifier = {}
styles.keyword = {fore = colors.white, bold = true}
styles.label = {fore = colors.red, bold = true}
styles.number = {fore = colors.cyan}
styles.operator = {fore = colors.yellow}
styles.preprocessor = {fore = colors.magenta}
styles.regex = {fore = colors.green, bold = true}
styles.string = {fore = colors.green}
styles.type = {fore = colors.magenta, bold = true}
styles.variable = {fore = colors.blue, bold = true}
styles.whitespace = {}

