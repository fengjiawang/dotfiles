#!/bin/bash
# Agent Skills Validation Script
# Checks if the skill complies with Agent Skills specification

echo "=== Agent Skills Validation Check ==="
echo "Checking skill: academic-writing-assistant"
echo ""

# Check 1: SKILL.md exists
if [ -f "SKILL.md" ]; then
    echo "✓ SKILL.md file exists"
else
    echo "✗ SKILL.md file missing"
    exit 1
fi

# Check 2: YAML frontmatter in SKILL.md
if head -1 SKILL.md | grep -q "---"; then
    echo "✓ YAML frontmatter detected"
else
    echo "✗ No YAML frontmatter found"
fi

# Check 3: Required fields in frontmatter
REQUIRED_FIELDS=("name:" "description:")
for field in "${REQUIRED_FIELDS[@]}"; do
    if grep -q "$field" SKILL.md; then
        echo "✓ Required field found: $field"
    else
        echo "✗ Missing required field: $field"
    fi
done

# Check 4: Name format (lowercase, hyphens)
SKILL_NAME=$(grep -E "^name:" SKILL.md | head -1 | sed 's/name: //' | tr -d '[:space:]')
if [[ $SKILL_NAME =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    echo "✓ Skill name format valid: $SKILL_NAME"
else
    echo "✗ Skill name format invalid: $SKILL_NAME"
fi

# Check 5: Description length
DESC_LENGTH=$(grep -E "^description:" SKILL.md -A1 | tail -1 | wc -m)
if [ $DESC_LENGTH -le 1024 ]; then
    echo "✓ Description length OK ($DESC_LENGTH chars)"
else
    echo "✗ Description too long ($DESC_LENGTH chars, max 1024)"
fi

# Check 6: Directory name matches skill name
DIR_NAME=$(basename $(pwd))
if [ "$DIR_NAME" = "$SKILL_NAME" ]; then
    echo "✓ Directory name matches skill name: $DIR_NAME"
else
    echo "⚠ Directory name ($DIR_NAME) doesn't match skill name ($SKILL_NAME)"
fi

# Check 7: Optional directories
OPTIONAL_DIRS=("scripts" "references" "assets")
for dir in "${OPTIONAL_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "✓ Optional directory exists: $dir/"
    else
        echo "○ Optional directory not present: $dir/"
    fi
done

echo ""
echo "=== Validation Summary ==="
echo "Skill appears to comply with Agent Skills specification."
echo "Note: This is a basic check. For full validation, refer to"
echo "the official Agent Skills specification at agentskills.io"
