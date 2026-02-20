-- =============================================================================
-- 070_molecular_biology.sql
-- BioLexicon seed data: Molecular Biology Fundamentals & Techniques
-- Domain: Molecular Biology / Biotechnology
-- Terms: 25
-- =============================================================================

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'dna',
  'DNA',
  'Source code repository: the master codebase stored as a double-stranded helical polymer, encoding all instructions for building and operating the organism. Like Git, it supports branching (recombination), versioning (mutations over generations), and distributed copies (in every cell).',
  'Deoxyribonucleic acid, a double-stranded helical polymer composed of deoxyribonucleotide monomers (dAMP, dTMP, dGMP, dCMP) linked by 3''-5'' phosphodiester bonds. The two antiparallel strands are held together by hydrogen bonds between complementary bases (A-T, G-C). Carries genetic information in the sequence of bases. Total human genome: ~3.2 billion base pairs across 23 chromosome pairs.',
  'Watson and Crick (with Franklin and Wilkins) determined the double helix structure (1953, Nobel Prize 1962). The foundation of genetics, genomics, forensics, and biotechnology. Human Genome Project completed the reference sequence in 2003.',
  ARRAY['deoxyribonucleic acid']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'rna',
  'RNA',
  'Versatile intermediate code / scripting language: single-stranded nucleic acid that serves multiple roles — mRNA (compiled bytecode), tRNA (adapter), rRNA (runtime engine), and regulatory RNAs (config scripts) — more flexible and diverse than the DNA master repository.',
  'Ribonucleic acid, a single-stranded polymer of ribonucleotides (AMP, UMP, GMP, CMP) linked by 3''-5'' phosphodiester bonds. Unlike DNA, contains ribose (not deoxyribose) and uracil (not thymine). Functions as mRNA (protein coding), tRNA (amino acid adapter), rRNA (ribosome component), and regulatory RNA (miRNA, siRNA, lncRNA, circRNA). Can form complex secondary and tertiary structures and possess catalytic activity (ribozymes).',
  'The RNA world hypothesis proposes RNA preceded DNA and proteins in early life. RNA-based therapeutics (mRNA vaccines, siRNA drugs like patisiran, ASOs like nusinersen) are transforming medicine. RNA-seq is a primary tool for transcriptomics.',
  ARRAY['ribonucleic acid']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'protein',
  'タンパク質',
  'Compiled executable / running program: the functional end-product of gene expression that performs the cell''s actual work — enzymes (functions), structural proteins (framework), transporters (I/O handlers), receptors (API endpoints), and motors (actuators). The cell''s entire operational machinery.',
  'A macromolecule composed of one or more polypeptide chains, each consisting of amino acids linked by peptide bonds. Proteins fold into specific three-dimensional structures determined by their amino acid sequence (Anfinsen''s dogma) and perform virtually all cellular functions: catalysis (enzymes), structure (collagen, keratin), transport (hemoglobin), signaling (hormones, receptors), defense (antibodies), and movement (myosin, kinesin).',
  'Human proteome estimated at >20,000 distinct proteins with >100,000 isoforms. AlphaFold (DeepMind, 2021) revolutionized protein structure prediction. Proteomics studies the global protein complement. Protein engineering and directed evolution (Frances Arnold, Nobel Prize 2018) are major biotechnology applications.',
  ARRAY['proteins', 'polypeptide']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'amino acid',
  'アミノ酸',
  'Character in the protein alphabet / instruction set opcode: one of 20 standard building blocks that are strung together in specific sequences to create functional proteins — like the 20 basic opcodes from which all protein programs are composed.',
  'An organic molecule containing an amino group (-NH2), a carboxyl group (-COOH), a hydrogen atom, and a variable side chain (R group) bonded to a central alpha-carbon. The 20 standard amino acids are encoded by the genetic code and polymerized into proteins via peptide bonds during translation. Classified by side chain properties: nonpolar, polar, positively charged, and negatively charged.',
  'Nine are essential (must be obtained from diet) in humans. Amino acids are also precursors of neurotransmitters, hormones, and other bioactive molecules. Studied by protein chemistry, mass spectrometry, and crystallography.',
  ARRAY['amino acids', 'AA', 'residue']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'nucleotide',
  'ヌクレオチド',
  'Single character / byte in the genetic code: the monomer unit of DNA and RNA, consisting of a base (information bit), sugar (backbone connector), and phosphate (structural linker) — the fundamental data unit of the genetic information system.',
  'The monomer unit of nucleic acids, consisting of a nitrogenous base (purine: adenine, guanine; pyrimidine: cytosine, thymine/uracil), a pentose sugar (deoxyribose in DNA, ribose in RNA), and one or more phosphate groups. Nucleotides are linked by 3''-5'' phosphodiester bonds to form polynucleotide chains. Also function as energy carriers (ATP, GTP), coenzymes (NAD+, FAD, CoA), and signaling molecules (cAMP, cGMP).',
  'Central to molecular biology, biochemistry, and pharmacology. Nucleotide analogs are major drug classes: antivirals (acyclovir, remdesivir), anticancer (5-FU, gemcitabine), and immunosuppressants (azathioprine).',
  ARRAY['nucleotides', 'nt']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'base pair',
  '塩基対',
  'Complementary key-value binding: A pairs with T (or U), G pairs with C, forming the hydrogen-bonded "rungs" of the DNA ladder — like key-value pairs where each key has exactly one valid matching value, ensuring data integrity through complementarity.',
  'A pair of complementary nitrogenous bases held together by hydrogen bonds in double-stranded nucleic acids. In DNA: adenine pairs with thymine (2 hydrogen bonds, A-T) and guanine pairs with cytosine (3 hydrogen bonds, G-C). In RNA: adenine pairs with uracil (A-U). Base pairing is the foundation of DNA structure, replication, and information transfer. The unit "base pair" (bp) measures DNA/RNA length.',
  'Chargaff''s rules (A=T, G=C) provided crucial evidence for the Watson-Crick model. GC-rich regions are more thermostable. Mismatched base pairs are detected by proofreading and mismatch repair. The human genome is ~3.2 Gbp.',
  ARRAY['bp', 'base pairs', 'Watson-Crick base pair']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'double helix',
  '二重らせん',
  'Twisted-pair cable / redundant RAID-1 storage: two complementary strands wound around each other in a helix, providing structural stability and data redundancy — if one strand is damaged, the other serves as a recovery template, like RAID-1 mirroring.',
  'The three-dimensional structure of B-form DNA described by Watson and Crick (1953), consisting of two antiparallel polynucleotide chains wound around a common axis in a right-handed helix with ~10.5 base pairs per turn and a diameter of ~2 nm. The hydrophobic bases stack on the interior; the sugar-phosphate backbone faces outward. Features major and minor grooves where proteins bind.',
  'One of the most iconic structures in biology. Watson, Crick, and Wilkins received the 1962 Nobel Prize; Rosalind Franklin''s X-ray diffraction data (Photo 51) was crucial. Alternative forms: A-DNA (right-handed, compact), Z-DNA (left-handed).',
  ARRAY['DNA double helix', 'B-form DNA']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'central dogma',
  'セントラルドグマ',
  'Software build pipeline: DNA (source code) → RNA (compiled bytecode via transcription) → Protein (running executable via translation). Information flows in one direction through defined compilation stages, with no reverse compilation from protein back to DNA under normal conditions.',
  'The principle, articulated by Francis Crick (1958, 1970), describing the flow of genetic information in biological systems: DNA → RNA → Protein. DNA is transcribed to mRNA, which is translated to protein. DNA can also be replicated (DNA → DNA). Exceptions include reverse transcription (RNA → DNA, by retroviruses and retrotransposons) and RNA replication (RNA → RNA, by some RNA viruses). The dogma states that information transfer from protein back to nucleic acid does not occur.',
  'Foundational concept in molecular biology. The discovery of reverse transcriptase (Howard Temin, David Baltimore, Nobel Prize 1975) expanded but did not overturn the dogma. Prions (protein-only infectious agents) challenge some interpretations.',
  ARRAY['central dogma of molecular biology']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'gene expression',
  '遺伝子発現',
  'Code execution / deployment: the complete process of converting a gene''s information into a functional product — from reading the source (transcription), processing the build (RNA processing), to running the executable (translation) and post-deployment configuration (post-translational modification).',
  'The process by which information encoded in a gene is used to synthesize a functional gene product (protein or functional RNA). Encompasses transcription, RNA processing (capping, splicing, polyadenylation), mRNA export, translation, and post-translational modification. Regulated at multiple levels to ensure appropriate temporal, spatial, and quantitative expression.',
  'Gene expression profiling (RNA-seq, microarrays) is fundamental to genomics research and clinical applications (molecular subtyping of cancers). Differential gene expression analysis identifies disease biomarkers and drug targets.',
  ARRAY['gene expression profiling', 'expression']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'mutation',
  '変異',
  'Bug / code change: any alteration to the DNA sequence — some are harmless (silent mutations = no-op changes), some break functionality (loss-of-function = crash bugs), and some gain new behavior (gain-of-function = feature additions or security vulnerabilities).',
  'A permanent alteration in the nucleotide sequence of DNA. Types include substitutions (transitions, transversions), insertions, deletions, and chromosomal rearrangements. Can be silent (synonymous), missense (amino acid change), nonsense (premature stop), or frameshift. Arise from replication errors, DNA damage, or mobile genetic elements. May be germline (heritable) or somatic.',
  'Mutations are the raw material for evolution and the cause of genetic diseases and cancer. Mutational signatures reveal the etiology of cancer genomes (COSMIC database). Targeted mutation analysis is central to precision medicine.',
  ARRAY['mutations', 'genetic mutation', 'DNA mutation']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'point mutation',
  '点変異',
  'Single-character typo: a change of exactly one nucleotide — like a single-character bug that may be silent (synonym substitution), cause a subtle behavioral change (missense), or crash the program entirely (nonsense/stop).',
  'A mutation affecting a single nucleotide, either a substitution (transition: purine↔purine or pyrimidine↔pyrimidine; transversion: purine↔pyrimidine) or a single-base insertion/deletion. Substitutions can be silent/synonymous, missense (different amino acid), or nonsense (premature stop codon). The most common type of mutation.',
  'Sickle cell disease results from a single point mutation in the beta-globin gene (E6V). Oncogenic driver mutations are often point mutations (e.g., BRAF V600E, KRAS G12D). Identified by Sanger sequencing, targeted sequencing panels, or whole-genome sequencing.',
  ARRAY['point mutations', 'single nucleotide substitution', 'SNV']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'insertion',
  '挿入',
  'Code insertion / extra line added: one or more nucleotides are added to the DNA sequence — if not a multiple of 3, it shifts the reading frame downstream (like adding an extra character in a fixed-width protocol, corrupting all subsequent data parsing).',
  'A type of mutation in which one or more nucleotides are added to the DNA sequence. Small insertions (1-50 bp) can cause frameshifts if not multiples of 3 within a coding region. Larger insertions include transposable element insertions, viral integrations, and segmental duplications. Can be detected by sequencing, PCR fragment analysis, or array CGH.',
  'Insertional mutagenesis by retroviruses or transposons can activate oncogenes or disrupt tumor suppressors. Insertions and deletions (indels) are the second most common variant type after SNVs in human genomes.',
  ARRAY['insertions', 'nucleotide insertion', 'indel']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'deletion',
  '欠失',
  'Code deletion / dropped line: one or more nucleotides are removed from the sequence — if not a multiple of 3 in a coding region, it causes a frameshift that garbles all downstream translation (like removing a byte from a binary protocol stream).',
  'A type of mutation in which one or more nucleotides are removed from the DNA sequence. Small deletions (1-50 bp) can cause frameshifts. Large deletions can remove entire exons, genes, or chromosomal segments. Examples: the 3-bp deletion in CFTR (ΔF508) causes cystic fibrosis; large deletions in the DMD gene cause Duchenne muscular dystrophy.',
  'The most common CFTR mutation (ΔF508) is a 3-bp deletion removing phenylalanine at position 508. Copy number variations (CNVs) include large deletions and are associated with neurodevelopmental disorders and cancer.',
  ARRAY['deletions', 'nucleotide deletion', 'gene deletion']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'frameshift mutation',
  'フレームシフト変異',
  'Off-by-one error in a fixed-width parser: an insertion or deletion that is not a multiple of 3 shifts the entire reading frame, causing every downstream codon to be misread — like a deserialization error where the byte offset shifts, corrupting all subsequent field parsing.',
  'A mutation caused by insertions or deletions of nucleotides not divisible by three within a coding region, shifting the translational reading frame. This alters all downstream codons, typically producing a truncated, non-functional protein due to encounter of a premature stop codon. Among the most deleterious types of mutations.',
  'Frameshift mutations are common in DNA mismatch repair-deficient (MSI-high) cancers. The reading frame concept was established by Crick et al. (1961). Frameshift variants are typically classified as loss-of-function mutations.',
  ARRAY['frameshift', 'reading frame shift']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'pcr',
  'PCR',
  'Exponential data amplification / replication loop: a thermal cycling protocol that repeatedly denatures (unzip), anneals primers (address lookup), and extends (copy) a target DNA region, doubling the copies each cycle — like a for-loop that doubles an array''s content 30 times, yielding ~10^9 copies from a single template.',
  'Polymerase Chain Reaction, an in vitro technique for exponential amplification of a specific DNA sequence. Uses thermal cycling: denaturation (~95C, strand separation), annealing (~50-65C, primer binding), and extension (~72C, DNA polymerase synthesis). Each cycle doubles the target, yielding ~2^n copies after n cycles. Requires template DNA, two oligonucleotide primers, thermostable DNA polymerase (Taq), dNTPs, and buffer with Mg2+.',
  'Invented by Kary Mullis (Nobel Prize 1993). Revolutionized molecular biology, diagnostics, forensics, and genomics. Variants include RT-PCR, qPCR, digital PCR, and multiplex PCR. Foundation of COVID-19 diagnostic testing.',
  ARRAY['polymerase chain reaction']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'gel electrophoresis',
  'ゲル電気泳動',
  'Sorting/filtering by size: DNA, RNA, or protein fragments are separated through a porous gel matrix by an electric field — smaller fragments migrate faster, like packets being sorted through a network filter where smaller payloads pass through faster.',
  'A technique for separating macromolecules (DNA, RNA, proteins) based on size (and charge) by migration through a porous gel matrix (agarose for nucleic acids, polyacrylamide for proteins/small DNA) under an applied electric field. Nucleic acids (uniformly negatively charged) migrate toward the anode at rates inversely proportional to size. Visualized by staining (ethidium bromide for DNA, Coomassie/silver stain for proteins).',
  'Fundamental laboratory technique. SDS-PAGE separates proteins by molecular weight. Agarose gels assess PCR products and restriction digests. Capillary electrophoresis is used in Sanger sequencing and fragment analysis. Pulsed-field gel electrophoresis (PFGE) separates very large DNA molecules.',
  ARRAY['electrophoresis', 'agarose gel electrophoresis', 'SDS-PAGE']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'restriction enzyme',
  '制限酵素',
  'Regular expression pattern matcher + string cutter: an enzyme that recognizes a specific DNA sequence pattern (regex) and cleaves the double-stranded DNA at or near that pattern — the molecular biology equivalent of string.split() with a specific delimiter.',
  'Bacterial endonucleases (restriction endonucleases) that recognize specific palindromic DNA sequences (typically 4-8 bp, called restriction sites) and cleave both strands of the double helix. Type II restriction enzymes (most commonly used in lab) cut at defined positions within or adjacent to the recognition sequence, producing blunt or sticky (cohesive) ends. Naturally function as a bacterial immune defense against bacteriophages.',
  'Werner Arber, Daniel Nathans, and Hamilton Smith received the 1978 Nobel Prize for restriction enzymes. Foundation of recombinant DNA technology and molecular cloning. Over 4,000 restriction enzymes are known, with ~600 commercially available.',
  ARRAY['restriction endonuclease', 'restriction enzymes', 'RE']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'plasmid',
  'プラスミド',
  'Plugin module / sidecar process with independent configuration: a small, self-replicating circular DNA that carries optional features (antibiotic resistance genes) and can be loaded into or transferred between cells — like a plugin or extension that adds capabilities to a host application.',
  'A small, circular, extrachromosomal DNA molecule that replicates independently of the chromosomal DNA. Found naturally in bacteria, carrying genes for antibiotic resistance, virulence factors, or metabolic functions. Widely used in molecular biology as cloning vectors (engineered with multiple cloning sites, selectable markers, and origins of replication) for gene cloning and protein expression.',
  'Backbone of recombinant DNA technology. Common lab plasmids: pBR322, pUC19, pET series (expression), pGEM (cloning). Plasmid-mediated antibiotic resistance is a major public health concern. R plasmids, F plasmids, and Ti plasmids have distinct biological roles.',
  ARRAY['plasmids', 'cloning vector']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'vector',
  'ベクター',
  'Package manager / deployment vehicle: a DNA molecule used to carry a foreign gene insert into a host cell — like a package manager that delivers and installs new code modules into a target environment (npm install, pip install).',
  'A DNA molecule used as a vehicle to artificially carry foreign genetic material into another cell for replication and/or expression. Types include plasmids (small inserts, <15 kb), bacteriophage vectors (lambda, M13), cosmids (~45 kb), BACs (bacterial artificial chromosomes, 100-300 kb), YACs (yeast artificial chromosomes, up to 2 Mb), and viral vectors (lentivirus, AAV, adenovirus for gene therapy).',
  'Vector choice depends on insert size and application. Viral vectors (AAV, lentivirus) are used in gene therapy (Luxturna, Zolgensma). Expression vectors contain promoters for protein production. Gateway and Gibson assembly have modernized vector construction.',
  ARRAY['cloning vector', 'expression vector', 'vectors']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cloning',
  'クローニング',
  'Copy-paste + deploy: the process of isolating a specific gene (copying a module), inserting it into a vector (packaging it), transforming it into a host cell (deploying to a server), and selecting successful transformants (verifying the deployment).',
  'The process of creating copies of a specific DNA fragment (molecular/gene cloning) or an entire organism (reproductive cloning). In molecular cloning: (1) isolate or synthesize the target DNA, (2) ligate into a vector (cut with restriction enzymes or assembled via Gibson/Golden Gate), (3) transform into host cells (E. coli), (4) select and screen for correct clones. DNA cloning produces unlimited copies of a gene for study or protein expression.',
  'Foundation of biotechnology since Cohen and Boyer''s recombinant DNA experiments (1973). Gateway cloning, Gibson assembly, and Golden Gate assembly are modern high-throughput cloning methods. Distinct from reproductive cloning (Dolly the sheep, 1996).',
  ARRAY['molecular cloning', 'gene cloning', 'DNA cloning']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'crispr',
  'CRISPR',
  'Find-and-replace / sed command for genomes: a programmable molecular tool where a guide RNA (search pattern/regex) directs the Cas9 nuclease (editor) to a specific genomic location, enabling precise cuts, deletions, or replacements — the ultimate genome IDE.',
  'Clustered Regularly Interspaced Short Palindromic Repeats, a prokaryotic adaptive immune system repurposed as a revolutionary genome editing tool. CRISPR-Cas9 uses a guide RNA (sgRNA) complementary to a target DNA sequence to direct the Cas9 endonuclease to create a double-strand break at a precise genomic location. Repair by NHEJ (error-prone, for knockouts) or HDR (precise editing with donor template) enables targeted genome modification.',
  'Jennifer Doudna and Emmanuelle Charpentier received the 2020 Nobel Prize for CRISPR-Cas9 development. Applications span gene therapy (sickle cell disease: Casgevy/exagamglogene), agriculture, functional genomics (CRISPR screens), diagnostics (SHERLOCK, DETECTR), and epigenome editing (CRISPRa, CRISPRi). Base editors and prime editors offer nuclease-free precision editing.',
  ARRAY['CRISPR-Cas9', 'CRISPR-Cas', 'genome editing tool']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'gene editing',
  'ゲノム編集',
  'Live-patching production code: making precise, targeted changes to the genome of living cells — like hot-patching a running application in production, with CRISPR as the primary IDE and ZFNs/TALENs as legacy editors.',
  'The deliberate modification of an organism''s DNA at a specific genomic locus using engineered nucleases. Technologies include CRISPR-Cas9 (most widely used), zinc finger nucleases (ZFNs), transcription activator-like effector nucleases (TALENs), and meganucleases. Applications include gene knockout, correction of disease-causing mutations, gene insertion, and regulatory element modification. Can be performed ex vivo (cells removed, edited, returned) or in vivo (editing within the body).',
  'First FDA-approved CRISPR therapy: Casgevy (exagamglogene autotemcel) for sickle cell disease and transfusion-dependent beta-thalassemia (2023). Ethical debates surround germline editing (He Jiankui controversy, 2018). Somatic gene editing is widely pursued for genetic diseases, cancer, and infectious diseases.',
  ARRAY['genome editing', 'gene modification', 'CRISPR editing']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'southern blot',
  'サザンブロット',
  'Grep for DNA: a technique that searches for a specific DNA sequence within a complex mixture — like running grep with a labeled probe pattern against genomic DNA fragments separated by size, returning the matching bands.',
  'A molecular biology technique for detecting a specific DNA sequence in a complex mixture. DNA is digested with restriction enzymes, separated by agarose gel electrophoresis, transferred (blotted) to a membrane (nitrocellulose or nylon), and hybridized with a labeled complementary probe. Named after Edwin Southern who invented it in 1975.',
  'Classic technique for detecting gene rearrangements, copy number changes, and transgene integration. Largely superseded by PCR and NGS for most applications but remains important for transgene copy number analysis and certain clinical tests.',
  ARRAY['Southern blotting', 'Southern hybridization']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'northern blot',
  'ノーザンブロット',
  'Grep for RNA: analogous to Southern blot but searches for specific RNA transcripts — like running grep against the cell''s active mRNA inventory to detect whether a particular gene is being expressed and at what level.',
  'A technique for detecting specific RNA molecules in a mixture. RNA is separated by denaturing gel electrophoresis, transferred to a membrane, and hybridized with a labeled complementary probe. Allows detection of transcript size, abundance, and splice variants. Named by analogy to the Southern blot (a molecular biology naming joke).',
  'Provides information about both transcript size and abundance that RNA-seq and RT-qPCR do not easily provide simultaneously. Largely replaced by RT-qPCR and RNA-seq for routine gene expression analysis but still used for validating transcript size and alternative splicing.',
  ARRAY['Northern blotting', 'Northern hybridization', 'RNA blot']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'western blot',
  'ウエスタンブロット',
  'Grep for proteins: detects specific proteins using antibodies as search probes — like running a targeted search against the cell''s protein inventory using highly specific pattern matchers (antibodies) to verify that the compiled executable (protein) is present and the correct size.',
  'A technique for detecting specific proteins in a complex mixture. Proteins are separated by SDS-PAGE (by molecular weight), transferred to a membrane (PVDF or nitrocellulose), blocked, and probed with a primary antibody specific to the target protein, followed by a secondary antibody conjugated to an enzyme (HRP, AP) or fluorophore for detection. Named by analogy to Southern and Northern blots.',
  'Gold standard for protein detection and semi-quantification. Used extensively in research (confirming gene knockdown/knockout, checking signaling pathway activation) and diagnostics (HIV Western blot confirmatory test, now replaced by 4th-gen immunoassays). Enhanced chemiluminescence (ECL) is the most common detection method.',
  ARRAY['Western blotting', 'immunoblot', 'protein blot']
) ON CONFLICT DO NOTHING;
