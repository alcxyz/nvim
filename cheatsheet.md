# Vim & Neovim Cheatsheet

## I. Navigation

### Line

| Command | Description |
|---------|-------------|
| `0` | Absolute beginning of line |
| `^` | First non-whitespace character |
| `$` | End of line |
| `g$` | End of display line (when wrap is on) |
| `I` | Insert at first non-whitespace (`^` + `i`) |
| `A` | Append at end of line (`$` + `a`) |

### Word

| Command | Description |
|---------|-------------|
| `w` / `W` | Next word / WORD start |
| `b` / `B` | Previous word / WORD start |
| `e` / `E` | End of word / WORD |
| `ge` | End of previous word |

### Paragraph / Sentence

| Command | Description |
|---------|-------------|
| `{` / `}` | Previous / next paragraph (blank line separated) |
| `(` / `)` | Previous / next sentence |

### Code Blocks

| Command | Description |
|---------|-------------|
| `%` | Jump to matching `()` `[]` `{}` |
| `[[` / `]]` | Previous / next top-level block start |
| `[]` / `][` | Previous / next top-level block end |
| `[{` / `]}` | Previous / next unmatched `{` / `}` |

### File / Screen

| Command | Description |
|---------|-------------|
| `gg` / `G` | Top / bottom of file |
| `{n}G` | Go to line n |
| `Ctrl-d` / `Ctrl-u` | Half page down / up |
| `Ctrl-f` / `Ctrl-b` | Full page down / up |
| `H` / `M` / `L` | Top / middle / bottom of screen |
| `zz` / `zt` / `zb` | Center / top / bottom cursor on screen |

### Jumps & Marks

| Command | Description |
|---------|-------------|
| `Ctrl-o` / `Ctrl-i` | Jump back / forward in jumplist |
| `m{a-z}` | Set local mark |
| `'{a-z}` | Jump to mark (line) |
| `` `{a-z} `` | Jump to mark (exact position) |
| `m{A-Z}` | Set global mark (across files) |
| `` `. `` | Jump to last edit position |
| `''` | Jump to position before last jump |
| `gd` / `gD` | Go to local / global definition |

---

## II. Editing

### Text Objects

Format: `{operator}{a|i}{object}` — `a` = around (includes delimiters), `i` = inner (excludes delimiters)

| Object | Description |
|--------|-------------|
| `w` / `W` | word / WORD |
| `s` | sentence |
| `p` | paragraph |
| `"` `'` `` ` `` | quoted strings |
| `(` `)` `b` | parentheses block |
| `{` `}` `B` | braces block |
| `[` `]` | brackets block |
| `<` `>` | angle brackets |
| `t` | HTML/XML tag |

Examples: `ciw` (change inner word), `da"` (delete around quotes), `yi{` (yank inner braces)

### Operators

| Command | Description |
|---------|-------------|
| `d` | Delete |
| `c` | Change (delete + insert mode) |
| `y` | Yank (copy) |
| `>` / `<` | Indent / dedent |
| `=` | Auto-indent |
| `gU` / `gu` / `g~` | Uppercase / lowercase / toggle case |

### Common Combos

| Command | Description |
|---------|-------------|
| `dd` / `cc` / `yy` | Delete / change / yank entire line |
| `D` / `C` | Delete / change to end of line |
| `x` / `X` | Delete char forward / backward |
| `r{char}` | Replace single char |
| `R` | Enter replace mode |
| `J` | Join line below to current |
| `o` / `O` | Open line below / above |
| `.` | Repeat last change |
| `u` / `Ctrl-r` | Undo / redo |

### Surround (mini.surround)

| Command | Description |
|---------|-------------|
| `saiw)` | **Add** surround: inner word with `()` |
| `sd'` | **Delete** surrounding `'` |
| `sr)'` | **Replace** surrounding `)` with `'` |

### Case Manipulation

| Command | Description |
|---------|-------------|
| `gUw` / `guw` / `g~w` | Uppercase / lowercase / toggle word |
| `gUU` / `guu` | Uppercase / lowercase entire line |
| `~` | Toggle case of char under cursor |
| Visual + `U` / `u` / `~` | Uppercase / lowercase / toggle selection |

