package.loaded['po2mood.palette'] = nil
local p = require('po2mood.palette')

vim.cmd.highlight('clear')
vim.o.background = 'light'
vim.g.colors_name = 'po2mood'

local groups = {
  -- base text
  Normal = { fg = p.fg, bg = p.bg },
  NormalFloat = { fg = p.fg, bg = p.bg_alt },
  FloatBorder = { fg = p.border, bg = p.bg_alt },
  Bold = { bold = true },
  Italic = { italic = true },
  Underlined = { underline = true },
  Directory = { bold = true },
  Title = { bold = true },
  Conceal = {},
  NonText = {},
  EndOfBuffer = {},

  -- soft text
  Comment = { fg = p.comment },
  LineNr = { fg = p.comment },
  CursorLineNr = { fg = p.comment },
  FoldColumn = { fg = p.fg },
  SignColumn = { fg = p.fg },

  -- bars and menus
  StatusLine = { fg = p.fg, bg = p.bg, reverse = true },
  StatusLineNC = { fg = p.fg, bg = p.bg_alt },
  StatusLineTerm = { link = 'StatusLine' },
  StatusLineTermNC = { link = 'StatusLineNC' },
  TabLine = { fg = p.fg, bg = p.bg_alt },
  TabLineSel = { fg = p.fg, bg = p.bg, reverse = true },
  TabLineFill = { fg = p.bg_alt, bg = p.bg_alt },
  WinBar = { link = 'StatusLine' },
  WinBarNC = { link = 'StatusLineNC' },
  Pmenu = { fg = p.fg, bg = p.bg_alt },
  PmenuSel = { fg = p.fg, bg = p.bg, reverse = true },
  PmenuSbar = { bg = p.border },
  PmenuThumb = { bg = p.fg },
  WildMenu = { fg = p.fg, bg = p.bg_alt },
  ToolbarButton = { fg = p.fg, bg = p.bg_alt, bold = true },
  ToolbarLine = { bg = p.bg_alt },
  VertSplit = { fg = p.border, bg = p.border },
  WinSeparator = { fg = p.border },

  -- cursor and highlights
  Cursor = { fg = p.fg_strong, bg = p.bg, reverse = true },
  ColorColumn = { bg = p.bg_alt },
  CursorColumn = { bg = p.bg_alt },
  CursorLine = { bg = p.bg_alt },
  Folded = { bg = p.bg_alt },
  QuickFixLine = { bg = p.bg_alt },
  MatchParen = { fg = p.fg_strong, bg = p.border },
  Visual = { fg = p.blue, bg = p.bg, reverse = true },
  VisualNOS = { fg = p.comment, bg = p.bg, reverse = true },
  Search = { fg = p.search, bg = p.fg_strong, reverse = true },
  CurSearch = { link = 'IncSearch' },
  IncSearch = { fg = p.fg_strong, bg = p.bg, reverse = true },
  Substitute = { link = 'Search' },

  -- spelling
  SpellBad = { sp = p.spell_red, undercurl = true },
  SpellCap = { sp = p.spell_blue, undercurl = true },
  SpellLocal = { sp = p.spell_cyan, undercurl = true },
  SpellRare = { sp = p.spell_magenta, undercurl = true },

  -- syntax
  Type = { fg = p.magenta },
  StorageClass = { link = 'Type' },
  Structure = { link = 'Type' },
  Typedef = { link = 'Type' },
  Identifier = { fg = p.red },
  Function = { fg = p.red },
  Special = { fg = p.gold },
  Debug = { link = 'Special' },
  Delimiter = { link = 'Special' },
  SpecialChar = { link = 'Special' },
  SpecialComment = { link = 'Special' },
  SpecialKey = { link = 'Special' },
  Tag = { link = 'Special' },
  Statement = { fg = p.green },
  Conditional = { link = 'Statement' },
  Exception = { link = 'Statement' },
  Keyword = { link = 'Statement' },
  Label = { link = 'Statement' },
  Operator = { link = 'Statement' },
  Repeat = { link = 'Statement' },
  PreProc = { fg = p.cyan },
  Define = { link = 'PreProc' },
  Include = { link = 'PreProc' },
  Macro = { link = 'PreProc' },
  PreCondit = { link = 'PreProc' },
  Constant = { fg = p.blue },
  Boolean = { link = 'Constant' },
  Character = { link = 'Constant' },
  Float = { link = 'Constant' },
  Number = { link = 'Constant' },
  String = { link = 'Constant' },
  Todo = { fg = p.cyan, bg = p.bg, reverse = true },

  -- messages
  Error = { fg = p.red, bg = p.bg, reverse = true },
  ErrorMsg = { link = 'Error' },
  WarningMsg = { fg = p.magenta, bg = p.bg, reverse = true },
  TooLong = { link = 'WarningMsg' },
  ModeMsg = {},
  MoreMsg = {},
  Question = {},

  -- diffs
  DiffAdd = { fg = p.green, bg = p.bg, reverse = true },
  DiffChange = { bg = p.bg_alt },
  DiffDelete = { fg = p.red, bg = p.bg, reverse = true },
  DiffText = { fg = p.gold, bg = p.bg, reverse = true },
  DiffAdded = { link = 'DiffAdd' },
  DiffChanged = { link = 'DiffText' },
  DiffRemoved = { link = 'DiffDelete' },
  Added = { fg = p.green },
  Changed = { fg = p.gold },
  Removed = { fg = p.red },

  -- diagnostics
  DiagnosticError = { fg = p.red },
  DiagnosticWarn = { fg = p.magenta },
  DiagnosticInfo = { fg = p.blue },
  DiagnosticHint = { fg = p.cyan },
  DiagnosticOk = { fg = p.green },
  DiagnosticUnderlineError = { sp = p.red, undercurl = true },
  DiagnosticUnderlineWarn = { sp = p.magenta, undercurl = true },
  DiagnosticUnderlineInfo = { sp = p.blue, undercurl = true },
  DiagnosticUnderlineHint = { sp = p.cyan, undercurl = true },
  DiagnosticUnderlineOk = { sp = p.green, undercurl = true },
  DiagnosticUnnecessary = { fg = p.comment },
  DiagnosticDeprecated = { strikethrough = true },

  -- lsp
  LspReferenceText = { bg = p.bg_alt },
  LspReferenceRead = { bg = p.bg_alt },
  LspReferenceWrite = { bg = p.bg_alt },
  LspInlayHint = { fg = p.comment, bg = p.bg_alt },

  -- treesitter: the rest falls back to the syntax groups above via default links
  ['@variable'] = { fg = p.fg },
}

for name, spec in pairs(groups) do
  vim.api.nvim_set_hl(0, name, spec)
end

local term = {
  p.bg, p.red, p.green, p.gold, p.blue, p.magenta, p.cyan, p.fg,
  p.comment, p.red, p.green, p.gold, p.blue, p.magenta, p.cyan, p.fg_strong,
}
for i, color in ipairs(term) do
  vim.g['terminal_color_' .. (i - 1)] = color
end
