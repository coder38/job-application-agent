# Privacy

This document explains what the Job Application Agent plugin does with your information.

## What the plugin is

The plugin is a set of written instructions (a Claude skill). It contains no code that runs on your device, no servers, no analytics, no telemetry, no hooks, and no background processes. It cannot send data anywhere by itself.

Everything it does happens through tools that are already part of your Claude session: Claude's built-in browser or the Claude in Chrome extension, job-board connectors you have chosen to connect, web search, and Claude's file creation. Those tools are covered by Anthropic's privacy policy and by the terms of the websites you visit.

## Information you provide

- **Resume and LinkedIn PDF.** Used to match, rank, and tailor applications. They stay in your Claude conversation unless you choose to save them elsewhere.
- **Profile answers** (target roles, location, work arrangement, employment type, salary floor, exclusions). Used to filter and rank jobs.
- **Work authorization.** Used only to screen postings. Left out of any saved profile unless you explicitly choose to include it.
- **Voluntary self-identification.** Defaults to "decline to self-identify". Answered only as you choose, and never saved unless you ask.
- **Screening answers** (notice period, relocation, salary expectations, written answers). Saved to a reusable answer bank only with your permission.

## What the agent saves, and where

Nothing is saved unless you say yes. When you agree, the agent saves to a place your Claude environment supports, such as a Claude Project document or a file you download and keep:

| Item | Saved when | Never includes |
| --- | --- | --- |
| Profile (`job-agent-profile.md`) | You accept the offer to save it | Passwords, ID numbers, financial details; work authorization and self-identification unless you opt in |
| Answer bank | You approve saving specific answers | Anything you didn't approve |
| Application tracker (spreadsheet or `job-applications.csv`) | You accept the offer to create it | Credentials or personal identifiers |
| Tailored resumes | After you approve the changes | Anything not supported by your original resume or your own answers |

Your original resume is never modified.

## Websites and accounts

- You sign in to job sites yourself. The agent never sees, types, or stores your passwords, never creates accounts, and never completes CAPTCHAs or security checks.
- The agent never submits an application, sends a message, or makes a connection request on your behalf.
- It never enters government ID numbers, bank details, or payment information into any form.

## Other people

Referral suggestions are optional and run only when you ask. The agent suggests at most three people the job site already shows you (your own connections, the job poster or hiring team, school alumni), uses only their name, title, and team as shown, opens at most a few profiles, and never collects contact details or compiles information about anyone. Messages are drafted for you to review and send yourself.

## Content from websites

Text on job pages, emails, and files is treated as data, never as instructions. If a page contains instructions aimed at the agent, it quotes them to you and asks before doing anything.

## Questions

Open an issue in this repository for questions about this document. For how Anthropic handles data in Claude, see Anthropic's privacy policy.
