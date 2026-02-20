-- =============================================================================
-- 060_metabolism.sql
-- BioLexicon seed data: Metabolism & Bioenergetics
-- Domain: Biochemistry / Metabolic Pathways
-- Terms: 20
-- =============================================================================

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'metabolism',
  '代謝',
  'Total system resource management: the sum of all data processing (catabolic = ETL extraction of energy from raw data) and construction (anabolic = building new features from extracted components) operations running in the cell at any given time.',
  'The entirety of chemical reactions occurring within a living organism, comprising catabolism (breakdown of complex molecules to release energy) and anabolism (synthesis of complex molecules from simpler precursors using energy). Metabolism is organized into metabolic pathways catalyzed by enzymes and regulated by allosteric control, hormones, and gene expression.',
  'Central to biochemistry and physiology. Metabolic reprogramming is a hallmark of cancer (Warburg effect). Metabolomics studies the global metabolite profile. Inborn errors of metabolism are a major category of genetic diseases.',
  ARRAY['cellular metabolism', 'intermediary metabolism']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'catabolism',
  '異化',
  'ETL data extraction + energy harvesting: the breakdown phase where complex input molecules (raw data) are decomposed into simpler components, extracting stored energy (ATP, NADH) for reuse — like an ETL pipeline that extracts value from raw data sources.',
  'The set of metabolic pathways that break down complex molecules into simpler ones, releasing energy in the form of ATP and reducing equivalents (NADH, FADH2). Major catabolic pathways include glycolysis, the citric acid cycle, beta-oxidation of fatty acids, and amino acid degradation. Catabolic reactions are generally exergonic.',
  'Catabolic pathways converge on common intermediates (acetyl-CoA, pyruvate) feeding into the citric acid cycle. Regulated by hormones (glucagon, epinephrine promote catabolism; insulin promotes anabolism).',
  ARRAY['catabolic pathway', 'degradation']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'anabolism',
  '同化',
  'Build/compile phase: the constructive phase where simple precursors are assembled into complex molecules (proteins, lipids, nucleic acids) — like a build system that compiles source components into deployable artifacts, consuming energy (ATP) in the process.',
  'The set of metabolic pathways that construct complex molecules from simpler precursors, requiring energy input (ATP) and reducing power (NADPH). Major anabolic pathways include gluconeogenesis, fatty acid synthesis, amino acid biosynthesis, and nucleotide synthesis. Products include proteins, lipids, nucleic acids, and polysaccharides.',
  'Anabolic processes are dominant during growth and tissue repair. Anabolic steroids mimic testosterone to promote protein synthesis. mTOR is a central anabolic regulator, integrating growth factor and nutrient signals.',
  ARRAY['anabolic pathway', 'biosynthesis']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'glycolysis',
  '解糖系',
  'ETL pipeline stage 1: a 10-step sequential transformation that extracts energy from glucose (raw input), producing 2 pyruvate + 2 ATP + 2 NADH per glucose — like the first stage of a data processing pipeline that transforms raw input into intermediate results.',
  'A cytoplasmic metabolic pathway consisting of 10 enzymatic steps that converts one molecule of glucose (6C) into two molecules of pyruvate (3C), with a net yield of 2 ATP and 2 NADH. Key regulatory enzymes are hexokinase, phosphofructokinase-1 (PFK-1, rate-limiting), and pyruvate kinase. Operates under both aerobic and anaerobic conditions.',
  'Universal pathway present in virtually all organisms. The Warburg effect (aerobic glycolysis in cancer cells) is a hallmark of cancer metabolism. PET scanning exploits increased glucose uptake (FDG) in tumors. Embden-Meyerhof-Parnas pathway.',
  ARRAY['glycolytic pathway', 'Embden-Meyerhof pathway', 'EMP pathway']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'citric acid cycle',
  'クエン酸回路',
  'Central processing hub / data enrichment loop: a cyclical pipeline that fully oxidizes acetyl-CoA (the common intermediate from all fuel sources), generating NADH and FADH2 (energy tokens) with each iteration — like a recurring batch process that extracts maximum value from input data.',
  'A cyclical series of 8 enzymatic reactions in the mitochondrial matrix that oxidizes acetyl-CoA (2C) to 2 CO2, generating 3 NADH, 1 FADH2, and 1 GTP per turn. Also called the Krebs cycle or tricarboxylic acid (TCA) cycle. Intermediates serve as biosynthetic precursors (oxaloacetate for gluconeogenesis, α-ketoglutarate for amino acids, succinyl-CoA for heme). Regulated by isocitrate dehydrogenase, α-ketoglutarate dehydrogenase, and citrate synthase.',
  'Hans Krebs elucidated the cycle (Nobel Prize 1953). Central metabolic hub linking carbohydrate, lipid, and amino acid metabolism. IDH1/2 mutations (neomorphic, producing 2-hydroxyglutarate) are found in gliomas and AML.',
  ARRAY['Krebs cycle', 'TCA cycle', 'tricarboxylic acid cycle']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'oxidative phosphorylation',
  '酸化的リン酸化',
  'Power generation plant: the electron transport chain (turbines) drives protons across the inner mitochondrial membrane (creates electrical potential), and ATP synthase (generator) converts this proton-motive force into ATP (electricity) — the cell''s main power grid producing ~30-32 ATP per glucose.',
  'The metabolic process in the inner mitochondrial membrane in which the energy released by electron transfer through the electron transport chain (complexes I-IV) is coupled to ATP synthesis via chemiosmosis. Electrons from NADH and FADH2 are passed through the chain to O2 (final electron acceptor), generating a proton gradient that drives ATP synthase (complex V). Produces approximately 30-32 ATP per glucose.',
  'Peter Mitchell proposed the chemiosmotic hypothesis (Nobel Prize 1978). Paul Boyer and John Walker elucidated ATP synthase mechanism (Nobel Prize 1997). Mitochondrial dysfunction and oxidative phosphorylation defects are implicated in aging, neurodegeneration, and metabolic diseases.',
  ARRAY['OXPHOS', 'oxidative phosphorylation pathway']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'atp',
  'ATP',
  'Universal energy currency / API credit token: the cell''s standard unit of energy exchange, spent to power virtually all energy-requiring processes (molecular motors, biosynthesis, transport) — like credits in a compute platform that are consumed by every operation and must be continuously regenerated.',
  'Adenosine 5''-triphosphate, the primary energy currency of all living cells. Composed of adenine, ribose, and three phosphate groups. Energy is released by hydrolysis of the terminal phosphate bond (ATP → ADP + Pi, ΔG°'' ≈ -30.5 kJ/mol). Regenerated from ADP by oxidative phosphorylation, substrate-level phosphorylation, and photophosphorylation. A human body turns over approximately its own weight in ATP per day.',
  'Central to all of biochemistry. Fritz Lipmann (Nobel Prize 1953) established ATP as the energy currency of the cell. ATP also functions as a signaling molecule (purinergic signaling) and as a hydrotrope maintaining protein solubility.',
  ARRAY['adenosine triphosphate', 'adenosine 5-triphosphate']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'electron transport chain',
  '電子伝達系',
  'Series of step-down transformers: electrons (electrical current) flow through a chain of protein complexes (transformers) with decreasing energy levels, and the released energy at each step pumps protons (charges a capacitor) to create the electrochemical gradient that powers ATP synthase.',
  'A series of protein complexes (Complex I/NADH dehydrogenase, Complex II/succinate dehydrogenase, Complex III/cytochrome bc1, Complex IV/cytochrome c oxidase) and mobile carriers (ubiquinone, cytochrome c) embedded in the inner mitochondrial membrane. Electrons from NADH and FADH2 are transferred through the chain to O2, with the released energy used to pump protons (H+) from the matrix to the intermembrane space, creating the proton-motive force.',
  'Cyanide (Complex IV inhibitor), rotenone (Complex I inhibitor), and antimycin A (Complex III inhibitor) are classic ETC poisons. Mitochondrial ETC defects cause a spectrum of diseases (Leigh syndrome, MELAS).',
  ARRAY['ETC', 'respiratory chain', 'mitochondrial electron transport chain']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'nadh',
  'NADH',
  'Rechargeable battery / energy shuttle: carries high-energy electrons from catabolic reactions (charging) to the electron transport chain (discharging), where the energy is converted to ATP — like a rechargeable battery that shuttles energy between the extraction and generation systems.',
  'Nicotinamide adenine dinucleotide (reduced form). A key electron carrier in cellular metabolism. Produced during glycolysis, pyruvate oxidation, and the citric acid cycle by reduction of NAD+ (accepting 2 electrons and 1 H+). Donates electrons to Complex I of the electron transport chain, yielding approximately 2.5 ATP per NADH. The NAD+/NADH ratio is a critical indicator of cellular metabolic state.',
  'NAD+ is also a substrate for sirtuins (protein deacetylases linked to aging) and PARPs (DNA repair enzymes). NAD+ metabolism (via NMN, NR supplementation) is a major area of aging research. NADH/NAD+ ratio regulates metabolic flux.',
  ARRAY['reduced NAD', 'nicotinamide adenine dinucleotide']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'fadh2',
  'FADH2',
  'Secondary battery with lower voltage: another electron carrier that feeds into the ETC at a lower entry point (Complex II instead of Complex I), yielding fewer ATP per molecule — like a secondary power source that connects at a later stage of the power grid.',
  'Flavin adenine dinucleotide (reduced form). An electron carrier that donates electrons to Complex II (succinate dehydrogenase) of the electron transport chain via ubiquinone, yielding approximately 1.5 ATP per FADH2. Produced primarily by succinate dehydrogenase in the citric acid cycle and by acyl-CoA dehydrogenase in fatty acid beta-oxidation.',
  'FADH2 enters the ETC at a lower energy level than NADH, hence fewer ATP produced. FAD is also a cofactor in many oxidase and dehydrogenase enzymes. Riboflavin (vitamin B2) is the precursor of FAD.',
  ARRAY['reduced FAD', 'flavin adenine dinucleotide']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'pyruvate',
  'ピルビン酸',
  'Intermediate build artifact / pipeline junction: the 3-carbon output of glycolysis that sits at a critical routing decision — it can be sent to the mitochondria for full oxidation (production build), converted to lactate (quick fallback), or used for biosynthesis (feature branch).',
  'A 3-carbon alpha-keto acid (CH3COCOO-) that is the end product of glycolysis. Under aerobic conditions, pyruvate is transported into mitochondria and oxidatively decarboxylated to acetyl-CoA by the pyruvate dehydrogenase complex. Under anaerobic conditions, it is reduced to lactate (animals) or ethanol + CO2 (yeast). Also a substrate for gluconeogenesis and amino acid biosynthesis.',
  'Key metabolic branch point. Pyruvate dehydrogenase complex deficiency causes lactic acidosis. Cancer cells often convert pyruvate to lactate even in the presence of oxygen (Warburg effect/aerobic glycolysis).',
  ARRAY['pyruvic acid']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'acetyl-coa',
  'アセチルCoA',
  'Universal data interchange format: the common 2-carbon intermediate that all major fuel sources (carbs, fats, proteins) are converted into before entering the TCA cycle — like JSON or protobuf as the universal serialization format that all services must produce before the central processor can consume their output.',
  'Acetyl coenzyme A, a thioester of acetic acid and coenzyme A. The central metabolic intermediate formed from pyruvate (by pyruvate dehydrogenase), fatty acids (by beta-oxidation), and amino acid catabolism. Feeds into the citric acid cycle for complete oxidation. Also the building block for fatty acid synthesis, cholesterol synthesis, and acetylation reactions.',
  'Sits at the crossroads of catabolism and anabolism. Acetyl-CoA levels regulate histone acetylation, linking metabolism to epigenetics. Citrate (from acetyl-CoA + oxaloacetate) is exported from mitochondria for cytosolic fatty acid synthesis via ATP-citrate lyase.',
  ARRAY['acetyl coenzyme A', 'AcCoA']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'fermentation',
  '発酵',
  'Offline/degraded mode processing: when the main power grid (oxidative phosphorylation) is unavailable (no O2), the cell falls back to a less efficient mode that regenerates NAD+ by reducing pyruvate — like a system running on emergency backup power with reduced throughput.',
  'An anaerobic metabolic process that regenerates NAD+ from NADH by transferring electrons from NADH to an organic electron acceptor (pyruvate). Lactic acid fermentation (in muscle cells, some bacteria) reduces pyruvate to lactate. Alcoholic fermentation (in yeast) decarboxylates pyruvate to acetaldehyde, then reduces it to ethanol + CO2. Net ATP yield: 2 per glucose (glycolysis only).',
  'Basis of bread-making (CO2 production), brewing (ethanol production), and yogurt/cheese making (lactic acid production). Lactic acid accumulation during intense exercise causes muscle fatigue. Industrial fermentation produces biofuels, pharmaceuticals, and food products.',
  ARRAY['anaerobic fermentation', 'lactic acid fermentation', 'alcoholic fermentation']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'gluconeogenesis',
  '糖新生',
  'Reverse ETL / data reconstruction: the reverse pathway that rebuilds glucose from non-carbohydrate precursors (lactate, amino acids, glycerol) when input supplies run low — like reconstructing original data from derived artifacts when the primary source is exhausted.',
  'A metabolic pathway that synthesizes glucose from non-carbohydrate precursors (lactate, glycerol, glucogenic amino acids, propionate) primarily in the liver and kidney cortex. Largely the reverse of glycolysis but uses four bypass enzymes (pyruvate carboxylase, PEPCK, fructose-1,6-bisphosphatase, glucose-6-phosphatase) to circumvent irreversible glycolytic steps. Consumes 4 ATP + 2 GTP per glucose synthesized.',
  'Essential for maintaining blood glucose during fasting and exercise. Regulated reciprocally with glycolysis by hormones (glucagon stimulates, insulin inhibits). Metformin (type 2 diabetes drug) partially works by inhibiting hepatic gluconeogenesis.',
  ARRAY['GNG', 'glucose synthesis']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'pentose phosphate pathway',
  'ペントースリン酸経路',
  'Utility service / sidecar process: a parallel processing pathway branching off glycolysis that produces essential supplies — NADPH (security tokens for antioxidant defense and biosynthesis) and ribose-5-phosphate (raw materials for DNA/RNA construction) — rather than energy.',
  'A metabolic pathway branching from glycolysis at glucose-6-phosphate, consisting of an oxidative phase (producing 2 NADPH and ribulose-5-phosphate) and a non-oxidative phase (interconverting sugars, producing ribose-5-phosphate for nucleotide synthesis and returning intermediates to glycolysis). Key enzyme: glucose-6-phosphate dehydrogenase (G6PD). Does not produce ATP directly.',
  'G6PD deficiency is the most common enzyme deficiency worldwide (~400 million people), causing hemolytic anemia upon oxidative stress (favism). NADPH from the PPP is essential for reductive biosynthesis (fatty acid synthesis) and glutathione-based antioxidant defense.',
  ARRAY['PPP', 'hexose monophosphate shunt', 'HMP shunt', 'phosphogluconate pathway']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'beta-oxidation',
  'β酸化',
  'Iterative data chunk processor: fatty acids are processed in a repeating 4-step loop that clips off 2-carbon units (acetyl-CoA) per iteration, like a while-loop that processes a data stream in fixed-size chunks until the input is fully consumed.',
  'The mitochondrial catabolic pathway that degrades fatty acids by sequential removal of 2-carbon units as acetyl-CoA. Each cycle of four reactions (oxidation by acyl-CoA dehydrogenase, hydration, oxidation by β-hydroxyacyl-CoA dehydrogenase, thiolysis) shortens the fatty acid by 2 carbons and produces 1 FADH2, 1 NADH, and 1 acetyl-CoA. A C16 palmitate yields 8 acetyl-CoA, 7 FADH2, and 7 NADH (~106 ATP total).',
  'Major energy source during fasting and endurance exercise. Fatty acid oxidation disorders (e.g., MCAD deficiency) cause hypoketotic hypoglycemia. Carnitine shuttle (CPT1/CPT2) is required for long-chain fatty acid entry into mitochondria; CPT1 is the rate-limiting step.',
  ARRAY['fatty acid oxidation', 'fatty acid beta-oxidation', 'FAO']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'lipid metabolism',
  '脂質代謝',
  'Storage management system: handles both writing to disk (lipogenesis = storing excess energy as fat) and reading from disk (lipolysis + beta-oxidation = retrieving stored energy) — the cell''s primary long-term storage I/O system.',
  'The metabolic processes involving the synthesis (lipogenesis), storage, and degradation (lipolysis, beta-oxidation) of lipids including fatty acids, triglycerides, phospholipids, cholesterol, and sphingolipids. Fatty acid synthesis occurs in the cytoplasm from acetyl-CoA (via malonyl-CoA); degradation occurs in mitochondria via beta-oxidation. Cholesterol synthesis (mevalonate pathway) occurs in the ER.',
  'Dyslipidemia is a major cardiovascular risk factor. Statins (HMG-CoA reductase inhibitors) are the most prescribed drug class worldwide. Lipid metabolism reprogramming in cancer is an emerging research area.',
  ARRAY['fat metabolism', 'lipid biosynthesis']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'amino acid metabolism',
  'アミノ酸代謝',
  'Component recycling center: amino acids are deconstructed (deaminated, with the nitrogen routed to urea cycle for safe disposal) and their carbon skeletons are fed back into the central processing pipeline (TCA cycle) as fuel or biosynthetic precursors.',
  'The metabolic pathways involving the synthesis, interconversion, and degradation of amino acids. Degradation involves transamination or deamination (removing the amino group, which enters the urea cycle), and metabolism of the carbon skeleton to TCA cycle intermediates (glucogenic amino acids) or acetyl-CoA/acetoacetate (ketogenic amino acids). Essential amino acids must be obtained from diet.',
  'Urea cycle defects cause hyperammonemia. Phenylketonuria (PKU) is caused by phenylalanine hydroxylase deficiency. Amino acid metabolism is dysregulated in cancer (glutamine addiction). Branched-chain amino acid metabolism is important in exercise physiology.',
  ARRAY['protein metabolism', 'amino acid catabolism']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'photosynthesis',
  '光合成',
  'Solar-powered data center with carbon capture: uses light energy (solar panels) to split water (raw power extraction), generate ATP and NADPH (charge batteries), and fix CO2 into glucose (build carbon-based data structures from atmospheric carbon) — a self-sustaining energy + manufacturing facility.',
  'The process by which photosynthetic organisms (plants, algae, cyanobacteria) convert light energy into chemical energy. Light reactions (in thylakoid membranes) use photosystems I and II to split water, generate O2, and produce ATP and NADPH. Dark reactions (Calvin cycle in stroma) use ATP and NADPH to fix CO2 into glyceraldehyde-3-phosphate (G3P) and ultimately glucose. Overall: 6CO2 + 6H2O + light → C6H12O6 + 6O2.',
  'Responsible for virtually all oxygen in Earth''s atmosphere and the primary source of organic carbon in the biosphere. Melvin Calvin elucidated the Calvin cycle (Nobel Prize 1961). Improving photosynthetic efficiency is a major goal for food security and bioenergy.',
  ARRAY['photosynthetic pathway']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'calvin cycle',
  'カルビン回路',
  'Carbon-fixation build loop: a cyclical assembly process that takes 3 CO2 molecules (raw atmospheric inputs) per turn and, using ATP and NADPH (energy credits), constructs one G3P molecule (usable carbon building block) — like a factory loop that converts raw materials into components using purchased energy.',
  'A cyclical series of enzyme-catalyzed reactions in the chloroplast stroma (also called the Calvin-Benson-Bassham cycle or C3 pathway) that fixes atmospheric CO2 into organic carbon. Three phases: (1) Carbon fixation — RuBisCO carboxylates ribulose-1,5-bisphosphate (RuBP) to form two 3-phosphoglycerate (3PGA); (2) Reduction — 3PGA is reduced to G3P using ATP and NADPH; (3) Regeneration — RuBP is regenerated from G3P. Three turns fix 3 CO2 to produce 1 net G3P, consuming 9 ATP and 6 NADPH.',
  'Elucidated by Melvin Calvin using 14C-labeled CO2 (Nobel Prize 1961). RuBisCO is the most abundant protein on Earth but is catalytically slow and prone to oxygenation (photorespiration). Engineering improved RuBisCO is a major research goal.',
  ARRAY['Calvin-Benson cycle', 'C3 cycle', 'carbon fixation cycle', 'dark reactions']
) ON CONFLICT DO NOTHING;
