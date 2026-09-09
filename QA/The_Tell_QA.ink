// THE TELL — v05 QA REGRESSION BUILD
// Page-one rewrite. Built from THE_TELL_WORKING_DESIGN_v09_updated.md
// and THE_TELL_DIALOGUE_LEDGER_v01.md.
// Legacy .ink files are historical reference only.
//
// STATUS:
// - State machine: provisionally certified by n=1 reachability audit.
// - Dialogue: only surviving/provisionally locked lines are treated as current copy.
// - D2 menu labels have received the Candidate Build voice pass.
//
// SCORE:
// 0/6 BOLTS + No Intel
// 1/6 BOLTS + Lead
// 2/6 BOLTS + Actionable Intel
// 3/6 SALE
// 4/6 SALE + Lead
// 5/6 SALE + Actionable Intel or PYRRHIC GRAND SLAM
// 6/6 GRAND SLAM
//
// 0/6 emerged naturally in the three-decision restructure:
// C can bolt after an unnecessary D3 press before any Intel is secured.
// No failure branch was invented merely to populate the scale.

CONST PROFILE_C = 0
CONST PROFILE_P = 1
CONST PROFILE_A = 2

CONST TACTICAL = 0
CONST STRATEGIC = 1
CONST FLEX = 2

VAR vektor_profile = PROFILE_C

VAR d1_strategy = -1
VAR d2_strategy = -1

VAR commitment = 0
VAR suspicion = 0
VAR intel = 0
VAR score = 0

VAR pressure_signature = false
VAR counter_probe_captured = false
VAR verification_footprint_observed = false

VAR ghost_cover_compromised = false

VAR grand_slam_possible = true
VAR grand_slam_secured = false

VAR roll = 0

// QA-ONLY CONTROLS. Not for employer release.
VAR qa_profile = -1
VAR qa_a_coin = 0
VAR qa_c_vouch = 0

-> qa_profile_setup


=== qa_profile_setup ===

QA PROFILE

* [C]
    ~ qa_profile = PROFILE_C
    -> qa_c_setup

* [P]
    ~ qa_profile = PROFILE_P
    -> qa_c_setup

* [A]
    ~ qa_profile = PROFILE_A
    -> qa_c_setup


=== qa_c_setup ===

QA C VOUCH OUTCOME

* [RANDOM]
    ~ qa_c_vouch = 0
    -> qa_a_setup

* [SUCCESS]
    ~ qa_c_vouch = 1
    -> qa_a_setup

* [REFUSE — SALE SURVIVES]
    ~ qa_c_vouch = 2
    -> qa_a_setup

* [REFUSE — BOLTS]
    ~ qa_c_vouch = 3
    -> qa_a_setup


=== qa_a_setup ===

QA A COINCIDENCE? SEVERITY

* [RANDOM]
    ~ qa_a_coin = 0
    -> pre_contact

* [+1 — SURVIVE]
    ~ qa_a_coin = 1
    -> pre_contact

* [+2]
    ~ qa_a_coin = 2
    -> pre_contact

* [+3]
    ~ qa_a_coin = 3
    -> pre_contact



=== pre_contact ===

VANCE: Oh, uh -- the Orchard account.
CIPHER: Yeah?
VANCE: Nothing yet.

// DESIGN NOTE — HIDDEN VEKTOR PROFILE
// C / P / A is randomized once per playthrough and remains hidden.
// This is intentionally NOT biased toward A in the employer build.
//
// Consequence: even a player who deliberately chooses the full Flex line
// cannot force access to the Grand Slam. They must first encounter A.
//
// That rarity is deliberate:
// - C and P are legitimate adversary profiles, not "wrong" rolls.
// - The demo is about reading and responding to behavior, not selecting a route.
// - Grand Slam is a commitment path with exceptional upside, not guaranteed content.
// - A first-playthrough bias toward A would make the showcase more predictable,
//   but would quietly convert the hidden profile into authorial stage-management.
//
// Reviewers inspecting the code should read the low Grand-Slam frequency as
// authored risk structure, not as an overlooked discoverability problem.
//
// QA builds may force profile/RNG for regression testing only.
{ qa_profile >= 0:
    ~ vektor_profile = qa_profile
- else:
    ~ vektor_profile = RANDOM(PROFILE_C, PROFILE_A)
}

