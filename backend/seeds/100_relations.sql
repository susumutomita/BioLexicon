-- Relations seed: 60+ relations between terms
-- Uses subqueries to reference terms by name

-- Cell structure relations
INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'component', 'Ribosomes are found in the cytoplasm'
FROM terms s, terms t WHERE s.name = 'cytoplasm' AND t.name = 'ribosome'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'component', 'Nucleus contains chromatin'
FROM terms s, terms t WHERE s.name = 'nucleus' AND t.name = 'chromatin'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'component', 'Nucleus is bounded by nuclear envelope'
FROM terms s, terms t WHERE s.name = 'nucleus' AND t.name = 'nuclear envelope'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'component', 'Cytoskeleton includes microtubules'
FROM terms s, terms t WHERE s.name = 'cytoskeleton' AND t.name = 'microtubule'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'component', 'Cytoskeleton includes actin filaments'
FROM terms s, terms t WHERE s.name = 'cytoskeleton' AND t.name = 'actin'
ON CONFLICT DO NOTHING;

-- Cell cycle relations
INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'phase', 'Cell cycle includes interphase'
FROM terms s, terms t WHERE s.name = 'cell cycle' AND t.name = 'interphase'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'phase', 'Cell cycle includes mitosis'
FROM terms s, terms t WHERE s.name = 'cell cycle' AND t.name = 'mitosis'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'phase', 'Interphase includes G1 phase'
FROM terms s, terms t WHERE s.name = 'interphase' AND t.name = 'g1 phase'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'phase', 'Interphase includes S phase'
FROM terms s, terms t WHERE s.name = 'interphase' AND t.name = 's phase'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'phase', 'Interphase includes G2 phase'
FROM terms s, terms t WHERE s.name = 'interphase' AND t.name = 'g2 phase'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'activates', 'Cyclin activates CDK'
FROM terms s, terms t WHERE s.name = 'cyclin' AND t.name = 'cdk'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'regulates', 'CDK regulates cell cycle checkpoints'
FROM terms s, terms t WHERE s.name = 'cdk' AND t.name = 'checkpoint'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'inhibits', 'p53 inhibits cell cycle progression'
FROM terms s, terms t WHERE s.name = 'p53' AND t.name = 'cell cycle'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'inhibits', 'Rb protein inhibits cell cycle at restriction point'
FROM terms s, terms t WHERE s.name = 'rb protein' AND t.name = 'restriction point'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'regulates', 'APC/C regulates securin degradation'
FROM terms s, terms t WHERE s.name = 'apc/c' AND t.name = 'securin'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'activates', 'Securin degradation activates separase'
FROM terms s, terms t WHERE s.name = 'securin' AND t.name = 'separase'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'cleaves', 'Separase cleaves cohesin'
FROM terms s, terms t WHERE s.name = 'separase' AND t.name = 'cohesin'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'phase', 'Mitosis includes prophase'
FROM terms s, terms t WHERE s.name = 'mitosis' AND t.name = 'prophase'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'phase', 'Mitosis includes metaphase'
FROM terms s, terms t WHERE s.name = 'mitosis' AND t.name = 'metaphase'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'phase', 'Mitosis includes anaphase'
FROM terms s, terms t WHERE s.name = 'mitosis' AND t.name = 'anaphase'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'phase', 'Mitosis includes telophase'
FROM terms s, terms t WHERE s.name = 'mitosis' AND t.name = 'telophase'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'triggers', 'p53 triggers apoptosis'
FROM terms s, terms t WHERE s.name = 'p53' AND t.name = 'apoptosis'
ON CONFLICT DO NOTHING;

