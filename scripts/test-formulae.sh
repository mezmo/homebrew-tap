#!/usr/bin/env bash
# Validate every formula in this tap the way a user installs it: brew test-bot
# for tap-syntax (style + audit + readall), then install each formula, run its
# test block, and uninstall. Requires Homebrew to be installed already; it finds
# an existing install (PATH or the standard prefixes) and loads its environment.
set -euo pipefail

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_GITHUB_API_TOKEN="${GITHUB_TOKEN:-}"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

load_brew() {
  command -v brew >/dev/null 2>&1 && return 0
  local p brew_env
  for p in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew
  do
    if [[ -x "${p}" ]]
    then
      brew_env="$("${p}" shellenv)"
      eval "${brew_env}"
      return 0
    fi
  done
}

load_brew
if ! command -v brew >/dev/null 2>&1
then
  echo "Homebrew not found; unable to continue..."
  exit 1
fi

brew --version

# Homebrew resolves a short tap name (mezmo/tap) to a repo named homebrew-tap;
# test-bot needs this checkout at that path. A real tap may already be installed
# here (a developer's own `brew tap mezmo/tap` clone); set it aside and restore
# it afterward rather than destroying it. Cleanup only removes a symlink we
# created — never a real directory.
TAP_DIR="$(brew --repository)/Library/Taps/mezmo/homebrew-tap"
BACKUP_DIR="${TAP_DIR}.backup.$$"
WORK_DIR=""
INSTALLED=()

cleanup() {
  # Uninstall anything we installed (a failed test block would otherwise leave
  # it behind) while the tap symlink still resolves the formula names.
  for name in "${INSTALLED[@]:-}"
  do
    [[ -n "${name}" ]] || continue
    brew uninstall --formula --force "${name}" >/dev/null 2>&1 || true
  done
  [[ -L "${TAP_DIR}" ]] && rm -f "${TAP_DIR}"
  [[ -e "${BACKUP_DIR}" ]] && mv "${BACKUP_DIR}" "${TAP_DIR}"
  # rmdir removes the mezmo/ org dir only when empty, sparing any sibling tap.
  rmdir "${TAP_DIR%/*}" 2>/dev/null || true
  [[ -n "${WORK_DIR}" ]] && rm -rf "${WORK_DIR}"
}
trap cleanup EXIT INT TERM

if [[ -L "${TAP_DIR}" ]]
then
  rm -f "${TAP_DIR}"
elif [[ -e "${TAP_DIR}" ]]
then
  mv "${TAP_DIR}" "${BACKUP_DIR}"
fi
mkdir -p "$(dirname "${TAP_DIR}")"
ln -sfn "${REPO_ROOT}" "${TAP_DIR}"

# test-bot writes its step logs into the working directory; run the syntax check
# from a scratch dir so those artifacts never touch the repo.
WORK_DIR="$(mktemp -d)"
cd "${WORK_DIR}"

brew test-bot --tap=mezmo/tap --only-tap-syntax

# Install, test, and uninstall each formula directly. test-bot's --only-formulae
# is avoided because it also builds a bottle and writes a `bottle do` block back
# into the formula, which adds nothing for a tap that installs upstream prebuilt
# binaries.
for formula in "${REPO_ROOT}"/Formula/*.rb
do
  name="mezmo/tap/$(basename "${formula%.rb}")"

  if brew list --formula --versions "${name}" >/dev/null 2>&1
  then
    echo "${name} is already installed; refusing to replace it." >&2
    exit 1
  fi

  brew install --formula --verbose "${name}"
  INSTALLED+=("${name}")
  brew test --verbose "${name}"
  brew uninstall --formula --force "${name}"
done
