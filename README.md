# THE DATA GUARD STING
**Format:** Interactive Branching Text Demo (Ink Architecture)  
**Playtime:** ~5 Minutes  

## Design Objective
To demonstrate high-tension, fast-paced character dialogue driven by authentic relational database engineering principles (Oracle Data Guard architectures and network routing constraints). This project bridges advanced software engineering with elite screenplay pacing.

## Core State Variables Tracked
* `vektor_trust`: Controls character volatility, pacing, and transaction delays.
* `suspicion`: Controls automated network counter-traces and gatekeeper tripwires.
* `fbi_compliance`: Tracks operational ethics vs. rogue undercover survival tactics.
* `hospital_safe`: Tracks the physical security and integrity of the St. Jude database framework.

## Golden Path Reference
To achieve the optimal 'Tactical Masterstroke' outcome, the user must execute a high-risk technical strategy:
1. **Act I (The Setup):** Blind the automated AI scraper using the **IP Churning Strat** (Sets up low suspicion).
2. **Act I (The Ask):** Establish commercial leverage by uploading an **OTP-obfuscated** structural data block.
3. **Act II (The Jargon Gate):** Bypass Vektor's data integrity trap cleanly via the **Oracle Data Guard DR failover** masterstroke response.
4. **Act III (The Climax):** Deploy the **Terminal Emulator Clone Script** to actively capture Vektor's session IDs.
5. **Act III (The Resolution):** Force an immediate, administrative `ALTER SYSTEM DISCONNECT SESSION` statement back up the pipe to kill his connection before encryption executes.

## Project Architecture Flowchart
This diagram renders automatically into a clean geometric flowchart inside compatible viewers like GitHub, Notion, or Obsidian.

```mermaid
graph TD
    %% Define Styles & Visual Themes for Scannability
    classDef startEnd fill:#111,stroke:#333,stroke-width:2px,color:#fff;
    classDef choice fill:#f9f9f9,stroke:#999,stroke-width:1px,color:#333;
    classDef logic fill:#fffde7,stroke:#ffd54f,stroke-width:2px,color:#000;
    classDef fail fill:#ffebee,stroke:#ef5350,stroke-width:2px,color:#c62828;
    classDef win fill:#e8f5e9,stroke:#66bb6a,stroke-width:2px,color:#2e7d32;

    %% Act I Nodes
    Start([Act I: Cipher Meets Vektor]):::startEnd
    
    Start --> Choice_Tone1{Select Tone}:::choice
    Choice_Tone1 -->|"Professional Tone"| Ask[Act I: Vektor Demands Data Dictionary]
    Choice_Tone1 -->|"Arrogant Tone<br/>(vektor_trust -10, suspicion +5)"| Ask
    Choice_Tone1 -->|"IP Churning Strat<br/>(suspicion -15, fbi_compliance = false)"| Ask

    %% Act I to Act II Transition
    Ask --> Choice_File{Select Upload Strategy}:::choice
    Choice_File -->|"Standard FBI File<br/>(suspicion +10)"| Gate[Act II: The Jargon Gate<br/>Vektor Spots Sequential ROWIDs]
    Choice_File -->|"AES-256 Lockdown<br/>(vektor_trust +15)"| Gate
    Choice_File -->|"One-Time Pad Strat<br/>(vektor_trust +25, suspicion -10)"| Gate

    %% Act II Logic Gate
    Gate --> Choice_Gate{Select Technical Counter}:::choice
    Choice_Gate -->|"Amateur Answers"| Burned([Ending: Burned Cover<br/>Vektor Hard-Wipes Node]):::fail
    Choice_Gate -->|"Oracle Data Guard Masterstroke<br/>(vektor_trust +30, suspicion -20)"| ClimaxCheck{"Act III Router:<br/>Check Suspicion"}:::logic
    Choice_Gate -->|"Technical Bluff<br/>(vektor_trust -10, suspicion +15)"| ClimaxCheck

    %% Act III Routing Logic
    ClimaxCheck -->| suspicion >= 40 | Burned
    ClimaxCheck -->| suspicion < 40 | ClimaxChoices[Act III: Vektor Deploys Payload]:::choice

    %% Act III Choices & Final Endings
    ClimaxChoices -->|"TNS Poisoning Redirect<br/>(hospital_safe = true)"| SandboxCheck{"Check Sandbox Latency"}:::logic
    ClimaxChoices -->|"Hold the Line<br/>(hospital_safe = false)"| FBIVictory([Ending: Bureaucratic FBI Victory<br/>Hospital Encrypted, Trace Complete]):::win
    ClimaxChoices -->|"Deploy Terminal Clone Script<br/>(fbi_compliance = false)"| CloneChoices[Clone Session Action]:::choice

    %% Clone Branch Options
    CloneChoices -->|"Inject SQL Disconnect Loop"| Masterstroke([Ending: Tactical Masterstroke<br/>Hospital Safe, Syndicate Dismantled]):::win
    CloneChoices -->|"Sacrifice Wire to Harvest Data"| FBIVictory

    %% Sandbox Sub-Evaluation
    SandboxCheck -->| suspicion >= 35 | Burned
    SandboxCheck -->| suspicion < 35 | TacVictory([Ending: Tactical Victory<br/>Hospital Safe and Clean]):::win
```
