# Prompting music models

## Style prompt

One line of tags, or one paragraph for prose-style models. Cover, in this order:

1. Genre and era ("90s boom bap hip-hop", "lo-fi house", "cinematic orchestral")
2. Tempo ("120 BPM", "about 70 BPM")
3. Structure ("sparse intro into full chorus", "build and drop", "verse, pre-chorus, chorus")
4. Vocal ("breathy female lead", "warm baritone", "group harmonies on the chorus", "instrumental only")
5. Sound ("warm analog synths", "tight live drums", "big drums on the lift")
6. Mix and mood ("polished modern mix", "hopeful", "clean and open")
7. Ending ("fades out slowly", "ends on one held chord")

Example, action chase:

```
fast electronic chase music, 140 BPM, driving four-on-the-floor kick, pulsing synth bass,
rising arpeggios into a big drop, tense strings in the build, punchy modern mix, relentless
```

Example, warm indie theme:

```
warm indie folk theme, 96 BPM, fingerpicked acoustic guitar, soft brushed drums,
harmony vocals on the chorus, gentle build, hopeful, intimate, clean mix
```

## Negative prompt

Name the sounds you do not want: `muddy mix, thin vocals, off-key harmonies, generic stock-music feel`. Match it to the style: a quiet acoustic track might exclude `heavy distortion, big drops, autotune`.

## Lyrics

- Section tags: `[Intro] [Verse 1] [Build] [Drop] [Bridge] [Final Drop] [Outro]`
- One idea per line, short lines that scan on the beat
- Put the hook where the energy peaks (the drop or the final chorus) so the line and the beat land together
- Spell tricky names phonetically so they are sung right (write "Kay-tlin" if "Caitlin" keeps being sung wrong)
- Bookend the song: the intro and outro can echo the same short phrase
- Build sections count down ("three, two, one") into the drop
- The bridge is the quiet beat: say so in the prompt ("drops to almost nothing, one held vocal note, then the biggest drop")
- Everything original. No borrowed lines

## Prose prompt (for ElevenLabs-style models)

Write it like a brief to a producer:

- Length and genre first ("A 75-second warm indie folk theme, 96 BPM")
- Name the hook and where it lands ("built around one short phrase that returns in every chorus")
- Describe the vocal like a casting call ("soft, intimate, human, close-mic, natural phrasing")
- Describe the arc section by section (quiet verse, lifting pre-chorus, full chorus, stripped bridge, final chorus)
- End with the mix and the ending ("clean, open mix, fades out on the guitar")

## Settings

- Length: 60 to 90 seconds for video, 2 to 3 minutes for a full song
- Takes: 3 to 4, then pick. Do not trust the first
- Vocal gender and timbre stated in the prompt, not left to chance

## Fixing a bad take

| Problem | Fix |
| --- | --- |
| Wrong voice or accent | Describe the voice concretely, add it to the negative prompt |
| Hook sung wrong | Phonetic spelling, repeat the hook line in the prompt |
| Muddy or buried vocal | "vocal mixed forward and present on top of the beat" |
| No drop, flat energy | Name the build, the riser and the drop explicitly |
| Sounds like a known song | Regenerate, change genre words and tempo, never name the song |
