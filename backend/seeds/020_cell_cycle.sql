-- =============================================================================
-- 020_cell_cycle.sql
-- BioLexicon seed data: Cell Cycle & Cell Division
-- Domain: Cell Biology / Cell Cycle Regulation
-- Terms: 30
-- =============================================================================

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cell cycle',
  '細胞周期',
  'Application lifecycle with defined states: the cell progresses through a finite state machine (G1 → S → G2 → M) with checkpoint validators at each transition, ensuring data integrity before proceeding.',
  'The ordered series of events by which a cell duplicates its contents and divides into two daughter cells. Consists of interphase (G1, S, G2 phases) and M phase (mitosis and cytokinesis). Regulated by cyclin-CDK complexes and checkpoint mechanisms.',
  'Fundamental to all biology. Dysregulation is a hallmark of cancer. Key research area for Nobel Prize-winning work by Leland Hartwell, Tim Hunt, and Paul Nurse (2001).',
  ARRAY['cell division cycle']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'interphase',
  '間期',
  'Development sprint between releases: the longest phase where the cell actively codes (replicates DNA), builds features (grows), and runs QA checks before the next deployment (division).',
  'The period of the cell cycle between successive mitotic divisions, comprising G1 (growth/gap 1), S (DNA synthesis), and G2 (growth/gap 2) phases. During interphase, the cell grows, replicates its DNA, and prepares for mitosis. Occupies approximately 90-95% of the total cell cycle time.',
  'Often misconceived as a "resting" phase, interphase is metabolically the most active period. Central to understanding cell proliferation kinetics in cancer research.',
  ARRAY['interkinesis']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'g1 phase',
  'G1期',
  'Sprint planning + environment setup: the cell evaluates requirements (growth signals), provisions resources (increases organelles, RNA, proteins), and decides whether to commit to the next release cycle or enter standby (G0).',
  'The first gap phase of the cell cycle following mitosis and preceding S phase. The cell increases in size, synthesizes RNA and proteins, and assesses environmental conditions. Contains the restriction point, beyond which the cell commits to DNA replication independent of mitogenic signals.',
  'Critical decision point in cell cycle biology. Targeted by Rb and p53 tumor suppressors. Most cells in the body are in G1 or the quiescent G0 state.',
  ARRAY['gap 1', 'G1', 'g1']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  's phase',
  'S期',
  'Git clone / full codebase replication: the cell creates a complete copy of every chromosome (repository), verifying checksums (DNA damage repair) throughout the process to ensure zero data corruption.',
  'The synthesis phase of the cell cycle during which the entire nuclear genome is replicated exactly once. Each chromosome is duplicated to form two sister chromatids joined at the centromere. Duration is typically 6-8 hours in mammalian cells.',
  'Central to DNA replication studies. Labeled by BrdU or EdU incorporation assays. Errors during S phase can lead to mutations and genomic instability.',
  ARRAY['synthesis phase', 'S', 'DNA synthesis phase']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'g2 phase',
  'G2期',
  'Pre-deployment testing / staging environment: the cell runs integration tests (DNA damage checks), ensures all replicated data is intact, and stages the mitotic machinery before going live with division.',
  'The second gap phase between the completion of DNA synthesis (S phase) and the onset of mitosis. The cell continues to grow, synthesizes proteins required for mitosis (e.g., tubulin, cyclin B), and verifies the integrity of replicated DNA via the G2/M checkpoint.',
  'Contains the G2/M DNA damage checkpoint. Relevant to cancer therapy as many DNA-damaging agents arrest cells in G2. Duration is typically 2-5 hours in mammalian cells.',
  ARRAY['gap 2', 'G2', 'g2']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'mitosis',
  '有糸分裂',
  'Production deployment with zero downtime: the cell distributes identical copies of its codebase (chromosomes) to two new server instances (daughter cells) through a precisely orchestrated sequence of stages.',
  'A type of cell division in which a eukaryotic cell separates duplicated chromosomes into two identical sets, producing two genetically identical daughter nuclei. Proceeds through prophase, prometaphase, metaphase, anaphase, and telophase, followed by cytokinesis.',
  'Fundamental process in growth, development, and tissue repair. Errors in mitosis lead to aneuploidy, a hallmark of cancer. First described by Walther Flemming in the 1880s.',
  ARRAY['mitotic division', 'M phase']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'meiosis',
  '減数分裂',
  'Fork + diverge strategy for genetic diversity: two rounds of division that shuffle the codebase (crossing over) and halve the chromosome count, producing four unique branch variants (gametes) from one parent commit.',
  'A specialized cell division that produces four haploid gametes from one diploid cell through two successive divisions (meiosis I and II). Meiosis I is reductional (homologs separate); meiosis II is equational (sister chromatids separate). Includes genetic recombination via crossing over.',
  'Essential for sexual reproduction. Errors cause aneuploidy (e.g., Down syndrome from trisomy 21). Central to genetics and evolutionary biology.',
  ARRAY['meiotic division', 'reduction division']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cytokinesis',
  '細胞質分裂',
  'Server partitioning / VM split: the physical separation of one running instance into two independent instances, each with their own allocated resources (organelles, cytoplasm).',
  'The physical division of the cytoplasm following nuclear division (karyokinesis), resulting in two separate daughter cells. In animal cells, a contractile ring of actin and myosin pinches the cell (cleavage furrow). In plant cells, a cell plate forms from vesicles at the center.',
  'Final step of cell division. Failure of cytokinesis produces binucleate or multinucleate cells. Studied in developmental biology and cancer (cytokinesis failure can lead to tetraploidy).',
  ARRAY['cell cleavage']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'prophase',
  '前期',
  'Build preparation: chromatin condenses into visible chromosomes (code compilation), the nucleolus disappears (dev server shuts down), and centrosomes migrate to opposite poles (setting up the deployment pipeline).',
  'The first stage of mitosis in which chromatin condenses into discrete chromosomes, each consisting of two sister chromatids. The mitotic spindle begins to form, centrosomes migrate toward opposite poles, and the nucleolus disassembles.',
  'Identified by condensed chromosomes visible under light microscopy. Prophase I of meiosis includes synapsis and crossing over between homologous chromosomes.',
  ARRAY['prophase I', 'prophase II']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'metaphase',
  '中期',
  'Load balancer alignment check: all chromosomes (job payloads) are lined up at the equatorial plate (queue), and the spindle assembly checkpoint verifies that every payload is properly attached before triggering distribution.',
  'The stage of mitosis in which condensed chromosomes align at the metaphase plate (cell equator), with kinetochores of sister chromatids attached to spindle microtubules from opposite poles (bi-orientation). The spindle assembly checkpoint must be satisfied before anaphase onset.',
  'Optimal stage for karyotyping (chromosomes are maximally condensed). Colchicine arrests cells in metaphase by disrupting microtubules, used in cytogenetic analysis.',
  ARRAY['metaphase plate', 'metaphase I', 'metaphase II']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'anaphase',
  '後期',
  'Parallel deployment / data distribution: sister chromatids are simultaneously pulled apart (like sharding a database), with motor proteins transporting each copy to its designated server node (pole).',
  'The stage of mitosis in which sister chromatids separate and move toward opposite spindle poles. Anaphase A involves kinetochore microtubule shortening pulling chromatids poleward; anaphase B involves spindle elongation pushing poles apart. Initiated by APC/C-mediated degradation of securin.',
  'The shortest phase of mitosis. Errors (e.g., lagging chromosomes) lead to aneuploidy. Anaphase I of meiosis separates homologous chromosomes rather than sister chromatids.',
  ARRAY['anaphase A', 'anaphase B', 'anaphase I', 'anaphase II']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'telophase',
  '終期',
  'Post-deployment cleanup: nuclear envelopes reassemble around each chromosome set (new firewalls go up), chromosomes decondense (code is extracted back to working files), and the nucleolus reboots.',
  'The final stage of mitosis in which chromosomes arrive at the poles and decondense, the nuclear envelope reassembles around each set of chromosomes, nucleoli reappear, and the mitotic spindle disassembles. Typically overlaps with cytokinesis.',
  'Marks the transition from M phase back to interphase. Often studied together with cytokinesis as the completion of cell division.',
  ARRAY['telophase I', 'telophase II']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cyclin',
  'サイクリン',
  'Cron job scheduler: cyclically synthesized and degraded proteins that activate CDK partners at precise times, driving cell cycle phase transitions like scheduled task triggers.',
  'A family of regulatory proteins whose concentrations oscillate during the cell cycle, activating cyclin-dependent kinases (CDKs) to drive cell cycle progression. Types include D-type cyclins (G1), cyclin E (G1/S), cyclin A (S/M), and cyclin B (M phase). Degraded by ubiquitin-mediated proteolysis.',
  'Discovery of cyclins by Tim Hunt (Nobel Prize 2001) was foundational for cell cycle biology. Cyclin D overexpression and CDK4/6 are therapeutic targets in breast cancer (palbociclib).',
  ARRAY['cyclins', 'cyclin A', 'cyclin B', 'cyclin D', 'cyclin E']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cdk',
  'サイクリン依存性キナーゼ',
  'State machine transition executor: a kinase engine that only fires when its cyclin key is inserted, phosphorylating target substrates to trigger irreversible state transitions in the cell cycle.',
  'A family of serine/threonine protein kinases (CDK1, CDK2, CDK4, CDK6, etc.) that require binding of a cyclin regulatory subunit for activation. Phosphorylate key substrates to drive cell cycle transitions. Activity is further regulated by CDK inhibitors (CKIs) and activating/inhibitory phosphorylation.',
  'CDK4/6 inhibitors (palbociclib, ribociclib, abemaciclib) are FDA-approved for HR+/HER2- breast cancer. Paul Nurse received the 2001 Nobel Prize for CDK discovery.',
  ARRAY['cyclin-dependent kinase', 'CDK1', 'CDK2', 'CDK4', 'CDK6']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'checkpoint',
  'チェックポイント',
  'CI/CD quality gate: a validation step in the pipeline that halts progression if tests fail (DNA damage, misaligned chromosomes), preventing buggy releases (defective daughter cells) from going to production.',
  'A regulatory mechanism in the cell cycle that monitors the completion of critical events and halts cycle progression if conditions are not met. Major checkpoints include the G1/S (restriction point), G2/M (DNA damage), and spindle assembly checkpoint (SAC) at the metaphase-to-anaphase transition.',
  'Checkpoint defects are hallmarks of cancer. ATM/ATR kinases are key checkpoint sensors. Targeted by checkpoint inhibitors in cancer therapy (e.g., Chk1/Chk2 inhibitors).',
  ARRAY['cell cycle checkpoint', 'checkpoints']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'spindle assembly checkpoint',
  '紡錘体集合チェックポイント',
  'Distributed consensus validator: like a Raft/Paxos protocol, every kinetochore must report "attached and bi-oriented" before the system achieves consensus and triggers anaphase; a single dissenting node blocks the transition.',
  'A surveillance mechanism that delays anaphase onset until all kinetochores are properly attached to spindle microtubules with bi-orientation. Unattached kinetochores catalyze formation of the mitotic checkpoint complex (MCC), which inhibits APC/C-Cdc20, preventing securin degradation and sister chromatid separation.',
  'Critical for maintaining chromosome number fidelity. SAC weakening contributes to chromosomal instability (CIN) in cancer. Components include Mad1, Mad2, BubR1, Bub3, and Mps1.',
  ARRAY['SAC', 'mitotic checkpoint', 'spindle checkpoint']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'p53',
  'p53',
  'System watchdog / chaos monkey supervisor: monitors for data corruption (DNA damage), and upon detection either halts the process for repair (cell cycle arrest) or initiates graceful shutdown (apoptosis) to prevent cascading failures.',
  'A tumor suppressor transcription factor (TP53 gene, 393 amino acids) that responds to cellular stress signals (DNA damage, oncogene activation, hypoxia) by inducing cell cycle arrest (via p21), DNA repair, senescence, or apoptosis. Mutated or inactivated in over 50% of human cancers.',
  'Known as the "guardian of the genome." Most frequently mutated gene in human cancers. Li-Fraumeni syndrome results from germline TP53 mutations. Extensive research target in oncology.',
  ARRAY['TP53', 'tumor protein p53', 'guardian of the genome']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'rb protein',
  'Rbタンパク質',
  'Feature flag / deployment gate controller: in its active (hypophosphorylated) state, Rb locks the E2F release valve, blocking S-phase genes. Cyclin-CDK phosphorylation flips the flag, opening the gate to DNA replication.',
  'The retinoblastoma protein (pRb, 928 amino acids, encoded by the RB1 gene), a tumor suppressor that regulates the G1/S transition by binding and inhibiting E2F transcription factors. Hypophosphorylated pRb sequesters E2F; sequential phosphorylation by cyclin D-CDK4/6 and cyclin E-CDK2 releases E2F to activate S-phase genes.',
  'First tumor suppressor identified (retinoblastoma). Inactivated in many cancers. CDK4/6 inhibitors work by maintaining Rb in its active, hypophosphorylated state.',
  ARRAY['pRb', 'retinoblastoma protein', 'RB1']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'apc/c',
  'APC/C',
  'Garbage collection trigger / batch delete scheduler: a ubiquitin ligase complex that tags specific cell cycle proteins (securin, cyclins) for destruction by the proteasome, enabling irreversible phase transitions like anaphase.',
  'The Anaphase-Promoting Complex/Cyclosome, a multi-subunit E3 ubiquitin ligase that polyubiquitinates key cell cycle regulators for proteasomal degradation. APC/C-Cdc20 triggers anaphase by degrading securin and cyclin B. APC/C-Cdh1 maintains G1 state by degrading mitotic cyclins.',
  'Essential for mitotic exit and G1 maintenance. Regulated by the spindle assembly checkpoint. Target of ongoing drug development in cancer research.',
  ARRAY['anaphase-promoting complex', 'cyclosome', 'APC']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'securin',
  'セキュリン',
  'Mutex lock on chromosome separation: securin holds the separase enzyme in a locked state, preventing premature sister chromatid separation. APC/C-mediated destruction of securin releases the lock, allowing anaphase.',
  'An inhibitory chaperone protein that binds and inhibits the protease separase, preventing premature cleavage of cohesin complexes holding sister chromatids together. Degraded by APC/C-Cdc20 upon satisfaction of the spindle assembly checkpoint, releasing active separase to trigger anaphase.',
  'Overexpression of securin (PTTG1) is observed in many tumors and correlates with chromosomal instability. Identified in yeast as Pds1.',
  ARRAY['PTTG1', 'pituitary tumor-transforming gene 1']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'separase',
  'セパラーゼ',
  'Atomic operation executor: once unlocked (securin degraded), separase cleaves the cohesin bonds in a single irreversible cut, like executing a database transaction commit that cannot be rolled back.',
  'A cysteine protease (also classified as a CD clan endopeptidase) that cleaves the Scc1/Rad21 subunit of the cohesin complex upon activation, allowing sister chromatid separation at anaphase onset. Kept inactive during metaphase by binding to securin and by CDK1-mediated inhibitory phosphorylation.',
  'Essential for faithful chromosome segregation. Premature separase activation leads to precocious sister chromatid separation and aneuploidy.',
  ARRAY['separin', 'ESP1']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cohesin',
  'コヒーシン',
  'Distributed lock / resource binding: a ring-shaped protein complex that physically holds sister chromatids together (like a database row lock), ensuring they stay paired until the transaction (anaphase) is committed.',
  'A multi-subunit ring-shaped protein complex (SMC1, SMC3, Scc1/Rad21, Scc3/SA) that topologically entraps sister chromatids from S phase until anaphase, ensuring proper bi-orientation on the mitotic spindle. Also functions in DNA repair, gene regulation, and chromatin organization.',
  'Mutations in cohesin subunits cause cohesinopathies (e.g., Cornelia de Lange syndrome). Also implicated in cancer as a tumor suppressor. Important for 3D genome organization (TADs).',
  ARRAY['cohesin complex', 'SMC1', 'SMC3', 'Rad21']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'condensin',
  'コンデンシン',
  'Code minifier / compressor: compacts the sprawling chromatin codebase into tightly condensed chromosome packages for efficient transport during deployment (mitosis), reducing the data footprint dramatically.',
  'An SMC protein complex (condensin I and condensin II) that compacts chromatin into mitotic chromosomes through ATP-dependent loop extrusion. Condensin II acts in prophase within the nucleus; condensin I acts after nuclear envelope breakdown. Essential for chromosome resolution and segregation.',
  'Key to understanding mitotic chromosome structure. Studied via Hi-C and microscopy. Also functions in interphase gene regulation and DNA repair.',
  ARRAY['condensin complex', 'condensin I', 'condensin II']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'aurora kinase',
  'オーロラキナーゼ',
  'DevOps orchestration controllers: Aurora A manages spindle assembly (infrastructure provisioning), Aurora B monitors kinetochore attachments (health checks) and corrects errors, Aurora C specializes in meiotic division.',
  'A family of serine/threonine kinases (Aurora A, B, C) that regulate mitotic and meiotic events. Aurora A localizes to centrosomes and regulates spindle assembly. Aurora B (chromosomal passenger complex) monitors and corrects kinetochore-microtubule attachments and regulates cytokinesis. Aurora C functions in meiosis.',
  'Overexpressed in many cancers. Aurora kinase inhibitors (e.g., alisertib, barasertib) are in clinical trials as anti-cancer agents.',
  ARRAY['aurora kinases', 'aurora A', 'aurora B', 'aurora C', 'AurA', 'AurB']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'polo-like kinase',
  'Polo様キナーゼ',
  'Release manager / deployment coordinator: PLK1 orchestrates multiple mitotic milestones — centrosome maturation (infrastructure scaling), spindle formation (pipeline setup), and cytokinesis initiation (post-deploy cleanup).',
  'A family of serine/threonine kinases (PLK1-5) with polo-box domains that mediate substrate recognition. PLK1 is the primary mitotic kinase, promoting centrosome maturation, mitotic entry, spindle assembly, APC/C activation, and cytokinesis. Recognizes primed phospho-substrates via its polo-box domain.',
  'PLK1 is overexpressed in many cancers and is a therapeutic target (volasertib). Originally identified in Drosophila polo mutants.',
  ARRAY['PLK', 'PLK1', 'polo kinase']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cdc25',
  'CDC25',
  'Circuit breaker reset switch: removes inhibitory phosphates from CDK (resets the breaker), rapidly activating the CDK engine for mitotic entry through a positive feedback amplification loop.',
  'A family of dual-specificity phosphatases (CDC25A, B, C) that activate cyclin-CDK complexes by removing inhibitory phosphorylation on CDK threonine-14 and tyrosine-15 residues. CDC25 and CDK form a bistable positive feedback loop driving abrupt cell cycle transitions. Inhibited by checkpoint kinases Chk1/Chk2.',
  'Key to understanding the switch-like nature of cell cycle transitions. CDC25A is an oncogene overexpressed in some cancers. Checkpoint-mediated degradation of CDC25 is critical for DNA damage response.',
  ARRAY['CDC25A', 'CDC25B', 'CDC25C', 'cell division cycle 25']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'wee1',
  'Wee1',
  'Rate limiter / throttle: adds inhibitory phosphorylation to CDK1 (applies the brakes), preventing premature mitotic entry. Acts as the counterbalance to CDC25, maintaining the CDK1 bistable switch in the OFF state.',
  'A nuclear tyrosine kinase that phosphorylates CDK1 on tyrosine-15, inhibiting its activity and preventing premature entry into mitosis. Forms a double-negative feedback loop with CDC25, creating a bistable switch for mitotic commitment. Degraded at the G2/M transition.',
  'Named from the small cell size phenotype in fission yeast wee1 mutants (Paul Nurse). WEE1 inhibitors (e.g., adavosertib) are in clinical trials for cancer therapy, exploiting synthetic lethality in p53-deficient tumors.',
  ARRAY['WEE1 kinase', 'Wee1 kinase']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'dna damage checkpoint',
  'DNA損傷チェックポイント',
  'Automated rollback trigger: when data corruption (DNA damage) is detected, sensor kinases (ATM/ATR) halt the pipeline, activate repair services, and if damage is irreparable, trigger graceful shutdown (apoptosis) instead of deploying corrupted code.',
  'A signal transduction pathway activated by DNA lesions that arrests the cell cycle to allow time for repair. Sensor kinases ATM (double-strand breaks) and ATR (replication stress, ssDNA) activate effector kinases Chk2 and Chk1, respectively, which inhibit CDC25 phosphatases and stabilize p53.',
  'Central to genome stability and cancer biology. Exploited therapeutically via synthetic lethality (e.g., PARP inhibitors in BRCA-deficient cancers). ATM mutations cause ataxia-telangiectasia.',
  ARRAY['DNA damage response', 'DDR', 'ATM/ATR checkpoint']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'restriction point',
  '制限点',
  'Point of no return in a deployment pipeline: once the cell passes this gate in late G1, it is committed to S phase regardless of external growth signals — like a CI/CD pipeline past the approval stage that runs to completion autonomously.',
  'A point in late G1 phase (approximately 2-3 hours before S phase in mammalian cells) beyond which the cell no longer requires mitogenic signaling to progress through the remainder of the cell cycle. Molecularly defined by Rb hyperphosphorylation and E2F release. Identified by Arthur Pardee in 1974.',
  'Equivalent to "Start" in yeast. Loss of restriction point control is a feature of virtually all cancer cells. Key concept linking growth factor signaling to cell cycle commitment.',
  ARRAY['R point', 'Pardee point', 'Start (yeast)']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'apoptosis',
  'アポトーシス',
  'Graceful shutdown / controlled process termination: the cell executes an orderly self-destruct sequence — backing up useful components (apoptotic bodies for recycling), closing connections cleanly, and freeing resources without causing collateral damage (unlike necrosis = kernel panic).',
  'Programmed cell death characterized by cell shrinkage, chromatin condensation, DNA fragmentation, membrane blebbing, and formation of apoptotic bodies. Executed via intrinsic (mitochondrial) and extrinsic (death receptor) pathways, both converging on caspase activation. Essential for development, homeostasis, and immune function.',
  'Coined by Kerr, Wyllie, and Currie (1972). Dysregulation is central to cancer (evasion of apoptosis) and neurodegenerative diseases (excessive apoptosis). Bcl-2 family and caspases are key regulators. Sydney Brenner, H. Robert Horvitz, and John Sulston received the 2002 Nobel Prize for apoptosis research.',
  ARRAY['programmed cell death', 'PCD', 'cell suicide']
) ON CONFLICT DO NOTHING;
