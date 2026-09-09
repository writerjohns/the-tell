# The Tell v05 — Targeted Runtime Smoke Test

Compile and run `The_Tell_v05_QA.ink`.

The QA menus only force hidden profile and the two relevant RNG moments.
Player choices remain normal.

| # | Profile | C vouch | A Coincidence | D1 | D2 | D3 / D4 | Expected |
|---|---|---|---|---|---|---|---|
| 1 | C | RANDOM | RANDOM | PICK THE TEST | GIVE HIM SOMETHING TO CHASE | BANK THE WIN | SALE / NONE / 3/6 |
| 2 | C | SUCCESS | RANDOM | PICK THE TEST | GIVE HIM SOMETHING TO CHASE | PRESS FOR MORE | SALE / LEAD / 4/6 |
| 3 | C | REFUSE — SALE SURVIVES | RANDOM | PICK THE TEST | GIVE HIM SOMETHING TO CHASE | PRESS FOR MORE | SALE / NONE / 3/6 |
| 4 | C | REFUSE — BOLTS | RANDOM | PICK THE TEST | GIVE HIM SOMETHING TO CHASE | PRESS FOR MORE | BOLTS / NONE / 0/6 |
| 5 | P | RANDOM | RANDOM | PICK THE TEST | GIVE HIM SOMETHING TO CHASE | BANK THE WIN | SALE / NONE / 3/6 |
| 6 | P | RANDOM | RANDOM | PICK THE TEST | GIVE HIM SOMETHING TO CHASE | PRESS FOR MORE | SALE / LEAD / 4/6 + GHOST COVER BURNED |
| 7 | A | RANDOM | RANDOM | PICK THE TEST | MAKE HIM SHOW HIS HAND | BANK THE WIN | SALE / ACTIONABLE / 5/6 |
| 8 | A | RANDOM | +1 — SURVIVE | PICK THE TEST | MAKE HIM SHOW HIS HAND | PRESS FOR MORE → SAY NOTHING | GRAND SLAM / STRATEGIC / 6/6 |

Optional ninth test:
A / +1 / full Flex / PRESS FOR MORE → WHAT'S IT WORTH TO YOU?
Expected: PYRRHIC GRAND SLAM / 5/6.

If these pass, the new three-decision C/P/A architecture has runtime coverage at every important terminal.
