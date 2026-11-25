# Skaf

A DIY home partner for Denmark, packaged as a [Claude skill](https://docs.claude.com/en/docs/agents-and-tools/agent-skills/overview). Tell it a job or a symptom in Danish, and it:

1. **Diagnoses** what is wrong with a home (damp, mould, cold radiators, draughts): ranks 2-4 likely causes and gives a cheap test for each, and says when it's a job for a pro, the landlord or the housing association.
2. **Plans** the job like a good coding agent: asks one question at a time, proposes 2-3 ways to do it, then gives numbered steps, the tools, the materials and the one mistake beginners make at each step.
3. **Sources** what you don't own, after your OK: private rental (Hygglo), pro rental (Rentay, Stark, Bygma), new (XL-Byg, Silvan, Bauhaus, jem & fix, IKEA) and used (DBA), with a rent-or-buy rule and a drafted booking message you send yourself.

It only shows prices it saw on a page that day, never sends anything for you, and says plainly that electrical, gas and water work is for an authorised professional.

## Example

> **Du:** Der er sorte prikker i hjørnet af soveværelset, oppe ved loftet.
>
> **Skaf:** Er det en ydervæg? ... (one question at a time) ... Mest sandsynligt kondens på et koldt hjørne. Test: et hygrometer (ca. 100 kr) i en uge, og et stykke folie tapet på væggen i 2 dage.

Worked runs, one per mode, are in [`examples/`](examples): a damp corner (diagnose), an IKEA PAX closet (plan) and a lowered gypsum ceiling (source).

## Install

Download `skaf.zip` from the latest [release](https://github.com/nicolai-bernsen/diy-sourcing/releases/latest) and upload it in Claude under Settings → Capabilities → Skills. (Or put [`skills/skaf/SKILL.md`](skills/skaf/SKILL.md) in a folder named `skaf` and zip it yourself.) Web search must be on for the price step. In Claude Code, copy the folder to `~/.claude/skills/skaf`.

## Status

An experiment, tested on three real jobs. The output is Danish and the sources are Danish shops. Prices and shop pages change, so check before you buy. Issues and ideas are welcome.

## Licence

[MIT](LICENSE)
