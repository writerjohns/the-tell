// ============================================================================
// THE DATA GUARD STING 
// Written in Ink by Inkle
// ============================================================================

// --- Global State Variables ---
VAR vektor_trust = 50
VAR suspicion = 0
VAR fbi_compliance = true
VAR hospital_safe = true

// --- Start Game ---
-> act_1_the_setup

// ============================================================================
// ACT I: THE SETUP
// ============================================================================
=== act_1_the_setup ===
Vektor: "Cipher. If you've got the master keys to the St. Jude MedNet DB, how come I don't see any exploits on the forum?"

* [Type: "It's in the schema. What do you want to see?"]
    ~ vektor_trust += 10
    Vektor: "All of it. Layout, schema, partition indexes, session telemetry -- show me it's live."
    -> act_1_the_ask

* [Type: "You don't trust me, check my forum rep."]
    ~ vektor_trust -= 10
    ~ suspicion += 5
    Vektor: "Darknet reps mean jack. I can find a zillion guys with rep. I need bankable. Show me the entry points, or we're done."
    -> act_1_the_ask

* [THE CHURN STRAT: Deploy a script to rotate your gateway IPs dynamically]
    ~ suspicion -= 15
    ~ fbi_compliance = false
    Vance's text flashes on your side monitor: *"Cipher! There a reason you're flooding the log array with rotational proxy routes? Because if you're masking his scraper, remember you're also violating the routing footprint. Those nodes desync, connection's gone!"*
    The status terminal on your screen flickers wildly:
    `[Vektor_System: Scraper encountering network jitter...]`
    `[Error: Source IP routing resolution unstable.]`
    Vektor: "Connection routing looks pretty noisy."
    Vektor: "You screw me on this... ☢️"
    -> act_1_the_ask


// ============================================================================
// ACT I: THE ASK
// ============================================================================
=== act_1_the_ask ===
Vektor: "Here's how this works. My team okays the metadata, I transfer the crypto. You can upload the data dictionary and transaction logs to my blind drop folder."

Vance’s side-channel window instantly updates on your main screen, the text scrolling rapidly: 
{ suspicion >= 15:
    "Vance (Side-Channel): Cipher, he's tracing our gateway server! We can't do a dummy file. AI sniffer flags it as dead and Vektor goes nuke. We need something structurally authentic, but nothing live. That's straight from the top."
- else:
    "Vance (Side-Channel): Cipher, negative on that request! You upload live production transaction logs, you hand Vektor the keys to the kingdom, put our Director in front of a Senate committee and you do time. Just drop a synthetic telemetry file."
}

* [FOLLOW PROTOCOL: Upload standard FBI synthetic telemetry file]
    ~ fbi_compliance = true
    ~ suspicion += 10
    You drop the bureau's standard synthetic dataset into the folder. 
    Vance: *"File sent. Let's just hope his parser buys it."*
    -> act_2_the_jargon_gate

* [THE TASTE, NOT THE WINE: Upload real sample with AES-256 encrypted columns]
    ~ fbi_compliance = false
    ~ vektor_trust += 15
    You lock down the sensitive patient name, SSN, and diagnosis columns using AES-256 and drop the file.
    You type: "Here's a taste, Vektor. Schema headers and transaction noise are authentic. Target rows are encrypted. You see them when I get paid."
    Vance: *"WTF did you just do? Did you not hear what I just said about leaking genuine network metadata? His parser cracks that file framework..."*
    You hear Vance sigh heavily over your headset, running his hands over his face.
    -> act_2_the_jargon_gate

* [THE OTP STRAT: Upload real data sample obfuscated by a One-Time Pad]
    ~ fbi_compliance = false
    ~ vektor_trust += 25
    ~ suspicion -= 10
    You run a local command line loop to XOR the patient payload directly against a random cryptographic key stream.
    You type: "Data dictionary's live. Good luck cracking it. Just let me know when escrow clears."
    Vance: *"That's either the stupidest or most brilliant thing I've ever seen. How I'm going to explain this to leadership...?"*
    You hear Vance exhale deeply into his microphone.
    -> act_2_the_jargon_gate


