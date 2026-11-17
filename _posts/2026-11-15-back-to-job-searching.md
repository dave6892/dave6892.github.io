---
title: "Back to job searching, and what I'm doing differently"
date: 2026-11-15 00:00:00 +0000
# author: David
categories: [Job Search, Blog]
tags: [blog, job_search]
description: Why my job search stopped working, what a recruiter told me, and the verified-evidence process I built in response.
toc: false
---

A few weeks into my job search, I'd sent about 35 applications. About 15 came back as rejection emails, and 4 became interviews. Many of the rejections were for roles I'd have called a sure fit. Most had scored 85% or higher in the AI tool I used to tailor each resume.

Five days ago I asked one of the recruiters who rejected me what I was missing. Their answer made it clear that my approach wasn't working.

This is the first post in a series about running this search differently. It covers how I searched before, what the recruiter told me, and the process I've built since. I don't have results from the new process yet. Later posts will report them, good or bad.

## The real problem is standing out

Software engineering roles draw huge applicant pools, and the pools keep growing. Ashby, a recruiting platform, found that applications per hire have roughly tripled since 2021, to more than 300 on average, and candidates are about half as likely to get an interview as five years ago ([Ashby, May 2026](https://www.prnewswire.com/news-releases/new-data-from-ashby-reveals-surge-in-applications-rising-selectivity-and-shifting-recruiter-workloads-302765846.html)). Greenhouse sees about 254 applicants for every job posted on its platform ([Fortune, July 2026](https://fortune.com/2026/07/27/greenhouse-ceo-daniel-chait-ai-doom-loop-job-seekers-spam-interview-applications-unemployment/)). A selection process at that scale has to be built for volume, and a resume has to stand out to whoever, or whatever, reads it first.

My old approach didn't stand out. One generic resume, sent to every job recommended to me, looks like hundreds of others in the same pile. AI tailoring made each resume match its posting more closely, but most applicants now use the same tools. In Greenhouse's 2026 survey, 77% of U.S. job seekers had used AI in their search, and its chief people officer described employers sifting through "AI-polished resumes that all look the same" ([Greenhouse, October 2026](https://www.greenhouse.com/newsroom/6-in-10-job-seekers-are-rethinking-how-they-write-to-avoid-sounding-like-ai-even-as-most-use-it-in-their-search)).

## How I searched before

Before my last job, I searched for about three months. I had one resume: a single page built in LaTeX on Overleaf, with personal info at the top, then education, work experience, projects and skills. There was no summary. I applied through LinkedIn Easy Apply, referrals and recruiters who reached out. I didn't filter. If a job was recommended to me, I applied.

That search took 30 to 50 applications. About 15 got a reply and 5 became interviews.

This time I started the same way, adding my latest job to the same resume. I also tailored every resume with Jobright, an AI tool that rewrites a resume around a posting's ATS keywords. It rephrased my bullets, keywords and summary. I checked every version for invented numbers and never found one. Nothing it wrote was something I couldn't defend.

The results didn't move. About 35 applications in a few weeks, about 15 rejections and 4 interviews. Tailoring and high match scores made no difference I could see. I wasn't unusual: in the same Greenhouse survey, 81% of U.S. candidates had been rejected in the past year without speaking to anyone at the company.

## What the recruiter told me

The feedback was general advice, not a note on my application. Paraphrased:

- For a few projects per role, show the problem, your part in it, and the result.
- Put scale and ownership on the page. Be clear about what you owned and what the team did.
- Use technologies in context: what you built or fixed with them.
- Pick the three or four examples that best match the posting, and cut the rest.
- Use numbers you can discuss two levels deeper in an interview.

One line stood out: "Restating the job description gives us little to evaluate."

## Why a high match score wasn't enough

That line describes what my resumes had become. A keyword-tailoring tool rewrites your resume to look more like the posting. Jobright [compares your resume with the job's requirements](https://jobright.ai/ai-resume-builder), and the match score tells you how close you got.

My scores were mostly 85% or higher, and the rejections came anyway. The score measured how much my resume overlapped with the posting's words. The recruiter's list asks what's behind those words: what I did, at what scale, with what result.

The tool got two things right, and I'm keeping both. Every resume should be tailored to the posting, and checked against it before it goes out. What I'm changing is what goes in and what gets measured.

My new process scores resumes too, so the same doubt applies to it. My score isn't proven either. Tracking real outcomes in this series is how I'll find out whether it means anything.

## The new process

I spent the next four days building a different process with Claude, then redesigned it as two loops connected by a library of verified work. Some steps run today. Others are marked new because I'm still building them.

I designed it around three goals:

1. **The best-matching resume and application for each posting,** built from real evidence instead of keyword overlap.
2. **Preparation for the conversation.** Working through each past project and defending every claim gets me ready to cover the important points in a recruiter screen, and to rehearse answers to situational questions.
3. **A clear picture for the recruiter:** how I'd fit the team, and how my experience applies to the problem the company is hiring to solve right now.

**Loop 1: build a library of verified work.** This runs on its own schedule, separate from any posting.

1. **Interview myself about every past job.** One question at a time. Each fact is marked confirmed, assumed, keep-off or still open. Assumed facts can never appear on a resume.
2. **Store it one project at a time.** Each entry holds the problem, my part, the decisions, the outcome and the evidence, tagged by area such as infrastructure or payments. (Being reorganized into this shape now.)

**Loop 2: one run per posting.** It reads from the library and never adds to it.

1. **Decompose the posting** into a frozen list of weighted requirements, including the one or two problems the role is really hiring to solve.
2. **Triage** before writing anything: go, stretch or skip, based on whether the library has evidence for the main requirements.
3. **Assemble the evidence** before any wording: three to six projects per recent role that best match the posting.
4. **Write** the bullets and summary from those projects only. Wording and order can change. Facts can't.
5. **Evaluate and iterate,** up to three rounds. A fixed script scores coverage and ATS keywords, a form check catches weak phrasing, and every claim is traced to a confirmed fact. If a requirement has no evidence, the loop stops trying and sends the gap back to loop 1.
6. **I approve** the final version.
7. **Apply and track** what was sent and what came back.

The library covers the recruiter's first three points: problem, part, result, scale and ownership. Assembling evidence covers the fourth, picking the best few examples. The claim trace covers the fifth, numbers I can defend. Because every round has to pass that trace, a higher score can't come from keyword stuffing.

Here's the kind of change it makes. A bullet written from memory might say "Helped improve checkout performance." After interviewing myself about it, the same work reads: "Traced checkout timeouts to an unindexed orders query, added the index and a read cache, and cut p95 latency from 2.1s to 400ms before the holiday peak. The team handled the rollout." That version has the problem, my part, the result, the scale and the ownership, which is everything the recruiter asked for.

So far I've run this on about five postings.

## What interviewing myself caught

The recruiter's last point, numbers I can discuss two levels deeper, meant checking my own history before trusting it. Interviewing myself caught several places where my memory had rounded up. I'm keeping the specifics private.

Here's what that kind of drift looks like, with invented examples:

- **Ownership:** "Built the event pipeline," when it existed before you joined and your work was fixing its consumers.
- **Ship status:** "Designed a caching layer," when the design was a proposal that never got built.
- **Scale:** "Served millions of users," when that was the company's total and your feature launched in one region.

None of these is a lie you'd notice telling. Each would still fall apart under one follow-up question in an interview.

It works the other way too. "Wrote some onboarding docs" can turn out to mean you ran onboarding for every new hire on the team for a year. Interviewing myself turned up stronger stories than I'd been telling.

What I have now is a resume I can defend line by line, built from better material than before.

## What's missing, and what's next

The last step, apply and track, doesn't exist yet. Until it does, nothing records which applications went out or what came back, so I can't tell whether my score predicts anything better than the AI tool's did. Building that tracker comes next, and this series will report what it shows.

Next posts:

- Interviewing myself before writing a resume, and what got corrected
- Reading a posting for the two requirements that matter
- Scoring a resume like a test suite
- A running log: applications, replies, interviews, with real numbers

If you're job searching too, I'd like to hear how you're doing it.

## Sources

- Ashby. [New data from Ashby reveals surge in applications, rising selectivity, and shifting recruiter workloads](https://www.prnewswire.com/news-releases/new-data-from-ashby-reveals-surge-in-applications-rising-selectivity-and-shifting-recruiter-workloads-302765846.html). PR Newswire, May 7, 2026. Analysis of 100M+ applications and 200K+ jobs.
- Orianna Rosa Royle. [Greenhouse CEO on the AI "doom loop" in hiring](https://fortune.com/2026/07/27/greenhouse-ceo-daniel-chait-ai-doom-loop-job-seekers-spam-interview-applications-unemployment/). Fortune, July 27, 2026.
- Greenhouse. [6 in 10 job seekers are rethinking how they write to avoid sounding like AI](https://www.greenhouse.com/newsroom/6-in-10-job-seekers-are-rethinking-how-they-write-to-avoid-sounding-like-ai-even-as-most-use-it-in-their-search). Press release for the 2026 Future of Hiring Candidate Report, October 20, 2026. Survey of 2,800+ job seekers, 1,200 in the U.S.
- Jobright. [AI Resume Builder](https://jobright.ai/ai-resume-builder). Product page.
- Recruiter feedback: private email to the author, paraphrased and quoted anonymously.
- My own application numbers are approximate counts from my own search. The resume examples are invented for illustration.
