# Claude Code Configuration Backup

This directory contains a **safe backup** of Claude Code configuration files, excluding sensitive data.

## 📁 Included Files

### ✅ Safe to backup & share:
- `CLAUDE.md` - User instructions and preferences
- `settings.json` - Global Claude Code settings (hooks, MCP servers)
- `agents/` - Custom agent definitions 
- `commands/` - Custom slash commands
- `.gitignore` - Excludes sensitive data

### ❌ Excluded (sensitive data):
- `settings.local.json` - Local overrides (may contain tokens)
- `todos/` - Session data with UUIDs
- `shell-snapshots/` - Command history (may contain secrets)
- `statsig/` - Usage analytics
- `projects/` - Project-specific configs (may contain API keys)
- `ide/` - IDE cache and temporary data

## 🔄 Usage

### Restore configuration:
```bash
# Copy safe configs back
cp -r ~/.dotfiles/.claude/agents ~/.claude/
cp -r ~/.dotfiles/.claude/commands ~/.claude/
cp ~/.dotfiles/.claude/CLAUDE.md ~/.claude/
cp ~/.dotfiles/.claude/settings.json ~/.claude/

# Note: settings.local.json should be configured manually
```

### Update backup:
```bash
~/backup-claude-config.sh
```

## 🔐 Security Notes

- **Never commit** `settings.local.json` or any files with API tokens
- **Review** `settings.json` before sharing - may contain server URLs
- **Regenerate** API tokens if accidentally exposed
- **Use** `.env` files for secrets, not config files

## 📋 MCP Servers in settings.json

Current configured servers (tokens removed):
- serena (code analysis)
- sequentialthinking (reasoning tools)  
- context7 (conversation management)
- github (repository management) - **TOKEN REQUIRED**
- notion (database management) - **OAuth required**
- obsidian (vault management) - **API KEY REQUIRED**

