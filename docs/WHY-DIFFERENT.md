# Why this one is different

A 2‑minute read. Lots of projects let AI write code. Here's what makes **this** setup stand out — in
plain words. The short version: it's a *team* with guardrails, and it's been **proven to ship on its
own**, on one laptop, without spending a cent of surprise money.

---

## 1. It runs on your own laptop 💻

No cloud account, no servers to rent, no monthly hosting bill. One ordinary laptop runs the whole
"company." Your code and your keys stay with you.

## 2. It can't overspend 💸

Most AI setups happily keep spending until *you* notice. This one has a built‑in gate that stops
**before** it would cost money. Over the whole build, paid spend stayed at exactly **zero**. If the
usage window is full, the team simply **waits** — leave it running overnight without watching a meter.

## 3. It's a team, not a swarm 👥

Instead of a pile of bots talking over each other, you get **ten clear roles** — CEO, product owner,
tech lead, security, engineer, release, QA, designer, and ops — each with one job and a manager. It
behaves like a small company, which makes it predictable and easy to follow.

## 4. Every change is reviewed 🧭

This is the big one. Nothing merges on a rubber stamp. When an engineer opens a pull request, the
system **opens a review task** for the Tech Lead — or the **Security Officer** if the change touches
dependencies, CI, scripts, or secrets. The reviewer reads the **actual diff** and posts a verdict;
only `approved` lets it merge, and "changes requested" bounces it back to the engineer. It's a review
*gate*, and it's been proven end‑to‑end on live pull requests.

## 5. It's safe by default 🔒

Every AI teammate works inside a locked box: no internet unless you allow it, and it **can't read your
secrets** or break your real project. Agents never hold the keys — they work on a **fork** and only
*propose* changes.

## 6. You're always in control 🎛️

A big **STOP** button halts everything at once. Anything risky — security, settings, spend — waits for
a human. And a **Telegram front door** lets you drive the whole thing from your phone: text "status"
for an accurate read, or send a brief and watch it become a task.

## 7. It brings in the right expert 🎓

Software skill isn't enough for a sleep‑coaching app, a meal planner or a budgeting tool. When a brief
needs a psychologist, a nutrition scientist or an economist, the team **says so**: leadership proposes
the expert roles the project needs, you switch those seats on, and the experts write the project's
knowledge pack, check the acceptance criteria, and **review the content** before it merges — a second
gate next to the code review. When the project ends, the seats go back on the bench. (They're stand‑ins
for real practitioners, not replacements — health and finance work still gets a human sign‑off.)

## 8. It's proven, not theoretical ✅

The headline test: hand it a one‑line brief and don't touch the keyboard. The product owner planned a
feature, the engineer built it with a test, the reviewer approved the diff, and it **merged and served**
— in minutes, on its own. The easy 80% flows without you; the important 20% still gets your eyes.

---

## In a nutshell

| Typical "AI writes code" setup | This one |
|---|---|
| Lives in the cloud, costs add up | Runs on one laptop, fixed budget |
| Can keep spending unnoticed | **Stops before it costs you** (spend stayed at zero) |
| A swarm of bots | A small **team of 10 roles** |
| Merges on a rubber stamp | **A reviewer reads the diff and gates the merge** |
| Broad access to your stuff | **Sandboxed**, can't leak secrets, works on a fork |
| Builds a health app from general knowledge | **Brings in domain experts per project**, who write the brief and review the content |
| You babysit every step | **Auto‑ships the easy stuff**, asks you about the rest |
| A cool demo | **Proven end‑to‑end** — planned, built, reviewed, shipped |

---

Curious how to build your own? → [**Build your own**](BUILD-YOUR-OWN.md) (a complete, ordered plan).
Prefer the backstory? → [**The article**](ARTICLE.md). Meet the roles → [**The team**](TEAM.md).
