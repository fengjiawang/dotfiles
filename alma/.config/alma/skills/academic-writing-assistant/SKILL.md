---
name: academic-writing-assistant
description: English academic paper writing assistant specialized for atmospheric science research, particularly dust aerosol effects on Indian summer monsoon, with ACP journal formatting support.
license: MIT
compatibility: Alma AI Assistant, requires LaTeX knowledge for full template usage
metadata:
  author: Alma AI Assistant
  version: "1.1.0"
  category: academic-writing
  target-journal: ACP
  research-field: atmospheric-science
  specialization: dust-aerosol indian-summer-monsoon
allowed-tools: WebSearch WebFetch Bash Read Write Edit
---

# Academic Writing Assistant for Atmospheric Science

## Overview

This skill provides specialized assistance for English academic paper writing in atmospheric science, with particular focus on dust aerosol effects on Indian summer monsoon research. It is optimized for ACP (Atmospheric Chemistry and Physics) journal formatting and requirements.

## Core Capabilities

### 1. Paper Structure Planning
- ACP paper outline generation
- Section content planning
- Logical structure optimization

### 2. Academic Language Polishing
- Academic expression enhancement
- Professional terminology suggestions
- Sentence structure diversification

### 3. Format Checking
- ACP format specification verification
- Citation format validation
- Figure/table description optimization

### 4. Domain-Specific Support
- Dust aerosol professional terminology
- Indian summer monsoon related expressions
- Climate model description templates

### 5. Reference Management
- ACP citation formatting
- Reference list organization
- DOI and link verification

## Usage Instructions

### Activation Phrases
The skill activates when you mention:
- "Use academic writing assistant"
- "Start paper writing mode"
- "I need ACP paper help"
- "学术写作助手"
- "论文写作模式"

### Common Commands

#### Paper Outline Generation
```
"Generate an ACP paper outline for my dust aerosol research"
"为我的沙尘气溶胶研究生成ACP论文大纲"
```

#### Language Polishing
```
"Polish this text about Indian summer monsoon"
"润色这段关于印度夏季风的文字"
```

#### Format Checking
```
"Check if this Methods section meets ACP requirements"
"检查这段Methods是否符合ACP要求"
```

#### Reference Formatting
```
"Format these references in ACP style"
"将这些参考文献格式化为ACP格式"
```

#### Terminology Suggestions
```
"Suggest professional expressions for 'dust aerosol'"
"为'沙尘气溶胶'提供专业表达"
```

## File Structure

```
academic-writing-assistant/
├── SKILL.md                    # This file (required)
├── scripts/                    # Optional: Scripts for automation
├── references/                 # Optional: Reference materials
├── assets/                     # Optional: Static assets
├── templates/                  # LaTeX and markdown templates
│   ├── acp_template.tex
│   ├── acp_abstract_template.md
│   └── acp_figures_guide.md
├── resources/                  # Domain-specific resources
│   ├── atmospheric_science_terms.json
│   ├── acp_guidelines.md
│   └── common_phrases_academic.json
└── examples/                   # Example documents
    ├── example_abstract.md
    └── example_methods.md
```

## User Profile Integration

This skill is optimized for:
- **Academic Level**: PhD student
- **Research Field**: Atmospheric science
- **Specialization**: Dust aerosol effects on Indian summer monsoon
- **Target Journal**: ACP (Atmospheric Chemistry and Physics)
- **Preferred Citation**: ACP format

## Progressive Disclosure

The skill uses progressive disclosure to provide information:
1. **Basic**: General academic writing advice
2. **Intermediate**: Field-specific terminology and expressions
3. **Advanced**: ACP-specific formatting and template usage

## File References

When working with documents, the skill can:
- Read and analyze existing documents
- Suggest improvements based on ACP guidelines
- Provide template-based starting points
- Check formatting consistency

## Validation

This skill has been validated for:
- ACP journal formatting requirements
- Atmospheric science terminology accuracy
- Academic writing best practices
- Chinese-English bilingual support

## Notes

1. This skill provides suggestions - final content should be verified by the author
2. Regularly check ACP website for latest formatting requirements
3. Use in conjunction with professional advisor feedback
4. The skill respects academic integrity and plagiarism guidelines

## Changelog

### v1.1.0 (2025-12-19)
- Converted to Agent Skills standard format
- Added YAML frontmatter with metadata
- Reorganized file structure
- Enhanced progressive disclosure

### v1.0.0 (2025-12-19)
- Initial release
- Basic writing assistant functionality
- ACP journal specific templates
- Atmospheric science domain support
