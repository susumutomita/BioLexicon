-- =============================================================================
-- 010_cell_structure.sql
-- BioLexicon seed data: Cell Structure & Organelles
-- Domain: Cell Biology / Structural Biology
-- Terms: 25
--
-- NOTE: ON CONFLICT DO NOTHING requires a UNIQUE constraint on terms(name).
--       Add one via: ALTER TABLE terms ADD CONSTRAINT terms_name_unique UNIQUE (name);
-- =============================================================================

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cell membrane',
  '細胞膜',
  'Firewall + load balancer: inspects every packet (molecule) and enforces allow/deny rules via selective permeability, while balancing import/export traffic across the cell boundary.',
  'A semipermeable lipid bilayer composed primarily of phospholipids, cholesterol, and integral/peripheral proteins that encloses the cytoplasm of a cell, maintaining electrochemical gradients and mediating selective transport of ions and molecules.',
  'Ubiquitous in cell biology textbooks as the fundamental boundary of all living cells. Central topic in membrane biology, pharmacology (drug delivery), and electrophysiology (action potentials).',
  ARRAY['plasma membrane', 'plasmalemma', 'cytoplasmic membrane']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cytoplasm',
  '細胞質',
  'Runtime environment / heap memory: the shared execution space where all cellular processes run, containing dissolved resources (variables) and organelles (running services).',
  'The entirety of the material within a cell enclosed by the plasma membrane, excluding the nucleus in eukaryotes. It comprises the cytosol (aqueous phase), organelles, and the cytoskeleton.',
  'Fundamental concept in cell biology. All metabolic reactions in prokaryotes occur in the cytoplasm. In eukaryotes, the cytoplasm is the site of glycolysis and many biosynthetic pathways.',
  ARRAY['protoplasm', 'cell substance']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'nucleus',
  '核',
  'Version-controlled repository server: stores the master codebase (genome) in a secure, access-controlled vault, dispatching read-only mRNA copies to the build system (ribosomes).',
  'A membrane-bound organelle found in eukaryotic cells that contains the majority of the cell''s genetic material organized as chromosomes. It is the site of DNA replication and transcription.',
  'Defining feature of eukaryotic cells. Central to genetics, gene expression studies, and nuclear biology. Described in virtually every molecular biology textbook.',
  ARRAY['cell nucleus']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'ribosome',
  'リボソーム',
  'Compiler/interpreter: reads mRNA source code and translates it into executable protein (machine code), one codon (instruction) at a time on the assembly line.',
  'A macromolecular machine composed of ribosomal RNA (rRNA) and proteins that catalyzes the translation of messenger RNA into polypeptide chains. Eukaryotic ribosomes (80S) consist of 40S and 60S subunits; prokaryotic ribosomes (70S) consist of 30S and 50S subunits.',
  'Central to the central dogma of molecular biology. Key target of many antibiotics (e.g., tetracycline, chloramphenicol). Studied extensively in structural biology via cryo-EM and X-ray crystallography.',
  ARRAY['70S ribosome', '80S ribosome']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'mitochondria',
  'ミトコンドリア',
  'Power plant / containerized microservice with its own codebase: generates ATP (electricity) via oxidative phosphorylation, runs its own circular DNA (separate git repo), and was historically an acquired startup (endosymbiosis).',
  'A double-membrane-bound organelle found in most eukaryotic cells responsible for aerobic respiration and ATP production via the electron transport chain and oxidative phosphorylation. Contains its own circular genome encoding 13 proteins, 22 tRNAs, and 2 rRNAs in humans.',
  'Central to bioenergetics and metabolic disease research. Implicated in aging, neurodegenerative diseases, and cancer metabolism (Warburg effect). Key evidence for the endosymbiotic theory (Lynn Margulis, 1967).',
  ARRAY['mitochondrion']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'endoplasmic reticulum',
  '小胞体',
  'Factory assembly line + CI/CD pipeline: rough ER compiles and packages proteins (like a build server with ribosome workers attached), while smooth ER handles lipid synthesis and detox (utility services).',
  'An extensive membrane-bound organelle in eukaryotic cells forming a network of tubules and cisternae. Rough ER (studded with ribosomes) is involved in protein synthesis and folding; smooth ER participates in lipid synthesis, carbohydrate metabolism, and detoxification.',
  'Major topic in protein trafficking and secretory pathway studies. Relevant to the unfolded protein response (UPR) and ER stress in disease contexts such as diabetes and neurodegeneration.',
  ARRAY['ER', 'rough ER', 'smooth ER', 'rough endoplasmic reticulum', 'smooth endoplasmic reticulum']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'golgi apparatus',
  'ゴルジ体',
  'Post-processing + shipping center: receives raw builds from the ER, applies final modifications (glycosylation = metadata tagging), sorts packages by destination address, and dispatches them via vesicle containers.',
  'A membrane-bound organelle consisting of a series of flattened, stacked cisternae (cis, medial, trans) that modifies, sorts, and packages proteins and lipids received from the endoplasmic reticulum for secretion, delivery to other organelles, or insertion into the plasma membrane.',
  'Essential for the secretory pathway. Studied in the context of protein glycosylation, membrane trafficking, and Golgi-associated diseases (e.g., congenital disorders of glycosylation).',
  ARRAY['golgi complex', 'golgi body', 'golgi']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'lysosome',
  'リソソーム',
  'Garbage collector + recycling daemon: breaks down deprecated objects (worn-out organelles, engulfed pathogens) using hydrolytic enzymes (destructors) at acidic pH, reclaiming memory (monomers) for reuse.',
  'A membrane-bound organelle containing hydrolytic enzymes (acid hydrolases) that operate at an optimal pH of ~4.5-5.0. Responsible for intracellular digestion of macromolecules via autophagy, endocytosis, and phagocytosis.',
  'Central to autophagy research (Yoshinori Ohsumi, Nobel Prize 2016). Relevant to lysosomal storage diseases (e.g., Tay-Sachs, Gaucher disease) and emerging roles in nutrient sensing via mTORC1 signaling.',
  ARRAY['lysosomes']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cytoskeleton',
  '細胞骨格',
  'Application framework / scaffolding: provides structural support (like a web framework skeleton), enables internal transport (message buses along tracks), and reconfigures dynamically (hot module replacement) for cell shape changes and division.',
  'A dynamic network of protein filaments within the cytoplasm of eukaryotic cells, comprising microfilaments (actin), intermediate filaments, and microtubules. Provides structural support, facilitates intracellular transport, and enables cell motility and division.',
  'Fundamental to cell biology, studied in the context of cell migration, wound healing, and cancer metastasis. Key research area in biophysics and mechanobiology.',
  ARRAY['cell skeleton']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'microtubule',
  '微小管',
  'Railway track system: rigid hollow tubes that serve as tracks for motor protein locomotives (kinesin, dynein), transporting cargo containers (vesicles) across the cell and forming the mitotic spindle (switchyard) during division.',
  'Hollow cylindrical polymers composed of alpha- and beta-tubulin heterodimers, approximately 25 nm in diameter, exhibiting dynamic instability. They form the mitotic spindle, contribute to intracellular transport, and constitute the core of cilia and flagella.',
  'Key topic in cell division, intracellular transport, and pharmacology (taxol and vinca alkaloids target microtubules as anti-cancer drugs). Studied extensively in structural biology.',
  ARRAY['microtubules', 'MT']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'actin',
  'アクチン',
  'Elastic mesh network / dynamic load-bearing cables: thin, flexible filaments that form a reconfigurable mesh under the membrane (like CSS flexbox), enabling shape changes, migration, and muscle-like contraction.',
  'A globular protein (G-actin, ~42 kDa) that polymerizes into filamentous actin (F-actin) forming microfilaments approximately 7 nm in diameter. Essential for cell motility, cytokinesis, and maintenance of cell shape. Interacts with myosin to generate contractile forces.',
  'One of the most abundant and conserved proteins in eukaryotes. Central to studies of cell migration, cytokinesis, and muscle physiology. Target of cytochalasin and phalloidin in research.',
  ARRAY['actin filament', 'microfilament', 'F-actin', 'G-actin']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'vesicle',
  '小胞',
  'Container / Docker container for molecular cargo: a self-contained lipid-wrapped package that transports proteins and lipids between organelle services, enabling decoupled inter-service communication.',
  'A small, spherical, membrane-enclosed sac (50-500 nm diameter) that transports molecules between organelles or between the cell and its environment. Types include transport vesicles, secretory vesicles, and endocytic vesicles.',
  'Central to membrane trafficking, exocytosis, and endocytosis studies. Relevant to neuroscience (synaptic vesicles), immunology (exosomes), and drug delivery (liposomes). James Rothman, Randy Schekman, and Thomas Sudhof received the 2013 Nobel Prize for vesicle trafficking discoveries.',
  ARRAY['vesicles', 'membrane vesicle']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'plasma membrane',
  '形質膜',
  'API gateway: the outermost interface of the cell, exposing receptor endpoints to the external environment, authenticating signals, and routing approved requests to internal handlers.',
  'The outer boundary of a cell, composed of a phospholipid bilayer with embedded proteins, glycoproteins, and cholesterol. Functionally identical to the cell membrane; the term emphasizes its position at the cell surface.',
  'Used interchangeably with cell membrane in most literature, though "plasma membrane" specifically emphasizes the outer boundary. Central to receptor biology and signal transduction studies.',
  ARRAY['cell membrane', 'plasmalemma', 'cytoplasmic membrane']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'nuclear envelope',
  '核膜',
  'DMZ (demilitarized zone) with controlled gateways: a double-firewall barrier separating the secure genome zone from the cytoplasmic network, with nuclear pore complexes acting as strict API gateways.',
  'A double-membrane structure enclosing the nucleus in eukaryotic cells, consisting of an outer nuclear membrane (continuous with the ER) and an inner nuclear membrane, separated by a perinuclear space. Perforated by nuclear pore complexes that regulate nucleocytoplasmic transport.',
  'Key topic in nuclear biology and cell division (envelope breakdown during mitosis). Relevant to laminopathies and studies of nuclear import/export (Ran GTPase cycle).',
  ARRAY['nuclear membrane', 'karyotheca']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'nucleolus',
  '核小体',
  'Ribosome build server / CI factory: the dedicated facility inside the nucleus that mass-produces ribosomal subunit components (rRNA + proteins), the cell''s most critical compilation hardware.',
  'A dense, non-membrane-bound structure within the nucleus where ribosomal RNA (rRNA) genes are transcribed by RNA polymerase I and ribosomal subunits are partially assembled. Typically organized around nucleolar organizer regions (NORs) containing tandem rDNA repeats.',
  'Important marker in cytology and cancer diagnostics (nucleolar size correlates with proliferative activity). Also studied as a stress sensor and in the context of nucleolar phase separation.',
  ARRAY['nucleoli']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'peroxisome',
  'ペルオキシソーム',
  'Sandboxed hazmat processing unit: isolates dangerous oxidation reactions (like running untrusted code in a sandbox), using catalase to neutralize toxic H2O2 byproducts before they damage the system.',
  'A single-membrane-bound organelle containing oxidative enzymes (e.g., catalase, D-amino acid oxidase, urate oxidase) that decompose hydrogen peroxide and participate in fatty acid beta-oxidation (very long chain), bile acid synthesis, and plasmalogen biosynthesis.',
  'Relevant to peroxisomal biogenesis disorders (e.g., Zellweger syndrome). Increasingly studied for roles in redox signaling and lipid metabolism. Named by Christian de Duve.',
  ARRAY['peroxisomes', 'microbody']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'centrosome',
  '中心体',
  'Orchestrator / Kubernetes control plane for cell division: organizes and dispatches microtubule workers to form the spindle cluster, ensuring chromosomes are distributed to the correct nodes.',
  'The primary microtubule-organizing center (MTOC) in animal cells, consisting of two centrioles surrounded by pericentriolar material (PCM). Nucleates and anchors microtubules, and duplicates once per cell cycle to form the two poles of the mitotic spindle.',
  'Central to cell division and centrosome biology. Centrosome amplification is a hallmark of many cancers. Also relevant to ciliopathies since the mother centriole templates the basal body.',
  ARRAY['centrosomes', 'MTOC', 'microtubule organizing center']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'centriole',
  '中心小体',
  'Core router in the data center: a pair of precisely structured cylindrical hardware units that anchor the centrosome hub and template the construction of cilia/flagella antennae.',
  'A cylindrical organelle composed of nine triplets of microtubules arranged in a pinwheel pattern (9+0 arrangement). Found in pairs within the centrosome of most animal cells. The mother centriole can function as a basal body to nucleate cilia and flagella.',
  'Studied in the context of centriole duplication, ciliogenesis, and centrosome biology. Relevant to ciliopathies and cancer (supernumerary centrioles).',
  ARRAY['centrioles']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'flagellum',
  '鞭毛',
  'Outboard motor / propulsion thruster: a rotating or whipping propulsion system that drives the cell through liquid media, powered by molecular motors (like a boat''s outboard engine).',
  'A long, whip-like appendage used for cell locomotion. Eukaryotic flagella contain a 9+2 microtubule axoneme powered by dynein motors; prokaryotic flagella are structurally distinct, composed of flagellin and driven by a rotary motor at the base.',
  'Key topic in microbiology (bacterial motility and chemotaxis), reproductive biology (sperm motility), and evolutionary biology (endosymbiotic origin of eukaryotic flagella).',
  ARRAY['flagella']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cilia',
  '繊毛',
  'Sensor array + ventilation fans: short antenna-like protrusions that either sense environmental signals (primary cilia = IoT sensors) or beat rhythmically to move fluid across surfaces (motile cilia = cooling fans).',
  'Short, hair-like organelles projecting from the cell surface. Motile cilia (9+2 axoneme) beat in coordinated waves to move fluid or mucus. Primary cilia (9+0 axoneme) are non-motile, solitary sensory organelles involved in signal transduction (e.g., Hedgehog pathway).',
  'Central to ciliopathies (e.g., polycystic kidney disease, Bardet-Biedl syndrome). Respiratory cilia clear mucus from airways. Primary cilia are signaling hubs studied in developmental biology.',
  ARRAY['cilium', 'motile cilia', 'primary cilium']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cell wall',
  '細胞壁',
  'Hardened container / infrastructure cage: a rigid external shell around the cell (like a server rack enclosure) that prevents physical damage and osmotic burst, while the membrane inside handles logical access control.',
  'A rigid structural layer surrounding the plasma membrane in plants (cellulose), fungi (chitin), and bacteria (peptidoglycan). Provides mechanical strength, maintains cell shape, and prevents osmotic lysis. Absent in animal cells.',
  'Target of antibiotics such as penicillin (inhibits peptidoglycan synthesis). Central to plant biology (turgor pressure, cell expansion). Distinguishes plant and animal cells in introductory biology.',
  ARRAY['cell walls']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'vacuole',
  '液胞',
  'Blob storage / expandable data lake: a large, flexible storage container that holds water, metabolites, and waste products, adjustable in size like cloud object storage scaling on demand.',
  'A membrane-bound organelle (tonoplast-enclosed in plants) that functions in storage, waste disposal, and maintenance of turgor pressure. Plant cells typically contain a large central vacuole occupying up to 90% of cell volume. Also found in fungi, protists, and some animal cells.',
  'Key to understanding plant cell physiology (turgor pressure, pigment storage in anthocyanin-containing vacuoles). Also relevant to yeast biology (vacuolar protein sorting) and protozoan parasitology.',
  ARRAY['vacuoles', 'central vacuole', 'tonoplast']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'chloroplast',
  '葉緑体',
  'Solar panel array with its own firmware: captures light energy and converts it to chemical energy (ATP/NADPH), runs its own circular DNA (like mitochondria, another acquired startup via endosymbiosis).',
  'A double-membrane-bound plastid in plants and algae containing thylakoid membranes organized into grana. Site of photosynthesis: light reactions occur on thylakoid membranes, and the Calvin cycle in the stroma. Contains its own circular genome (~120-160 kb in land plants).',
  'Central to plant biology and photosynthesis research. Key evidence (along with mitochondria) for the endosymbiotic theory. Increasingly studied in synthetic biology for engineering photosynthetic organisms.',
  ARRAY['chloroplasts', 'plastid']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'chromatin',
  'クロマチン',
  'Compressed/archived codebase with access controls: DNA wrapped around histone spools like files in a zip archive, where compression level (euchromatin = unzipped, heterochromatin = deeply archived) determines read accessibility.',
  'The complex of DNA and histone proteins that constitutes chromosomes within the nucleus. Exists in two states: euchromatin (loosely packed, transcriptionally active) and heterochromatin (densely packed, transcriptionally silent). Organization is regulated by histone modifications and chromatin remodeling complexes.',
  'Central to epigenetics and gene regulation. Studied via ChIP-seq, ATAC-seq, and Hi-C. Chromatin structure alterations are implicated in cancer and developmental disorders.',
  ARRAY['euchromatin', 'heterochromatin']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'nuclear pore',
  '核膜孔',
  'API gateway with authentication middleware: a massive multi-protein channel complex that validates transport credentials (nuclear localization signals) before granting import/export access between nucleus and cytoplasm.',
  'A large protein complex (~125 MDa, composed of ~30 different nucleoporins) embedded in the nuclear envelope that mediates selective bidirectional transport of molecules between the nucleus and cytoplasm. Small molecules (<~40 kDa) diffuse passively; larger cargoes require importin/exportin receptors and the Ran GTPase gradient.',
  'Key topic in nuclear transport biology. Relevant to virology (many viruses exploit nuclear pores) and neurodegenerative diseases (nucleoporin dysfunction in ALS). Structural studies have revealed the pore''s eightfold symmetry.',
  ARRAY['nuclear pore complex', 'NPC', 'nuclear pores']
) ON CONFLICT DO NOTHING;
