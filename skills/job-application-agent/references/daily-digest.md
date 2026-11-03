# Daily new-jobs digest

Part of the job-application-agent skill. Use this to set up a recurring digest when the user agrees, and to run one when a scheduled task fires.

## Offering it

After the first search in a conversation, offer once in one line: "Want a daily digest of new matches? I can check every morning and list only what's new." Offer it only if this environment can create scheduled tasks (look for a scheduling tool, using tool search if you have it). If it can't, don't offer.

## Setting it up (only with a yes)

1. **Save what a fresh session will need.** A scheduled run starts with no memory of this conversation, so make sure these are saved where the environment supports it (a Claude Project document or the user's saved files), with the user's OK:
   - the profile (`job-agent-profile.md`), including the search plan (titles, platform keywords, sources), location, exclusions, and whether US sponsorship is needed;
   - the tracker with its search log (`tracker.md`), so each run covers only what's new.
   If they can't be saved, explain that the digest can't work and stop.
2. **Ask two things in one message:** what time (default 8:00 in the user's time zone, weekdays) and how many matches at most (default 10).
3. **Create the scheduled task** with a self-contained prompt, for example: "Run the job-application-agent daily digest: read job-agent-profile.md and the job tracker, search for jobs posted since the last search in the search log, and post only new strong matches. Don't tailor, apply, or contact anyone."
4. **Confirm in one line** what was scheduled, when, and how to stop it.

## Running a digest

- **Read the profile and the tracker first.** If either is missing, say so in one line and stop.
- **Search since the last search** in the search log, in **Fast** mode by default: the profile's main titles and platform keywords, core boards, and connectors. Use the browser only if it's available and already signed in; never ask the user to sign in during a digest. Scheduled runs often have no browser, so read job-alert emails when a mail connector is available (`search.md`, source 5); they are the best stand-in for LinkedIn and Glassdoor. Start the digest by naming the sources that were skipped, for example "LinkedIn and Glassdoor skipped: no browser in scheduled runs."
- **Screen as usual:** duplicates and tracker matches out, exclusions out, "No sponsorship" postings skipped and logged, freshness signals checked (`search.md`, 2c). Run the H-1B history check only for US jobs when the user needs sponsorship, and only for new employers not already in the tracker.
- **Post a short digest:** a coverage line, then up to the user's maximum of new strong matches, newest first, each with title, company, location, age, a one-line fit reason, the sponsorship label when relevant, and a verified link. End with "Reply with a number to tailor your resume for it." If nothing new passed, say so in one line.
- **Update the tracker:** add the digest's matches as Considering and record the search in the search log.
- **Never** tailor, fill forms, apply, or message anyone during a digest. Those wait for the user.
