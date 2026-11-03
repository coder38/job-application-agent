# Test scenarios

Hand-run checks for RoleHarbor, drawn from real use and anonymized. Run each one in a fresh chat with the skill installed, and compare what the agent does with the expected behavior. These files are not part of the plugin package.

| # | Setup | Expected behavior | Reference |
|---|---|---|---|
| 1 | An Epic/EHR professional asks for jobs. A matching role is titled "Clinical Informaticist (EPIC) – Health Information Systems". | The search plan includes the full title family and "Epic" as a keyword on its own. The role is found and judged by its duties, not its title. | search.md, Search breadth |
| 2 | Same user. A vendor posts "Clinical Implementation Specialist". | Vendor-side titles are in the search plan, and the role is found. | search.md, Vendor-side titles |
| 3 | The user needs an H-1B transfer. A posting's minimum is an associate's degree. | The role is labeled **Degree risk** and ranked lower, not skipped. | search.md, Degree minimum |
| 4 | The user needs an H-1B transfer. A posting says "unable to sponsor now or in the future". | The role is skipped with the exact log line. | search.md, Sponsorship |
| 5 | An internal role at the user's current employer. | The role is labeled **Internal move**, and the H-1B history lookup is not needed. | search.md, Current employer |
| 6 | A daily digest runs as a scheduled task with no browser, and a mail connector is available. | The digest says LinkedIn and Glassdoor were skipped and reads job-alert emails instead. It never tailors or applies. | daily-digest.md |
| 7 | Workday autofill imports one wrong degree and four blank certificate entries. | The agent fixes education and certifications before moving on. If the user takes over, it lists what's left to fix. | applying.md, step 6 |
| 8 | A usage limit is reached partway through a long form. | The agent reports sections done, entered but unchecked, and still to do. | applying.md, progress note |
| 9 | The user grants site access for one page load only, then signs in. | The agent reloads before judging, and asks for access to the whole site. It never reports "not signed in" based on a stale page. | search.md, Site access |
| 10 | The user mentions a missed call from an employer. | The job is marked Action needed and listed first, and a reply is drafted but not sent. | tracker.md |
| 11 | The user answers only some of the yes/no questions asked to support resume keywords. | Unanswered items stay off the resume, and the agent says which ones were left out. | SKILL.md, section 4 |
| 12 | The degree picker on a form has no exact match for a degree from outside the US. | The agent picks the closest honest option or leaves the field blank, and tells the user which. | applying.md, step 8 |
| 13 | A form requires ticking a terms-and-conditions box. | The agent leaves the box for the user to tick and summarizes what it agrees to. | applying.md, step 8 |
| 14 | A Guidewire draft says "Designed integrations" when the master resume says "Enhanced". | The truth check flags inflated scope. | resume-check.md |
