---
name: browser
description: Open a visible browser window to interact with web pages. Use for form filling, clicking buttons, navigating multi-step flows, logging in, and any task requiring visual web interaction.
allowed-tools:
  - BrowserOpen
  - BrowserClick
  - BrowserType
  - BrowserScreenshot
  - BrowserRead
  - BrowserReadDom
  - BrowserBack
  - BrowserForward
  - BrowserReload
  - BrowserEval
  - BrowserClose
---

# Browser Skill

Open a visible browser window to interact with web pages in real-time. The user can see the browser window and watch your actions.

## When to Use This vs WebFetch/WebSearch

- **Use Browser** when you need to: fill forms, click buttons, navigate multi-step flows, log in to sites, interact with web apps, or the user wants to watch you browse
- **Use WebFetch** when you just need to read a page's content (faster, no visible window)
- **Use WebSearch** when you just need to search the web

## Available Tools

| Tool | Purpose |
|------|---------|
| `BrowserOpen` | Open browser & navigate to URL (creates window if needed) |
| `BrowserClick` | Click element by CSS selector |
| `BrowserType` | Type text into input fields, optionally press Enter |
| `BrowserScreenshot` | Take a screenshot to see the current page |
| `BrowserRead` | Get page content as markdown (article extraction) |
| `BrowserReadDom` | List all interactive elements (buttons, links, inputs) with CSS selectors |
| `BrowserBack` | Go back in browser history |
| `BrowserForward` | Go forward in browser history |
| `BrowserReload` | Reload the current page |
| `BrowserEval` | Execute JavaScript in the page context |
| `BrowserClose` | Close browser window |

## Workflow

1. **Open**: Use `BrowserOpen` with a URL to open the visible browser
2. **See**: Use `BrowserScreenshot` to see the current page state
3. **Discover**: Use `BrowserReadDom` to find all interactive elements with their CSS selectors
4. **Read**: Use `BrowserRead` to get page content as markdown (for text-heavy pages)
5. **Interact**: Use `BrowserClick`, `BrowserType`, `BrowserEval` to interact with elements
6. **Navigate**: Use `BrowserBack`, `BrowserForward`, `BrowserReload` for page navigation
7. **Verify**: Take another screenshot to verify your action worked
8. **Close**: Use `BrowserClose` when done

## Finding Elements

To click or type, you need CSS selectors. Strategies:
- **Use `BrowserReadDom`** — returns all interactive elements (buttons, links, inputs, selects, etc.) with their properties and CSS selector hints. This is the fastest way to discover what's on the page.
- Take a screenshot to visually understand the page layout
- Common selectors: `input[name="email"]`, `button[type="submit"]`, `a[href*="login"]`, `#search-input`, `.submit-btn`

## Example: Fill a Search Form

```
1. BrowserOpen(url: "https://example.com")
2. BrowserScreenshot()
3. BrowserType(selector: "input[name='q']", text: "search query", pressEnter: true)
4. BrowserScreenshot()
5. BrowserRead()
6. BrowserClose()
```

## Example: Multi-Step Form

```
1. BrowserOpen(url: "https://example.com/register")
2. BrowserScreenshot()
3. BrowserType(selector: "#name", text: "John Doe")
4. BrowserType(selector: "#email", text: "john@example.com")
5. BrowserClick(selector: "button[type='submit']")
6. BrowserScreenshot()
7. BrowserClose()
```

## Advanced: JavaScript Evaluation

For complex interactions not covered by Click/Type:

```
BrowserEval(code: "window.scrollTo(0, document.body.scrollHeight)")  // Scroll to bottom
BrowserEval(code: "document.querySelector('select#country').value = 'US'; document.querySelector('select#country').dispatchEvent(new Event('change', {bubbles: true}))")  // Select dropdown
BrowserEval(code: "JSON.stringify(Array.from(document.querySelectorAll('a')).map(a => ({text: a.textContent.trim(), href: a.href})))")  // List all links
```

## Tips

- Always take a **screenshot first** before interacting - you need to see the page
- The browser window is **visible to the user** - they can see what you are doing
- The window **persists** across tool calls - no need to re-open for each action
- If a click triggers navigation, take a screenshot again after the page loads
- For long pages, scroll using `BrowserEval` before taking a screenshot
- **Always close** the browser when done to free resources
