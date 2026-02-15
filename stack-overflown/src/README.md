# Stack Overflown — Dev-Themed Puzzle Game

A lightweight browser game built with plain HTML/CSS/JS. Drop blocks, match the target 5×5 pattern, and score points before the stack reaches the ceiling.

## Quick Start

### Option A — Serve with Python (recommended)
Runs a local HTTP server so all paths/scripts load reliably.

```bash
# From stack-overflown/src
/workspaces/.venv/bin/python -m http.server 8080
```
Then open:
```bash
"$BROWSER" http://localhost:8080/
```

### Option B — Open the file directly
Simple, but some environments block `file://` script execution.

```bash
# Try opening the HTML file directly
"$BROWSER" /workspaces/stack-overflown/src/index.html
```
If that doesn’t launch or scripts don’t run, use Option A.

### Option C — Helper Script
Use the bundled script for a one-liner run.

```bash
cd /workspaces/stack-overflown/src
./serve.sh --open
```
Choose a custom port:
```bash
./serve.sh -p 8090 --open
```
Stop the server: press Ctrl+C in that terminal.

## Controls
- ← / →: Move
- ↑: Rotate
- ↓: Soft drop
- Space: Hard drop
- P: Pause

## Gameplay
- A random 5×5 target pattern is shown in the side panel.
- Place blocks to match the filled cells of the pattern (void blocks count as empty).
- On a match: +100 score, the board clears, and a new target appears.
- Game over when the stack collides at spawn.

## Project Structure
- `src/index.html`: Entry page; loads styles and scripts
- `src/style.css`: Visual styling and layout
- `src/index.js`: Game loop, controls, drawing, scoring
- `src/patterns.js`: Target patterns used for matching

## Troubleshooting
- Port in use (8000/8080): choose another port
  ```bash
  /workspaces/.venv/bin/python -m http.server 8090
  "$BROWSER" http://localhost:8090/
  ```
- Browser launch issues: if `"$BROWSER"` doesn’t open, copy the URL into your browser manually.
- Blank page / no movement: open DevTools Console to check for JS errors; verify you’re serving from `src/`.
- `file://` restrictions: many environments block script execution from file URLs; prefer the Python server.

## Git Basics
If you initialized the repo in `src/`, you can commit changes directly:
```bash
# From stack-overflown/src
git add .
git commit -m "Initial commit: Stack Overflown game"
```
Alternatively, initialize at the project root (`stack-overflown/`) to version both `src/` and this README.

## Notes
- No build step or external dependencies are required.
- Works in any modern desktop browser.