-- Gene expression relations
INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'produces', 'Transcription produces mRNA'
FROM terms s, terms t WHERE s.name = 'transcription' AND t.name = 'mrna'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'uses', 'Translation uses mRNA as template'
FROM terms s, terms t WHERE s.name = 'translation' AND t.name = 'mrna'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'uses', 'Translation uses tRNA for amino acid delivery'
FROM terms s, terms t WHERE s.name = 'translation' AND t.name = 'trna'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'catalyzes', 'RNA polymerase catalyzes transcription'
FROM terms s, terms t WHERE s.name = 'rna polymerase' AND t.name = 'transcription'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'binds', 'Transcription factor binds to promoter'
FROM terms s, terms t WHERE s.name = 'transcription factor' AND t.name = 'promoter'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'process', 'Splicing removes introns from pre-mRNA'
FROM terms s, terms t WHERE s.name = 'splicing' AND t.name = 'intron'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Understanding codons requires knowledge of mRNA'
FROM terms s, terms t WHERE s.name = 'codon' AND t.name = 'mrna'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'modifies', 'Methylation modifies histones for gene regulation'
FROM terms s, terms t WHERE s.name = 'methylation' AND t.name = 'histone'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'modifies', 'Acetylation modifies histones'
FROM terms s, terms t WHERE s.name = 'acetylation' AND t.name = 'histone'
ON CONFLICT DO NOTHING;

-- DNA replication relations
INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'unwinds', 'Helicase unwinds DNA at replication fork'
FROM terms s, terms t WHERE s.name = 'helicase' AND t.name = 'replication fork'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'synthesizes', 'Primase synthesizes RNA primers'
FROM terms s, terms t WHERE s.name = 'primase' AND t.name = 'dna replication'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'synthesizes', 'DNA polymerase synthesizes new DNA strand'
FROM terms s, terms t WHERE s.name = 'dna polymerase' AND t.name = 'leading strand'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'component', 'Okazaki fragments form on lagging strand'
FROM terms s, terms t WHERE s.name = 'okazaki fragment' AND t.name = 'lagging strand'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'joins', 'DNA ligase joins Okazaki fragments'
FROM terms s, terms t WHERE s.name = 'dna ligase' AND t.name = 'okazaki fragment'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'extends', 'Telomerase extends telomeres'
FROM terms s, terms t WHERE s.name = 'telomerase' AND t.name = 'telomere'
ON CONFLICT DO NOTHING;

-- Signal transduction relations
INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'binds', 'Ligand binds to receptor'
FROM terms s, terms t WHERE s.name = 'ligand' AND t.name = 'receptor'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'activates', 'G protein activates second messenger production'
FROM terms s, terms t WHERE s.name = 'g protein' AND t.name = 'second messenger'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Understanding MAPK pathway requires knowledge of kinase'
FROM terms s, terms t WHERE s.name = 'mapk pathway' AND t.name = 'kinase'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'activates', 'Caspase activates apoptosis pathway'
FROM terms s, terms t WHERE s.name = 'caspase' AND t.name = 'apoptosis'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'inhibits', 'Bcl-2 inhibits apoptosis'
FROM terms s, terms t WHERE s.name = 'bcl-2' AND t.name = 'apoptosis'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'type', 'Growth factor is a type of ligand'
FROM terms s, terms t WHERE s.name = 'growth factor' AND t.name = 'ligand'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'type', 'Cytokine is a type of signaling molecule'
FROM terms s, terms t WHERE s.name = 'cytokine' AND t.name = 'signal transduction'
ON CONFLICT DO NOTHING;

-- Metabolism relations
INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'produces', 'Glycolysis produces pyruvate'
FROM terms s, terms t WHERE s.name = 'glycolysis' AND t.name = 'pyruvate'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'feeds_into', 'Pyruvate feeds into citric acid cycle as acetyl-CoA'
FROM terms s, terms t WHERE s.name = 'pyruvate' AND t.name = 'citric acid cycle'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'produces', 'Citric acid cycle produces NADH'
FROM terms s, terms t WHERE s.name = 'citric acid cycle' AND t.name = 'nadh'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'uses', 'Electron transport chain uses NADH'
FROM terms s, terms t WHERE s.name = 'electron transport chain' AND t.name = 'nadh'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'produces', 'Oxidative phosphorylation produces ATP'
FROM terms s, terms t WHERE s.name = 'oxidative phosphorylation' AND t.name = 'atp'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'type', 'Glycolysis is a type of catabolism'
FROM terms s, terms t WHERE s.name = 'glycolysis' AND t.name = 'catabolism'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'type', 'Gluconeogenesis is a type of anabolism'
FROM terms s, terms t WHERE s.name = 'gluconeogenesis' AND t.name = 'anabolism'
ON CONFLICT DO NOTHING;