{ vektor_profile == PROFILE_A:
    ~ suspicion = 1
}

-> opening


=== opening ===

VEKTOR: Where's the data?
CIPHER: When the check clears.

[Vektor studies the material. MACHINE and OSUSER are masked.]

CIPHER: Oh right. Give you my access path. Sure. Whatever.
VEKTOR: I want to know what I'm buying.
CIPHER: I think you know.
VEKTOR: I know what you sent.

[Beat.]

VEKTOR: But I don't know you. Maybe you're a Fed.
CIPHER: You forget the community we live in? Word travels. You're not big enough.
VEKTOR: Yet here we are.
CIPHER: Yeah. Here we are.

VEKTOR: Tables look good. Relationships, environment.
CIPHER: But?
VEKTOR: Could be six months old for all I know.
CIPHER: You calling me a liar?
VEKTOR: I'm saying give me something I can verify.

* [SAMPLE]
    ~ d1_strategy = TACTICAL
    -> d1_sample

* [PAYMENTS]
    ~ d1_strategy = STRATEGIC
    -> d1_payments

* [PICK THE TEST]
    ~ d1_strategy = FLEX
    -> d1_pick


=== d1_sample ===

[Cipher sends a small current sample.]

CIPHER: This morning's.
VEKTOR: And the rest?
CIPHER: When I see the money.

[Vektor independently verifies the sample.]

CIPHER: We good?
VEKTOR: Maybe.

~ commitment = 2

-> d2_menu


=== d1_payments ===

VEKTOR: What's this?
CIPHER: Payments. You wanted current.

[Cipher exposes the controlled payment data. Vektor studies it.]

VEKTOR: Last payment's May.
CIPHER: Probably the payment cycle.
VEKTOR: Or it's not June data.
CIPHER: Really? Are we doing this?

[Vektor checks the payment history against a current June record.]

VEKTOR: Fine.

~ commitment = 2
~ verification_footprint_observed = true

-> d2_menu


=== d1_pick ===

CIPHER: Your call.

{ vektor_profile:
- PROFILE_C:
    -> d1_pick_c
- PROFILE_P:
    -> d1_pick_p
- else:
    -> d1_pick_a
}


=== d1_pick_c ===

VEKTOR: Recent service. Provider, date, status.
CIPHER: While we're at it, why don't we add what I had for breakfast?
VEKTOR: Look, wiseass, I need something that works. Something that hangs together.

[Cipher selects a controlled recent record and exposes the requested fields.]
[Vektor checks the information.]

CIPHER: We good?
VEKTOR: Yeah.

~ commitment = 2

-> d2_menu


=== d1_pick_p ===

VEKTOR: Birth year. Sex. ZIP.
CIPHER: That it?
VEKTOR: Full ZIP.
CIPHER: Full ZIP? That's a totally different--
VEKTOR: You said "your call."

[Cipher sends the controlled fields. Vektor checks them.]

VEKTOR: This'll do. For now.

~ commitment = 2

-> d2_menu


=== d1_pick_a ===

VEKTOR: SSN. Full DOB.

[A long beat.]

VEKTOR: There a problem?

[Another beat.]

CIPHER: No.

[Cipher selects a controlled specimen and exposes the requested fields.]
[Vektor begins verification.]

VANCE: We've got movement.
CIPHER: The account?
VANCE: Just lit up.

[Vektor finishes verification and returns.]

VEKTOR: That took some brass ones.
CIPHER: I aim to please.

