-- Copyright 2006-2022 Mitchell. See LICENSE.
-- SciTE theme for Scintillua.

local lexer = require('lexer')
local colors, styles = lexer.colors, lexer.styles

colors.red = '#7F0000'
colors.yellow = '#7F7F00'
colors.green = '#007F00'
colors.teal = '#007F7F'
colors.purple = '#7F007F'
colors.orange = '#B07F00'
colors.blue = '#00007F'
colors.black = '#000000'
colors.grey = '#808080'
colors.white = '#FFFFFF'

-- Default font.
local font = WIN32 and 'Courier New' or OSX and 'Monaco' or 'Monospace'
local size = not OSX and 11 or 12

-- Predefined styles.
styles.default = {
  font = font, size = size, fore = colors.black, back = colors.white
}
styles.line_number = {back = '#C0C0C0'}
styles.brace_light = {fore = '#0000FF', bold = true}
styles.brace_bad = {fore = '#FF0000', bold = true}
styles.control_char = {}
styles.indent_guide = {fore = '#C0C0C0', back = colors.white}
styles.call_tip = {fore = colors.white, back = '#444444'}
styles.fold_display_text = {}

-- Token styles.
styles.class = {fore = colors.black, bold = true}
styles.comment = {fore = colors.green}
styles.constant = {fore = colors.teal, bold = true}
styles.embedded = {fore = colors.blue}
styles.error = {fore = colors.red}
styles['function'] = {fore = colors.black, bold = true}
styles.identifier = {}
styles.keyword = {fore = colors.blue, bold = true}
styles.label = {fore = colors.teal, bold = true}
styles.number = {fore = colors.teal}
styles.operator = {fore = colors.black, bold = true}
styles.preprocessor = {fore = colors.yellow}
styles.regex = lexer.STYLE_STRING
styles.string = {fore = colors.purple}
styles.type = {fore = colors.blue}
styles.variable = {fore = colors.black}
styles.whitespace = {}