-- Molecular biology relations
INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Central dogma requires understanding of DNA'
FROM terms s, terms t WHERE s.name = 'central dogma' AND t.name = 'dna'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Central dogma requires understanding of RNA'
FROM terms s, terms t WHERE s.name = 'central dogma' AND t.name = 'rna'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Central dogma requires understanding of protein'
FROM terms s, terms t WHERE s.name = 'central dogma' AND t.name = 'protein'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'tool', 'PCR amplifies DNA using DNA polymerase'
FROM terms s, terms t WHERE s.name = 'pcr' AND t.name = 'dna polymerase'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'tool', 'CRISPR is a gene editing tool'
FROM terms s, terms t WHERE s.name = 'crispr' AND t.name = 'gene editing'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'type', 'Point mutation is a type of mutation'
FROM terms s, terms t WHERE s.name = 'point mutation' AND t.name = 'mutation'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'causes', 'Frameshift mutation caused by insertion or deletion'
FROM terms s, terms t WHERE s.name = 'insertion' AND t.name = 'frameshift mutation'
ON CONFLICT DO NOTHING;

-- Genetics relations
INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Understanding genotype requires knowledge of alleles'
FROM terms s, terms t WHERE s.name = 'genotype' AND t.name = 'allele'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Phenotype results from genotype'
FROM terms s, terms t WHERE s.name = 'phenotype' AND t.name = 'genotype'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Mendelian inheritance requires understanding of dominant/recessive'
FROM terms s, terms t WHERE s.name = 'mendelian inheritance' AND t.name = 'dominant'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'process', 'Crossing over occurs during meiosis'
FROM terms s, terms t WHERE s.name = 'crossing over' AND t.name = 'meiosis'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'method', 'GWAS identifies SNPs associated with traits'
FROM terms s, terms t WHERE s.name = 'gwas' AND t.name = 'snp'
ON CONFLICT DO NOTHING;

-- Immunology relations
INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'component', 'Immune system includes innate immunity'
FROM terms s, terms t WHERE s.name = 'immune system' AND t.name = 'innate immunity'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'component', 'Immune system includes adaptive immunity'
FROM terms s, terms t WHERE s.name = 'immune system' AND t.name = 'adaptive immunity'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'produces', 'B cell produces antibodies'
FROM terms s, terms t WHERE s.name = 'b cell' AND t.name = 'antibody'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'recognizes', 'Antibody recognizes antigen'
FROM terms s, terms t WHERE s.name = 'antibody' AND t.name = 'antigen'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Understanding T cell requires knowledge of MHC'
FROM terms s, terms t WHERE s.name = 't cell' AND t.name = 'mhc'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'triggers', 'Cytokine storm triggers excessive inflammation'
FROM terms s, terms t WHERE s.name = 'cytokine storm' AND t.name = 'inflammation'
ON CONFLICT DO NOTHING;

-- Cross-domain prerequisite relations
INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Understanding gene expression requires knowledge of DNA'
FROM terms s, terms t WHERE s.name = 'gene expression' AND t.name = 'dna'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Understanding DNA replication requires knowledge of DNA'
FROM terms s, terms t WHERE s.name = 'dna replication' AND t.name = 'dna'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Cell cycle regulation requires understanding of gene expression'
FROM terms s, terms t WHERE s.name = 'cell cycle' AND t.name = 'gene expression'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Understanding signal transduction requires knowledge of receptor'
FROM terms s, terms t WHERE s.name = 'signal transduction' AND t.name = 'receptor'
ON CONFLICT DO NOTHING;

INSERT INTO term_relations (source_term_id, target_term_id, relation_type, description)
SELECT s.id, t.id, 'prerequisite', 'Understanding metabolism requires knowledge of ATP'
FROM terms s, terms t WHERE s.name = 'metabolism' AND t.name = 'atp'
ON CONFLICT DO NOTHING;
