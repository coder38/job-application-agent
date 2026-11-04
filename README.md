# RoleHarbor

*Find your next opportunity with confidence.*

A Claude plugin that runs a job search the way a careful career coach would: it finds recently posted roles that fit your resume, checks each one against your must-haves (location, work arrangement, job type, pay, and work authorization if it applies to you), tailors your resume to the best match **without inventing anything**, and helps fill the application form **only after you approve**, always stopping before the final Submit click.

The plugin is one carefully structured [skill](skills/job-application-agent/SKILL.md) plus a small [truth-check agent](agents/resume-checker.md). It adds no servers, hooks, or scripts that run on your machine; everything it does happens through tools you already have in Claude (its browser, your connectors, web search, and file creation).

---

## Why RoleHarbor

Most job agents optimize for volume: hundreds of auto-submitted applications with keyword-stuffed resumes. Recruiters spot those, and one invented skill can end an interview. RoleHarbor optimizes for **fewer, stronger applications you can defend in every interview.**

| | Mass-apply tools | RoleHarbor |
| --- | --- | --- |
| **Resume** | Keyword-stuffed or generic | Tailored per job, then checked line by line against your real resume by a **separate agent** that never saw the reasoning behind the draft |
| **Numbers** | Often padded or invented | Only real figures; it asks for your reviews or project write-ups to find them, and never fills gaps with "realistic" placeholders |
| **Submitting** | Automatic | **Never.** It fills the form after you reply "Approved" and stops before Submit |
| **Which jobs** | Exact-title keyword matches | The whole title family, vendor-side titles, your core platform on its own, and your job-alert emails; judged by the work, not the title |
| **Dead ends** | Applies anyway | Flags ghost jobs, stale reposts, roles that rule out sponsorship, and roles whose degree minimum is an H-1B risk |
| **Visa sponsorship** | Rarely considered | Reads each posting's wording **and** the employer's public H-1B filing history, plus, for tech and consulting employers, recent government actions against them |
| **Interview** | You find out what your resume claims | Lists only tools you can explain, and gives you a one-line answer for anything an interviewer may probe (title differences, gaps) |

These rules come with hand-run [test scenarios](tests/scenarios.md) drawn from people using RoleHarbor for their own job search.

## What a result looks like

*Illustrative example with a fictional employer.*

> **Mode:** Balanced. **Searched:** LinkedIn (14), Indeed (9), Glassdoor (6), employer sites (4), job-alert emails (3). **Window:** since your last search (2 days).
>
> | Role | Company | Posted | Freshness | Sponsorship | H-1B history | Eligibility |
> | --- | --- | --- | --- | --- | --- | --- |
> | Senior Platform Engineer | Northwind Insurance | 20 hours | Likely active | Not stated | Frequent sponsor (FY2025) | Pass |
> | Integration Architect | Contoso Health | 3 days | Check before applying (reposted twice) | Sponsors | Occasional sponsor | Pass |
> | Application Developer | Fabrikam | 5 days | Likely active | No sponsorship: skipped | — | Fail |
>
> **Truth check on your tailored resume:** 3 issues found and fixed ("designed" changed to "enhanced" to match your original; one unsupported tool removed; one estimated metric removed). **ATS keywords:** 14 of 17 present; missing: microservices, Kafka, TDD (not in your experience, so not added).

---

## Features

