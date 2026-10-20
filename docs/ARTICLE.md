# I built a tiny AI software company on one laptop

*A short write‑up of an experiment: running a role‑based "AI company" of coding agents on a
single ~16 GB Windows laptop — safely, cheaply, and mostly unattended.*

---

## The itch

Everyone has chatted with a single AI coding assistant. I wanted to know what happens when you
stop treating it as *one assistant* and start treating it as *a team*: an Engineer who writes the
code, a QA who tests it, a Tech Lead who reviews, a Security Officer who guards the dangerous bits,
and a board of tickets flowing between them. Not a demo — something I could leave running.

Three constraints made it interesting:

1. **One laptop.** No cloud bill, no cluster. The same machine already runs other self‑hosted
   apps, so I had maybe half its ~16 GB of RAM to play with.
2. **No surprise spend.** Most agents run on a flat‑rate subscription. The system itself had to
   *guarantee* it would never spill into paid overage — not rely on me watching a dashboard.
3. **Safe to leave alone.** If agents run while I sleep, they must not be able to leak credentials,
   touch the host, or merge something risky on their own.

## The shape of the solution

A **self‑hosted orchestrator** runs inside WSL2 and drives several **AI coding agents**, each
pinned to a **role**. Tickets live on a board. The orchestrator takes one ticket, runs it as a
**single short task** (tight turn/time/budget caps — "one small task per run"), and the agent's
only way to produce output is a **pull request on GitHub**, made from a **fork** it pushes to. It
never has write access to the real repo.

Around that core sit a handful of **ops services**: a usage gate, a resource governor, nightly
backups, a monitor dashboard, and a Telegram notifier. They're the difference between "a cool demo"
and "a thing you can actually leave running."

## The two ideas I'm proudest of

**1. A pre‑emptive usage gate that fails closed.**
A thin wrapper sits in front of the agent binary. Before every subscription‑lane run it checks:
is there a HALT flag? did an API key sneak into the environment? is the usage data fresh? is the
usage window below its threshold? have paid credits moved recently? If *anything* is off, it
refuses. The key word is *pre‑emptive*: it decides **before** the run, so the worst case is "the
agent waits for the window to reset," never "a surprise invoice." There is deliberately **no**
API‑key fallback on that lane — exhaustion means *wait*, not *pay*.

**2. A merge policy instead of a human clicking "merge."**
Early on, every pull request waited for me. That doesn't scale to an unattended company. So a small
policy runs on a timer and auto‑approves + squash‑merges a bot's PR **only** when CI is green, the
diff is small, and nothing under protected paths (CI config, code owners, license) changed.
Everything else is left for a human, with a chat ping. The human gate moved from *every PR* to
*the policy, the protected paths, and a big red HALT button*.

## What went wrong (and taught me the most)

- **Sandboxes break ergonomics in surprising ways.** Denying a whole config directory also hid the
  orchestrator's own CLI; blanket `~` deny rules broke because temporary runs changed `$HOME`. The
  fix was always *narrower* rules, found by watching real runs fail.
- **"Behind" pull requests stall everything.** With a "branch must be up to date to merge" rule, any
  PR that falls behind main needs its branch updated — and the minimal human token couldn't push to
  the bot's fork. The clean fix: let the **bot** update its own fork (it owns it), and keep the
  human token minimal. Mechanical work belongs to a mechanical actor, not to your scarcest resource.
- **Small machines punish you for parallelism.** Memory caps, an agent‑slot gate, and a governor
  that can pause a lane aren't bureaucracy — they're what keeps the other apps on the laptop alive.

## Would I recommend it?

As a learning project: absolutely. You end up understanding agents, sandboxes, cost control, and
CI/merge automation far better than any single‑assistant workflow teaches you. As a serious
dev shop replacement: not yet — but the guardrails (gate, governor, sandbox, merge policy) are the
reusable, durable part, and they transfer to bigger setups unchanged.

The repo this article lives in has a [build‑your‑own guide](BUILD-YOUR-OWN.md), a sanitized
[config template](../examples/company.yaml), and a teaching version of the
[usage gate](../examples/usage-gate.sh). Start with one Engineer and one ticket, and grow the org
only when each new role has a reason to exist.

*— a weekend experiment, written up with the sensitive bits removed.*
