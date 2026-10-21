# Paperclip AI Company 🏢🤖

> **A little AI "software team" that runs on your own laptop.**
> It picks up tasks, writes the code, and hands you finished changes to approve — safely,
> and without surprise bills.

---

## What is this? (the 30‑second version)

Instead of chatting with **one** AI assistant, you get a small **team** of AI "employees" — an
engineer, a tester, a reviewer — each with a job. You drop tasks on a list; they do the work and
hand you pull requests (proposed changes) to approve. It all runs on **one normal laptop**, stays
within a **fixed budget**, and **can't touch anything it shouldn't**.

```mermaid
flowchart LR
    YOU["🧑 You"] -->|add a task| BOARD["📋 Task list"]
    BOARD --> TEAM["🤖 AI team<br/>engineer · tester · reviewer"]
    TEAM -->|proposes a change| PR["🔀 Pull request"]
    PR -->|auto-merges if safe,<br/>else waits for you| DONE["✅ Shipped"]
    TEAM -. runs on .-> LAPTOP["💻 Your laptop"]

    classDef a fill:#e8f0fe,stroke:#1a73e8,color:#0b2a66;
    classDef b fill:#e6f4ea,stroke:#1e8e3e,color:#0b3d1e;
    classDef c fill:#fff4e5,stroke:#e8a33d,color:#5a3a0b;
    class YOU,BOARD a;
    class TEAM,PR,DONE b;
    class LAPTOP c;
```

---

## How it works (4 steps)

1. 📝 **You add a task** to a list ("add a login page").
2. 🤖 **An AI teammate picks it up** and does one small job.
3. 🔀 **It opens a pull request** — a proposed change you can see.
4. ✅ **If it's small and the tests pass, it merges automatically.** Otherwise it waits for you.

That's it. You review and approve; the team does the typing.

---

## Why it's different

- 💻 **Runs on one laptop.** No cloud, no servers, no monthly hosting bill.
- 💸 **Never overspends.** It stops *before* it would cost you money — you can leave it running.
- 👥 **A real team, not a chaotic swarm.** Each AI has a clear role and knows its lane — [meet the team](docs/TEAM.md).
- 🔒 **Safe by default.** Sandboxed, can't leak your secrets, can't break your repo.
- 🎛️ **You stay in control.** A big "stop" button, and anything risky always waits for a human.

👉 Want the fuller story? Read [**Why this one is different**](docs/WHY-DIFFERENT.md) (a 2‑minute read).

---

## Try it / build your own

You don't need to be an expert.

1. Read the short [**build‑your‑own guide**](docs/BUILD-YOUR-OWN.md).
2. Run the starter script to create your own folder:
   ```bash
   ./scripts/scaffold.sh my-ai-company
   ```
3. Open `company.yaml`, fill in the blanks, and start with **one** teammate and **one** task.

Helpful files:
- 🧩 [`examples/company.yaml`](examples/company.yaml) — the one settings file, with blanks to fill in.
- 🚦 [`examples/usage-gate.sh`](examples/usage-gate.sh) — the "don't overspend" safety check, explained.

---

## Is it safe?

Short answer: **yes, that's the whole point.**

- It **can't spend money you didn't agree to** — a built‑in check stops it first.
- Each AI teammate works in a **locked box** — no web unless allowed, and it can't read your passwords.
- Agents **never get the keys** to your real code — they propose changes; you (or safe auto‑rules) approve.
- There's a **STOP button** that halts everything instantly.

---

<details>
<summary>🔧 <b>For the curious: how it looks under the hood</b> (click to expand)</summary>

You can skip this — it's here for people who want the technical picture.

**The pieces on the laptop**

```mermaid
flowchart TB
    subgraph LAPTOP["💻 One laptop · WSL2"]
        ORCH["🧠 Orchestrator<br/>hands out tasks"]
        TEAM["👥 AI agents<br/>each in a sandbox"]
        OPS["⚙️ Ops: budget guard ·<br/>monitor · backups · alerts"]
    end
    GH["🐙 GitHub<br/>forks → pull requests"]
    CHAT["📨 Chat alerts"]

    ORCH --> TEAM --> GH
    OPS -. watches & can stop .- TEAM
    OPS --> CHAT

    classDef a fill:#e8f0fe,stroke:#1a73e8,color:#0b2a66;
    classDef b fill:#e6f4ea,stroke:#1e8e3e,color:#0b3d1e;
    classDef c fill:#fff4e5,stroke:#e8a33d,color:#5a3a0b;
    class ORCH a;
    class TEAM,GH b;
    class OPS,CHAT c;
    style LAPTOP fill:#f8f9fb,stroke:#5f6368,color:#202124;
```

**The "don't overspend" check** (it refuses to run if anything looks off)

```mermaid
flowchart TD
    START([▶️ About to run]) --> HALT{STOP button on?}
    HALT -- yes --> DENY[⏸️ Wait]
    HALT -- no --> BUDGET{near the budget limit?}
    BUDGET -- yes --> DENY
    BUDGET -- no --> SAFE{everything healthy?}
    SAFE -- no --> DENY
    SAFE -- yes --> GO[✅ Go]

    classDef deny fill:#fde8e8,stroke:#c0392b,color:#7a1f1f;
    classDef ok fill:#e6f4ea,stroke:#1e8e3e,color:#0b3d1e;
    classDef chk fill:#fff4e5,stroke:#e8a33d,color:#5a3a0b;
    class DENY deny;
    class GO ok;
    class HALT,BUDGET,SAFE chk;
```

**The team**

```mermaid
flowchart TD
    CEO["👑 You"] --> LEAD["🧭 Tech Lead"]
    CEO --> SEC["🛡️ Security"]
    LEAD --> ENG["👷 Engineer"]
    LEAD --> QA["🔎 Tester"]
    LEAD --> REL["🚀 Release"]

    classDef lead fill:#e8f0fe,stroke:#1a73e8,color:#0b2a66;
    classDef ic fill:#e6f4ea,stroke:#1e8e3e,color:#0b3d1e;
    class CEO,LEAD ic;
    class ENG,QA,REL ic;
    class SEC lead;
```

Want the full technical write‑up? It's in [`docs/ARTICLE.md`](docs/ARTICLE.md) and
[`docs/BUILD-YOUR-OWN.md`](docs/BUILD-YOUR-OWN.md).

</details>

---

## What's *not* in this repo (your privacy)

This is a public explainer. It has **no secrets and no personal data** — no tokens, no emails, no
account names, no file paths, no real project code. Just the idea, a settings template with blanks,
and a couple of simple scripts. Keep your real secrets in a safe place, **never in a repo**.

---

## License

[MIT](LICENSE) — free to use, copy, and change. No warranty.

> Built as a weekend experiment: *can a small AI "company" run safely and cheaply on one laptop?*
> This repo is the friendly, sanitized answer.
