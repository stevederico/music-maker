---
name: music-maker
description: >
  Turn an idea into a finished original track: write the style prompt, negative
  prompt and lyrics with section tags, generate takes with ElevenLabs Music (or
  hand a paste-ready pack for Suno, Udio, or Lyria), pick the best take, and
  mix it under video. Use when asked to make music, a song, an anthem, a
  soundtrack, a jingle, background music, or a track for a video.
---

# music-maker

Original music from a plain-English idea. Prompt like a producer, generate a few takes, pick the one where the hook lands, then mix it.

## 1. Brief (ask only what is missing)

- **Slot:** what the track does (opening theme, chase scene, jingle, background bed, end sting)
- **Length:** seconds (default 90)
- **Voice:** instrumental, or vocal (male, female, choir, shouted, whispered)
- **Hook:** the one line or sound that should be the most memorable moment
- **Video:** if it goes under picture, the timestamp of the hero event the drop should hit

If the user gave enough, skip the questions and write the pack.

## 2. Write the pack

Read `references/prompting.md` for the patterns. Produce four parts:

1. **Style prompt:** genre, BPM, drop or build type, vocal type, mix, mood, in one comma list (or one prose paragraph for ElevenLabs)
2. **Negative prompt:** what to avoid
3. **Lyrics** (skip for instrumental): original words with section tags `[Intro] [Verse] [Build] [Drop] [Bridge] [Final Drop] [Outro]`
4. **Settings:** length, vocal, number of takes, export filename

Show the pack first. Save it as `music/<slug>.md` in the current project only if the user says yes.

## 3. Generate

- **ElevenLabs (automatic):** put the prompt in a file, then `scripts/generate.sh <prompt-file> <out-prefix> [takes] [length_ms]`. Needs `ELEVENLABS_API_KEY`. Writes `<out-prefix>-1.mp3`, `-2.mp3`, and so on. `DRY_RUN=1` prints the request without calling the API
- **Suno or Udio:** no official API. Give the style prompt, negative prompt and lyrics as separate copy-paste blocks and tell the user to generate 2 to 4 takes
- **Lyria (Gemini API):** same prompt, and say "use EXACTLY these lyrics and structure"

Never print or store the API key. Never generate without the user's yes when it costs credits.

## 4. Pick a take

- Generate 2 to 4 takes. Listen for the take where the first drop or chorus hits hardest
- Check the hook is sung clearly (fix odd names with phonetic spelling and regenerate)
- Say plainly which take you would pick and why. If you cannot listen, say so

## 5. Mix under video

- Music leads. Duck dialogue and effects under it
- Align one picture event to the first drop (a hit, a title, a cut)
- Bridge: thin the track out, then bring everything back in
- Export WAV or high-bitrate MP3

## 6. Legal

- Original lyrics plus a generated melody is safe to post
- Never use another song's lines, melody, or instrumental. Never write "cover of" or "in the style of" a named artist or song, since it gets blocked and is a risk
- Tell the user if a generated track sounds like a known song and regenerate

## Do not

- Copy famous lyrics or ask for a named artist's voice
- Spend credits without asking
- Claim a track is good without listening
