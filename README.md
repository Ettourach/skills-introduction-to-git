# Stack Overflown — Dev-Themed Puzzle Game

Stack Overflown is a lightweight browser puzzle game built with plain HTML, CSS, and JavaScript. Drop blocks to match the target 5×5 pattern shown in the side panel. Score points for matches before the stack reaches the ceiling.

## Overview
- Fast to load, no build step, runs locally.
- Single-page app with simple state management.
- Designed for learning and tinkering.

## Demo
Launch locally using the quick start below. You can serve the game and open it in your default browser.

## Quick Start

### Option A — Serve with Python (recommended)
Runs a local HTTP server so all paths/scripts load reliably.

```bash
# From the project root
cd /workspaces/skills-introduction-to-git
/workspaces/.venv/bin/python -m http.server 8080
"$BROWSER" http://localhost:8080/
```

If serving from a subfolder, adjust the path accordingly, e.g. `stack-overflown/src`.

### Option B — Open the file directly
Simple, but some environments block `file://` script execution.

```bash
"$BROWSER" /workspaces/skills-introduction-to-git/index.html
```

### Option C — Helper Script
Use the bundled script for a one-liner run.

```bash
cd /workspaces/skills-introduction-to-git
./serve.sh --open
```
Choose a custom port:
```bash
./serve.sh -p 8090 --open
```
Stop the server: press Ctrl+C in that terminal.

## Controls
- Left / Right: Move
- Up: Rotate
- Down: Soft drop
- Space: Hard drop
- P: Pause

## Features
- Target pattern matching across a 5×5 grid.
- Clear board on successful match and spawn a new target.
- Collision detection and game-over handling.
- Simple pause/resume logic.

## Tech Stack
- HTML5, CSS3, JavaScript (ES6)
- No external dependencies, no bundlers
- Optional Python `http.server` for local dev

## Project Structure
- `index.html`: Entry page; loads styles and scripts
- `style.css`: Visual styling and layout
- `index.js`: Game loop, controls, drawing, scoring
- `patterns.js`: Target patterns used for matching
- `serve.sh`: Helper to run a local server and open the browser

## Build Steps (How this game was implemented)
This section outlines the full implementation approach used to build the game from scratch. Use it as a learning path or blueprint.

1. Requirements & Concept
	- Define gameplay: falling blocks that must match a side-panel 5×5 target pattern.
	- Choose a minimal tech stack: plain HTML/CSS/JS for portability.

2. Base HTML & Layout
	- Create `index.html` with a canvas or container for the board and a side panel for the target pattern and score.
	- Link `style.css`, `index.js`, and `patterns.js`.

3. Visual Styles
	- In `style.css`, define layout (board area, sidebar), colors, typography, and spacing.
	- Add classes for block states (filled/empty/void) and simple transitions if needed.

4. Game State Model
	- In `index.js`, define core state: board grid, active piece, next piece, score, paused flag.
	- Represent the board as a 2D array of cells; pieces as shape matrices with rotation.

5. Patterns & Target Logic
	- In `patterns.js`, author a set of 5×5 patterns (arrays of booleans/ints).
	- Add utilities to select a random pattern and render it in the UI.

6. Input Handling
	- Register keyboard events for movement, rotation, soft/hard drop, and pause.
	- Debounce or limit repeat actions appropriately.

7. Physics & Collision
	- Implement collision checks (board bounds, occupied cells) before moving/rotating.
	- Handle lock-down of pieces when they can’t move further.

8. Rendering
	- Draw the board and active piece each frame using canvas or DOM elements.
	- Render the target pattern and score in the side panel.

9. Game Loop
	- Implement a tick loop using `requestAnimationFrame` or timed intervals.
	- Advance piece downward at a configurable speed; pause/resume correctly.

10. Matching & Scoring
	- On lock-down, check the current board state against the 5×5 target pattern.
	- Award points (e.g., +100) on a match, clear the board, and spawn a new target.

11. Game Over
	- Detect spawn collisions (piece overlaps at spawn); end the game and show a message.

12. Helper Script
	- Provide `serve.sh` to run a local server and optionally open the browser with `"$BROWSER"`.

13. Polishing & UX
	- Tune speeds, add simple animations, and refine visuals.
	- Ensure responsiveness for typical desktop window sizes.

14. Testing & Troubleshooting
	- Use the browser DevTools Console to catch JS errors.
	- Validate serving paths (avoid `file://` restrictions by using a local server).

15. Deployment
	- Host on any static site service (GitHub Pages, Netlify) by publishing the `index.html`, `style.css`, `index.js`, and `patterns.js`.

## Troubleshooting
- Port in use (8000/8080): choose another port
  ```bash
  /workspaces/.venv/bin/python -m http.server 8090
  "$BROWSER" http://localhost:8090/
  ```
- Browser launch issues: if `"$BROWSER"` doesn’t open, copy the URL into your browser manually.
- Blank page / no movement: open DevTools Console to check for JS errors; verify you’re serving from the correct directory.
- `file://` restrictions: many environments block script execution from file URLs; prefer the Python server.

## Contributing
Issues and pull requests are welcome. Keep changes small and focused. For new features, propose the design briefly before implementation.

## License
MIT — see `LICENSE`.