~ commitment = 2
~ pressure_signature = true
~ intel = 1
~ suspicion += 1

-> d2_menu


=== d2_menu ===

// PLAYER-FACING D2 ACTIONS.
// These describe Cipher's move, not hidden strategy classes.

* [PUSH TO CLOSE]
    ~ d2_strategy = TACTICAL
    ~ grand_slam_possible = (d1_strategy == FLEX && d2_strategy == FLEX)
    -> d2_router

* [GIVE HIM SOMETHING TO CHASE]
    ~ d2_strategy = STRATEGIC
    ~ grand_slam_possible = (d1_strategy == FLEX && d2_strategy == FLEX)
    -> d2_router

* [MAKE HIM SHOW HIS HAND]
    ~ d2_strategy = FLEX
    ~ grand_slam_possible = (d1_strategy == FLEX && d2_strategy == FLEX)
    -> d2_router


=== d2_router ===

{ vektor_profile:
- PROFILE_C:
    { d2_strategy:
    - TACTICAL:
        -> d2_c_tactical
    - STRATEGIC:
        -> d2_c_strategic
    - else:
        -> d2_c_flex
    }
- PROFILE_P:
    { d2_strategy:
    - TACTICAL:
        -> d2_p_tactical
    - STRATEGIC:
        -> d2_p_strategic
    - else:
        -> d2_p_flex
    }
- else:
    { d2_strategy:
    - TACTICAL:
        -> d2_a_tactical
    - STRATEGIC:
        -> d2_a_strategic
    - else:
        -> d2_a_flex
    }
}


// -----------------------------------------------------------------------------
// VEKTOR/C
// -----------------------------------------------------------------------------

=== d2_c_tactical ===

// C already has enough proof to transact.
// D2 stops at Deal-ready; D3 decides whether Cipher banks or moves the goalposts.

CIPHER: You have enough.
VEKTOR: Fine.

~ commitment = 3
-> d3_c


=== d2_c_strategic ===

VEKTOR: Show me you are who you say you are.
CIPHER: Cy-grrl.
VEKTOR: You know her?
CIPHER: Doesn't everybody? She's on every chat. I mean, I don't know her personally, but any money says she heard of me.
VEKTOR: Any money, huh? Smug bastard.
CIPHER: I know my worth.

[Vektor goes quiet while he checks Cy-grrl.]

VEKTOR: Okay. Let's do this.

{ d1_strategy == STRATEGIC:
    // PAYMENTS observation + observable Cy-grrl check matures the Lead.
    ~ intel = 1
}

~ commitment = 3
-> d3_c


=== d2_c_flex ===

VEKTOR: Your presence seems oriented toward a different community.
CIPHER: They're no different. One just admits what it is. You want street cred? Cy-grrl.
VEKTOR: You know her?
CIPHER: She's heard of me.
VEKTOR: That's not what I asked.
CIPHER: Check it--or not.

[Vektor goes quiet while he checks Cy-grrl.]

{ d1_strategy == STRATEGIC:
    // Existing weak observation + this verification matures I1.
    ~ intel = 1
}

VEKTOR: Okay. We're go.

~ commitment = 3
-> d3_c


// -----------------------------------------------------------------------------
// D3 — CLOSING LEVERAGE / VEKTOR C
// -----------------------------------------------------------------------------
//
// C's Tell is closure. He has enough proof and wants minimum friction.
// BANK closes the available sale.
// PRESS changes the terms after agreement by demanding reciprocal verification.
//
// The upside is a credible Surface X vouch / I1 Lead.
// The downside is exactly what C dislikes: new friction after the deal is ready.
//
// Current tuning from a normal C baseline:
// - PRESS itself: Suspicion +1
// - 30% vouch success -> close sale, earn I1 if needed
// - 70% refusal -> Suspicion + RANDOM(2,3)
//      S3 -> C refuses the extra disclosure but still closes
//      S4 -> BOLTS
//
// This makes PRESS non-dominant without inventing a generic skill check.

