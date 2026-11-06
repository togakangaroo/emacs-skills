👉 [Support my work via GitHub Sponsors](https://github.com/sponsors/xenodium)

# emacs-skills

Claude Code skills for Emacs integration.

These skills enable tighter integration with agents running inside Emacs, for example [agent-shell](https://github.com/xenodium/agent-shell).

## Skills

### /dired

Open files from the latest agent interaction in an Emacs dired buffer via `emacsclient`.

- **Same directory**: Opens dired at the parent directory with the relevant files marked, showing them in context alongside sibling files.
- **Multiple directories**: Creates a curated `*agent-files*` dired buffer containing only the relevant files, using relative paths from a common ancestor.

### /open

Open files from the latest agent interaction in Emacs buffers via `emacsclient`. Jumps to a specific line when relevant.

### /select

Open a file in Emacs and select the region most relevant to the current discussion. Ready to act on immediately: narrow, copy, refactor, etc.

### /highlight

Highlight relevant regions in a file in Emacs with a temporary read-only minor mode. Press `q` to exit and remove highlights.

### /describe

Look up Emacs documentation using the appropriate mechanism: `describe-function`, `describe-variable`, `describe-key`, `describe-symbol`, `apropos`, `apropos-documentation`, `info`, or `shortdoc`.

### /gnuplot

Plot data from the current context using gnuplot. Queries the Emacs foreground color and generates a transparent PNG that renders inline.

### /matplotlib

Plot data from the current context using matplotlib (via `uv run`). Queries the Emacs foreground color and generates a transparent PNG that renders inline. No permanent install needed — uses `uv` to run matplotlib on the fly.

### /github-activity

Analyze a GitHub project's recent activity (PRs and issues) and produce a succinct, chart-backed health report — throughput, backlog burn-rate, and responsiveness. Renders matplotlib charts inline.

### /pr-code-review-org

Build an Emacs org document of a GitHub pull request's code changes for review. Each file and hunk is a heading; hunks link to the local checkout and show a diff block. Optionally adds short Haiku-written summaries to larger files and hunks.

### /plantuml

Create diagrams from the current context using PlantUML. Applies the Emacs foreground color via `skinparam` for readable text on your Emacs background.

### /d2

Create diagrams from the current context using D2. Uses the dark theme with the Emacs foreground color applied to nodes and edges.

### /mermaid

Create diagrams from the current context using Mermaid. Applies the Emacs foreground color via theme variable overrides for readable text on your Emacs background.

### /swiftui-preview

Render SwiftUI code from the current context to a PNG via `swiftc` + SwiftUI's `ImageRenderer`. Outputs the resulting image inline. Requires Swift and macOS.

### /xcode-build-simulator

Build the Xcode workspace/project under the current working directory for the iOS Simulator (generic destination). Auto-detects the workspace/project and scheme.

### /xcode-build-device

Build the Xcode workspace/project under the current working directory for a physical iOS device (generic destination). Requires a configured signing team.

### /xcode-run-simulator

Build, install, and launch the app on an iOS Simulator. Reuses an already-booted simulator if present; otherwise boots the latest available iPhone and opens `Simulator.app`.

### /xcode-run-device

Build, install, and launch the app on a wired-connected iOS device via Xcode 15+ `devicectl`. Requires a configured signing team and a trusted, paired device.

### emacsclient (auto)

Always prefer `emacsclient` over `emacs` when the agent needs to interact with Emacs. This skill is not a slash command; it activates automatically.

### file-links (auto)

Format file references as markdown links with GitHub-style `#L` line numbers (e.g., `[file.el:42](path/to/file.el#L42)`). Activates automatically.

### mappu (auto)

Search Apple Maps for restaurants, cafes, businesses, or landmarks via the [mappu](https://github.com/xenodium/mappu) CLI when the user asks about a place or context implies a location lookup. Always uses `--near`; asks "Near where?" if no location is established. Returns a numbered map snapshot plus per-result image, website link, category, and address. Activates automatically. Requires `mappu` on `$PATH`.

## Requirements

- Emacs running a server (`M-x server-start` or `(server-start)` in your init file)
- `emacsclient` available on `$PATH`

## Install

```sh
claude plugin marketplace add xenodium/emacs-skills
claude plugin install emacs-skills@xenodium-emacs-skills
```

## Update

```sh
claude plugin marketplace update xenodium-emacs-skills
```

## Uninstall

```sh
claude plugin uninstall emacs-skills
```
