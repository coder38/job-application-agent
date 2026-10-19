#!/usr/bin/env sh
# Builds the two release downloads from the same source files:
#   dist/job-application-agent-plugin.zip  -> Claude app: Customize > Plugins > Add > Upload plugin
#   dist/job-application-agent-skill.zip   -> Claude app: Customize > Skills > Upload a skill
#
# Usage (from anywhere):  sh scripts/build-release.sh
# Requires: zip

set -eu

NAME="job-application-agent"
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DIST_DIR="$ROOT_DIR/dist"
PLUGIN_ZIP="$DIST_DIR/$NAME-plugin.zip"
SKILL_ZIP="$DIST_DIR/$NAME-skill.zip"

if [ ! -f "$ROOT_DIR/skills/$NAME/SKILL.md" ] || [ ! -f "$ROOT_DIR/.claude-plugin/plugin.json" ]; then
  echo "Error: run this from a checkout of the $NAME repository" >&2
  exit 1
fi

mkdir -p "$DIST_DIR"
rm -f "$PLUGIN_ZIP" "$SKILL_ZIP"

# Plugin ZIP: plugin files at the top level of the archive (no wrapper folder).
(cd "$ROOT_DIR" && zip -qr "$PLUGIN_ZIP" \
  .claude-plugin skills README.md PRIVACY.md CHANGELOG.md \
  $( [ -f LICENSE ] && echo LICENSE ) \
  -x "*.DS_Store")

# Skill ZIP: one top-level folder whose name matches the skill name.
(cd "$ROOT_DIR/skills" && zip -qr "$SKILL_ZIP" "$NAME" -x "*.DS_Store")

echo "Built $PLUGIN_ZIP"
echo "Built $SKILL_ZIP"