=== d3_c ===

* [BANK THE WIN]
    -> d3_c_bank

* [PRESS FOR MORE]
    -> d3_c_press


=== d3_c_bank ===

VEKTOR: First tranche.

~ commitment = 4
-> ending_sale


=== d3_c_press ===

~ suspicion += 1

CIPHER: What about you? You could be a Fed for all I know.
VEKTOR: My money's in escrow right now. That's not enough?
CIPHER: I thought my data was.
CIPHER: Give me a vouch.

{ qa_c_vouch == 1:
    ~ roll = 1
- else:
    { qa_c_vouch == 2 || qa_c_vouch == 3:
        ~ roll = 10
    - else:
        ~ roll = RANDOM(1,10)
    }
}

{ roll <= 3:
    [A Surface X vouch appears in the chat. Ghost confirms it.]
    { intel < 1:
        ~ intel = 1
    }

    ~ commitment = 4
    -> ending_sale
- else:
    VEKTOR: You data mining me? You're starting to sound like a cop.
    { qa_c_vouch == 2:
    ~ suspicion += 2
- else:
    { qa_c_vouch == 3:
        ~ suspicion += 3
    - else:
        ~ suspicion += RANDOM(2,3)
    }
}

    { suspicion >= 4:
        -> ending_bolts
    - else:
        VEKTOR: Forget it. First tranche.
        ~ commitment = 4
        -> ending_sale
    }
}


// -----------------------------------------------------------------------------
// VEKTOR/P
// -----------------------------------------------------------------------------

=== d2_p_tactical ===

VEKTOR: Ever hear of Candyman?
CIPHER: Doesn't ring a bell.
VEKTOR: Candyman's heard of you.
CIPHER: Lot of people have heard of me.
VEKTOR: That's not what I see.
CIPHER: I thought we were here to make a deal.
VEKTOR: We are. I just want to know who I'm dealing with.
CIPHER: Name the ask.
VEKTOR: Candyman doesn't shortlist someone he doesn't have a relationship with. Don't bullshit me.
CIPHER: Okay, maybe. I mean, the volume of business I do, I'm not going to remember every intermediary.
VEKTOR: If you're so big, how come no one has heard of you?
CIPHER: Big enough to land on your list. Big enough for you to be here.

