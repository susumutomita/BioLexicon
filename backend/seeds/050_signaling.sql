-- =============================================================================
-- 050_signaling.sql
-- BioLexicon seed data: Cell Signaling & Signal Transduction
-- Domain: Cell Biology / Signaling Pathways
-- Terms: 25
-- =============================================================================

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'signal transduction',
  'シグナル伝達',
  'Pub/Sub messaging + event-driven architecture: extracellular ligands (events) bind receptors (subscribers), triggering cascading handler chains (kinase cascades) that amplify and relay the signal to downstream effectors (services) that execute the appropriate cellular response.',
  'The process by which an extracellular signal (ligand) is detected by a cell-surface or intracellular receptor and converted into an intracellular response through a series of molecular events, typically involving protein phosphorylation cascades, second messengers, and transcription factor activation. Enables cells to respond to their environment.',
  'Foundational concept in cell biology and pharmacology. Martin Rodbell and Alfred Gilman received the 1994 Nobel Prize for G protein signaling. Dysregulated signaling is a hallmark of cancer and a major drug target category.',
  ARRAY['cell signaling', 'signal transduction pathway', 'signaling cascade']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'receptor',
  '受容体',
  'API endpoint / event listener: a protein that exposes a specific binding interface to the outside world, and upon ligand (request) binding, triggers an internal handler function that initiates downstream processing.',
  'A protein molecule, typically located on the cell surface or within the cell, that specifically binds a signaling molecule (ligand) and initiates a cellular response. Major classes include G protein-coupled receptors (GPCRs), receptor tyrosine kinases (RTKs), ion channel receptors, and nuclear receptors. Exhibits specificity, affinity, and saturation kinetics.',
  'GPCRs constitute the largest family of membrane receptors (~800 in humans) and are targets of ~34% of FDA-approved drugs. Receptor studies are central to pharmacology and drug discovery.',
  ARRAY['receptors', 'cell receptor', 'membrane receptor']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'ligand',
  'リガンド',
  'API request payload / event data: the specific molecule (message) that binds to a receptor (endpoint), carrying the information that triggers a particular cellular response — like an HTTP request body that activates a specific handler.',
  'A molecule that binds specifically to a receptor to form a receptor-ligand complex, initiating or modulating a signaling response. Ligands include hormones, neurotransmitters, growth factors, cytokines, and small molecules. Binding is characterized by affinity (Kd), specificity, and can be agonistic or antagonistic.',
  'Ligand-receptor interactions are the basis of pharmacology. Drug design focuses on creating ligands (agonists, antagonists, inverse agonists) that modulate receptor activity. Studied by binding assays, SPR, and structural biology.',
  ARRAY['ligands', 'signaling molecule']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'g protein',
  'Gタンパク質',
  'Message broker / middleware switch: heterotrimeric molecular switches that toggle between ON (GTP-bound) and OFF (GDP-bound) states, coupling receptor events to downstream effector services — like a message queue that routes events to the appropriate handler.',
  'A family of GTP-binding proteins that act as molecular switches in signal transduction. Heterotrimeric G proteins (Gα, Gβ, Gγ) couple GPCRs to intracellular effectors. Upon receptor activation, Gα exchanges GDP for GTP and dissociates from Gβγ, both activating downstream effectors. Gα intrinsic GTPase activity returns the system to the inactive state.',
  'Martin Rodbell and Alfred Gilman received the 1994 Nobel Prize for G protein discovery. G protein subtypes (Gs, Gi, Gq, G12/13) activate different effectors. Small G proteins (Ras superfamily) are also critical signaling switches.',
  ARRAY['G-protein', 'GTP-binding protein', 'heterotrimeric G protein']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'g protein-coupled receptor',
  'Gタンパク質共役型受容体',
  'RESTful API endpoint with standardized middleware: a seven-transmembrane-helix receptor that exposes an extracellular binding interface and signals through a standardized G protein middleware layer — the most common endpoint architecture in the cell''s API, targeted by ~34% of all approved drugs.',
  'The largest superfamily of cell-surface receptors (~800 in humans), characterized by seven transmembrane alpha-helical domains. Ligand binding induces conformational changes that activate associated heterotrimeric G proteins, which in turn modulate effector enzymes (adenylyl cyclase, phospholipase C) and ion channels. Also signal through G protein-independent pathways (β-arrestins).',
  'Target of approximately 34% of all FDA-approved drugs. Brian Kobilka and Robert Lefkowitz received the 2012 Nobel Prize for GPCR structural and functional studies. Includes receptors for light (rhodopsin), smell, taste, hormones, and neurotransmitters.',
  ARRAY['GPCR', 'GPCRs', 'seven-transmembrane receptor', '7TM receptor']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'kinase',
  'キナーゼ',
  'Event emitter / state setter: an enzyme that phosphorylates (tags) target proteins, flipping their activation state — like an event emitter that modifies object state by adding phosphorylation "flags" that change protein behavior.',
  'An enzyme that catalyzes the transfer of a phosphate group from ATP (or GTP) to a substrate molecule, typically a protein (protein kinase). Protein kinases phosphorylate serine, threonine, or tyrosine residues, modulating substrate activity, localization, or interactions. The human kinome contains 518 protein kinases.',
  'Kinases are the largest enzyme family targeted by drugs. Over 70 kinase inhibitors are FDA-approved (e.g., imatinib, erlotinib, vemurafenib). Kinase cascades (e.g., MAPK) are central signaling motifs.',
  ARRAY['protein kinase', 'kinases', 'phosphotransferase']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'phosphatase',
  'ホスファターゼ',
  'State resetter / undo operation: an enzyme that removes phosphate groups from proteins, reversing kinase actions — like an undo command that restores objects to their pre-modified state, maintaining system homeostasis.',
  'An enzyme that catalyzes the removal of a phosphate group from a substrate (dephosphorylation). Protein phosphatases counterbalance protein kinases, maintaining dynamic equilibrium of phosphorylation. Major families include serine/threonine phosphatases (PP1, PP2A, PP2B/calcineurin) and tyrosine phosphatases (PTP1B, SHP2, PTEN).',
  'PTEN is a lipid phosphatase and major tumor suppressor (antagonizes PI3K signaling). Calcineurin (PP2B) is the target of immunosuppressive drugs cyclosporine and tacrolimus. Increasingly recognized as drug targets.',
  ARRAY['protein phosphatase', 'phosphatases']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'second messenger',
  'セカンドメッセンジャー',
  'Internal event bus notification: small diffusible molecules that relay and amplify the receptor signal inside the cell — like lightweight internal events (pub/sub messages) that fan out from a single API call to activate multiple downstream handlers simultaneously.',
  'Small intracellular signaling molecules generated or released in response to an extracellular signal (first messenger) that amplify and relay the signal within the cell. Major second messengers include cAMP, cGMP, IP3, DAG, Ca2+, and PIP3. Produced rapidly, act locally, and are quickly degraded or sequestered to allow signal termination.',
  'Earl Sutherland received the 1971 Nobel Prize for discovering cAMP as a second messenger. Second messenger systems enable signal amplification: one receptor can generate thousands of second messenger molecules.',
  ARRAY['second messengers', 'intracellular messenger']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'camp',
  'cAMP',
  'Broadcast notification token: a rapidly generated, widely diffused signaling molecule that activates PKA (notification handler) throughout the cell — like a push notification that triggers multiple downstream actions from a single event.',
  'Cyclic adenosine 3'',5''-monophosphate, a ubiquitous second messenger synthesized from ATP by adenylyl cyclase (activated by Gs proteins) and degraded by phosphodiesterases (PDEs). Primarily activates protein kinase A (PKA), which phosphorylates diverse substrates including CREB transcription factor, metabolic enzymes, and ion channels.',
  'First second messenger discovered (Earl Sutherland, Nobel Prize 1971). Central to hormone signaling (epinephrine, glucagon). cAMP/PKA pathway regulates glycogen metabolism, gene expression, and cardiac function. PDE inhibitors (sildenafil/Viagra, caffeine) act by preventing cAMP/cGMP degradation.',
  ARRAY['cyclic AMP', 'cyclic adenosine monophosphate', '3'',5''-cyclic AMP']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'calcium signaling',
  'カルシウムシグナル伝達',
  'Interrupt signal / hardware interrupt: rapid Ca2+ release from ER stores (like a hardware interrupt from a peripheral device) triggers immediate downstream responses, with precise spatiotemporal patterns encoding different instructions (oscillations = repeated interrupts).',
  'A signaling mechanism in which transient increases in cytosolic Ca2+ concentration (from ~100 nM resting to ~1 μM upon stimulation) serve as intracellular signals. Ca2+ is released from the ER via IP3 receptors or ryanodine receptors, or enters from outside via plasma membrane channels. Ca2+ binds calmodulin and other sensors to activate effector proteins (CaMKII, calcineurin, PKC).',
  'Ca2+ signals regulate muscle contraction, neurotransmitter release, fertilization, gene expression, and apoptosis. Spatiotemporal patterns (oscillations, waves, sparks) encode different information. Dysregulation is implicated in cardiac arrhythmias, neurodegeneration, and cancer.',
  ARRAY['Ca2+ signaling', 'calcium signal', 'intracellular calcium']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'mapk pathway',
  'MAPK経路',
  'Three-tier middleware cascade (controller → service → handler): a core signaling module where Raf (tier 1) activates MEK (tier 2) which activates ERK (tier 3), amplifying the signal at each level — like a three-layer middleware stack that progressively processes and amplifies requests.',
  'A conserved three-tiered kinase cascade: MAP kinase kinase kinase (MAPKKK/Raf) → MAP kinase kinase (MAPKK/MEK) → MAP kinase (MAPK/ERK). Activated downstream of Ras (via RTK-Grb2-SOS pathway), ERK phosphorylates numerous cytoplasmic and nuclear targets to promote cell proliferation, differentiation, and survival. Other MAPK modules include JNK and p38 pathways.',
  'Ras-Raf-MEK-ERK pathway is one of the most frequently mutated signaling axes in cancer (BRAF V600E in melanoma, KRAS G12C in lung cancer). MEK inhibitors (trametinib) and BRAF inhibitors (vemurafenib) are FDA-approved for melanoma.',
  ARRAY['MAPK/ERK pathway', 'Ras-Raf-MEK-ERK', 'ERK pathway', 'mitogen-activated protein kinase pathway']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'pi3k/akt pathway',
  'PI3K/Akt経路',
  'Resource provisioning / auto-scaler: a growth and survival pathway that monitors nutrient and growth factor availability, scaling up cell growth (mTOR = provisioning engine), blocking shutdown (apoptosis inhibition), and allocating metabolic resources — like a cloud auto-scaling controller.',
  'A signaling pathway activated by RTKs and GPCRs in which PI3K phosphorylates PIP2 to generate PIP3, recruiting and activating the serine/threonine kinase Akt (PKB). Akt phosphorylates numerous substrates (mTORC1, BAD, GSK3β, FOXO) to promote cell survival, growth, proliferation, and metabolism. Negatively regulated by the phosphatase PTEN.',
  'One of the most frequently activated pathways in cancer (PIK3CA mutations, PTEN loss, AKT amplification). PI3K inhibitors (alpelisib) and mTOR inhibitors (everolimus) are FDA-approved. Central to insulin signaling and metabolic regulation.',
  ARRAY['PI3K-Akt-mTOR', 'PI3K pathway', 'Akt pathway', 'phosphoinositide 3-kinase pathway']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'wnt pathway',
  'Wntシグナル経路',
  'Feature toggle with state persistence: Wnt ligand binding disables the "destruction complex" (which normally garbage-collects β-catenin), allowing β-catenin to accumulate and activate target gene transcription — like toggling a feature flag that prevents cleanup of a normally short-lived configuration object.',
  'A conserved signaling pathway in which Wnt ligands bind Frizzled receptors and LRP5/6 co-receptors. In the canonical pathway, Wnt binding inhibits the β-catenin destruction complex (APC, Axin, GSK3β, CK1), allowing β-catenin to accumulate, translocate to the nucleus, and activate TCF/LEF target genes. Non-canonical pathways include Wnt/PCP and Wnt/Ca2+.',
  'Essential for embryonic development (axis formation, segment polarity in Drosophila). APC mutations causing constitutive Wnt activation are found in >80% of colorectal cancers. Named from Wingless (Drosophila) + Int-1 (mouse).',
  ARRAY['Wnt signaling', 'Wnt/beta-catenin pathway', 'wingless pathway']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'notch pathway',
  'Notchシグナル経路',
  'Direct inter-process communication (IPC) via shared memory: a contact-dependent signaling mechanism where a ligand on one cell directly triggers proteolytic cleavage and release of a transcription factor from the receptor on an adjacent cell — like a direct memory-mapped signal between adjacent processes without a network intermediary.',
  'A juxtacrine signaling pathway activated by cell-cell contact. Transmembrane Notch receptors (Notch1-4) are activated by Delta/Serrate/Jagged ligands on adjacent cells, triggering sequential proteolytic cleavages (by ADAM metalloproteases and gamma-secretase). The released Notch intracellular domain (NICD) translocates to the nucleus and activates CSL/RBPJ transcription factor targets (HES, HEY genes).',
  'Critical for cell fate decisions during development (lateral inhibition, boundary formation). Activating NOTCH1 mutations drive T-cell acute lymphoblastic leukemia (T-ALL). Gamma-secretase inhibitors are in clinical trials.',
  ARRAY['Notch signaling', 'Delta-Notch pathway']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'hedgehog pathway',
  'ヘッジホッグシグナル経路',
  'Gated pipeline with double-negative logic: in the absence of Hedgehog ligand, Patched receptor suppresses Smoothened (gate closed); Hedgehog binding relieves this inhibition (opens the gate), allowing Smoothened to activate Gli transcription factors — like a double-NOT gate where removing the inhibitor activates the downstream pipeline.',
  'A morphogen signaling pathway in which Hedgehog ligands (Sonic, Indian, Desert Hh in vertebrates) bind the receptor Patched (PTCH1), relieving its inhibition of the GPCR-like protein Smoothened (SMO). Active SMO signals through primary cilia to inhibit the processing of Gli transcription factors into repressor forms, allowing full-length Gli activators to drive target gene expression.',
  'Essential for embryonic patterning (limb development, neural tube ventralization). Aberrant activation (PTCH1 loss, SMO mutations) drives basal cell carcinoma and medulloblastoma. Vismodegib (SMO inhibitor) is FDA-approved for advanced BCC.',
  ARRAY['Hh pathway', 'Shh pathway', 'Sonic hedgehog pathway']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'rtk',
  '受容体チロシンキナーゼ',
  'Self-activating webhook endpoint: upon ligand binding, RTKs dimerize and auto-phosphorylate (like a webhook that self-validates and self-initializes), creating docking sites that recruit and activate multiple downstream signaling adapter modules.',
  'A class of cell-surface receptors with intrinsic tyrosine kinase activity. Ligand binding induces receptor dimerization and trans-autophosphorylation of tyrosine residues in the intracellular domain, creating phosphotyrosine docking sites for SH2/PTB domain-containing adaptor proteins. Activates Ras-MAPK, PI3K-Akt, PLCγ, and STAT pathways. Families include EGFR, PDGFR, VEGFR, FGFR, and insulin receptor.',
  'Major oncogenic drivers: EGFR (lung cancer), HER2 (breast cancer), BCR-ABL (CML). Targeted by numerous FDA-approved drugs: small molecule inhibitors (imatinib, erlotinib, lapatinib) and monoclonal antibodies (trastuzumab, cetuximab).',
  ARRAY['receptor tyrosine kinase', 'receptor tyrosine kinases', 'EGFR', 'HER2', 'VEGFR']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'jak-stat pathway',
  'JAK-STAT経路',
  'Express lane / fast-track signaling shortcut: a minimal two-step signal relay where JAK kinases directly phosphorylate STAT transcription factors at the receptor, which then dimerize and go straight to the nucleus — like a priority queue that bypasses the normal middleware stack entirely.',
  'A signaling pathway in which cytokine binding to type I/II cytokine receptors activates receptor-associated Janus kinases (JAK1, JAK2, JAK3, TYK2), which phosphorylate the receptor and recruit STAT transcription factors (STAT1-6). Phosphorylated STATs dimerize, translocate to the nucleus, and activate target genes. Negatively regulated by SOCS proteins, PIAS, and phosphatases.',
  'Critical for immune function, hematopoiesis, and development. JAK2 V617F mutation drives myeloproliferative neoplasms. JAK inhibitors (ruxolitinib, tofacitinib, baricitinib) are FDA-approved for myelofibrosis, rheumatoid arthritis, and atopic dermatitis.',
  ARRAY['JAK/STAT', 'Janus kinase-STAT pathway']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'nf-kappab pathway',
  'NF-κB経路',
  'Emergency response system with inhibitor-lock pattern: NF-κB transcription factors are held inactive in the cytoplasm by IκB inhibitors (like a locked emergency button). Stress signals activate IKK, which degrades IκB (breaks the lock), releasing NF-κB to rush to the nucleus and activate inflammatory/survival genes.',
  'A family of transcription factors (p65/RelA, RelB, c-Rel, p50, p52) that regulate immune, inflammatory, and survival gene expression. In the canonical pathway, stimuli (TNF, IL-1, LPS, TCR engagement) activate the IKK complex, which phosphorylates IκBα, targeting it for ubiquitination and proteasomal degradation, releasing NF-κB dimers to translocate to the nucleus.',
  'Central to innate and adaptive immunity. Constitutive NF-κB activation is common in cancers (especially lymphomas) and chronic inflammatory diseases. Bortezomib (proteasome inhibitor for multiple myeloma) indirectly inhibits NF-κB by preventing IκB degradation.',
  ARRAY['NF-kappaB', 'NF-kB pathway', 'nuclear factor kappa B']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'tgf-beta pathway',
  'TGF-β経路',
  'Context-dependent middleware with dual personality: TGF-β acts as either a growth suppressor (firewall) or a metastasis promoter (accelerator) depending on the cell''s state — like middleware that routes the same request to completely different handlers based on application context.',
  'A signaling pathway in which TGF-β superfamily ligands (TGF-β1/2/3, BMPs, activins) bind type II serine/threonine kinase receptors, which recruit and phosphorylate type I receptors. Activated type I receptors phosphorylate receptor-SMADs (SMAD2/3 for TGF-β; SMAD1/5/8 for BMP), which complex with SMAD4 and translocate to the nucleus to regulate target genes.',
  'Dual role in cancer: tumor suppressor in early stages (growth arrest, apoptosis) but promotes metastasis in advanced cancers (EMT, immune evasion). Mutated in many cancers (SMAD4 in pancreatic cancer, TGFBR2 in MSI cancers). TGF-β inhibitors are in clinical trials.',
  ARRAY['TGF-beta signaling', 'transforming growth factor beta pathway', 'SMAD pathway']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'apoptosis pathway',
  'アポトーシス経路',
  'Dual-trigger shutdown system: the intrinsic pathway (internal watchdog monitoring system health) and extrinsic pathway (external kill signal from admin) both converge on caspase execution — like two independent shutdown mechanisms (health-check failure vs. admin command) that both invoke the same graceful termination routine.',
  'The molecular signaling cascades that execute programmed cell death. The intrinsic (mitochondrial) pathway is activated by internal stress signals (DNA damage, ER stress), leading to BAX/BAK pore formation, cytochrome c release, apoptosome assembly, and caspase-9 activation. The extrinsic (death receptor) pathway is activated by extracellular death ligands (FasL, TRAIL, TNF) binding death receptors, forming the DISC and activating caspase-8. Both converge on effector caspases (caspase-3, -7).',
  'Evasion of apoptosis is a hallmark of cancer. BH3 mimetics (venetoclax) targeting anti-apoptotic BCL-2 are FDA-approved for CLL. TRAIL receptor agonists are in clinical trials. Central to development and immune homeostasis.',
  ARRAY['cell death pathway', 'intrinsic apoptosis', 'extrinsic apoptosis']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'caspase',
  'カスパーゼ',
  'Destructors / cleanup handlers: a family of proteases that execute the orderly dismantling of the cell during apoptosis — like destructors that systematically free resources, close connections, and clean up state in a controlled sequence.',
  'A family of cysteine-aspartate proteases that play essential roles in apoptosis, necroptosis, and inflammation. Initiator caspases (caspase-2, -8, -9, -10) are activated by proximity-induced dimerization at signaling platforms (apoptosome, DISC). Effector caspases (caspase-3, -6, -7) are activated by initiator caspases and cleave hundreds of cellular substrates to execute apoptosis. Inflammatory caspases (caspase-1, -4, -5, -11) process pro-inflammatory cytokines (IL-1β, IL-18).',
  'Named "Cysteine-ASPartic proteASE." Caspase-3 is the principal executioner caspase. Caspase-1 (inflammasome component) is central to innate immunity. Studied via fluorogenic substrates (DEVD-AMC) and activity-based probes.',
  ARRAY['caspases', 'cysteine-aspartic protease']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'bcl-2',
  'Bcl-2',
  'Anti-crash guard / exception handler that prevents shutdown: Bcl-2 proteins sit on the mitochondrial membrane and intercept pro-apoptotic signals, preventing the system from crashing — like a try/catch block that absorbs exceptions to keep the process alive.',
  'A family of proteins that regulate the intrinsic apoptosis pathway by controlling mitochondrial outer membrane permeabilization (MOMP). Anti-apoptotic members (Bcl-2, Bcl-xL, Mcl-1) prevent MOMP. Pro-apoptotic effectors (BAX, BAK) form pores in the mitochondrial membrane. BH3-only proteins (BIM, BID, BAD, PUMA, NOXA) activate BAX/BAK or neutralize anti-apoptotic members.',
  'Bcl-2 was discovered at the t(14;18) translocation in follicular lymphoma. Venetoclax (Bcl-2 inhibitor) is FDA-approved for CLL and AML. The balance between pro- and anti-apoptotic Bcl-2 family members determines cell fate.',
  ARRAY['B-cell lymphoma 2', 'Bcl-2 family', 'BCL2']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cytokine',
  'サイトカイン',
  'Inter-service API calls / microservice communication protocol: small secreted proteins that enable immune cells to communicate remotely, coordinating distributed immune responses — like RESTful API calls between microservices in a distributed system.',
  'A broad category of small secreted proteins (~5-20 kDa) produced by various cell types that mediate and regulate immunity, inflammation, and hematopoiesis through autocrine, paracrine, or endocrine signaling. Major families include interleukins (IL), interferons (IFN), tumor necrosis factors (TNF), chemokines, and colony-stimulating factors (CSF). Act through specific cell-surface receptors.',
  'Cytokine storm (hypercytokinemia) is a life-threatening complication of severe infections (COVID-19), CAR-T therapy, and autoimmune conditions. Anti-cytokine therapies (anti-TNF, anti-IL-6, anti-IL-17) are mainstays of autoimmune disease treatment.',
  ARRAY['cytokines', 'interleukin', 'interferon', 'chemokine']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'growth factor',
  '成長因子',
  'Scale-up signal / horizontal scaling request: secreted proteins that instruct cells to grow and divide — like an auto-scaling trigger that commands new instances to be provisioned in response to demand.',
  'A naturally occurring substance, usually a protein or steroid hormone, capable of stimulating cell growth, proliferation, healing, and differentiation. Growth factors bind to specific receptors (often RTKs) to activate intracellular signaling cascades (Ras-MAPK, PI3K-Akt). Major examples include EGF, PDGF, FGF, VEGF, IGF, and NGF.',
  'Growth factor signaling is dysregulated in cancer (autocrine loops, receptor amplification). Anti-VEGF therapies (bevacizumab) and anti-EGFR therapies (cetuximab, erlotinib) are FDA-approved. Recombinant growth factors are used therapeutically (EPO, G-CSF).',
  ARRAY['growth factors', 'mitogen', 'GF']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'hormone',
  'ホルモン',
  'Global configuration broadcast / cluster-wide environment variable: chemical messengers secreted into the bloodstream that configure distant target cells — like a centralized configuration service that pushes settings to remote nodes across the entire system.',
  'A chemical messenger produced by endocrine glands (or specialized cells) and secreted into the bloodstream to act on distant target cells bearing specific receptors. Classes include peptide hormones (insulin, growth hormone), steroid hormones (cortisol, estrogen, testosterone), and amino acid derivatives (thyroid hormones, epinephrine). Regulate metabolism, growth, reproduction, and homeostasis.',
  'Central to endocrinology and physiology. Hormone replacement therapy, oral contraceptives, and hormone-targeting cancer therapies (tamoxifen, aromatase inhibitors) are major pharmacological applications. Endocrine disruptors are an environmental health concern.',
  ARRAY['hormones', 'endocrine signal']
) ON CONFLICT DO NOTHING;
