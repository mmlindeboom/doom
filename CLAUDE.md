# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Doom Emacs configuration repository using a literate programming approach. The main configuration is written in `config.org` which tangles to `config.el` through org-auto-tangle.

## Essential Commands

### Doom Emacs Management
- **Sync configuration after changes**: `~/.config/emacs/bin/doom sync`
- **Upgrade Doom and packages**: `~/.config/emacs/bin/doom upgrade`
- **Check configuration health**: `~/.config/emacs/bin/doom doctor`
- **Clean build cache**: `~/.config/emacs/bin/doom clean`
- **Recompile packages**: `~/.config/emacs/bin/doom build`

### Development Workflow
- **Tangle config.org to config.el**: Happens automatically on save via `org-auto-tangle`
- **Reload configuration in Emacs**: `M-x doom/reload` or `SPC h r r`
- **Debug configuration issues**: Check `*Messages*` buffer or run `~/.config/emacs/bin/doom doctor`

## Architecture

### File Structure
- **config.org**: Primary configuration source (literate config that generates config.el)
- **config.el**: Generated from config.org - DO NOT EDIT DIRECTLY, now gitignored
- **init.el**: Declares which Doom modules are enabled
- **packages.el**: Declares external packages to install
- **custom.el**: Emacs Custom system settings (auto-generated, now gitignored)

### Configuration Flow
1. `init.el` determines which Doom modules to load
2. `packages.el` declares additional packages beyond Doom's defaults
3. `config.org` contains the main user configuration (tangles to `config.el`)

## Key Custom Features

### Email (Notmuch)
Fast, tag-based email client configured with:
- Notmuch module enabled with Org mode support
- mbsync backend for IMAP synchronization
- msmtp for sending mail
- Custom saved searches for inbox, unread, flagged, sent, drafts
- Keybindings under Leader + o m (mail operations)

**Required external tools** (install via homebrew):
- `notmuch` - Email indexing and search
- `isync` (provides mbsync) - IMAP synchronization
- `msmtp` - SMTP mail sending

**Configuration files needed** (not in repo):
- `~/.mbsyncrc` - IMAP sync configuration
- `~/.msmtprc` - SMTP sending configuration
- `~/.notmuch-config` - Notmuch database settings (run `notmuch setup`)

### Workspace Management
Uses `perspective` package for project-based workspace isolation:
- Leader key + DEL: Switch perspective
- Leader key + p: Create new perspective
- Workspaces auto-save/resume on restart

### Terminal Integration
Multi-vterm configured with Evil mode compatibility:
- Leader + v t: Toggle vterm popup
- Leader + v m: Create new vterm
- Custom keybindings preserve terminal control sequences

## Development Notes

### Adding New Packages
1. Add package declaration to `packages.el`
2. Add configuration to appropriate section in `config.org`
3. Run `~/.config/emacs/bin/doom sync`
4. Restart Emacs or run `M-x doom/reload`

### Modifying Configuration
- Edit `config.org` (not `config.el` directly)
- Changes auto-tangle on save due to `org-auto-tangle`
- Use `#+BEGIN_SRC emacs-lisp` blocks for code
- Organize with Org headings for structure

### LSP Configuration
Uses Eglot (not lsp-mode) with servers configured for:
- Python: pyright-langserver
- TypeScript: typescript-language-server
- Additional languages via Doom's +eglot flag

## Important Context

- Font: Dank Mono (main), Vollkorn (variable pitch)
- Theme: Custom doom-leuven with purple modeline (#8c1eff)
- Org directory: `~/org/`
- Uses Evil mode everywhere for vi-style editing
- Mixed-pitch mode enabled for text files
- AI tools: Claude Code package configured