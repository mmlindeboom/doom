# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Doom Emacs configuration repository using a literate programming approach. The main configuration is written in `config.org` which tangles to `config.el` through org-auto-tangle.

## Essential Commands

### Doom Emacs Management
- `~/.config/emacs/bin/doom sync` - Sync configuration after changes (required after editing packages.el or init.el)
- `~/.config/emacs/bin/doom upgrade` - Upgrade Doom and packages
- `~/.config/emacs/bin/doom doctor` - Check configuration health
- `~/.config/emacs/bin/doom clean` - Clean build cache
- `~/.config/emacs/bin/doom build` - Recompile packages

### Development Workflow
- Tangling config.org to config.el happens automatically on save via `org-auto-tangle`
- Reload configuration in Emacs: `M-x doom/reload` or `SPC h r r`
- Debug issues: Check `*Messages*` buffer or run `doom doctor`

## Architecture

### File Structure
- **config.org**: Primary configuration source - edit this file, not config.el
- **config.el**: Generated from config.org (gitignored)
- **init.el**: Declares which Doom modules are enabled
- **packages.el**: Declares external packages to install
- **custom.el**: Emacs Custom system settings (auto-generated, gitignored)
- **themes/leuven-theme.el**: Custom theme definition

### Configuration Flow
1. `init.el` determines which Doom modules to load
2. `packages.el` declares additional packages beyond Doom's defaults
3. `config.org` contains the main user configuration (tangles to `config.el`)

### Adding New Packages
1. Add package declaration to `packages.el`
2. Add configuration to appropriate section in `config.org` using `#+BEGIN_SRC emacs-lisp` blocks
3. Run `~/.config/emacs/bin/doom sync`
4. Restart Emacs or run `M-x doom/reload`

## Custom Keybindings

### Workspace (Perspective)
- `SPC DEL` - Switch perspective
- `SPC p` - Create new perspective
- `SPC ,` - Switch to buffer in perspective
- `SPC ]` / `SPC [` - Next/previous perspective
- `SPC +` - Add buffer to perspective
- `SPC -` - Remove perspective by name
- `SPC s f` - Save state to file

### Terminal (Multi-vterm)
- `SPC v t` - Toggle vterm popup
- `SPC v m` - Create new vterm
- `SPC v ]` - Next vterm

### Email (Notmuch)
- `SPC o m m` - Open notmuch
- `SPC o m c` - Compose email
- `SPC o m s` - Search email
- `SPC o m S` - Sync email

### Search
- `C-s` - Swiper isearch
- `SPC sw` - Open Swiper
- `SPC sc` - Open counsel-rg

### Org Mode
- `SPC i a` - Insert auto-tangle tag

## Key Custom Features

### Email (Notmuch)
Requires external tools (install via homebrew): `notmuch`, `isync` (provides mbsync), `msmtp`

Configuration files needed (not in repo):
- `~/.mbsyncrc` - IMAP sync configuration
- `~/.msmtprc` - SMTP sending configuration
- `~/.notmuch-config` - Notmuch database settings (run `notmuch setup`)

### LSP Configuration
Uses Eglot (not lsp-mode) with:
- Python: pyright-langserver
- TypeScript: typescript-language-server

### Python Development
- python-black auto-formats on save
- py-isort available for import sorting

## Important Context

- Font: Dank Mono (main), Vollkorn (variable pitch), FantasqueSansM Nerd Font Mono (modeline)
- Theme: doom-leuven with purple modeline (#8c1eff)
- Org directory: `~/org/`
- Uses Evil mode everywhere
- Mixed-pitch mode enabled for text files

### Known Workarounds
- Transient loading workaround for Doom issue #8541 in config.org
