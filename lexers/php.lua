-- Copyright 2006-2011 Mitchell mitchell<att>caladbolg.net. See LICENSE.
-- PHP LPeg lexer

local l = lexer
local token, style, color, word_match = l.token, l.style, l.color, l.word_match
local P, R, S, V = l.lpeg.P, l.lpeg.R, l.lpeg.S, l.lpeg.V

module(...)

local ws = token(l.WHITESPACE, l.space^1)

-- comments
local line_comment = (P('//') + '#') * l.nonnewline^0
local block_comment = '/*' * (l.any - '*/')^0 * P('*/')^-1
local comment = token(l.COMMENT, block_comment + line_comment)

-- strings
local sq_str = l.delimited_range("'", '\\', true)
local dq_str = l.delimited_range('"', '\\', true)
local bt_str = l.delimited_range('`', '\\', true)
local heredoc = '<<<' * P(function(input, index)
  local _, e, delimiter = input:find('([%a_][%w_]*)[\n\r\f]+', index)
  if delimiter then
    local _, e = input:find('[\n\r\f]+'..delimiter, e)
    return e and e + 1
  end
end)
local string = token(l.STRING, sq_str + dq_str + bt_str + heredoc)
-- TODO: interpolated code

-- numbers
local number = token(l.NUMBER, l.float + l.integer)

-- keywords
local keyword = token(l.KEYWORD, word_match {
  'and', 'array', 'as', 'bool', 'boolean', 'break', 'case',
  'cfunction', 'class', 'const', 'continue', 'declare', 'default',
  'die', 'directory', 'do', 'double', 'echo', 'else', 'elseif',
  'empty', 'enddeclare', 'endfor', 'endforeach', 'endif',
  'endswitch', 'endwhile', 'eval', 'exit', 'extends', 'false',
  'float', 'for', 'foreach', 'function', 'global', 'if', 'include',
  'include_once', 'int', 'integer', 'isset', 'list', 'new', 'null',
  'object', 'old_function', 'or', 'parent', 'print', 'real',
  'require', 'require_once', 'resource', 'return', 'static',
  'stdclass', 'string', 'switch', 'true', 'unset', 'use', 'var',
  'while', 'xor', '__class__', '__file__', '__function__',
  '__line__', '__sleep', '__wakeup'
})

-- variables
local word = (l.alpha + '_' + R('\127\255')) * (l.alnum + '_' + R('\127\255'))^0
local variable = token(l.VARIABLE, '$' * word)

-- identifiers
local identifier = token(l.IDENTIFIER, word)

-- operators
local operator = token(l.OPERATOR, S('!@%^*&()-+=|/.,;:<>[]{}') + '?' * -P('>'))

_rules = {
  { 'whitespace', ws },
  { 'keyword', keyword },
  { 'identifier', identifier },
  { 'string', string },
  { 'variable', variable },
  { 'comment', comment },
  { 'number', number },
  { 'operator', operator },
  { 'any_char', l.any_char },
}

-- Embedded in HTML.

local html = l.load('hypertext')

_lexer = html

-- Embedded PHP.
local php_start_rule = token('php_tag', '<?' * ('php' * l.space)^-1)
local php_end_rule = token('php_tag', '?>')
l.embed_lexer(html, _M, php_start_rule, php_end_rule)

-- TODO: embed in CSS and JS

_tokenstyles = {
  { 'php_tag', l.style_embedded },
}
