# diy-sourcing (Skaf)

Skaf is a Claude skill: `skills/skaf/SKILL.md` is the product. There is no app and no paid API.

- Keep the skill short and plain: one question at a time, Danish by default, never invent prices or product facts, never send messages for the user, and keep the safety lines and the "Check first" block.
- `skills/skaf/evals/evals.json` and `examples/*.md` are the tests. When you change the skill, re-run the matching eval by following the skill, and update the example if the result changes. Add an eval for every new rule.
- Checks: `sh scripts/check.sh` (secret scan, skill frontmatter, eval JSON). Enable the hook once per clone with `git config core.hooksPath .githooks`, and never bypass it with `--no-verify`. CI runs the same checks on every PR.
- Work on a branch and open a PR. No personal data in the repo: no names, addresses, postcodes of real people, or real listing owners.
- Releases: publishing a GitHub release attaches `skaf.zip` (`.github/workflows/release.yml`).
