# Job Application Agent

A Claude plugin that runs a job search the way a careful career coach would: it finds recently posted roles that fit your resume, screens out postings that rule out your work-authorization needs, tailors your resume to the best match **without inventing anything**, and helps fill the application form **only after you approve**, always stopping before the final Submit click.

The plugin is a single, carefully structured [skill](skills/job-application-agent/SKILL.md). It adds no servers, hooks, background jobs, or scripts that run on your machine; everything it does happens through tools you already have in Claude (its browser, your connected job-board connectors, web search, and file creation).

---

## Features

- **Multi-source job search.** LinkedIn, Indeed, Glassdoor, connected job-board connectors (Dice, ZipRecruiter), and company career / ATS pages (Greenhouse, Lever, Workday, Ashby), with duplicates and reposts merged.
- **Search modes.** *Fast*, *Balanced* (default), and *Deep*. Results start with a coverage line showing exactly what was and wasn't searched.
- **Freshness first.** Last 48 hours by default, automatically widening to 7 and then 14 days when there are too few good matches, and telling you when it does.
- **Work-authorization screening.** Each posting is labeled *Sponsors*, *Transfer only*, *No sponsorship*, or *Not stated*, with the employer's own wording. Postings that rule out the visa you need are skipped with the reason.
- **Eligibility before fit.** Hard requirements (authorization, licenses, location, job type) are marked Pass / Fail / Unknown; only then are roles ranked by real fit (skills, seniority, domain), with the reasons shown.
- **Honest gap analysis.** Missing skills, seniority mismatches, and look-alike products (for example two different products from the same vendor) are called out instead of glossed over.
- **Truthful resume tailoring.** Rewrites your summary, skills, and bullets in the posting's language only where your real experience supports it, checks every title, date, and skill against your original, and presents before/after changes.
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
2. **Search and screen.** All sources for the chosen mode, deduplicated, filtered, and sponsorship-checked.
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
- **Optional connectors:** Indeed, Dice, or ZipRecruiter (Customize → Connectors) add results; they don't replace LinkedIn and Glassdoor.
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

- **As a plugin:** download `job-application-agent-plugin.zip` from the latest release (or build it with `sh scripts/build-release.sh`), then Customize → Plugins → Add → **Upload plugin**. You can also add this GitHub repository as a marketplace under Customize → Plugins.
- **As a skill only:** download `job-application-agent-skill.zip` from the latest release (or build it the same way), then Customize → Skills → **+** → Create skill → **Upload a skill**. Skills work on every plan, including Free.

On Team and Enterprise plans, an admin may need to allow uploaded plugins or skills.

## Usage

Start a chat (in the desktop app for full features), attach your resume, and say:

> Use the job application agent skill to find jobs that match my resume.

More examples:

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
├── skills/
│   └── job-application-agent/
│       └── SKILL.md         # The agent's instructions (single source of truth)
├── scripts/
│   └── build-release.sh     # Builds the plugin and skill ZIPs from the same files
├── CHANGELOG.md
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
