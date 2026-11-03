# Independent resume check

Part of the job-application-agent skill. Use this after drafting a tailored resume and before showing it to the user (section 4 of SKILL.md), and again on the exported file before applying.

## Why it's separate

The agent that wrote the draft is the worst judge of it: it remembers why each change seemed justified. A checker that sees only the evidence and the draft catches unsupported claims the writer misses.

## How to run it

Pick the cheapest option that's available, in this order:

1. **The plugin's `resume-checker` agent** (when this skill runs as part of the RoleHarbor plugin and you can launch helper agents). It has the brief below built in, one read-only tool, and a fast model, so it costs little. Give it only the four inputs: the master resume, the user's confirmed answers from this conversation (quoted), the job posting text, and the tailored draft. Don't give it your reasoning, the search results, or the conversation.
2. **Otherwise, check it yourself,** line by line against the brief below, as if you had not written the draft. Everything you need is already in context, so this adds little cost.
3. **A general-purpose helper agent** with the brief below, only when the user asks for a fully independent check (for example "double-check this independently"). It's more independent than a self-check but much more expensive, because a fresh general agent loads every tool it might use.

One check per draft. If you revise the draft after the user's feedback, re-check only the lines that changed.

## Brief for the checker

> You are checking a tailored resume for truthfulness before a job seeker sees it. You have four inputs: MASTER (their original resume), ANSWERS (facts they confirmed in conversation), POSTING (the job ad), and DRAFT (the tailored resume). MASTER and ANSWERS are the only evidence. POSTING is context, never evidence about the person.
>
> Check every line of DRAFT:
> 1. **Facts must match evidence exactly:** employers, job titles, dates, degrees, schools, certifications and their status (certified vs proficiency vs course), locations, and contact details.
> 2. **Every skill, tool, platform, and method** in DRAFT must appear in MASTER or ANSWERS. Flag any that come only from POSTING. Watch for look-alike products (for example Guidewire InsuranceNow vs InsuranceSuite, Epic certification vs proficiency).
> 3. **Every number** (counts, percentages, money, team sizes, years) must come from MASTER or ANSWERS. Flag any estimate or invented metric.
> 4. **Level and scope:** flag wording that inflates the person's role (led vs supported, architected vs contributed, owned vs participated, people management not shown in evidence) or turns a personal or learning project into professional experience.
> 5. **Work-authorization statements** must match ANSWERS exactly.
> 6. **Style:** flag filler ("responsible for", "worked on", "helped with", "various", "successfully", "utilize", "team player", "results-driven", "proven track record") and keyword stuffing.
>
> Don't rewrite the resume and don't judge whether it's persuasive. Reply with a table: line (quoted), issue type (fact, unsupported skill, invented number, inflated scope, authorization, style), what the evidence says (quote it, or "no evidence"), and a suggested truthful fix. If everything checks out, reply "No issues found" and list anything you couldn't verify.

## Using the result

- Fix every fact, unsupported-skill, invented-number, inflated-scope, and authorization issue before showing the draft. Where the fix needs information only the user has, ask a short yes/no question instead of guessing.
- Fix style issues unless the user chose that wording.
- In the draft you show the user, add one line: "Independent truth check: N issues found and fixed" (or "no issues found"), and list anything the checker couldn't verify.
