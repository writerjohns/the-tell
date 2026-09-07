# The Tell — Developer Notes

**Build:** `The_Tell_v05.ink`

These notes explain design decisions that are intentionally not obvious from a single playthrough.


## 1. Three-Decision Architecture

The current playable structure is:

1. **D1 — Merchandise**
   - what proof Cipher exposes;
2. **D2 — Counterparty**
   - how Cipher handles Vektor's attempt to vet the seller;
3. **D3 — Closing Leverage**
   - whether Cipher banks the secured result or spends additional risk budget.

A rare fourth choice appears only on the deepest Grand Slam path.

This structure emerged after runtime testing exposed that the previous Candidate Build usually terminated after two decisions. Rather than inventing new content, existing late-D2 material was redistributed into a genuine D3.

The result is simpler:

- D1 proves merchandise;
- D2 proves counterparty;
- D3 asks whether enough is enough.

## 2. Hidden Vektor Profile

One Vektor profile is selected once per playthrough:

- `PROFILE_C` — Closure
- `PROFILE_P` — Professional
- `PROFILE_A` — Aggressive

The employer-facing build does **not** reveal or bias this profile.

That is intentional.

C and P are complete adversary profiles, not failed rolls on the way to A. The player is meant to read Vektor's behavior and make decisions under uncertainty rather than force a preferred content route.

QA builds may force profile/RNG for regression only.

## 3. State Model

The primary dimensions are:

### Commitment

`0–4`

`4 = SALE`

Commitment 4 is terminal. There is no artificial "one more move" after a completed transaction.

### Suspicion

`0–4`

`4 = BOLTS`

Suspicion is not a generic difficulty meter. It changes only when Vektor receives a plausible behavioral reason to become more concerned.

### Intel Yield

- `0` — None
- `1` — Lead
- `2` — Actionable
- `3` — Network
- `4` — Strategic

Intel tiers represent **qualitative investigative value**, not artifact count.

Two Leads do not automatically become Actionable Intel.

## 4. Intel Persists

Once an intelligence event is secured, later conservative play does not erase it.

Example:

- D1 Flex/A can earn `PRESSURE SIGNATURE / I1`.
- If the player later banks the sale, the Lead remains part of the result.

This matters because otherwise the score would describe the player's latest attitude instead of the operation's actual accumulated position.

## 5. D3: BANK THE WIN / PRESS FOR MORE

The generic D3 labels are deliberately simple:

- `BANK THE WIN`
- `PRESS FOR MORE`

The labels describe the strategic decision without exposing the hidden Tactical / Strategic / Flex taxonomy.

The **cost of PRESS is profile-specific**.

### C — Closure Risk

C has already agreed to transact.

PRESS changes the terms after agreement by demanding reciprocal verification.

Current behavior:

- 30% credible Surface X vouch;
- otherwise C refuses;
- some refusals still close the sale;
- some crystallize into Suspicion 4 and C bolts.

This is not a free Intel lottery.

### P — Asset Cost

P values bounded disclosure.

PRESS trades seller-side provenance for buyer-side escrow provenance.

The transaction survives, but Cipher spends Ghost's mature cover.

The operational cost is explicit:

`OPERATIONAL COST: GHOST COVER BURNED`

No arbitrary Suspicion roll is added.

### A — Escalation Risk

A's need to dominate verification can expose how he counter-operates.

PRESS may turn his own captured handle back on him.

If the prerequisites exist and he survives `Coincidence?`, the repository / Black Orchard escalation becomes available.

Otherwise the same act can simply burn the deal.

## 6. Why Strategic Can Be Better Expected Value

The game is not balanced around equal expected scores.

Current fixed-policy testing shows:

`Strategic -> Strategic -> BANK`

is the most efficient controlled route and averages 4/6 across the hidden profiles.

That is intentional.

Strategic is capped.

It cannot reach the clean 6/6 ceiling.

Flex accepts worse expected value in exchange for access to exceptional outcomes.

The design question is therefore not:

> Which button is mathematically strongest?

It is:

> Is the remaining intelligence opportunity worth the risk I would have to spend to pursue it?

## 7. Grand Slam Gate

Grand Slam is not a hidden "best class" bonus.

The deepest path requires causal preparation:

1. D1 Flex/A earns **PRESSURE SIGNATURE / I1**.
2. D2 Flex/A earns **COUNTER-PROBE CAPTURED / I2**.
3. D3 PRESS turns the captured behavior back on A.
4. A must survive the `Coincidence?` suspicion crystallization.
5. Vektor then follows the controlled repository breadcrumb.
6. K establishes fresh control of a Black-Orchard-associated cryptographic identity.
7. A fresh, valid Black Orchard authorization invocation secures **I4 / Strategic**.

