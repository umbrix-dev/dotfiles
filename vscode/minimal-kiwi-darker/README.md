# Minimal Kiwi Darker

A darker variant of the popular Minimal Kiwi theme for Visual Studio Code. This theme takes the beloved kiwi green aesthetic and deepens the background colors for even better contrast and reduced eye strain during long coding sessions.

## Features

- **Ultra-dark backgrounds** - Main editor uses `#0a0a0a` (even darker than the original `#212121`)
- **Perfect contrast** - Enhanced readability with deeper blacks
- **Signature kiwi green** - Maintains the iconic `#C3E88D` accent color
- **Consistent UI** - All UI elements (sidebar, activity bar, status bar) match the darker aesthetic
- **Eye strain reduction** - Optimized for long coding sessions

## Preview

The theme features:
- Editor background: `#0a0a0a` (ultra dark)
- Sidebar: `#0d0d0d`
- Activity bar: `#080808`
- Kiwi green accents: `#C3E88D`

## Installation

### From VSIX (Local Testing)

1. Download the `.vsix` file
2. Open VS Code
3. Press `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (Mac)
4. Type "Extensions: Install from VSIX"
5. Select the downloaded `.vsix` file
6. Restart VS Code
7. Go to File > Preferences > Color Theme
8. Select "Minimal Kiwi Darker"

### From Marketplace (After Publishing)

1. Open VS Code
2. Press `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (Mac)
3. Type "ext install minimal-kiwi-darker"
4. Install and activate the theme

## Publishing to VS Code Marketplace

### Prerequisites

1. **Create a Microsoft account** (if you don't have one)
2. **Create an Azure DevOps organization**:
   - Go to https://dev.azure.com
   - Sign in with your Microsoft account
   - Create a new organization (it's free)

3. **Generate a Personal Access Token (PAT)**:
   - In Azure DevOps, click your profile icon → Personal access tokens
   - Click "New Token"
   - Name: "VS Code Marketplace"
   - Organization: Select "All accessible organizations"
   - Scopes: Select "Marketplace" → "Manage"
   - Create and **save the token** (you won't see it again!)

4. **Create a publisher**:
   - Go to https://marketplace.visualstudio.com/manage
   - Sign in with your Microsoft account
   - Click "Create publisher"
   - Choose a unique publisher ID (this will be in your extension URL)
   - Fill in the details

### Package and Publish

1. **Install vsce** (VS Code Extension Manager):
   ```bash
   npm install -g @vscode/vsce
   ```

2. **Update package.json**:
   - Change `"publisher"` to your publisher ID
   - Update `"repository"` URL if you have a GitHub repo

3. **Package the extension**:
   ```bash
   vsce package
   ```
   This creates a `.vsix` file you can test locally.

4. **Login to vsce**:
   ```bash
   vsce login YOUR_PUBLISHER_ID
   ```
   Enter your Personal Access Token when prompted.

5. **Publish**:
   ```bash
   vsce publish
   ```

6. **Wait for review** - Microsoft usually reviews extensions within a few hours.

### Updating Your Extension

1. Update the version in `package.json`:
   ```json
   "version": "1.0.1"
   ```

2. Publish the update:
   ```bash
   vsce publish
   ```

Or use version bumping:
```bash
vsce publish patch  # 1.0.0 -> 1.0.1
vsce publish minor  # 1.0.0 -> 1.1.0
vsce publish major  # 1.0.0 -> 2.0.0
```

## Customization

You can further customize colors by:

1. Opening Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`)
2. Searching for "Preferences: Open Settings (JSON)"
3. Adding color overrides:

```json
{
  "workbench.colorCustomizations": {
    "[Minimal Kiwi Darker]": {
      "editor.background": "#000000",  // Even darker if you want
      "sideBar.background": "#050505"
    }
  }
}
```

## Credits

Inspired by the original [Minimal Kiwi](https://marketplace.visualstudio.com/items?itemName=PranjalKumar.minimal-kiwi) theme by Pranjal Kumar.

## License

MIT License - Feel free to fork and modify!

## Support

If you enjoy this theme, consider:
- ⭐ Starring the GitHub repo
- 📝 Leaving a review on the VS Code Marketplace
- 🐛 Reporting issues or suggesting improvements

---

**Enjoy coding in the dark! 🥝**