// ============================================================================
// ACT II: THE JARGON GATE
// ============================================================================
=== act_2_the_jargon_gate ===
Vektor: "Cipher. We just got metadata layout."
Vektor: "And I find myself asking, if the target is supposed to be running a highly distributed, active-active multi-tenant cluster architecture across localized shards, why do the block metrics show consecutive, perfectly sequential ROWIDs across distinct data partitions?"

* [AMATEUR TRAP: "DBA must have done a manual migration before the export."]
    ~ suspicion += 50
    You tap out a quick justification, trying to play off the structural inconsistency as normal human behavior.
    Vektor: "A manual migration on a live primary enterprise ledger during peak hours? Without tripping an alert? When your bank calls -- and they will -- tell them I said thanks."
    The connection terminates.
    -> sequential_fallout_burned

* [EXPERT MASTERSTROKE: "It's a mirror. I hacked the ODG tnsnames and forced a DR failover."]
    ~ vektor_trust += 30
    ~ suspicion -= 20
    You type: "EDR sensors—CrowdStrike were all over the cluster. I had to get the credentials from a sloppy TNS backup to issue the silent DR mirror partition. The ROWIDs are just transaction inserts syncing the data to the backup. It's not staged. It's a clean failover."
    The chat terminal is silent for a moment.
    Vektor: "A forced DR failover to bypass active endpoint detection... okay. Sync matches."
    -> act_3_the_climax

