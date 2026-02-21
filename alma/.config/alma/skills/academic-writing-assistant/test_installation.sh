#!/bin/bash
echo "Testing Academic Writing Assistant skill installation..."
echo "Skill directory: $(pwd)"
echo ""
echo "Files found:"
find . -type f -name "*.md" -o -name "*.json" -o -name "*.tex" | sort
echo ""
echo "Installation appears to be complete!"
