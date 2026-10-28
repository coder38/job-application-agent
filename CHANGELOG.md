# Changelog

All notable changes to this project are documented here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and versions follow [Semantic Versioning](https://semver.org/).

## [0.1.1] - Unreleased

### Added
- Role suggestions: when a user isn't sure what to target, the agent suggests 3-5 role families grounded in their resume, each rated Direct fit, Short step, or Stretch, with evidence, search titles, the biggest gap, and an optional demand check.
- Postings the user brings: pasted job links go through the same eligibility, tailoring, and approval steps, with a note on why the search missed them.
- Search log in the tracker, so repeat searches cover everything since the last one.
- README: recommended connectors (Indeed, Dice) and an explanation of the `privacyPolicyUrl` / `supportUrl` warning.

### Changed
- The agent works as an expert in the user's field (titles, platforms, certifications, what hiring managers look for) when searching, judging fit, and tailoring.
- Resume standards: accomplishment-formula bullets with real metrics, a three-sentence summary, exact certification names and status, a filler-word list to cut, and ATS-friendly formatting.
- More sources: ZipRecruiter joins the core boards; employer career sites now include the main employers in the user's field and area (for example health systems); specialist boards are chosen per user (Dice, Built In, Wellfound for tech; We Work Remotely, Remotive, Remote.co, FlexJobs for remote; industry and government boards).
- Broader search: a search plan with a full title family (5-10 titles in Balanced, for example Epic analyst, EHR analyst, clinical applications analyst), platform keywords searched on their own (for example Epic, Guidewire, Salesforce), at least 2 results pages per search, a separate remote search, and no seniority filter unless asked.
- Matching judges the job's responsibilities, skills, and platforms rather than its title; well-fitting titles found in results are added to the search plan.
- Posting window: past 7 days on the first search (widening to 14 or 30 days when there are fewer than 5 strong matches), then everything since the last search. Replaces the fixed 48-hour default.
- Shortlist of up to about 15 matches, all shown with links; the top 3-5 read in full. Removed the 5-minute search target.
- Skill description now leads with must-haves rather than visas, and mentions role suggestions.

## [0.1.0] - 2026-10-19

First release as a Claude plugin, packaging the job-application-agent skill as RoleHarbor.

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
