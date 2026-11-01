-- po2mood palette: the single source of truth for every integration.
-- Values are inherited unchanged from nightsense/rusticated.
return {
  bg        = '#d3d2ce', -- background
  bg_alt    = '#c3c0ba', -- cursorline, popups, inactive bars
  border    = '#989387', -- separators, matching parens
  comment   = '#5f5a4c', -- comments, line numbers
  fg        = '#444136', -- normal text
  fg_strong = '#312d23', -- cursor, bright white
  search    = '#bca964', -- search highlight

  red       = '#834742', -- identifiers, functions, errors
  gold      = '#645826', -- specials, delimiters
  green     = '#2c633f', -- statements, keywords
  cyan      = '#006470', -- preprocessor, todos
  blue      = '#3c5a89', -- constants, strings, selection
  magenta   = '#784872', -- types, warnings

  spell_red     = '#90001b',
  spell_blue    = '#004ba9',
  spell_cyan    = '#005a76',
  spell_magenta = '#800c78',
}
