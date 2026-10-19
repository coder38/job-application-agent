# Changelog

All notable changes to this project are documented here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and versions follow [Semantic Versioning](https://semver.org/).

## [0.1.0] - 2026-10-19

First release as a Claude plugin, packaging the job-application-agent skill as ApplyWise.

### Added
- Plugin manifest and a one-plugin marketplace so the repository can be installed directly from GitHub.
- Build script that produces the plugin ZIP and the standalone skill ZIP from the same source files.
- README, privacy notes, and changelog.

### Skill capabilities in this release
- Profile onboarding with only resume and target roles required; skippable questions state their defaults.
- Fast / Balanced / Deep search across LinkedIn, Indeed, Glassdoor, connected job-board connectors, and company career / ATS pages, with a coverage line.
- 48-hour posting window with automatic widening to 7 and 14 days.
- Work-authorization screening (Sponsors / Transfer only / No sponsorship / Not stated) with the employer's own wording.
- Hard eligibility gate, explained fit ranking, honest gap analysis, and ATS keyword analysis.
- Truthful resume tailoring with a consistency check and a mandatory approval pause.
- Approval-gated form filling that stops before Submit, with batched screening questions and an optional answer bank.
- Optional application tracker, referral suggestions, follow-up and interview prep, and Career Intelligence Report.
