-- po2mood palette: the single source of truth for every integration.
--
-- Colors are CIE LCh(ab) with lightness L = 100 * 0.618^e, as in
-- nightsense/rusticated. Grays use hue 90; accents share one lightness and
-- chroma and differ only in hue (30, 90, 150, 210, 270, 330).
-- Contrast ratios are WCAG 2 ratios against `bg`.
return {
  bg        = '#dedcd8', -- e=0.27, lightest bg keeping every accent >= 5:1
  bg_alt    = '#cccac4', -- 1.2:1   cursorline, popups, inactive bars
  search    = '#c7b46e', -- 1.5:1   search highlight
  border    = '#a19c90', -- 2:1     separators, matching parens
  comment   = '#595446', -- 5.5:1   comments, line numbers, ANSI bright black
  fg        = '#444136', -- 7.5:1   normal text
  fg_strong = '#312d23', -- 10:1    cursor, ANSI bright white

  red       = '#834742', -- 5.2:1   identifiers, functions, errors
  gold      = '#645826', -- 5.2:1   specials, delimiters
  green     = '#2c633f', -- 5.2:1   statements, keywords
  cyan      = '#006470', -- 5.0:1   preprocessor, todos
  blue      = '#3c5a89', -- 5.1:1   constants, strings, selection
  magenta   = '#784872', -- 5.2:1   types, warnings

  spell_red     = '#90001b',
  spell_blue    = '#004ba9',
  spell_cyan    = '#005a76',
  spell_magenta = '#800c78',
}
