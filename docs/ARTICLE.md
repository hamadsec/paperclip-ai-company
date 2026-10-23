# I built a tiny AI "company" on one laptop — and it shipped

A short, plain story: not "what if an AI acted like a team?" but *what happened when I actually built
one* — a small AI software company that runs on a single laptop, reviews its own work, and ships.

---

## The idea

Everyone has chatted with a single AI helper. I wanted to run **several** of them like employees — a
product owner who plans, engineers who write code, a tester, a reviewer who signs off, a security
checker — all picking work off a shared board.

Three rules I gave myself:

1. **It has to run on one laptop.** No cloud, no rented servers.
2. **It must never cost me a surprise.** It should stop *before* it spends money, not after.
3. **It has to be safe to leave alone.** No leaking my keys, no breaking my code.

## How it turned out

It runs like a little office. A brief comes in; the **Product Owner** turns it into small tasks; an
**Engineer** writes the code and opens a pull request; the **Tech Lead reviews the diff and approves
it**; and the change merges and ships. Small, green, approved changes flow on their own; anything
bigger or risky waits for me, with a chat ping.

It grew to **ten roles** — CEO, Tech Lead, Product Owner, Security, Engineer, Release, QA, Designer,
plus a maintenance and a watchdog role — each with one job and a manager. Around that core sit the
quiet helpers: a budget gate that refuses to run if the window's spent, a governor watching the
machine, nightly backups, and a big **STOP** button I can hit from my phone.

## The moment it clicked

The test I cared about: hand the company a one‑line brief and *don't touch the keyboard*. I asked for a
simple "How It Works" page. The Product Owner planned it, the Engineer built it (with a test), the
tests went green, the system **opened a review task for the Tech Lead**, the Tech Lead read the diff
and approved it, and it **merged and served** — start to finish in a few minutes, fully on its own.

That's the difference between a clever demo and something that behaves like a team.

## The things I'm proudest of

**It can't overspend.** A simple check sits in front of every run: "is this allowed and affordable
right now?" If anything's off, it just waits. Paid spend stayed at exactly **zero** the whole time —
by design, not luck. The worst case is "the work happens a bit later," never "a scary bill."

**Every change gets reviewed.** I didn't want a rubber stamp, so nothing merges until an AI reviewer
(the Tech Lead, or Security for risky changes) reads the actual diff and signs off. The orchestrator
didn't have this as a feature, so I wired it as a convention — and it held.

**I can run it from my phone.** A chat front door lets me text "status" and get an accurate read of the
whole company, or send a brief and watch it become a task.

## What it taught me

- **Being strict is what makes it relaxing.** The budget gate, the sandbox, the review gate, the STOP
  button — those rules are *exactly* why I can walk away.
- **Start tiny, grow on merit.** One engineer, one task. Add a role only when it has a real job.
- **The hard parts are the boring parts.** The interesting failures weren't the AI writing bad code —
  they were a token that couldn't update a stale PR, git worktrees that weren't isolated, and a Windows
  security feature blocking an unsigned update. Getting those right is the whole game.

## Would I recommend building one?

As a way to *understand* AI agents, cost control, and safety — absolutely. You learn more than any
single‑chat workflow teaches. Start with one engineer and one task, keep the budget gate and sandbox in
front of everything, and grow your "company" only when it earns it.

Want to try? → [**Build your own**](BUILD-YOUR-OWN.md) · [**Why it's different**](WHY-DIFFERENT.md) · [**Meet the team**](TEAM.md)

*— written up with the private bits removed.*
