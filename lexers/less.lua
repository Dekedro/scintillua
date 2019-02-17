-- Copyright 2006-2019 Robert Gieseke. See LICENSE.
-- Less CSS LPeg lexer.
-- http://lesscss.org

local lexer = require('lexer')
local token = lexer.token
local S = lpeg.S

local lex = lexer.new('less', {inherit = lexer.load('css')})

-- Line comments.
lex:add_rule('line_comment', token(lexer.COMMENT, '//' * lexer.nonnewline^0))

-- Variables.
lex:add_rule('variable', token(lexer.VARIABLE, '@' *
                                               (lexer.alnum + S('_-{}'))^1))

-- Fold points.
lex:add_fold_point(lexer.COMMENT, '//', lexer.fold_line_comments('//'))

return lex