* [TECHNICAL BLUFF: Attack Vektor's parsing tools instead of explaining the data.]
    ~ suspicion += 15
    ~ vektor_trust -= 10
    You type: "You're still using regex libraries from 2024 and you think my data's the problem?"
    Vance whispers over your headset: *"Need I remind you, Cipher, this guy took down Capitol pipeline last year? We're trying to bust him, not talk him into wiping out half our electrical grid."*
    Vektor: "You would do well to mind your own systems."
    You stare at the blinking cursor during the long, uncomfortable silence.
    Vektor: "Fine. I'll accept the data layout. But we deploy now. I want this target."
    -> act_3_the_climax
    ink// ============================================================================
// ACT III: THE CLIMAX
// ============================================================================
=== act_3_the_climax ===
{ 
    - suspicion >= 40:
        -> sequential_fallout_burned
    - else:
        -> ongoing_negotiation_climax
}

=== ongoing_negotiation_climax ===
Vektor: "Their NOC will spot the primary drop in minutes. Deploying the payload to the active listener port before they roll back the mirror."
Vance: "Cipher! He's hitting the listener port. We need 15 seconds to lock his uplink coordinates. Can you reroute that connection descriptor before the hospital goes dark?"

* [TNS POISON: Edit tnsnames.ora to reroute Vektor's payload to the FBI sandbox]
    ~ hospital_safe = true
    ~ suspicion += 15
    You quickly edit the listener target host address, executing a silent TNS redirection to point his payload straight into the bureau's dummy container.
    You type: "Listener's bounced. Use the updated descriptor."
    The payload deploys. St. Jude's ping stays a steady, healthy green.
    -> evaluating_the_sting

* [HOLD THE LINE: Let the payload hit the live database to secure the trace]
    ~ hospital_safe = false
    ~ vektor_trust += 20
    You freeze. On your monitor, Vektor's script loops into the real database, encrypting critical client structures row by row. St. Jude's status indicator changes to a flashing, critical crimson.
    Vance: *"He's in Bucharest. We got him, Cipher! You got him! Oh jeez... hospital just went dark."*
    -> ending_fbi_victory

* [COUNTER-EXPLOIT: Deploy terminal clone script straight into his pipe]
    ~ fbi_compliance = false
    ~ suspicion += 20
    You launch an inline terminal emulator clone script straight down his connection thread, masking the hook within his active data stream.
    Vance: *"Cipher, that's an unauthorized counter-exploit! We don't have a warrant for a tactical intrusion into an overseas network—"*
    The clone hook catches. Dual telemetry streams fracture across your UI display.
    `[INT_ALERTER: Terminal Emulator Clone Active]`
    `[SYS_ECHO: Upstream Session Input Intercepted]`
    Vance: *"Wait... look at the loopback logs. It's mapping his upstream server architecture. We're pulling his entire network layout. But the payload is still traveling down the pipe. You've got five seconds."*
    ** [TRIPLE-PLAY: Inject a spoofed administrative disconnect loop]
        -> ending_tactical_masterstroke
    ** [HARVEST WIRE: Sacrifice the target node to let the data mapping finish]
        ~ hospital_safe = false
        Vance: *"Uplink locked! Script hit 100%. We have the physical blueprint to his command server in Bucharest, but the hospital framework is encrypted."*
        -> ending_fbi_victory


// ============================================================================
// EVALUATIONS & ENDINGS
// ============================================================================
=== evaluating_the_sting ===
{
    - suspicion >= 35:
        Vektor: "You bounced the listener? Wait. Latency just dropped to absolute zero. This isn't an enterprise network route... it's a local loopback."
        Vektor: "You're feeding me a sandbox. Cops."
        -> sequential_fallout_burned
    - else:
        Vektor: "Socket updated. Payload running... data throughput looks consistent. Escrow clearing initiated."
        Vance: *"Trace complete! We bypassed his Tor entry node while he was hitting our sandbox. Strike teams are breaching his location now."*
        -> ending_tactical_victory
}

=== sequential_fallout_burned ===
The chat console turns a cold, dead gray: `[Session Disconnected by Remote Host]`.
Vance sighs heavily over your earpiece. *"He pulled the plug. His scraper must have caught the loopback route or smelled the synthetic file structure. He's scrubbing his command servers right now. The syndicate is going dark."*
*"Your legend held up enough to keep you safe, but the sting is dead. Pack up your console, Agent. We're reassigning your file."*
-> END

=== ending_fbi_victory ===
Vance pumps his fist against his desk. *"We got him! The trace bypassed his Tor proxies. We have a physical server farm location in Bucharest and local authorities are moving in now."*
He looks at your secondary screen, his expression hardening as the St. Jude database flatlines. *"The sting is a massive success for the Bureau. We dismantled a global ransomware wing tonight. But tomorrow, you and I are going to have to explain to the Director why we let an entire hospital group go dark to get it."*
-> END

=== ending_tactical_victory ===
Vance throws his headset onto his desk and cheers. *"Trace complete! We bypassed his proxies. Strike teams are breaching his physical server location in Bucharest right now."*
Because you threw him a dummy target file via the TNS redirection, the real St. Jude Medical network remains completely untouched, glowing a healthy green on your status board.
Vance looks at you, completely stunned. *"You broke operational routing protocol with that IP Churning stunt, Agent. But your technical execution was flawless. You insulated the target and dismantled a global cyber ring in a single shift. Exceptional work, Cipher."*
-> END

=== ending_tactical_masterstroke ===
You pull Vektor's live connection footprint from your emulator script and fire a raw, spoofed administrative command straight up his core execution pipeline:
`ALTER SYSTEM DISCONNECT SESSION '12, 3456' IMMEDIATE;`
The deployment bar on your terminal freezes permanently at 84%. His local command host drops, forcefully killing its own stream before the ransomware can parse its tablespace wipe.
The chat turns a frozen gray: `[Session Terminated via Remote Host Response]`.
St. Jude's diagnostics glow a healthy, steady green.
Vance pulls off his headset, staring at your monitor in absolute awe. *"You didn't just reroute him... you hit him back. Your script finished pulling the telemetry before the socket dropped. We have the complete network map of his syndicate's infrastructure. DOJ is going to scream about the warrant-less intrusion... but the Director can't touch you when you just handed them the keys to destroy the largest ransomware ring on earth. Pack up your gear, Agent. Let's go talk to the lawyers."*
[ FADE OUT. THE DATA GUARD STING v1.0 ]
-> END