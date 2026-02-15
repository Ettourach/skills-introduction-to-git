#!/usr/bin/env sh
set -e

# Default settings
PORT=8080
OPEN=0

# Resolve script directory (src)
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

# Choose Python interpreter
PY="$PYTHON"
if [ -z "$PY" ]; then
  if [ -x "/workspaces/.venv/bin/python" ]; then
    PY="/workspaces/.venv/bin/python"
  else
    PY="python3"
  fi
fi

usage() {
  echo "Usage: $(basename "$0") [-p PORT] [--open]"
  echo "Examples:"
  echo "  ./serve.sh            # serve on port 8080"
  echo "  ./serve.sh -p 8090    # serve on port 8090"
  echo "  ./serve.sh --open     # also open in browser"
  exit 0
}

# Parse args
while [ $# -gt 0 ]; do
  case "$1" in
    -p|--port)
      PORT="$2"; shift 2;;
    -o|--open|--open-browser)
      OPEN=1; shift;;
    -h|--help)
      usage;;
    *)
      echo "Unknown option: $1"; usage;;
  esac
done

cd "$SCRIPT_DIR"

echo "Serving $SCRIPT_DIR on http://localhost:$PORT"
"$PY" -m http.server "$PORT" &
PID=$!

trap 'echo; echo "Stopping server..."; kill "$PID" 2>/dev/null || true' INT TERM

if [ "$OPEN" -eq 1 ] && [ -n "$BROWSER" ]; then
  "$BROWSER" "http://localhost:$PORT/" || true
fi

wait "$PID"