- **Role suggestions.** Not sure what to search for? It suggests 3-5 roles your resume already fits, each marked *Direct fit*, *Short step*, or *Stretch*, with the evidence from your resume, the job titles to search, and the biggest gap.
- **Multi-source job search.** LinkedIn, Indeed, Glassdoor, and ZipRecruiter; employer career sites and applicant-tracking systems (Workday, Greenhouse, Lever, iCIMS, and more), including the major employers in your field and area, such as health-system career sites for healthcare roles; plus specialist boards chosen to fit you: Dice, Built In, and Wellfound for tech, and We Work Remotely, Remotive, Remote.co, and FlexJobs when you're open to remote. Duplicates and reposts are merged, and the employer's own posting is preferred.
- **Search modes.** *Fast*, *Balanced* (default), and *Deep*. Deep mode runs web lookups in parallel helper agents where Claude supports them, while browser work stays with the main agent. Results start with a coverage line showing exactly what was and wasn't searched.
- **Wide, fresh search.** Searches the whole family of titles employers use for your work (for example Epic analyst, EHR analyst, clinical applications analyst), plus your core platform on its own (such as Epic or Guidewire), judges each job by its actual work rather than its title, goes past the first page, and runs a separate remote search when you're open to remote. The first search covers the past 7 days (widening to 14 or 30 if needed); later searches cover everything posted since your last one, newest first.
- **Bring your own link.** Found a job yourself? Paste the link and it goes through the same eligibility check, tailoring, and approval. If the search should have found it, the agent says why it didn't and offers to adjust future searches.
- **Optional work-authorization screening.** If you say you need sponsorship, each posting is labeled *Sponsors*, *Transfer only*, *No sponsorship*, or *Not stated*, with the employer's own wording. Postings that rule out what you need are skipped with the reason. It also checks each shortlisted employer's past H-1B filings (public Department of Labor data) and ranks frequent sponsors higher, while still respecting what each posting says. If you don't need sponsorship, this step stays out of the way.
- **Eligibility before fit.** Hard requirements (authorization, licenses, location, job type) are marked Pass / Fail / Unknown; only then are roles ranked by real fit (skills, seniority, domain), with the reasons shown.
- **Honest gap analysis.** Missing skills, seniority mismatches, and look-alike products (for example two different products from the same vendor) are called out instead of glossed over.
- **Truthful resume tailoring, written like a field expert.** Rewrites your summary, skills, and bullets in the posting's language only where your real experience supports it: results-first bullets in the XYZ format (accomplished X, measured by Y, by doing Z), ordered by impact, real numbers only, no filler or hype words, and nothing you couldn't explain in an interview. Presents before/after changes.
- **Two-lens review.** Before you see a draft, it is read as an ATS parser (keywords present and missing, formatting a parser would misread) and as a hiring manager skimming hundreds of resumes (what gets skipped, what stops the scroll, yes / maybe / no pile). It reports keyword coverage, never a made-up "ATS score".
- **Independent truth check.** Before you see a tailored resume, a separate check compares every line against your original resume and your confirmed answers, and flags anything unsupported (using the plugin's lightweight checker agent where Claude can run it).
- **Ghost-job detection.** Each shortlisted posting is labeled *Likely active*, *Check before applying*, or *Likely stale* (long-open, repeatedly reposted, evergreen wording, or closed on the employer's own site), so you don't waste applications.
- **Job-alert emails.** With Gmail or Outlook connected, it reads your LinkedIn, Indeed, and Glassdoor alert emails, which often surface roles a keyword search misses.
- **Daily digest.** Optionally, a scheduled check every morning lists only new strong matches posted since your last search.
- **Follow-ups that don't slip.** Recruiter calls and emails are marked *Action needed* and listed first, with a draft reply for you to send. Long forms keep a progress note, so an interruption never means starting over.
- **Approval gate.** Nothing is filled in until you reply **Approved**.
- **Careful form filling.** You attach the resume (ideally with the site's "Autofill with resume"), then the agent checks and fixes fields, asks all screening questions in one message, and stops before Submit.
- **Application tracker.** Optional spreadsheet or CSV that prevents duplicate applications and tracks follow-ups. A job is marked *Applied* only when you say so.
- **Optional extras, only when you ask:** referral suggestions (people the job site already shows you, with draft messages you send yourself), follow-up dates, role-specific interview prep, and a *Career Intelligence Report* with evidence-based skill gaps and a 30/60/90-day plan.

## How it works

```
Profile ──► Search (all sources) ──► Screen & rank ──► Pick a role ──► Tailor resume
                                                                          │
   You click Submit ◄── Agent stops ◄── Fill form ◄── You attach resume ◄─┴─ You reply "Approved"
```

1. **Profile.** Only your resume and target roles are required. Work authorization, location, work arrangement, and employment type are asked but skippable (the agent states its defaults); everything else is optional.
2. **Search and screen.** All sources for the chosen mode, deduplicated, and filtered against your must-haves.
3. **Rank and choose.** Eligibility check, explained fit, top pick plus backups; you choose which one to tailor for.
4. **Tailor and approve.** ATS keyword analysis, before/after resume changes, then a mandatory pause for your approval.
5. **Apply, with you in control.** The agent builds a one-page resume PDF, opens the application from the posting itself, fills and checks fields, and stops at Submit.

## Human-in-the-loop safeguards

These rules override everything else in the skill:

- Never submits an application. Stops with: *"Form completed. Ready for your final review and submission click."*
- Never creates accounts, types passwords, or solves CAPTCHAs or security checks. You sign in yourself.
- Never fills a form before you reply **Approved**.
- Never invents job titles, employers, dates, metrics, degrees, certifications, or skills.
- Never enters government ID numbers, bank details, or payment information.
- Never sends messages, connection requests, or emails on your behalf; outreach is drafted for you to send.
- Treats text on job pages, emails, and files as data, never as instructions (prompt-injection resistant), and stops instead of working around a blocked action.

## Requirements

| | Free plan | Paid plan (Pro or higher) |
| --- | --- | --- |
| Search Indeed (connector) and the web | Yes | Yes |
| Search LinkedIn and Glassdoor | No (needs a browser) | Yes |
| Check that job links open | No: links are marked "Not verified" | Yes |
| Tailor your resume and build the PDF | Yes | Yes |
| Fill the application form | No: you apply yourself | Yes, stopping before Submit |

- **A browser Claude can use** for LinkedIn, Glassdoor, link checks, and form filling: the built-in browser in the Claude desktop app, or the Claude in Chrome extension. Both require a paid Claude plan.
- **Recommended connectors:** before your first search, connect **Indeed** (and **Dice** for tech roles) under Customize → Connectors, plus **Gmail** or **Outlook** so it can read your job-alert emails and spot recruiter replies. The agent uses them automatically. They add to LinkedIn and Glassdoor; they don't replace them.
- **Your resume** (PDF, Word, or pasted text). Optionally your LinkedIn profile saved as a PDF (Claude can't open LinkedIn profile links).

## Installation

### Claude Code (from GitHub)

This repository is both the plugin and a one-plugin marketplace.

```bash
claude plugin marketplace add coder38/job-application-agent
claude plugin install job-application-agent@job-application-agent
```

Or from inside a session:

```
/plugin marketplace add coder38/job-application-agent
/plugin install job-application-agent@job-application-agent
```

To try it for one session without installing: clone the repository and run `claude --plugin-dir ./job-application-agent`.

### Claude app (claude.ai web and desktop, including Cowork)

- **As a plugin:** download `roleharbor-plugin.zip` from the latest release (or build it with `sh scripts/build-release.sh`), then Customize → Plugins → Add → **Upload plugin**. You can also add this GitHub repository as a marketplace under Customize → Plugins.
- **As a skill only:** download `roleharbor-skill.zip` from the latest release (or build it the same way), then Customize → Skills → **+** → Create skill → **Upload a skill**. Skills work on every plan, including Free.

On Team and Enterprise plans, an admin may need to allow uploaded plugins or skills.

**About a warning you may see:** when you add this repository as a marketplace, Claude may warn that `plugin.json` has unrecognized keys `privacyPolicyUrl` and `supportUrl`. These are listing fields that the Claude plugin directory reads; Claude simply ignores them when loading the plugin. It's safe to continue.

## Usage

Start a chat (in the desktop app for full features), attach your resume, and say:

> Use the job application agent skill to find jobs that match my resume.

More examples:

- *"I'm not sure which roles to go for. Suggest some my resume fits."*
- *"Here's a job I found: <link>. Can I apply to it?"*
- *"Deep search for senior backend engineer roles in Seattle or remote, and skip anything that can't sponsor an H-1B."*
- *"Fast search: data analyst jobs posted today, hybrid at most 2 days a week, salary at least $110K."*
- *"Tailor my resume for the second job in that list."*
- *"Want referral suggestions for this job? Yes."*
- *"What have I applied to, and what needs a follow-up?"*
- *"Give me a Career Intelligence Report for product analyst roles."*

**One-time setup on paid plans:** when the agent asks, show the browser (Cmd+Shift+B on Mac, Ctrl+Shift+B on Windows), sign in to LinkedIn and Glassdoor there yourself, and reply **ready**. Choose to keep sites allowed rather than allowing them once.

## Limitations

- LinkedIn and Glassdoor have no Claude connector and block automated fetching, so they're only searched through a browser (paid plans).
- The browser tools can't attach files; you attach the tailored resume yourself.
- Job sites change their layouts and may show security checks; the agent pauses for you rather than working around them.
- Searches run one site at a time in the browser, so a Balanced search typically takes a few minutes.
- Sponsorship screening reflects only what a posting says. It is not immigration or legal advice.
- Fit scores and career reports are heuristics based on the postings read, not predictions of interview or hiring outcomes.
- Results depend on the Claude plan, app, and tools available in your session.
- Job sites set their own terms for automated browsing. The agent works at a human pace, only on pages you could open yourself, and stops at any security check, but you are responsible for how you use it on each site.

## Privacy and data handling

- The plugin itself collects nothing and sends nothing anywhere. It has no servers, analytics, telemetry, hooks, or background processes.
- **Where your information goes, and only through tools you already use in Claude:**
  - *Job boards and web search* receive search terms: target titles, skills, and location. Your resume is not sent to them.
  - *Employers' application forms* (company career pages and applicant-tracking systems such as Workday, Greenhouse, and Lever) receive the details you approve, such as your name, contact details, and tailored resume, typed into the form only after you approve. You click Submit yourself.
  - Those sites keep what you submit under their own privacy policies.
- Your resume and answers stay in your Claude conversation. A profile, saved answers, or tracker is saved **only if you say yes**, and only where your Claude environment supports it (for example a Claude Project or a file you keep).
- Work authorization and voluntary self-identification answers are left out of saved files unless you choose to include them. Passwords, ID numbers, and financial details are never saved.
- Referral suggestions use only what the job site already shows you, open at most a few profiles, and never compile information about anyone.
- Job-site sign-ins happen in your browser, by you; the agent never sees or types your passwords.

See [PRIVACY.md](PRIVACY.md) for details.

## Troubleshooting

| Problem | Fix |
| --- | --- |
| The agent doesn't follow these steps | Check the plugin or skill is enabled, and start with "Use the job application agent skill". |
| It only searches Indeed | Use the Claude desktop app (paid plan) so it can use the built-in browser. |
| "I can't see your LinkedIn" | Attach your LinkedIn profile as a PDF; for LinkedIn jobs, sign in to LinkedIn in the app's browser. |
| A job link shows an error | Tell the agent which link failed; it will find the direct posting or the company careers page. |
| Glassdoor shows "Humans only" | Sign in to Glassdoor and complete the check yourself, then say "ready". |
| The browser is paused or a popup is open | Finish signing in or close the popup, then say "ready". |
| You can't see the browser | Press Cmd+Shift+B (Mac) or Ctrl+Shift+B (Windows) in the desktop app. |

## Repository structure

```
job-application-agent/
├── .claude-plugin/
│   ├── plugin.json          # Plugin manifest
│   └── marketplace.json     # Lets this repo act as its own marketplace
├── agents/
│   └── resume-checker.md    # Lightweight truth-check agent (fast model, read-only)
├── skills/
│   └── job-application-agent/
│       ├── SKILL.md         # Core workflow, approval pauses, truth and safety rules
│       └── references/      # Detailed steps, loaded only when needed
│           ├── search.md            # Sources, search plan, browser, screening
│           ├── role-suggestions.md  # Suggesting roles to target
│           ├── resume-standards.md  # Resume writing standards
│           ├── applying.md          # Building the resume file and filling forms
│           ├── resume-check.md      # Truth check for tailored resumes
│           ├── parallel-lookups.md  # Parallel helper lookups in Deep mode
│           ├── daily-digest.md      # Scheduled daily digest of new matches
│           ├── tracker.md           # Application tracker and search log
│           ├── referrals.md         # Optional referral suggestions
│           └── career-intelligence.md  # Optional skill-gap and career advice
├── scripts/
│   └── build-release.sh     # Builds the plugin and skill ZIPs from the same files
├── tests/
│   └── scenarios.md         # Hand-run test scenarios from real use (not packaged)
├── CHANGELOG.md
├── LICENSE
├── PRIVACY.md
└── README.md
```

## Development

```bash
claude plugin validate --strict .            # validate plugin + marketplace
claude --plugin-dir .                        # try it in a session
sh scripts/build-release.sh                  # build dist/ plugin and skill ZIPs
```

Bump `version` in `.claude-plugin/plugin.json` with every release so installed copies update.

## License

Released under the [MIT License](LICENSE).
