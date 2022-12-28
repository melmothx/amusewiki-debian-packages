--
-- This is file `ecclesiasticlatin.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- latin.dtx  (with options: `lua')
-- 
-- The original version of the following Lua code has been written for the
-- polyglossia package by É. Roux and others. The code has been adapted for
-- the babel-latin package by K. Wehr.
-- 
-- Copyright (C) 2021      by Keno Wehr
-- All rights reserved.
-- 
-- This file is part of the babel-latin package.
-- ----------------------------------------------
-- 
-- It may be distributed and/or modified under the
-- conditions of the LaTeX Project Public License, either version 1.3
-- of this license or (at your option) any later version.
-- The latest version of this license is in
--   http://www.latex-project.org/lppl.txt
-- and version 1.3 or later is part of all distributions of LaTeX
-- version 2003/12/01 or later.
-- 
-- This work has the LPPL maintenance status "maintained".
-- 
-- The Current Maintainer of this work is Keno Wehr.
-- 
-- Please report errors to: https://github.com/wehro/babel-latin/issues
-- 
luatexbase.provides_module({
    name        = "ecclesiasticlatin",
    date        = "2021-06-27",
    version     = "4.0",
    description = "babel-latin punctuation spacing for ecclesiastic Latin"
})
local add_to_callback     = luatexbase.add_to_callback
local in_callback         = luatexbase.in_callback
local new_attribute       = luatexbase.new_attribute
local node                = node
local insert_node_before  = node.insert_before
local insert_node_after   = node.insert_after
local remove_node         = node.remove
local has_attribute       = node.has_attribute
local node_copy           = node.copy
local new_node            = node.new
local end_of_math         = node.end_of_math
local get_next            = node.getnext
local get_prev            = node.getprev
local get_property        = node.getproperty
local glue_code    = node.id"glue"
local glyph_code   = node.id"glyph"
local penalty_code = node.id"penalty"
local kern_code    = node.id"kern"
local math_code    = node.id"math"
local userkern = 1
local removable_skip = {
    [0]  = true, -- userskip
    [13] = true, -- spaceskip
    [14] = true  -- xspaceskip
}
local kern_node   = new_node(kern_code)
kern_node.subtype = userkern
local function get_kern_node(dim)
    local n = node_copy(kern_node)
    n.kern = dim
    return n
end
local space_chars = {
    [0x20] = true,   -- space
    [0xA0] = true,   -- no-break space
    [0x1680] = true, -- ogham space mark
    [0x2000] = true, -- en quad
    [0x2001] = true, -- em quad
    [0x2002] = true, -- en space
    [0x2003] = true, -- em space
    [0x2004] = true, -- three-per-em-space
    [0x2005] = true, -- four-per-em space
    [0x2006] = true, -- six-per-em space
    [0x2007] = true, -- figure space
    [0x2008] = true, -- punctuation space
    [0x2009] = true, -- thin space
    [0x200A] = true, -- hair space
    [0x202F] = true, -- narrow no-break space
    [0x205F] = true, -- medium mathematical space
    [0x3000] = true  -- ideographic space
}
local left_bracket_chars = {
    [0x28] = true,  -- left parenthesis
    [0x5B] = true,  -- left square bracket
    [0x7B] = true,  -- left curly bracket
    [0x27E8] = true -- mathematical left angle bracket
}
local right_bracket_chars = {
    [0x29] = true,  -- right parenthesis
    [0x5D] = true,  -- right square bracket
    [0x7D] = true,  -- right curly bracket
    [0x27E9] = true -- mathematical right angle bracket
}
local question_exclamation_chars = {
    [0x21] = true,   -- exclamation mark !
    [0x3F] = true,   -- question mark ?
    [0x203C] = true, -- double exclamation mark ‼
    [0x203D] = true, -- interrobang ‽
    [0x2047] = true, -- double question mark ⁇
    [0x2048] = true, -- question exclamation mark ⁈
    [0x2049] = true  -- exclamation question mark ⁉
}
local function somespace(n)
    if n then
        local id, subtype = n.id, n.subtype
        if id == glue_code then
            return removable_skip[subtype]
        elseif id == kern_code then
            return subtype == userkern
        elseif id == glyph_code then
            return space_chars[n.char]
        end
    end