---

## III. Visual Mode

| Command | Description |
|---------|-------------|
| `v` | Character-wise selection |
| `V` | Line-wise selection |
| `Ctrl-v` | Block (column) selection |
| `gv` | Reselect last visual selection |
| `o` | Jump to other end of selection |

---

## IV. Search & Replace

| Command | Description |
|---------|-------------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` / `N` | Next / previous match |
| `*` / `#` | Search word under cursor forward / backward |
| `:s/old/new/g` | Replace in current line |
| `:%s/old/new/g` | Replace in entire file |
| `:%s/old/new/gc` | Replace with confirmation |

---

## V. Registers

| Command | Description |
|---------|-------------|
| `"{reg}y` | Yank into register (a-z) |
| `"{reg}p` | Paste from register |
| `"0p` | Paste last yank (not delete) |
| `"+y` / `"+p` | System clipboard yank / paste |
| `:reg` | View all registers |
| `"_d` | Delete to black hole (no register) |

---

## VI. Macros

| Command | Description |
|---------|-------------|
| `q{a-z}` | Start recording macro into register |
| `q` | Stop recording |
| `@{a-z}` | Play macro |
| `@@` | Replay last macro |
| `{n}@{a-z}` | Play macro n times |

---

## VII. Windows & Buffers

| Command | Description |
|---------|-------------|
| `Ctrl-w s` / `Ctrl-w v` | Split horizontal / vertical |
| `Ctrl-h/j/k/l` | Move focus between windows (config keymap) |
| `Ctrl-w =` | Equalize window sizes |
| `Ctrl-w _` / `Ctrl-w \|` | Maximize height / width |
| `Ctrl-w q` | Close window |
| `:bn` / `:bp` | Next / previous buffer |
| `<Space><Space>` | Find existing buffers (telescope) |

---

## VIII. Plugin Keymaps (This Config)

### Leader = Space

### Telescope (Search)

| Keymap | Description |
|--------|-------------|
| `<Space>sf` | Search files |
| `<Space>sg` | Search by grep (live) |
| `<Space>sw` | Search current word |
| `<Space>sh` | Search help tags |
| `<Space>sk` | Search keymaps |
| `<Space>sd` | Search diagnostics |
| `<Space>sr` | Resume last search |
| `<Space>s.` | Search recent files |
| `<Space>s/` | Grep in open files |
| `<Space>sn` | Search neovim config files |
| `<Space>/` | Fuzzy search in current buffer |

### LSP

| Keymap | Description |
|--------|-------------|
| `grn` | Rename symbol |
| `gra` | Code action |
| `grr` | Find references |
| `gri` | Go to implementation |
| `grd` | Go to definition |
| `grD` | Go to declaration |
| `grt` | Go to type definition |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `<Space>th` | Toggle inlay hints |
| `<Space>q` | Open diagnostic quickfix list |

### Git

| Keymap | Description |
|--------|-------------|
| `<Space>hb` | Git blame line (gitsigns) |
| `<Space>hd` | Diff against index (gitsigns) |

### Formatting

| Keymap | Description |
|--------|-------------|
| `<Space>f` | Format buffer |
| Auto on save | Enabled (except C/C++) |

---

## IX. Motions Reference

These work with any operator (`d`, `c`, `y`, `gU`, `>`, etc.):

| Motion | Description |
|--------|-------------|
| `w` / `b` / `e` | Word boundaries |
| `W` / `B` / `E` | WORD boundaries (whitespace-delimited) |
| `f{c}` / `F{c}` | Find char forward / backward (inclusive) |
| `t{c}` / `T{c}` | Till char forward / backward (exclusive) |
| `;` / `,` | Repeat last f/F/t/T forward / backward |
| `{n}j` / `{n}k` | n lines down / up |
| `gg` / `G` | Start / end of file |
| `{` / `}` | Paragraph boundaries |
| `iw` / `aw` | Inner / around word |
| `i"` / `a"` | Inner / around quotes |
| `i(` / `a(` | Inner / around parens |
| `i{` / `a{` | Inner / around braces |
| `it` / `at` | Inner / around HTML tag |
| `ip` / `ap` | Inner / around paragraph |
