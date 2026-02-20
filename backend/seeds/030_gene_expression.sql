-- =============================================================================
-- 030_gene_expression.sql
-- BioLexicon seed data: Gene Expression & Regulation
-- Domain: Molecular Biology / Transcription / Translation
-- Terms: 30
-- =============================================================================

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'gene',
  '遺伝子',
  'Function definition in source code: a discrete unit of hereditary information that encodes a specific product (protein or functional RNA), complete with its own promoter (entry point), exons (executable code), and regulatory regions (configuration).',
  'A segment of DNA that contains the information necessary to produce a functional product, typically a protein or a non-coding RNA. Includes coding sequences (exons), non-coding sequences (introns), and regulatory elements (promoters, enhancers). The fundamental unit of heredity.',
  'Central concept in all of biology since Mendel. Human genome contains approximately 20,000-25,000 protein-coding genes. Gene identification is a primary goal of genomics and bioinformatics.',
  ARRAY['genes', 'genetic locus', 'locus']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'transcription',
  '転写',
  'Source code to intermediate representation (IR) compilation: RNA polymerase reads the DNA template and produces an mRNA transcript, analogous to a compiler generating bytecode from source code.',
  'The process by which the enzyme RNA polymerase synthesizes a complementary RNA molecule from a DNA template strand, proceeding in the 5'' to 3'' direction. Involves initiation (promoter binding, open complex formation), elongation (NTP incorporation), and termination (release of transcript). First step of gene expression.',
  'Central to the central dogma. Regulated by transcription factors, enhancers, silencers, and epigenetic modifications. Studied via RNA-seq, GRO-seq, and single-molecule imaging.',
  ARRAY['gene transcription', 'DNA transcription']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'translation',
  '翻訳',
  'Bytecode interpretation / JIT compilation: ribosomes read the mRNA intermediate code and produce the final executable protein, processing codons (opcodes) sequentially with tRNA adapters delivering amino acid operands.',
  'The process by which ribosomes decode messenger RNA (mRNA) to synthesize a polypeptide chain. Transfer RNAs (tRNAs) deliver amino acids matching each codon via anticodon base-pairing. Proceeds through initiation (start codon recognition), elongation (peptide bond formation), and termination (stop codon recognition by release factors).',
  'Second step of the central dogma. Target of many antibiotics in prokaryotes. Studied via ribosome profiling (Ribo-seq), polysome profiling, and cryo-EM structural analysis.',
  ARRAY['protein synthesis', 'mRNA translation']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'mrna',
  'メッセンジャーRNA',
  'Compiled bytecode / build artifact: a temporary, read-only copy of a gene''s instructions that is transported from the nucleus (repository) to ribosomes (runtime), where it is executed and eventually garbage-collected (degraded).',
  'A single-stranded RNA molecule transcribed from a DNA template that carries the coding sequence for a protein. In eukaryotes, mature mRNA is processed with a 5'' 7-methylguanosine cap, 3'' poly-A tail, and has introns removed by splicing. Serves as the template for translation.',
  'Central to gene expression studies. mRNA vaccines (e.g., Pfizer-BioNTech, Moderna COVID-19 vaccines) deliver synthetic mRNA encoding spike protein. Measured by RNA-seq, qRT-PCR, and Northern blot.',
  ARRAY['messenger RNA', 'messenger ribonucleic acid']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'trna',
  'トランスファーRNA',
  'Adapter / interface converter: each tRNA is a specific adapter that maps a three-letter codon (API call) to its corresponding amino acid (implementation), bridging the nucleic acid and protein languages.',
  'A small RNA molecule (73-93 nucleotides) with a characteristic cloverleaf secondary structure and L-shaped tertiary structure. Bears an anticodon that base-pairs with an mRNA codon and carries the corresponding amino acid attached to its 3'' CCA end by aminoacyl-tRNA synthetases.',
  'Essential for the genetic code''s implementation. There are 61 sense codons but only ~45 tRNAs in humans (wobble base-pairing). Studied in the context of codon usage bias and translational regulation.',
  ARRAY['transfer RNA', 'transfer ribonucleic acid']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'rrna',
  'リボソームRNA',
  'Core runtime engine / virtual machine bytecode executor: rRNA is the structural and catalytic core of the ribosome, performing the actual peptide bond formation (it is a ribozyme) — the VM that actually runs the code.',
  'Ribosomal RNA, the most abundant RNA in cells (~80% of total RNA). Forms the structural and catalytic core of ribosomes. The peptidyl transferase center of the large ribosomal subunit (23S rRNA in prokaryotes, 28S in eukaryotes) catalyzes peptide bond formation. rRNA sequences are widely used for phylogenetic classification.',
  'Target of many antibiotics (chloramphenicol, erythromycin). 16S/18S rRNA sequencing is the gold standard for microbial taxonomy and metagenomics. Thomas Cech and Sidney Altman received the 1989 Nobel Prize for RNA catalysis.',
  ARRAY['ribosomal RNA', 'ribosomal ribonucleic acid', '16S rRNA', '18S rRNA', '28S rRNA']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'promoter',
  'プロモーター',
  'Function entry point / main() declaration: the upstream DNA region where RNA polymerase and transcription factors bind to initiate transcription — like the entry point that tells the build system where to start compilation.',
  'A DNA regulatory region located upstream (5'') of a gene''s transcription start site (TSS) where RNA polymerase and general transcription factors assemble to initiate transcription. In eukaryotes, core promoter elements include the TATA box, Inr, DPE, and BRE. In prokaryotes, -10 (Pribnow box) and -35 elements.',
  'Central to gene regulation studies. Promoter analysis is fundamental in bioinformatics. Synthetic promoters are designed in synthetic biology for controlled gene expression.',
  ARRAY['gene promoter', 'promoter region']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'enhancer',
  'エンハンサー',
  'Remote configuration boost / feature flag that amplifies throughput: a distal regulatory element that loops through 3D chromatin space to contact the promoter, dramatically increasing transcription rate — like a CDN node that accelerates delivery regardless of physical distance.',
  'A cis-regulatory DNA element (typically 200-1000 bp) that increases transcription of a target gene when bound by specific transcription factors. Can function over large genomic distances (up to 1 Mb) and in either orientation, brought into proximity with promoters via chromatin looping mediated by cohesin and CTCF.',
  'Identified by enhancer-associated histone marks (H3K4me1, H3K27ac). Studied via ATAC-seq, ChIP-seq, and enhancer reporter assays. Super-enhancers drive expression of cell identity genes and oncogenes.',
  ARRAY['enhancer element', 'transcriptional enhancer', 'super-enhancer']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'silencer',
  'サイレンサー',
  'Kill switch / rate limiter config: a regulatory element that binds repressor proteins to suppress transcription, like a circuit breaker that throttles or blocks specific function calls when activated.',
  'A cis-regulatory DNA element that decreases or abolishes transcription of a target gene when bound by repressor proteins. Can act over variable distances. Functions as the negative counterpart to enhancers in the combinatorial regulation of gene expression.',
  'Less well-characterized than enhancers. Studied in developmental gene regulation (e.g., REST/NRSF silencing of neuronal genes in non-neuronal cells). Relevant to understanding tissue-specific gene expression.',
  ARRAY['silencer element', 'transcriptional silencer']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'rna polymerase',
  'RNAポリメラーゼ',
  'Build engine / compiler process: the core enzyme that reads the DNA template and produces RNA transcripts. Like a makefile executor that processes source files into build artifacts, one nucleotide at a time.',
  'An enzyme that synthesizes RNA from a DNA template in the 5'' to 3'' direction. Prokaryotes have a single RNA polymerase (core enzyme: α2ββ''ω). Eukaryotes have three nuclear RNA polymerases: Pol I (rRNA), Pol II (mRNA, most snRNAs), and Pol III (tRNA, 5S rRNA). Pol II is the primary mRNA-synthesizing polymerase.',
  'Roger Kornberg received the 2006 Nobel Prize for elucidating the molecular basis of eukaryotic transcription by RNA Pol II. Target of rifampicin (bacterial RNAP) and alpha-amanitin (eukaryotic Pol II).',
  ARRAY['RNAP', 'RNA pol', 'RNA polymerase II', 'Pol II']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'ribosome binding site',
  'リボソーム結合部位',
  'Module loader entry address: the specific mRNA sequence where the ribosome docks to begin translation — like the address a class loader uses to locate and initialize an executable module.',
  'The sequence on mRNA where the ribosome assembles to initiate translation. In prokaryotes, the Shine-Dalgarno sequence (5''-AGGAGG-3'') base-pairs with the 16S rRNA 3'' end to position the start codon. In eukaryotes, the 5'' cap-dependent scanning mechanism or internal ribosome entry sites (IRES) serve this function.',
  'Critical for protein expression optimization in biotechnology. Shine-Dalgarno sequence strength affects translation efficiency. Engineered RBS libraries are used in synthetic biology for tuning expression levels.',
  ARRAY['RBS', 'Shine-Dalgarno sequence', 'IRES']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'codon',
  'コドン',
  'Three-byte opcode: a triplet of nucleotide bases that encodes one specific instruction (amino acid) in the genetic programming language, with 64 possible opcodes mapping to 20 amino acids plus stop signals.',
  'A sequence of three consecutive nucleotides in mRNA that specifies a particular amino acid (sense codon) or signals translation termination (stop codon: UAA, UAG, UGA). The genetic code is degenerate (most amino acids are encoded by multiple codons), nearly universal, and non-overlapping.',
  'Foundation of the genetic code, deciphered by Nirenberg, Khorana, and Holley (Nobel Prize 1968). Codon usage bias affects translation efficiency and is exploited in codon optimization for recombinant protein expression.',
  ARRAY['codons', 'triplet code', 'genetic codon']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'anticodon',
  'アンチコドン',
  'Pattern matcher / regex group: the three-nucleotide sequence on tRNA that recognizes and base-pairs with a specific mRNA codon — like a regex capture group that matches its complement to select the correct amino acid handler.',
  'A sequence of three nucleotides on the anticodon loop of a tRNA molecule that is complementary to a specific codon on mRNA. Base-pairing between the codon and anticodon (with wobble allowed at the third position) ensures correct amino acid delivery during translation.',
  'Central to understanding the genetic code and tRNA biology. Wobble base-pairing at the third position (Francis Crick, 1966) explains how fewer tRNAs can decode all 61 sense codons.',
  ARRAY['anticodons']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'start codon',
  '開始コドン',
  'main() function call / program entry point: the AUG triplet that signals the ribosome to begin translation at this precise position, always loading methionine as the first instruction.',
  'The codon AUG (encoding methionine) that signals the initiation of translation. In eukaryotes, the first AUG in a favorable Kozak context (GCC(A/G)CCAUGG) is typically selected as the start codon. In prokaryotes, an AUG (or occasionally GUG/UUG) downstream of the Shine-Dalgarno sequence initiates translation.',
  'Essential for correct open reading frame (ORF) identification. Upstream ORFs (uORFs) with start codons can regulate translation of the main ORF. Relevant to bioinformatics gene prediction.',
  ARRAY['initiation codon', 'AUG']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'stop codon',
  '終止コドン',
  'Return statement / process.exit(): one of three triplets (UAA, UAG, UGA) that signals the ribosome to terminate translation, release the completed polypeptide, and disassemble — like a return statement ending function execution.',
  'One of three codons (UAA/ochre, UAG/amber, UGA/opal) that signal termination of translation. Recognized not by tRNAs but by release factors (RF1, RF2 in prokaryotes; eRF1 in eukaryotes) that trigger hydrolysis of the peptidyl-tRNA bond and release of the completed polypeptide.',
  'Nonsense mutations creating premature stop codons cause truncated proteins and trigger nonsense-mediated mRNA decay (NMD). Stop codon readthrough is exploited by some viruses and is a therapeutic target (e.g., ataluren for Duchenne muscular dystrophy).',
  ARRAY['termination codon', 'nonsense codon', 'UAA', 'UAG', 'UGA']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'exon',
  'エクソン',
  'Executable code block: the portions of a gene that survive the splicing build step and are concatenated into the final mRNA artifact — like production code that ships after dead code elimination.',
  'A segment of a gene that is represented in the mature mRNA after RNA splicing. Exons contain the protein-coding sequence and/or untranslated regions (UTRs). The number and arrangement of exons vary; alternative splicing of exons can produce multiple protein isoforms from a single gene.',
  'Average human gene contains ~8 exons. Alternative exon usage generates proteome diversity (estimated >100,000 protein isoforms from ~20,000 genes). Exon-intron boundaries are defined by splice site sequences (GT-AG rule).',
  ARRAY['exons', 'coding exon']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'intron',
  'イントロン',
  'Dead code / comments removed at build time: non-coding sequences within a gene that are transcribed but spliced out before the mRNA is shipped to production, analogous to debug code stripped during release builds.',
  'A non-coding nucleotide sequence within a gene that is transcribed into precursor mRNA but removed by RNA splicing before translation. Defined by conserved splice site sequences (5'' GU, 3'' AG, branch point A). Introns can contain regulatory elements and can be alternatively spliced.',
  'Discovered by Phillip Sharp and Richard Roberts (Nobel Prize 1993). Introns constitute ~25% of the human genome. Self-splicing introns (Group I, II) are ribozymes and may represent evolutionary precursors of the spliceosome.',
  ARRAY['introns', 'intervening sequence']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'splicing',
  'スプライシング',
  'Build-time dead code elimination + module concatenation: the spliceosome removes intron blocks and joins exon modules into a continuous executable mRNA, with alternative splicing enabling different feature combinations from the same source.',
  'The process of removing introns and joining exons in precursor mRNA to produce mature mRNA. Catalyzed by the spliceosome, a large ribonucleoprotein complex (U1, U2, U4, U5, U6 snRNPs). Alternative splicing generates multiple mRNA isoforms from a single gene by differential inclusion/exclusion of exons.',
  'Over 95% of multi-exon human genes undergo alternative splicing. Splicing defects cause diseases (e.g., spinal muscular atrophy, some cancers). Splice-switching oligonucleotides (e.g., nusinersen for SMA) are FDA-approved therapeutics.',
  ARRAY['RNA splicing', 'pre-mRNA splicing', 'alternative splicing']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  '5'' cap',
  '5''キャップ',
  'Security header / authentication token: a chemical modification at the mRNA 5'' end that authenticates it as a legitimate transcript, protecting it from degradation (garbage collection) and enabling ribosome recognition (request authentication).',
  'A 7-methylguanosine (m7G) linked via a 5''-5'' triphosphate bridge to the first nucleotide of eukaryotic mRNA. Added co-transcriptionally by capping enzymes. Functions in mRNA stability (protection from 5'' exonucleases), nuclear export, splicing of the first intron, and translation initiation (eIF4E binding).',
  'Essential for eukaryotic gene expression. Cap-dependent translation is a regulatory bottleneck. mRNA vaccines use modified caps (e.g., CleanCap technology) for efficient translation.',
  ARRAY['five prime cap', 'm7G cap', '7-methylguanosine cap', 'mRNA cap']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'poly-a tail',
  'ポリAテール',
  'TTL (time-to-live) counter: a string of adenine nucleotides appended to the mRNA 3'' end that gradually shortens with each translation round, determining the transcript''s lifespan — like a countdown timer for cache expiration.',
  'A stretch of 100-250 adenine nucleotides added to the 3'' end of eukaryotic mRNA by poly(A) polymerase after cleavage at the polyadenylation signal (AAUAAA). Functions in mRNA stability (protection from 3'' exonucleases), nuclear export, and translation initiation (PABP-eIF4G interaction). Deadenylation is often the rate-limiting step of mRNA decay.',
  'Poly-A selection is the most common method for enriching mRNA in RNA-seq library preparation. Poly-A tail length regulation is important in early development (cytoplasmic polyadenylation). mRNA vaccines include optimized poly-A tails for stability.',
  ARRAY['polyadenylation', 'poly(A) tail', 'polyA tail']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'transcription factor',
  '転写因子',
  'Configuration parameter / environment variable setter: a protein that binds specific DNA sequences to modulate (activate or repress) gene transcription, like environment variables that configure application behavior at startup.',
  'A protein that binds to specific DNA sequences (cis-regulatory elements) to regulate the rate of transcription. General transcription factors (GTFs: TFIIA, B, D, E, F, H) are required for basal transcription by Pol II. Sequence-specific transcription factors (activators, repressors) bind enhancers/silencers to modulate transcription rates.',
  'Human genome encodes approximately 1,600 transcription factors. Many are oncogenes (MYC, JUN) or tumor suppressors (p53). Master regulators (e.g., Yamanaka factors: Oct4, Sox2, Klf4, c-Myc) can reprogram cell fate.',
  ARRAY['TF', 'transcription factors', 'trans-acting factor']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'tata box',
  'TATAボックス',
  'Standardized function signature / magic number: a conserved promoter motif (TATAAA) that positions the transcription start site precisely, like a magic byte sequence that tells the loader where execution begins.',
  'A conserved AT-rich DNA motif (consensus: TATAAA) located approximately 25-30 bp upstream of the transcription start site in many eukaryotic promoters. Bound by TATA-binding protein (TBP), a subunit of TFIID, to position RNA Pol II for accurate transcription initiation.',
  'Present in approximately 10-20% of human promoters. TATA-less promoters use alternative elements (Inr, DPE, CpG islands). The TATA box was one of the first promoter elements identified (Goldberg-Hogness box).',
  ARRAY['TATA element', 'Goldberg-Hogness box']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'operon',
  'オペロン',
  'Monorepo module / co-deployed microservice bundle: a cluster of functionally related genes under a single promoter that are transcribed as one polycistronic mRNA, ensuring coordinated deployment of related services.',
  'A unit of gene regulation in prokaryotes consisting of a cluster of functionally related structural genes transcribed as a single polycistronic mRNA from a common promoter, regulated by an operator sequence and a regulatory gene encoding a repressor or activator protein.',
  'Operon model proposed by Jacob and Monod (Nobel Prize 1965). Classic examples include lac, trp, and ara operons in E. coli. Operons are rare in eukaryotes (exceptions: C. elegans, Drosophila).',
  ARRAY['operons']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'lac operon',
  'lacオペロン',
  'Feature-flagged lazy-loading module: genes for lactose metabolism are kept OFF by default (repressor bound). Lactose (allolactose) flips the feature flag, and glucose absence (cAMP/CAP) boosts throughput — a classic AND-gate of two environmental conditions.',
  'A gene regulatory unit in E. coli consisting of three structural genes (lacZ, lacY, lacA) for lactose utilization, controlled by the lac promoter, operator, and the lacI repressor gene. Induced by allolactose (derepression) and further activated by cAMP-CAP when glucose is absent (catabolite repression). A paradigm of gene regulation.',
  'The foundational model of gene regulation (Jacob and Monod, 1961). Used extensively in molecular biology education and as a tool in biotechnology (lacZ as a reporter gene, IPTG as a synthetic inducer).',
  ARRAY['lactose operon', 'lac operon model']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'gene regulation',
  '遺伝子制御',
  'Comprehensive DevOps configuration management: the multi-layered system controlling when, where, and how much of each gene product is made — spanning infrastructure (chromatin), build config (transcription), post-processing (splicing/mRNA stability), and runtime (translation/protein stability).',
  'The mechanisms by which cells control the expression of genes, occurring at multiple levels: chromatin remodeling (epigenetic), transcriptional (promoters, enhancers, transcription factors), post-transcriptional (splicing, mRNA stability, miRNA), translational (ribosome recruitment, uORFs), and post-translational (protein modification, degradation).',
  'Central to developmental biology (cell differentiation), disease (cancer, genetic disorders), and biotechnology. Studied by a wide array of techniques including RNA-seq, ChIP-seq, ATAC-seq, and CRISPR screens.',
  ARRAY['gene expression regulation', 'transcriptional regulation']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'epigenetics',
  'エピジェネティクス',
  'Runtime configuration without source code changes: heritable changes in gene expression that alter program behavior (phenotype) without modifying the underlying codebase (DNA sequence) — like OS-level environment variables that persist across reboots (cell divisions).',
  'The study of heritable changes in gene expression that do not involve alterations to the DNA sequence. Major epigenetic mechanisms include DNA methylation (CpG), histone post-translational modifications (acetylation, methylation, phosphorylation), and non-coding RNA-mediated regulation. These modifications are largely reversible and can be influenced by environment.',
  'Rapidly expanding field bridging genetics and environment. Relevant to cancer (epigenetic silencing of tumor suppressors), development (X-inactivation, imprinting), aging, and transgenerational inheritance. Epigenetic drugs (DNMT inhibitors, HDAC inhibitors) are FDA-approved for certain cancers.',
  ARRAY['epigenetic regulation', 'epigenome']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'histone',
  'ヒストン',
  'Spool / data compression unit: small, positively charged proteins around which DNA winds like thread on a spool. Post-translational modifications on histone tails act as metadata tags that control data access permissions (gene expression).',
  'Small, highly conserved basic proteins (H2A, H2B, H3, H4, and linker histone H1) that package and organize eukaryotic DNA into nucleosomes. An octamer of core histones (2 each of H2A, H2B, H3, H4) wraps ~147 bp of DNA. Histone N-terminal tails are subject to extensive post-translational modifications (the "histone code") that regulate chromatin structure and gene expression.',
  'Central to epigenetics. The histone code hypothesis (Strahl and Allis, 2000) proposes that combinations of modifications dictate chromatin state. Histone variants (H2A.Z, H3.3, CENP-A) have specialized functions.',
  ARRAY['histones', 'histone protein', 'core histone', 'histone octamer']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'methylation',
  'メチル化',
  'Permission flag / access control bit: adding a methyl group to DNA or histones is like setting a file permission bit — DNA methylation at CpG sites typically sets the "read-only" flag (silencing), while histone methylation can either grant or revoke access depending on the position.',
  'The addition of a methyl group (-CH3) to a molecule. In epigenetics, DNA methylation occurs primarily at the 5-position of cytosine in CpG dinucleotides, catalyzed by DNA methyltransferases (DNMT1, DNMT3A, DNMT3B). Histone methylation occurs on lysine and arginine residues. DNA methylation at promoter CpG islands generally correlates with transcriptional silencing.',
  'Key epigenetic mark. Aberrant DNA methylation is a hallmark of cancer (global hypomethylation, promoter hypermethylation of tumor suppressors). DNMT inhibitors (azacitidine, decitabine) are used in MDS and AML treatment. Studied via bisulfite sequencing, RRBS, and WGBS.',
  ARRAY['DNA methylation', 'histone methylation', 'CpG methylation']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'acetylation',
  'アセチル化',
  'Unlock / chmod +r: adding acetyl groups to histone lysines neutralizes their positive charge, loosening DNA wrapping and opening the chromatin for reading — like granting read access to a previously locked file.',
  'The addition of an acetyl group (-COCH3) to a molecule. Histone acetylation, catalyzed by histone acetyltransferases (HATs), occurs on lysine residues of histone tails, neutralizing positive charges and weakening histone-DNA interactions. This results in open chromatin (euchromatin) and is generally associated with transcriptional activation. Removed by histone deacetylases (HDACs).',
  'H3K27ac is a hallmark of active enhancers and promoters. HDAC inhibitors (vorinostat, romidepsin) are FDA-approved anti-cancer drugs. Studied via ChIP-seq with acetylation-specific antibodies.',
  ARRAY['histone acetylation', 'lysine acetylation']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'chromatin remodeling',
  'クロマチンリモデリング',
  'Dynamic resource allocation / hot reconfiguration: ATP-dependent complexes that reposition, eject, or restructure nucleosomes in real time — like a container orchestrator that dynamically reallocates resources to expose or shield specific genomic regions.',
  'The ATP-dependent alteration of chromatin structure by specialized multi-subunit complexes (SWI/SNF, ISWI, CHD, INO80 families) that slide, eject, or restructure nucleosomes to regulate access to DNA for transcription, replication, and repair. These complexes use the energy of ATP hydrolysis to disrupt histone-DNA contacts.',
  'SWI/SNF complex mutations are found in ~20% of human cancers, making it one of the most frequently mutated complexes in cancer. Relevant to developmental biology and stem cell maintenance.',
  ARRAY['chromatin remodeling complex', 'nucleosome remodeling', 'SWI/SNF', 'ATP-dependent chromatin remodeling']
) ON CONFLICT DO NOTHING;
