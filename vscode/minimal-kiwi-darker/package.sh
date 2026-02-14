#!/bin/bash

echo "🥝 Minimal Kiwi Darker - Setup & Package Script"
echo "================================================"
echo ""

# Check if vsce is installed
if ! command -v vsce &> /dev/null
then
    echo "vsce is not installed. Installing now..."
    npm install -g @vscode/vsce
    echo "vsce installed successfully!"
else
    echo "vsce is already installed"
fi

echo ""
echo "Packaging extension..."
vsce package

if [ $? -eq 0 ]; then
    echo ""
    echo "Extension packaged successfully!"
    echo ""
    echo ""
    echo "Now: Install the .vsix file in VS Code"
    echo "   - Open VS Code"
    echo "   - Press Ctrl+Shift+P (Cmd+Shift+P on Mac)"
    echo "   - Type: 'Extensions: Install from VSIX'"
    echo "   - Select the .vsix file"
    echo ""
    echo "VSIX file created:"
    ls -lh *.vsix
else
    echo "Packaging failed. Check the errors above."
fi