Only then does the final Tell appear.

## 8. The Final Tell

At Intel 4, there is no Intel 5.

The final choice is:

- `SAY NOTHING`
- `WHAT'S IT WORTH TO YOU?`

The operation has already achieved the strategic objective.

The only thing left to gain is personal satisfaction.

That is why the second choice is dangerous.

The player has to understand that the correct final move is restraint.

## 9. Selective Randomness

Randomness is used only where interpretation can plausibly vary.

Examples:

- C may interpret a late reciprocal-vouch demand as tolerable friction or as enough reason to walk.
- A may crystallize the same circumstantial `Coincidence?` pattern at different Suspicion severity.

Randomness is **not** used as a generic skill check.

Most outcomes are deterministic consequences of:

- hidden Vektor profile;
- prior player behavior;
- accumulated state.

## 10. Natural 0/6

The original score table did not contain a reachable 0/6.

The three-decision rewrite created one honestly.

C can reach D3 with no Intel, the player can press after the sale is already available, and C can bolt before any Lead is secured.

That produces:

- lost sale;
- no Intel.

Therefore:

`BOLTS / INTEL: NONE / 0/6`

No failure branch was invented merely to fill the bottom of the scale.

## 11. Score Semantics

The narrative label tells **what happened**.

The score tells **how well the operation performed**.

Current scale:

- `0/6` — BOLTS + None
- `1/6` — BOLTS + Lead
- `2/6` — BOLTS + Actionable
- `3/6` — Sale
- `4/6` — Sale + Lead
- `5/6` — Sale + Actionable **or** Pyrrhic Grand Slam
- `6/6` — Grand Slam

Different narrative outcomes may legitimately share the same numeric performance score.

## 12. Surface X / Candyman

These are intentionally different entities.

### Surface X

Fictional underground commercial venue/environment.

### Candyman

Human fixer / bridge / intermediary.

Candyman's relationship graph can become part of Vektor's counter-probe.

The older placeholder `X` for the person was retired because it collided cognitively with Surface X.

## 13. Technical Plausibility Rules

Technical details are allowed to be dramatic, but not magical.

Important constraints preserved in the code/design:

- IP addresses do not identify people by themselves.
- Cryptographic fingerprints do not reveal legal identity by themselves.
- Correlation creates investigative value; it does not automatically prove attribution.
- A fresh cryptographic authentication can demonstrate current control of an identity.
- A valid fresh authorization invocation can demonstrate knowledge/access to a live authority path.
- Third-party activity must be observable through an established monitoring/logging position; Cipher's server does not magically see unrelated traffic.

## 14. QA / Certification

v05 has passed:

### Compile

Clean Inky compile.

### Targeted Runtime

8/8 required smoke tests passed:

- C BANK
- C PRESS / vouch success
- C PRESS / refusal + sale
- C PRESS / refusal + bolt
- P BANK
- P PRESS + Ghost cost
- A full Flex BANK
- A full Flex PRESS + Grand Slam

### Deterministic Reachability

54 profile × D1 × D2 × D3 path families exhaustively certified.

All stochastic sub-branches sum correctly.

### Monte Carlo

2,000,000 random playthroughs.

All scores 0/6 through 6/6 appeared.

No impossible Grand Slam route or state collision was found.

The simulation is a state-machine stress test, not a model of actual player behavior.

## 15. Why the Grand Slam Is Rare

Under a completely random player model, clean 6/6 occurs at approximately:

`1 / 324 ~= 0.309%`

The rarity is mechanically explained by independent gates:

- A profile;
- D1 Flex;
- D2 Flex;
- D3 PRESS;
- survive `Coincidence?`;
- final `SAY NOTHING`.

The employer build is not altered to showcase this branch more often.

That decision is intentional and documented here because code reviewers may reasonably notice the low frequency.

## 16. Code-Review Priorities

If reviewing the Ink as code, the most important areas are:

- profile routing after D1/D2;
- persistence of Intel;
- Commitment 4 terminal behavior;
- C/P/A-specific D3 implementation;
- `grand_slam_possible`;
- `pressure_signature`;
- `counter_probe_captured`;
- score terminals;
- comments surrounding selective RNG and the Grand Slam gate.

The QA build exists to make these paths deterministic during regression.

## 17. Design Thesis

The game is built around one reciprocal question:

> **What does your behavior tell me that you did not intend to tell me?**

Vektor asks it about Cipher.

Cipher asks it about Vektor.

The final choice asks it about the player.