[Vektor digs into Cipher's commercial history.]

VEKTOR: No wonder you're big business. You hand-wave Deloitte into a 6-month AI gen data analytics sub -- for $2M? That's not magic -- that's theft. Or it's bogus.
CIPHER: So you've actually run a company? You know that changing a business model doesn't have a price tag -- training, interfaces, implementation, consulting? That's all gratis, right? WTF? Stay in your lane.

~ commitment = 3
-> d3_p


=== d2_p_strategic ===

VEKTOR: Data checks. But do you?
CIPHER: Cy-grrl.
VEKTOR: What does that mean?
CIPHER: She's heard of me.
VEKTOR: That's your vouch? A chat groupie? I need a track record. A buyer.
CIPHER: Deloitte.
VEKTOR: You're way out of your depth here, aren't you?
CIPHER: But my data isn't, is it?
VEKTOR: Show me you're not some wannabe with a pirated stash--or a cop.
CIPHER: I just gave you my history. And a deal you know you won't get later.

[Cipher stops. Vektor goes quiet again.]

VEKTOR: I'm in.

{ d1_strategy == STRATEGIC:
    // PAYMENTS + observable due-diligence correlation matures I1.
    ~ intel = 1
}

~ commitment = 3
-> d3_p


=== d2_p_flex ===

VEKTOR: How does a guy with zero footprint in the community end up on Candyman's short list? Help me connect the dots.
CIPHER: Big enough to land on your list. Big enough for you to be here.

[Cipher stops. Vektor goes quiet again.]

VEKTOR: I'm in.

~ commitment = 3
-> d3_p


// -----------------------------------------------------------------------------
// D3 — CLOSING LEVERAGE / VEKTOR P
// -----------------------------------------------------------------------------
//
// P's Tell is bounded disclosure. He wants provenance, attribution, and
// minimum necessary exposure.
//
// BANK preserves the available sale and Ghost's mature cover.
// PRESS reuses the existing reciprocal escrow/provenance exchange:
// Cipher spends Ghost as seller-side provenance to obtain buyer-side
// escrow provenance.
//
// The downside is operational asset cost, not an arbitrary Suspicion tax.
// Pressing does not automatically create I2 simply because a second artifact
// exists. The escrow handle/service affiliation is an I1-quality Lead.

=== d3_p ===

* [BANK THE WIN]
    -> d3_p_bank

* [PRESS FOR MORE]
    -> d3_p_press


=== d3_p_bank ===

VEKTOR: Let's do it. First tranche.

~ commitment = 4
-> ending_sale


=== d3_p_press ===

CIPHER: Show me how I don't open an empty vault because your brother-in-law is the escrow agent. That's the trade.
VEKTOR: You want the escrow?
CIPHER: Agent, who he works for, all of it.
VEKTOR: Seriously?
CIPHER: You ask for part of my network, then question why I want to know if I'm going to get paid?
VEKTOR: Surface X handle, service/affiliation. Nothing upstream, nothing personal, nothing else.
CIPHER: Fine. But you get what you pay for.

VANCE: Do it.

[Cipher names Ghost as the bridge to Candyman.]
[Vektor returns an escrow handle and service affiliation.]

~ ghost_cover_compromised = true

{ intel < 1:
    ~ intel = 1
}

~ commitment = 4
-> ending_sale


// -----------------------------------------------------------------------------
// VEKTOR/A
// -----------------------------------------------------------------------------

=== d2_a_tactical ===

VEKTOR: We're "good" when I say we are. I don't deal with just anybody.
CIPHER: You've seen the data? You want a deal or not?
VEKTOR: Know what I see? A guy on a list. Deloitte's impressive -- if I'm PriceWaterhouse. Wrong footprint, pal. In this world -- MY world -- your buzz is crickets. An over-leveraged noob hoping for gold -- or a cop.
CIPHER: Know what I see? A small-timer looking for validation. You've seen the data and you're still here. We doing attitude -- or a sale?
VEKTOR: Then sell me. Show me you're legit.
CIPHER: I thought I just did.
VEKTOR: You really are new, aren't you? You want to walk, walk. But anywhere you go, you're going to learn one thing. Without a rep, you need collateral. Show me you are who you say you are.
CIPHER: Name the ask.
VEKTOR: Okay, so Deloitte. If you did more than just sell the software -- training, consulting, whatever, who did you work with? Or did you forget that too?
CIPHER: Rhea Calder, Strategic Sourcing Principal.
VEKTOR: Not the sales guy. The Implementation Manager. The guy you actually did that interface and consulting work with.
CIPHER: Mason Venn, Solutions Architect.
VEKTOR: Okay, rook. Let's do this.

~ commitment = 3
-> d3_a


=== d2_a_strategic ===

VEKTOR: You're not a broker. You're a dealer. Maybe we're looking at a different deal. What else can you get your junkies to pawn?
CIPHER: I'm not your supplier. You decide to buy, I decide what's on the table.
CIPHER: BUT ... if you're looking for a little sugar, I'm open to referrals. Say 25%?

CIPHER: Twenty-five.
VEKTOR: Forty.
CIPHER: Twenty-seven.
VEKTOR: Thirty-seven.
CIPHER: Thirty.
VEKTOR: Thirty-five.
CIPHER: Thirty-two.
VEKTOR: Thirty-four.
CIPHER: Thirty-three.
VEKTOR: Thirty-three five.
CIPHER: Done.

[Vektor checks Cy-grrl, then returns.]

{ d1_strategy == STRATEGIC:
    // PAYMENTS + A's observable Cy-grrl check matures I1.
    ~ intel = 1
}

{ d1_strategy == FLEX:
    // PRESSURE SIGNATURE is already I1; do not double-count.
    ~ intel = 1
}

~ commitment = 3
-> d3_a


=== d2_a_flex ===

VEKTOR: I heard Candyman is compromised. You're a Fed, aren't you?
CIPHER: Of course. So are you. So is Candyman. We ALL are. Accusations are cheap. Proof has a price.
VEKTOR: Can you afford to pay it?
CIPHER: I can if you can.

[Vektor goes quiet.]

[On the surveillance channel, Ghost catches a probe against Candyman's relationship graph.]

~ counter_probe_captured = true
~ intel += 1

VEKTOR: Boo! I see you.

~ commitment = 3
-> d3_a


// -----------------------------------------------------------------------------
// D3 — CLOSING LEVERAGE / VEKTOR A
// -----------------------------------------------------------------------------
//
// A has committed far enough that the sale is available, but not yet executed.
// D3 asks whether Cipher banks the known result or spends risk budget exploiting
// A's need to control the verification process.
//
// Context matters:
// - If D2 FLEX already captured A's handle, the press is literally to send it.
// - Otherwise, Cipher must first turn A's legitimacy demand back on him.
//
// Commitment 4 remains absolute: once Cipher banks, SALE ends the branch.

=== d3_a ===

{ counter_probe_captured:
    * [BANK THE WIN]
        -> d3_a_bank

    * [PRESS FOR MORE]
        CIPHER: [VEKTOR/A HANDLE]
        -> d3_a_handle_reveal

- else:
    * [BANK THE WIN]
        -> d3_a_bank

    * [PRESS FOR MORE]
        CIPHER: Your turn.
        -> d3_a_force_reciprocity
}


=== d3_a_bank ===

{ d2_strategy == STRATEGIC:
    CIPHER: Now let's get this deal done.
    VEKTOR: First tranche?
- else:
    CIPHER: First tranche.
}

~ commitment = 4
-> ending_sale


=== d3_a_force_reciprocity ===

// Minimal connective tissue. Choosing YOUR TURN commits the player to the press.
// The following exchange is surviving former D2/Flex material, relocated here.

VEKTOR: I heard Candyman is compromised. You're a Fed, aren't you?
CIPHER: Of course. So are you. So is Candyman. We ALL are. Accusations are cheap. Proof has a price.
VEKTOR: Can you afford to pay it?
CIPHER: I can if you can.

[Vektor goes quiet.]

[On the surveillance channel, Ghost catches a probe against Candyman's relationship graph.]

~ counter_probe_captured = true
~ intel += 1

VEKTOR: Boo! I see you.
CIPHER: [VEKTOR/A HANDLE]

-> d3_a_handle_reveal


=== d3_a_handle_reveal ===

[Vektor drops a sparse comm log into the chat: Ghost contacted Candyman before Cipher appeared. Cipher arrived later with a thin footprint. Candyman still shortlisted him.]

VEKTOR: Coincidence?

{ qa_a_coin > 0:
    ~ suspicion += qa_a_coin
- else:
    ~ suspicion += RANDOM(1,3)
}
{ suspicion > 4:
    ~ suspicion = 4
}

{ suspicion >= 4:
    -> ending_bolts
}

// DESIGN NOTE — GRAND SLAM GATE
// `grand_slam_possible` is not a class-purity bonus.
// Full Flex is required because two causal prerequisites must already exist:
//   D1 Flex/A -> PRESSURE SIGNATURE / I1
//   D2 Flex/A -> COUNTER-PROBE CAPTURED / I2
//
// D3 PRESS spends the secured sale to exploit A's Tell.
// If the full-Flex prerequisites exist and A survives `Coincidence?`, the
// repository trap becomes available.
//
// Non-full-Flex histories can still earn valuable Intel by pressing, but they
// cannot retroactively create the missing Grand Slam prerequisites.
{ grand_slam_possible:
    -> d3_grand_slam
- else:
    -> d3_a_recovery
}


=== d3_a_recovery ===

CIPHER: That your idea of a gotcha? Of course they're related. Ghost connected me with Candyman and Candyman to you. It's called networking.

~ suspicion += RANDOM(0,1)
{ suspicion > 4:
    ~ suspicion = 4
}

{ suspicion >= 4:
    -> ending_bolts
}

~ commitment = 4
-> ending_sale


// -----------------------------------------------------------------------------
// D3 PRESS CASCADE → D4 — GRAND SLAM / THE FINAL TELL
// -----------------------------------------------------------------------------

=== d3_grand_slam ===

// Entry requirement:
// - PROFILE_A
// - D1 FLEX
// - D2 FLEX
// - PRESSURE SIGNATURE secured
// - COUNTER-PROBE CAPTURED secured
// - survived Coincidence? at S3

[Cipher stares at Vektor's last message.]

[He checks the repository through Surface X.]

[Beat.]

TECH: Holy shit. He's at the repository.

[Another beat.]

TECH: He's authenticating.

[Beat.]

TECH: Unbelievable.
VANCE: What?
TECH: It's the Black Orchard key.

~ intel = 3

[Beat.]

TECH: Checking inventory.

[Beat.]

TECH: Hitting the protected fields.

[Silence.]

[Cipher is still staring at:]

Coincidence?

[A longer beat.]

TECH: Hold on.

[Vance looks over.]

TECH: He's requesting authorization.

[Beat.]

TECH: Transmitted.

~ intel = 4
~ grand_slam_secured = true

[Silence.]

VANCE: Got 'em.

* [SAY NOTHING]
    -> ending_grand_slam

* [WHAT'S IT WORTH TO YOU?]
    CIPHER: What's it worth to you?
    ~ suspicion = 4
    -> ending_pyrrhic


// -----------------------------------------------------------------------------
// TERMINALS
// -----------------------------------------------------------------------------

=== ending_sale ===

{ intel >= 2:
    ~ score = 5
    RESULT: SALE
    INTEL: ACTIONABLE
    SCORE: 5/6
- else:
    { intel >= 1:
        ~ score = 4
        RESULT: SALE
        INTEL: LEAD
        SCORE: 4/6
    - else:
        ~ score = 3
        RESULT: SALE
        INTEL: NONE
        SCORE: 3/6
    }
}

{ ghost_cover_compromised:
    OPERATIONAL COST: GHOST COVER BURNED
}

-> END


=== ending_bolts ===

{ intel >= 2:
    ~ score = 2
    RESULT: BOLTS
    INTEL: ACTIONABLE
    SCORE: 2/6
- else:
    { intel >= 1:
        ~ score = 1
        RESULT: BOLTS
        INTEL: LEAD
        SCORE: 1/6
    - else:
        ~ score = 0
        RESULT: BOLTS
        INTEL: NONE
        SCORE: 0/6
    }
}

-> END


=== ending_pyrrhic ===

TECH: Wait. He's bailing.
VANCE: What?
TECH: He's disconnecting.
VANCE: Check the source.

[Beat.]

TECH: He's gone. We lost him.
VANCE: WTF, Cipher?

~ score = 5

FADE TO BLACK.

RESULT: PYRRHIC GRAND SLAM
INTEL: STRATEGIC
TARGET: LOST
SCORE: 5/6

-> END


=== ending_grand_slam ===

~ score = 6

FADE TO BLACK.

RESULT: GRAND SLAM
INTEL: STRATEGIC
TARGET: VIABLE
SCORE: 6/6

-> END
