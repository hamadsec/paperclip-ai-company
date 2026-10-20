# I built a tiny AI "company" on one laptop

A short, plain story of a weekend experiment: what if an AI didn't act like one assistant, but
like a small **team** that works for you?

---

## The idea

Everyone has chatted with a single AI helper. I wondered what happens if you run **several** of
them like employees — an engineer who writes code, a tester who checks it, a reviewer who signs
off — all picking up tasks from a shared list.

I gave myself three rules:

1. **It has to run on one laptop.** No cloud, no rented servers.
2. **It must never cost me a surprise.** It should stop *before* it spends money, not after.
3. **It has to be safe to leave alone.** No leaking my passwords, no breaking my code.

## How it turned out

It works like a little office. Tasks sit on a list. An AI teammate picks one up, does a small piece
of work, and hands back a proposed change for me to approve. If the change is small and passes the
tests, it goes in on its own. If it's bigger or risky, it waits for me and sends a message.

Around that core sit a few quiet helpers: one that watches the budget and refuses to run if it's
spent, one that keeps an eye on the laptop so the AI doesn't hog it, nightly backups, and a big
**STOP** button I can hit from my phone. Those helpers are the difference between a fun demo and
something I can actually leave running.

## The two things I'm proudest of

**It can't overspend.** There's a simple check in front of the AI: before it runs, it asks "is this
allowed and affordable right now?" If anything's off, it just waits. The worst case is "the work
happens a bit later," never "a scary bill."

**It approves its own easy work.** I used to click "approve" on every single change, which doesn't
scale. Now small, safe changes merge automatically, and only the important ones land on my desk. I
went from babysitting everything to handling just the 20% that matters.

## What it taught me

- **Being strict is what makes it relaxing.** The budget stop, the sandbox, the STOP button — the
  rules are exactly why I can walk away and not worry.
- **Start tiny.** One teammate, one task. Add more only when each new "role" has a real job.
- **Small machines teach discipline.** Sharing a laptop forces you to keep each task small and
  cheap — which, it turns out, is just good practice anyway.

## Would I recommend it?

As a way to learn: absolutely. You end up understanding AI agents, costs, and safety far better
than any single‑chat workflow teaches you. Start with one engineer and one task — and grow your
"company" only when it earns it.

Want to try? → [**Build your own**](BUILD-YOUR-OWN.md) · [**Why it's different**](WHY-DIFFERENT.md)

*— a weekend experiment, written up with the private bits removed.*
