# Changelog

All notable changes to this project are documented here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and versions follow [Semantic Versioning](https://semver.org/).

## [0.2.0] - 2026-11-04

### Added
- Independent resume check: after tailoring, a fresh helper agent that sees only the master resume, the user's confirmed answers, the posting, and the draft flags unsupported skills, invented numbers, inflated scope, and fact mismatches before the user sees the draft. Falls back to a line-by-line self-check where helper agents aren't available.
- Parallel lookups in Deep mode: employer career sites, connector searches, and H-1B history and news checks run in parallel helper agents, while the lead agent keeps all browser work, user interaction, and approvals. Falls back to sequential lookups elsewhere.
- Hidden-employer check: recruiter posts for unnamed clients are flagged when their details point to the user's current or former employer or an excluded company.
- Ghost-job and stale-posting detection: each shortlisted posting is labeled Likely active, Check before applying, or Likely stale from signals already on the page (age, reposts, evergreen wording, closed on the employer's site), with a layoffs or hiring-freeze check for the top pick only.
- Daily digest: with the user's OK, a scheduled task checks every morning for jobs posted since the last search and lists only new strong matches. It never tailors, applies, or contacts anyone.
- `resume-checker` plugin agent: a lightweight checker with one read-only tool and a fast model, used for the truth check when available.
- Job-alert emails as a source when a mail connector is connected; daily digests use them when no browser is available.
- Vendor-side titles (implementation, solutions and consultant roles) in the search plan for platform specialists.
- Degree-risk flag: for H-1B users, postings whose minimum is below a bachelor's degree are flagged and ranked lower. Internal roles at the current employer are labeled Internal move.
- Form filling: education and certifications are checked first after resume autofill, and a progress note on long forms lets an interrupted application resume.
- Tracker: employer calls and emails are marked Action needed and listed first.
- Resume writing: the XYZ accomplishment formula by name, bullets ordered by impact and grouped under subheads, outcome-based summaries without copied bullets, functional headlines with official titles kept exact, interview-defensible skills only, no repeated facts or verbs, and a one-time ask for supporting material (reviews, project write-ups) to find real numbers. Missing numbers are asked for or marked `[FILL IN]`, never invented.
- Two-lens review before the draft is shown: an ATS parser check (keywords present and missing, formatting) and a hiring-manager skim (what gets skipped, yes, maybe or no pile). No ATS scores are quoted.
- `tests/scenarios.md`: 19 hand-run test scenarios drawn from real use (not part of the package).
- Includes everything from the unreleased 0.1.2 below.

### Changed
- Lower token use: the truth check defaults to the lightweight plugin agent or a self-check (a full general-purpose helper only on request); pages are read selectively (result lists and job descriptions only); 3 postings are read in full by default instead of 3-5.

## [0.1.2] - Not released separately (folded into 0.2.0)

### Added
- H-1B sponsorship history: when the user needs sponsorship or a transfer, the agent looks up each shortlisted employer's past H-1B filings (U.S. Department of Labor LCA data, via sites such as Ellis or MyVisaJobs), labels it Frequent sponsor, Occasional sponsor, No filings found, or Unknown employer with counts and source, and uses it to rank eligible postings. A posting's own "no sponsorship" statement still decides.
- Current-restrictions check: for likely sponsors in tech, IT services, or consulting, a quick news search flags PERM or H-1B suspensions and federal investigations, with date and source.

### Changed
- Sponsorship checks run only for US jobs when the user needs a new H-1B or transfer, so users in other countries or without sponsorship needs spend no extra time or tokens. The work-authorization question adapts to the country being searched.

## [0.1.1] - 2026-10-28

### Added
- Role suggestions: when a user isn't sure what to target, the agent suggests 3-5 role families grounded in their resume, each rated Direct fit, Short step, or Stretch, with evidence, search titles, the biggest gap, and an optional demand check.
- Postings the user brings: pasted job links go through the same eligibility, tailoring, and approval steps, with a note on why the search missed them.
- Search log in the tracker, so repeat searches cover everything since the last one.
- README: recommended connectors (Indeed, Dice) and an explanation of the `privacyPolicyUrl` / `supportUrl` warning.

### Changed
- Skill split into a lean core (workflow, approval pauses, truth and safety rules) and reference files loaded only when needed, cutting what loads on every use from about 6,700 to about 2,600 words. No change in behavior.
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
