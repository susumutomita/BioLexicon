-- =============================================================================
-- 040_dna_replication.sql
-- BioLexicon seed data: DNA Replication & Repair
-- Domain: Molecular Biology / DNA Replication
-- Terms: 20
-- =============================================================================

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'dna replication',
  'DNA複製',
  'Git fork + full codebase clone: the cell creates an exact copy of its entire genome before division, with multiple origin servers (replication origins) working in parallel to complete the clone within the deployment window.',
  'The biological process by which a cell duplicates its entire DNA content, producing two identical copies from one original molecule. Proceeds bidirectionally from origins of replication via semi-conservative mechanism. Involves helicase unwinding, primase priming, DNA polymerase synthesis, and ligase joining. Occurs during S phase of the cell cycle.',
  'Fundamental to all life. Meselson-Stahl experiment (1958) demonstrated semiconservative replication. Arthur Kornberg discovered DNA polymerase I (Nobel Prize 1959). Errors in replication are a major source of mutations.',
  ARRAY['DNA synthesis', 'genome replication']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'origin of replication',
  '複製起点',
  'Git clone starting point / bootstrap address: the specific genomic locus where replication machinery assembles and initiates bidirectional copying. E. coli has one origin (single-server); human cells have ~30,000-50,000 (distributed cluster for parallel processing).',
  'A specific DNA sequence where replication is initiated. In E. coli, the single origin (oriC, 245 bp) contains DnaA-binding sites and an AT-rich DNA unwinding element. In eukaryotes, origins are bound by the origin recognition complex (ORC) and are fired in a temporally regulated program during S phase.',
  'Origin firing must occur exactly once per cell cycle (licensing mechanism via MCM loading). Studied via DNA fiber assays, Repli-seq, and OK-seq. Relevant to understanding replication timing and genome stability.',
  ARRAY['ori', 'oriC', 'replication origin', 'ORI']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'replication fork',
  '複製フォーク',
  'Active build cursor / read head: the Y-shaped junction where the double helix is unwound and both strands are simultaneously copied by the replication machinery — like a read/write head processing data in both directions from a split point.',
  'The Y-shaped structure formed at the point where double-stranded DNA is unwound during replication. At the fork, helicase separates the parental strands, and DNA polymerase synthesizes new complementary strands. The leading strand is synthesized continuously; the lagging strand discontinuously as Okazaki fragments.',
  'Central to replication biology. Fork stalling causes replication stress, a driver of genomic instability in cancer. Studied via electron microscopy, DNA fiber spreading, and iPOND (isolation of proteins on nascent DNA).',
  ARRAY['replication forks']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'helicase',
  'ヘリカーゼ',
  'Unzip utility / archive extractor: an ATP-powered motor protein that unwinds the DNA double helix ahead of the replication fork, separating the two strands like unzipping a compressed archive to expose the data for reading.',
  'An enzyme that uses the energy of ATP hydrolysis to unwind double-stranded DNA into single strands at the replication fork. The primary replicative helicase is DnaB in E. coli (hexameric, moves 5''→3'' on the lagging strand template) and CMG complex (Cdc45-MCM-GINS) in eukaryotes (moves 3''→5'' on the leading strand template).',
  'MCM2-7 helicase loading (licensing) is a key regulatory step ensuring once-per-cycle replication. Helicase defects cause genomic instability syndromes (e.g., Werner syndrome, Bloom syndrome).',
  ARRAY['DNA helicase', 'DnaB', 'CMG helicase']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'primase',
  'プライマーゼ',
  'Stub generator / scaffolding tool: synthesizes short RNA primers that provide the required 3''-OH starting point for DNA polymerase — like generating boilerplate code that the main compiler can extend.',
  'An RNA polymerase enzyme that synthesizes short RNA primers (8-12 nucleotides in eukaryotes, ~11 in E. coli) complementary to the DNA template, providing the free 3''-hydroxyl group required for DNA polymerase to begin synthesis. Part of the primase-Pol α complex in eukaryotes; DnaG in E. coli.',
  'Essential because DNA polymerases cannot initiate synthesis de novo. Primers are later removed and replaced with DNA. Relevant to understanding the discontinuous nature of lagging strand synthesis.',
  ARRAY['DNA primase', 'DnaG', 'RNA primase']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'dna polymerase',
  'DNAポリメラーゼ',
  'Copy-on-write engine with built-in spell checker: reads the template strand and writes the complementary strand one nucleotide at a time, with 3''→5'' exonuclease proofreading that backtracks to correct mismatches (error rate: ~1 per 10^7 bases).',
  'An enzyme that synthesizes DNA by adding deoxyribonucleotides to the 3'' end of a primer strand complementary to a template strand (5''→3'' direction only). E. coli: Pol III (primary replicase), Pol I (primer removal, gap filling). Eukaryotes: Pol ε (leading strand), Pol δ (lagging strand), Pol α-primase (priming). Most replicative polymerases have 3''→5'' exonuclease proofreading.',
  'Arthur Kornberg discovered DNA Pol I (Nobel Prize 1959). DNA polymerases are essential tools in biotechnology: Taq polymerase enables PCR; high-fidelity polymerases (Pfu, Phusion) are used in cloning.',
  ARRAY['DNA pol', 'DNAP', 'DNA polymerase III', 'Pol delta', 'Pol epsilon']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'leading strand',
  'リーディング鎖',
  'Continuous stream processing: the strand synthesized continuously in the same direction as fork movement — like a streaming pipeline that processes data in one smooth, uninterrupted flow without buffering.',
  'The newly synthesized DNA strand at the replication fork that is elongated continuously in the 5''→3'' direction, the same direction as replication fork movement. Requires only a single RNA primer. Synthesized by DNA Pol ε in eukaryotes and primarily by Pol III in E. coli.',
  'Conceptually simpler than lagging strand synthesis. Identified through pulse-labeling experiments showing asymmetric replication. Relevant to understanding replication fidelity (different error rates on leading vs. lagging strands).',
  ARRAY['continuous strand']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'lagging strand',
  'ラギング鎖',
  'Batch processing with chunk assembly: synthesized discontinuously as short Okazaki fragments (batches) in the direction opposite to fork movement, then stitched together — like processing a stream in reverse-order chunks that must be joined post-hoc.',
  'The newly synthesized DNA strand at the replication fork that is elongated discontinuously as short Okazaki fragments (100-200 nt in eukaryotes, 1000-2000 nt in prokaryotes) in the 5''→3'' direction opposite to fork movement. Each fragment requires a separate RNA primer, which is subsequently removed and replaced with DNA before fragments are joined by DNA ligase.',
  'More complex and error-prone than leading strand synthesis. Lagging strand processing involves multiple enzymes (primase, Pol δ, RNase H/FEN1, Pol I, ligase). Source of short deletions and repeat expansions.',
  ARRAY['discontinuous strand']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'okazaki fragment',
  '岡崎フラグメント',
  'Work chunk / batch unit: a discrete unit of lagging strand synthesis that must be produced, trimmed, and joined with adjacent chunks — like individual micro-batch results that are concatenated into the final output.',
  'Short DNA fragments synthesized on the lagging strand during DNA replication. Each fragment begins with an RNA primer and is extended by DNA polymerase. Approximately 100-200 nucleotides in eukaryotes and 1,000-2,000 nucleotides in prokaryotes. Discovered by Reiji and Tsuneko Okazaki in 1968 using pulse-labeling experiments in E. coli.',
  'Named after Reiji Okazaki who discovered them. Their discovery confirmed the discontinuous model of lagging strand synthesis. Processing of Okazaki fragments is essential for genome integrity.',
  ARRAY['Okazaki fragments']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'dna ligase',
  'DNAリガーゼ',
  'Array.join() / string concatenator: seals the nicks between adjacent Okazaki fragments (or repair patches) by catalyzing phosphodiester bond formation — like joining array elements into a single continuous string.',
  'An enzyme that catalyzes the formation of a phosphodiester bond between the 3''-hydroxyl and 5''-phosphate ends of adjacent DNA strands, sealing single-strand nicks. Uses NAD+ (E. coli ligase) or ATP (T4 ligase, human ligases I, III, IV) as a cofactor. Essential for joining Okazaki fragments, DNA repair, and recombination.',
  'T4 DNA ligase is a workhorse enzyme in molecular cloning (joining restriction fragments into vectors). Human DNA ligase IV is essential for non-homologous end joining (NHEJ) of double-strand breaks.',
  ARRAY['ligase', 'DNA ligase I', 'DNA ligase IV', 'T4 DNA ligase']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'single-strand binding protein',
  '一本鎖DNA結合タンパク質',
  'Memory guard / buffer protector: coats exposed single-stranded DNA to prevent it from re-annealing, forming secondary structures, or being degraded — like a memory fence that protects an exposed buffer from corruption during processing.',
  'Proteins that bind cooperatively to single-stranded DNA (ssDNA) exposed during replication, recombination, and repair. SSB in E. coli (homotetramer) and RPA (replication protein A, heterotrimer) in eukaryotes prevent ssDNA from re-annealing, forming secondary structures, or being degraded by nucleases.',
  'RPA also serves as a signaling platform, recruiting checkpoint and repair proteins to ssDNA regions. RPA exhaustion model explains replication catastrophe under severe replication stress.',
  ARRAY['SSB', 'RPA', 'replication protein A']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'topoisomerase',
  'トポイソメラーゼ',
  'Deadlock resolver / thread contention manager: relieves torsional stress (supercoiling) that builds up ahead of the replication fork — like a concurrency manager that resolves thread contention by temporarily breaking and rejoining resource locks.',
  'Enzymes that regulate DNA topology by transiently breaking and rejoining DNA strands to relieve torsional stress. Type I topoisomerases cut one strand (relax supercoils). Type II topoisomerases (e.g., DNA gyrase, Topo II) cut both strands (can introduce or remove supercoils, decatenate linked molecules). Essential for replication, transcription, and chromosome segregation.',
  'Targets of important drugs: fluoroquinolone antibiotics (DNA gyrase), camptothecin/topotecan (Topo I), etoposide/doxorubicin (Topo II). James Wang pioneered topoisomerase research.',
  ARRAY['topoisomerases', 'DNA topoisomerase', 'gyrase', 'Topo I', 'Topo II']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'telomere',
  'テロメア',
  'Buffer zone / padding bytes at file boundaries: repetitive DNA sequences (TTAGGG in humans) capping chromosome ends that shorten with each replication cycle (like consuming padding), protecting coding data from truncation and serving as a biological aging clock.',
  'Repetitive nucleoprotein structures (TTAGGG repeats in vertebrates, 5-15 kb) at the ends of linear chromosomes that protect against degradation, end-to-end fusion, and recognition as DNA damage. Shielded by the shelterin protein complex (TRF1, TRF2, POT1, TIN2, TPP1, RAP1). Shorten with each cell division due to the end-replication problem.',
  'Elizabeth Blackburn, Carol Greider, and Jack Szostak received the 2009 Nobel Prize for telomere and telomerase research. Telomere shortening is linked to aging; telomere maintenance is a hallmark of cancer (via telomerase or ALT).',
  ARRAY['telomeres', 'TTAGGG repeats']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'telomerase',
  'テロメラーゼ',
  'Auto-padding / buffer replenishment service: a reverse transcriptase that extends telomere repeat sequences using its built-in RNA template — like a daemon that periodically replenishes consumed padding bytes to prevent data boundary erosion.',
  'A ribonucleoprotein enzyme (reverse transcriptase TERT + RNA template TERC) that elongates telomeres by adding TTAGGG repeats to chromosome 3'' ends, counteracting the end-replication problem. Active in stem cells, germ cells, and ~85-90% of cancers. Absent or low in most somatic cells.',
  'Reactivation of telomerase is a hallmark of cancer immortalization. Telomerase inhibitors (e.g., imetelstat) are in clinical trials. Mutations in telomerase components cause telomere biology disorders (dyskeratosis congenita, pulmonary fibrosis).',
  ARRAY['TERT', 'TERC', 'telomerase reverse transcriptase']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'semiconservative replication',
  '半保存的複製',
  'Copy-on-write with parent reference retention: each daughter molecule inherits one original strand (parent reference) and one newly synthesized strand (copy), ensuring traceability back to the original while producing a complete new instance.',
  'The mode of DNA replication in which each of the two resulting double-stranded DNA molecules contains one parental (template) strand and one newly synthesized strand. Demonstrated experimentally by Meselson and Stahl (1958) using density-gradient centrifugation with 15N-labeled E. coli DNA.',
  'The Meselson-Stahl experiment is considered one of the most elegant experiments in molecular biology. This mechanism ensures high-fidelity transmission of genetic information and enables mismatch repair (new strand identification via methylation state in E. coli).',
  ARRAY['semi-conservative replication']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'proofreading',
  '校正',
  'Inline spell-check / linter: the 3''→5'' exonuclease activity of DNA polymerase that immediately detects and corrects misincorporated nucleotides during synthesis — like a real-time linter that catches and auto-fixes typos as you type.',
  'The 3''→5'' exonuclease activity intrinsic to most replicative DNA polymerases that detects and excises misincorporated nucleotides immediately after insertion. When an incorrect base pair is detected (by altered geometry at the polymerase active site), the polymerase switches to exonuclease mode, removes the wrong nucleotide, and resumes synthesis. Reduces the error rate from ~10^-4 to ~10^-7 per base pair.',
  'Key to understanding replication fidelity. Combined with mismatch repair, achieves an overall error rate of ~10^-9 to 10^-10 per base pair per replication. Loss of proofreading (POLE/POLD1 mutations) causes ultramutated cancers.',
  ARRAY['3-prime to 5-prime exonuclease', 'exonuclease proofreading']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'mismatch repair',
  'ミスマッチ修復',
  'Post-build diff checker + auto-fix: a quality control system that scans newly replicated DNA for mismatches missed by proofreading, identifies the new strand (the one with errors), and patches the incorrect bases — like a CI job that diffs the build against the spec and auto-corrects deviations.',
  'A post-replicative DNA repair pathway that detects and corrects base-base mismatches and small insertion/deletion loops that escape polymerase proofreading. In E. coli, MutS detects mismatches, MutL coordinates repair, and MutH nicks the unmethylated (new) strand. In eukaryotes, MSH2-MSH6 (MutSα) and MSH2-MSH3 (MutSβ) detect mismatches; MLH1-PMS2 (MutLα) coordinates excision and resynthesis.',
  'Defects in mismatch repair cause Lynch syndrome (hereditary nonpolyposis colorectal cancer) and microsatellite instability (MSI-high tumors), which respond well to immune checkpoint inhibitors (pembrolizumab).',
  ARRAY['MMR', 'DNA mismatch repair', 'MutS', 'MutL']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'nucleotide excision repair',
  'ヌクレオチド除去修復',
  'Patch replacement / hotfix deploy: detects bulky DNA lesions (corrupted data blocks), excises a 24-32 nucleotide segment around the damage (removes the corrupted region), and resynthesizes using the undamaged strand as template — like cutting out and replacing a corrupted disk sector.',
  'A versatile DNA repair pathway that removes bulky, helix-distorting lesions (e.g., UV-induced pyrimidine dimers, chemical adducts). Global genome NER (GG-NER) surveys the entire genome; transcription-coupled NER (TC-NER) preferentially repairs the transcribed strand of active genes. Involves damage recognition, dual incision, excision of ~24-32 nt oligonucleotide, gap filling by DNA polymerase, and ligation.',
  'Defects cause xeroderma pigmentosum (extreme UV sensitivity, 1000x increased skin cancer risk), Cockayne syndrome, and trichothiodystrophy. Aziz Sancar received the 2015 Nobel Prize for NER mechanism elucidation.',
  ARRAY['NER', 'excision repair']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'base excision repair',
  '塩基除去修復',
  'Single-character patch / typo fix: a surgical repair for small, non-distorting base modifications — a glycosylase detects and removes the damaged base (deletes the typo), then the AP site is processed and the gap filled with the correct nucleotide (types the correction).',
  'A DNA repair pathway that corrects small, non-helix-distorting base lesions (oxidized bases like 8-oxoguanine, deaminated bases like uracil, alkylated bases). A specific DNA glycosylase recognizes and removes the damaged base, creating an abasic (AP) site. AP endonuclease nicks the backbone, followed by gap filling and ligation (short-patch or long-patch).',
  'The most frequently used DNA repair pathway, handling thousands of lesions per cell per day. OGG1 (8-oxoG glycosylase) and UNG (uracil glycosylase) are well-studied. Tomas Lindahl received the 2015 Nobel Prize for discovering base excision repair.',
  ARRAY['BER', 'base repair']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'homologous recombination',
  '相同組換え',
  'Git merge using a known-good reference branch: repairs double-strand breaks by finding the homologous chromosome (identical branch), aligning sequences, and using it as a template to faithfully restore the damaged region — like resolving a corrupted file by merging from an intact copy.',
  'A high-fidelity DNA repair pathway that repairs double-strand breaks (DSBs) using a homologous DNA sequence (sister chromatid or homologous chromosome) as a template. Involves end resection (MRN complex, CtIP), strand invasion (RAD51 filament formation on ssDNA, facilitated by BRCA2), D-loop formation, DNA synthesis, and resolution of recombination intermediates.',
  'Defects in HR genes (BRCA1, BRCA2, RAD51) predispose to breast, ovarian, and other cancers. PARP inhibitors (olaparib) exploit synthetic lethality in HR-deficient tumors. Also essential for meiotic crossing over.',
  ARRAY['HR', 'homologous recombination repair', 'HRR']
) ON CONFLICT DO NOTHING;
