# Contributing to the Mezmo Homebrew Tap

Thank you for contributing! Bug reports, fixes to formulae, documentation, and issue triage are all welcome.

This repository hosts the Homebrew formulae (and casks) for Mezmo software. This guide covers the contribution process itself.

## The Short Version

1. Fork the repo (external contributors) or branch from `main` (maintainers).
2. Make a focused change: one logical change per PR.
3. Run `make test-mac` and `make test-linux` before pushing.
4. Write a clear commit message describing the change.
5. Open a PR explaining what and why. A maintainer reviews, then rebase-merges.

Contributions require agreement to the [CLA](#contributor-license-agreement), and this project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).

## How Formulae Are Maintained

Formulae in this tap are maintained by Mezmo. Updates are automated: when a new generally available (GA) release is published, the corresponding formula is updated to point at the new version and its checksums. Prereleases (alphas, betas, and release candidates) are intentionally excluded.

Because version and checksum bumps are automated, most of those changes do not need a manual pull request. Open a PR for everything else: fixes to formula metadata, dependencies, install logic, or documentation.

## Getting Help

- **[GitHub Issues](https://github.com/mezmo/homebrew-tap/issues)**: report a broken or out-of-date formula, a failed install, or request a package.

## Contributor License Agreement

All contributors, both individual and corporate, must agree to the [Mezmo Contributor License Agreement (CLA)](CLA.md) before their contributions can be accepted. The CLA ensures that you grant the necessary rights for your contributions to be included in the project while you retain ownership of your work.

By submitting a pull request, commit, or other contribution to this repository after being presented with the CLA, you accept and agree to its terms. If you are contributing on behalf of your employer, please ensure you have authorization to accept the agreement on their behalf.

Organizations with ten (10) or more contributors may contact [cla@mezmo.com](mailto:cla@mezmo.com) to execute a separate Corporate Contributor License Agreement covering all authorized contributors within the organization. For any questions about the CLA or licensing, reach out to [cla@mezmo.com](mailto:cla@mezmo.com).

## Development Workflow

1. Create a branch from the latest `main`:

   ```bash
   git checkout main
   git pull origin main
   git checkout -b fix/your-change
   ```

2. Make your changes, keeping commits focused and atomic.

3. Run the test suite before pushing:

   ```bash
   make test-mac     # run the tests on macOS
   make test-linux   # run the tests in a Linux environment
   ```

4. Push your branch and open a pull request.

All changes are merged to `main` via **rebase merging** to maintain a linear commit history.

## Commit Messages

Conventional Commits are not required. Just write a clear, descriptive message: a concise subject line summarizing the change, with a body explaining **what** and **why** when the change isn't self-explanatory. Reference `Fixes: #<issue number>` when the change closes a GitHub issue.

If you prefer, the [Conventional Commits](https://www.conventionalcommits.org/) style (e.g. `fix: correct arm64 checksum for vector`) is welcome but optional.

## Pull Requests

Before you submit:

1. Rebase on the latest `main` (`git fetch origin && git rebase origin/main`).
2. Run the quality checks above.
3. Update documentation if your change affects user-facing behavior.

Guidelines:

- **Title**: clear and descriptive.
- **Description**: explain what the PR does and why: context, approach, and testing performed.
- **Size**: keep PRs focused and reasonably sized.

A suggested PR template:

```markdown
## What

Brief description of what this PR does.

## Why

Motivation and context for the change.

## Testing

How this was tested (`make test-mac`, `make test-linux`, manual install, etc.).
```

After you submit, watch the PR for automated check results, the CLA bot's request to sign the contributor agreement, and reviewer feedback.

## Review Process

- All PRs require at least one maintainer review before merging.
- Reviewers may request changes; this is normal and part of maintaining quality. If you disagree with a suggestion, explain your reasoning.
- After approval, a maintainer rebase-merges your PR.

## Reporting Issues

When reporting a problem with a formula, please include:

- The command you ran (e.g. `brew install mezmo/tap/name`)
- Your operating system and architecture (e.g. macOS arm64, Linux x86_64)
- The full output, ideally with `brew install --verbose --debug` for install failures
- The output of `brew config` and `brew doctor`

For package requests, describe the software you'd like to see in the tap and your use case.

## License

By contributing to this repository, you agree that your contributions will be licensed under the [Apache License, Version 2.0](LICENSE), the same license that covers the project. All contributions are also subject to the [Contributor License Agreement](CLA.md).
