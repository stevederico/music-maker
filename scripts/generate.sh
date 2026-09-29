#!/usr/bin/env bash
# Generate takes with the ElevenLabs Music API.
# Usage: scripts/generate.sh <prompt-file> <out-prefix> [takes=2] [length_ms=90000]
# Needs: ELEVENLABS_API_KEY, curl. DRY_RUN=1 prints the request body and exits (no API call, no credits).
set -euo pipefail

prompt_file="${1:?usage: generate.sh <prompt-file> <out-prefix> [takes] [length_ms]}"
prefix="${2:?usage: generate.sh <prompt-file> <out-prefix> [takes] [length_ms]}"
takes="${3:-2}"
length_ms="${4:-90000}"
model="${ELEVENLABS_MUSIC_MODEL:-music_v1}"

[ -f "$prompt_file" ] || { echo "No such file: $prompt_file" >&2; exit 1; }
[ "$length_ms" -ge 3000 ] && [ "$length_ms" -le 600000 ] || { echo "length_ms must be 3000 to 600000" >&2; exit 1; }

# Escape the prompt for JSON: backslash, quote, tab, newline.
escaped=$(awk 'BEGIN{ORS=""} {gsub(/\\/,"\\\\"); gsub(/"/,"\\\""); gsub(/\t/,"\\t"); if (NR>1) print "\\n"; print}' "$prompt_file")
body=$(printf '{"prompt":"%s","music_length_ms":%s,"model_id":"%s"}' "$escaped" "$length_ms" "$model")

if [ "${DRY_RUN:-0}" = "1" ]; then
  echo "POST https://api.elevenlabs.io/v1/music (x$takes takes)"
  echo "$body"
  exit 0
fi

[ -n "${ELEVENLABS_API_KEY:-}" ] || { echo "Set ELEVENLABS_API_KEY" >&2; exit 1; }

for i in $(seq 1 "$takes"); do
  out="${prefix}-${i}.mp3"
  code=$(curl -sS -o "$out" -w '%{http_code}' -X POST "https://api.elevenlabs.io/v1/music" \
    -H "xi-api-key: ${ELEVENLABS_API_KEY}" -H "Content-Type: application/json" -d "$body")
  if [ "$code" != "200" ]; then
    echo "Take $i failed (HTTP $code):" >&2
    head -c 400 "$out" >&2; echo >&2
    rm -f "$out"
    exit 1
  fi
  echo "wrote $out"
done
