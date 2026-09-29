# music-maker

An agent skill that turns an idea into a finished original track.

It writes the prompt like a producer (style, negative prompt, lyrics with section tags), generates a few takes, helps pick the best one, and mixes it under video.

## What it does

1. Asks only what is missing: slot, length, voice, hook, video sync point
2. Writes the pack: style prompt, negative prompt, lyrics, settings
3. Generates takes with ElevenLabs Music, or hands you paste-ready blocks for Suno, Udio, or Lyria
4. Picks a take, mixes it under picture, and keeps the result original and safe to post

## Install

```bash
npx skills add stevederico/music-maker
```

Then ask your agent: "make me a theme song for my video" or "write a 60 second chase track".

## Requirements

- `curl` and `bash` for the generator
- Optional: an [ElevenLabs](https://elevenlabs.io) API key in `ELEVENLABS_API_KEY` for automatic generation. Without it, the skill gives you copy-paste prompts for any music tool

## Run the generator by hand

```bash
export ELEVENLABS_API_KEY=...
scripts/generate.sh prompt.txt takes/theme 3 75000   # 3 takes, 75 seconds
DRY_RUN=1 scripts/generate.sh prompt.txt takes/theme  # print the request, no credits used
```

The request goes to `POST https://api.elevenlabs.io/v1/music` with `prompt`, `music_length_ms` (3000 to 600000) and `model_id` ([docs](https://elevenlabs.io/docs/overview/capabilities/music)). Set `ELEVENLABS_MUSIC_MODEL` to change the model.

## Notes

- Not tested against the live API yet. The request body is checked with a dry run
- Generating costs credits. The skill asks before spending them
- Original lyrics plus a generated melody is safe to post. Never ask for a named artist's voice or another song's melody

## License

MIT