end
local function someleftbracket(n)
    if n then
        local id = n.id
        if id == glyph_code then
            return left_bracket_chars[n.char]
        end
    end
end
local function somerightbracket(n)
    if n then
        local id = n.id
        if id == glyph_code then
            return right_bracket_chars[n.char]
        end
    end
end
local function question_exclamation_sequence(n1, n2)
    if n1 and n2 then
        local id1 = n1.id
        local id2 = n2.id
        if id1 == glyph_code and id2 == glyph_code then
            return question_exclamation_chars[n1.char] and question_exclamation_chars[n2.char]
        end
    end
end
local function somepenalty(n, value)
    if n then
        local id = n.id
        if id == penalty_code then
            if value then
                return n.penalty == value
            else
                return true
            end
        end
    end
end
local punct_attr = new_attribute("ecclesiasticlatin_punct")
local left_space  = {}
local right_space = {}
local function process(head)
    local current = head
    while current do
        local id = current.id
        if id == glyph_code then
            if has_attribute(current, punct_attr) then
                local char = get_property(current) and get_property(current).glyph_info
                if not char and current.char <= 0x10FFFF then
                    char = utf8.char(current.char)
                end
                local leftspace, rightspace
                if char then
                    leftspace  = left_space[char]
                    rightspace = right_space[char]
                end
                if leftspace or rightspace then
                    local fontparameters = fonts.hashes.parameters[current.font]
                    local spacing_node
                    if leftspace and fontparameters then
                        local prev = get_prev(current)
                        local space_exception = false
                        if prev then
                            space_exception = someleftbracket(prev)
                                              or question_exclamation_sequence(prev, current)
                            while somespace(prev) do
                                head = remove_node(head, prev)
                                prev = get_prev(current)
                            end
                            if somepenalty(prev, 10000) then
                                head = remove_node(head, prev)
                            end
                        end
                        spacing_node = get_kern_node(leftspace * fontparameters.quad)
                        if not space_exception then
                            head = insert_node_before(head, current, spacing_node)
                        end
                    end
                    if rightspace and fontparameters then
                        local next = get_next(current)
                        local space_exception = false
                        if next then
                            space_exception = somerightbracket(next)
                            local nextnext = get_next(next)
                            if somepenalty(next, 10000) and somespace(nextnext) then
                                head, next = remove_node(head, next)
                            end
                            while somespace(next) do
                                head, next = remove_node(head, next)
                            end
                        end
                        spacing_node = get_kern_node(rightspace * fontparameters.quad)
                        if not space_exception then
                            head, current = insert_node_after(head, current, spacing_node)
                        end
                    end
                end
            end
        elseif id == math_code then
            current = end_of_math(current)
        end
        current = get_next(current)
    end
    return head
end
local hairspace = 0.08333 -- 1/12
local function space_left(char)
    left_space[char] = hairspace
end
local function space_right(char, kern)
    right_space[char] = hairspace
end
space_left('!')
space_left('?')
space_left('‼')
space_left('⁇')
space_left('⁈')
space_left('⁉')
space_left('‽') -- U+203D (interrobang)
space_left(':')
space_left(';')
space_left('»')
space_left('›')
space_right('«')
space_right('‹')
local function activate()
    tex.setattribute(punct_attr, 1)
    for _, callback_name in ipairs{ "pre_linebreak_filter", "hpack_filter" } do
        if not in_callback(callback_name, "ecclesiasticlatin-punct.process") then
            add_to_callback(callback_name, process, "ecclesiasticlatin-punct.process", 1)
        end
    end
end
local function deactivate()
    tex.setattribute(punct_attr, -0x7FFFFFFF) -- this value means "unset"
end
ecclesiasticlatin = ecclesiasticlatin or {}
ecclesiasticlatin.activate_spacing   = activate
ecclesiasticlatin.deactivate_spacing = deactivate
