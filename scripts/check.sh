#!/bin/sh
# Repo checks, run by the pre-commit hook and by CI. No dependencies.
set -e
fail() { echo "check: $1"; exit 1; }

# 1) No secrets or secret files in tracked files.
git ls-files | grep -E '(^|/)(\.env.*|\.dev\.vars|.*\.pem)$' && fail "secret file tracked"
if git grep -nE '(ghp_|github_pat_|gho_|lin_api_|sk-ant-|xox[bp]-|AKIA[0-9A-Z]{16}|-----BEGIN [A-Z ]*PRIVATE KEY)' -- . ':!scripts/check.sh'; then
  fail "possible secret"
fi

# 2) Every skill has frontmatter with a matching name and a description under 1024 chars.
for f in skills/*/SKILL.md; do
  dir=$(basename "$(dirname "$f")")
  [ "$(head -1 "$f")" = "---" ] || fail "$f: no frontmatter"
  grep -qx "name: $dir" "$f" || fail "$f: name must be '$dir'"
  case "$dir" in *claude*|*anthropic*) fail "$f: reserved word in skill name";; esac
  desc=$(grep -m1 '^description: ' "$f" | cut -c14-)
  case "$desc" in ''|'>'*|'|'*) fail "$f: description must be one non-empty line";; esac
  [ "${#desc}" -lt 1024 ] || fail "$f: description over 1024 chars"
done
# 3) Eval files are valid JSON (skipped if python3 is missing).
for f in skills/*/evals/evals.json; do
  [ -f "$f" ] || continue
  command -v python3 >/dev/null || break
  python3 -c 'import json,sys; json.load(open(sys.argv[1]))' "$f" || fail "$f: invalid JSON"
done
echo "check: ok"
