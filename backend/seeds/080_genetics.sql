-- =============================================================================
-- 080_genetics.sql
-- BioLexicon seed data: Genetics & Genomics
-- Domain: Genetics / Population Genetics / Genomics
-- Terms: 20
-- =============================================================================

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'genome',
  'ゲノム',
  'Complete codebase / monorepo: the entire set of genetic instructions contained in an organism — every repository, every module, every config file — including coding regions, regulatory sequences, and repetitive elements.',
  'The complete set of genetic material (DNA) in an organism, including all genes, regulatory sequences, and non-coding DNA. The human genome comprises approximately 3.2 billion base pairs across 23 pairs of chromosomes (22 autosomal + XY/XX), plus the 16.6 kb mitochondrial genome. Contains ~20,000-25,000 protein-coding genes (representing ~1.5% of total DNA), with the remainder consisting of regulatory elements, repetitive sequences, and sequences of unknown function.',
  'Human Genome Project (1990-2003) produced the first reference genome. Telomere-to-Telomere (T2T) consortium completed the first gap-free human genome in 2022. Genomics encompasses genome sequencing, annotation, and comparative analysis across species.',
  ARRAY['genomes', 'genetic material']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'genotype',
  '遺伝子型',
  'Source code / configuration: the actual genetic code (allele combination) at a specific locus — the underlying instructions that may or may not manifest as observable features, depending on dominance, environment, and epistasis.',
  'The genetic constitution of an organism, specifically the combination of alleles at a particular locus or set of loci. Represented using allele symbols (e.g., Bb for a heterozygous genotype at the B locus). The genotype, together with environmental factors and stochastic effects, determines the phenotype. Assessed by DNA sequencing, genotyping arrays, or molecular markers.',
  'Genotype-phenotype correlation is a central goal of genetics and precision medicine. Genotyping arrays (Illumina, Affymetrix) enable large-scale genotyping for GWAS. Direct-to-consumer genetic testing (23andMe) reports genotypes for health and ancestry traits.',
  ARRAY['genotypes', 'genetic constitution']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'phenotype',
  '表現型',
  'Runtime behavior / observable output: the actual observable characteristics produced when the genotype (source code) is executed in a particular environment — like the user-facing behavior of an application that depends on both the code and the runtime environment.',
  'The observable physical, biochemical, or behavioral characteristics of an organism, resulting from the interaction of its genotype with the environment. Phenotypes range from molecular (enzyme activity) to cellular (cell morphology) to organismal (height, eye color, disease susceptibility). A single genotype can produce different phenotypes in different environments (phenotypic plasticity).',
  'Phenotyping is increasingly important in precision medicine (deep phenotyping) and crop improvement. The phenotype gap (our ability to read genomes far exceeds our ability to predict phenotypes) is a major challenge. Model organisms enable systematic genotype-phenotype mapping.',
  ARRAY['phenotypes', 'trait']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'allele',
  '対立遺伝子',
  'Version / branch variant: different versions of the same gene at a given locus — like alternative implementations (branches) of the same function, where diploid organisms carry two copies (one from each parent fork).',
  'One of two or more variant forms of a gene at a particular locus on a chromosome. Different alleles arise through mutation and may produce different phenotypic effects. In diploid organisms, each individual carries two alleles per autosomal locus (one from each parent). Alleles can be dominant, recessive, or codominant. The wild-type allele is the most common form in a population.',
  'Allele frequencies are the foundation of population genetics. Allelic heterogeneity (different mutations in the same gene causing the same disease) is common in genetic disorders. Pharmacogenomic alleles (e.g., CYP2D6 variants) influence drug metabolism.',
  ARRAY['alleles', 'gene variant']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'dominant',
  '優性',
  'Override / higher-priority configuration: a dominant allele''s phenotype masks the recessive allele''s effect in a heterozygote — like a higher-priority CSS rule or environment variable that overrides the default value.',
  'A pattern of inheritance in which one allele (dominant) expresses its phenotype in the heterozygous state, masking the effect of the other allele (recessive). Only one copy of the dominant allele is needed for phenotypic expression. Dominant traits appear in every generation when present. Autosomal dominant disorders (e.g., Huntington disease, Marfan syndrome) require only one mutant allele.',
  'Dominance is a property of the phenotype, not the allele itself (molecular mechanisms include haploinsufficiency, gain-of-function, and dominant-negative effects). Incomplete dominance (blending) and codominance (both expressed) are additional patterns.',
  ARRAY['dominant allele', 'dominant trait', 'autosomal dominant']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'recessive',
  '劣性',
  'Default / fallback configuration: the recessive allele''s phenotype is only expressed when no dominant override is present (homozygous state) — like a default CSS value that only applies when no higher-priority rule exists.',
  'A pattern of inheritance in which an allele''s phenotype is expressed only in the homozygous state, being masked by a dominant allele in heterozygotes. Carriers (heterozygotes) are phenotypically unaffected but can transmit the allele to offspring. Autosomal recessive disorders (e.g., cystic fibrosis, sickle cell disease, PKU) require two copies of the mutant allele.',
  'Carrier frequency is an important concept in genetic counseling (e.g., ~1/25 Caucasians carry a CFTR mutation). Consanguinity increases the risk of autosomal recessive disorders. Carrier screening panels test for common recessive disease alleles.',
  ARRAY['recessive allele', 'recessive trait', 'autosomal recessive']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'homozygous',
  'ホモ接合',
  'Identical configurations on both nodes: both allele copies at a locus are the same — like a redundant system where both backup instances run the same version of the code.',
  'Having two identical alleles at a particular genetic locus on homologous chromosomes. An organism can be homozygous dominant (AA), homozygous recessive (aa), or homozygous for any allele. Homozygous individuals breed true for the trait associated with that allele. Homozygosity across the genome (runs of homozygosity) can indicate consanguinity or population bottlenecks.',
  'Homozygosity mapping is used to identify recessive disease genes in consanguineous families. Loss of heterozygosity (LOH) in tumors can unmask recessive tumor suppressor mutations. Inbreeding increases homozygosity.',
  ARRAY['homozygote', 'homozygosity']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'heterozygous',
  'ヘテロ接合',
  'Mixed configurations / version mismatch: the two allele copies differ — like a system running two different versions of the same module, where the phenotypic outcome depends on which version takes priority (dominance relationship).',
  'Having two different alleles at a particular genetic locus on homologous chromosomes. Heterozygotes express the dominant allele''s phenotype in complete dominance, an intermediate phenotype in incomplete dominance, or both alleles'' phenotypes in codominance. Heterozygosity provides genetic diversity and can confer selective advantage (heterozygote advantage, e.g., sickle cell trait and malaria resistance).',
  'Carriers of autosomal recessive disorders are heterozygotes. Compound heterozygosity (two different mutant alleles) can cause recessive disease. Heterozygosity is a measure of genetic diversity in populations.',
  ARRAY['heterozygote', 'heterozygosity', 'carrier']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'mendelian inheritance',
  'メンデル遺伝',
  'Deterministic inheritance rules / single-variable configuration: predictable inheritance patterns following simple rules — like a configuration system where each setting is controlled by a single variable with clear priority rules (dominant > recessive).',
  'Patterns of inheritance that follow Gregor Mendel''s laws: (1) Law of Segregation — two alleles for each trait separate during gamete formation, with each gamete receiving one allele; (2) Law of Independent Assortment — genes on different chromosomes assort independently during meiosis. Applies to traits controlled by a single gene with clear dominant/recessive relationships. Autosomal dominant, autosomal recessive, X-linked dominant, and X-linked recessive are the four main Mendelian patterns.',
  'Mendel''s work (published 1866, rediscovered 1900) founded modern genetics. Mendelian disorders (~4,500 known, cataloged in OMIM) follow predictable inheritance patterns. Most complex traits (height, disease risk) are non-Mendelian (polygenic, multifactorial).',
  ARRAY['Mendelian genetics', 'Mendel''s laws', 'monogenic inheritance']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'linkage',
  '連鎖',
  'Bundled deployment / tightly coupled modules: genes physically close on the same chromosome tend to be inherited together — like tightly coupled code modules in the same package that are always deployed as a unit unless explicitly separated (by crossing over).',
  'The tendency of genes located close together on the same chromosome to be inherited together during meiosis, deviating from Mendel''s law of independent assortment. The degree of linkage is inversely proportional to the physical distance between loci, as measured by recombination frequency. One centimorgan (cM) corresponds to ~1% recombination frequency, approximately 1 Mb in humans.',
  'Thomas Hunt Morgan established the chromosome theory of heredity and discovered linkage (Nobel Prize 1933). Linkage analysis was the primary method for mapping disease genes before GWAS (e.g., mapping the Huntington disease gene to chromosome 4).',
  ARRAY['genetic linkage', 'gene linkage']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'crossing over',
  '交差',
  'Code swap between parallel branches: during meiosis, homologous chromosomes exchange segments — like a git cherry-pick or branch merge where specific sections are swapped between two parallel development branches, creating new combinations.',
  'The reciprocal exchange of genetic material between homologous chromosomes during meiosis I (specifically during the pachytene stage of prophase I). Crossing over occurs at chiasmata, involving DNA double-strand breaks (Spo11), strand invasion, and resolution of Holliday junctions. Produces recombinant chromosomes with new combinations of alleles, increasing genetic diversity.',
  'Crossing over frequency is the basis of genetic mapping (1 cM = 1% recombination). Recombination hotspots are determined by PRDM9 in humans. Absence of crossing over can lead to nondisjunction. Essential for proper chromosome segregation in meiosis I.',
  ARRAY['crossover', 'recombination', 'chromosomal crossover', 'chiasma']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'genetic drift',
  '遺伝的浮動',
  'Random noise / stochastic fluctuation in small systems: random changes in allele frequency due to sampling effects in finite populations — like random fluctuations in a small-scale A/B test where sample size is too small for results to reflect true proportions.',
  'Random changes in allele frequencies in a population from generation to generation due to chance sampling of gametes, independent of natural selection. Effects are strongest in small populations. Can lead to fixation (allele frequency = 1) or loss (frequency = 0) of alleles. Mechanisms include bottleneck effect (population size reduction) and founder effect (small group establishes new population).',
  'Important in conservation biology (small populations lose genetic diversity), human population genetics (founder effects in isolated populations), and neutral theory of molecular evolution (Motoo Kimura). Effective population size (Ne) determines the strength of drift.',
  ARRAY['random drift', 'allelic drift']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'natural selection',
  '自然選択',
  'Production fitness testing / survival of the fittest deployment: organisms with beneficial traits (features that pass integration tests in the environment) survive and reproduce at higher rates — like A/B testing where the better-performing variant is promoted and the other is deprecated over time.',
  'The differential survival and reproduction of individuals due to differences in heritable traits that affect fitness in a given environment. Proposed by Charles Darwin and Alfred Russel Wallace (1858). Types include directional (favoring one extreme), stabilizing (favoring the mean), disruptive (favoring both extremes), and sexual selection. Acts on phenotypic variation arising from genetic variation.',
  'The primary mechanism of adaptive evolution. Evidence includes antibiotic resistance in bacteria, peppered moth industrial melanism, and Darwin''s finches. Molecular signatures of selection (selective sweeps, dN/dS ratios) are detected by population genomics methods.',
  ARRAY['Darwinian selection', 'selection', 'adaptive evolution']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'hardy-weinberg equilibrium',
  'ハーディ・ワインベルグ平衡',
  'Steady-state null hypothesis / baseline model: a mathematical model predicting that allele and genotype frequencies remain constant in an idealized population with no evolutionary forces — like a theoretical steady-state system model against which real-world deviations (evolution) are measured.',
  'A principle stating that allele and genotype frequencies in a population remain constant from generation to generation in the absence of evolutionary forces. For a biallelic locus (alleles p and q, where p + q = 1), expected genotype frequencies are p^2 (AA), 2pq (Aa), q^2 (aa). Assumptions: infinite population, random mating, no mutation, no migration, no selection. Deviations from HWE indicate evolutionary forces or genotyping errors.',
  'Foundation of population genetics. HWE testing is used in GWAS quality control (deviations in controls suggest genotyping errors). Also used to estimate carrier frequencies of recessive diseases (q^2 = disease prevalence, 2pq = carrier frequency).',
  ARRAY['HWE', 'Hardy-Weinberg law', 'Hardy-Weinberg principle']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'snp',
  'SNP',
  'Single-bit variant / configuration flag: a position in the genome where a single nucleotide differs between individuals — like a boolean feature flag that varies across deployments, where common variants define population-level configuration differences.',
  'Single Nucleotide Polymorphism, a variation at a single nucleotide position in the genome that is present at an appreciable frequency (typically >1%) in a population. The most common type of genetic variation in humans, with ~4-5 million SNPs per individual genome relative to the reference. SNPs can be synonymous, missense, nonsense, or in non-coding regions (regulatory, intronic, intergenic).',
  'SNPs are the primary markers used in GWAS, pharmacogenomics, and ancestry testing. The dbSNP database catalogs known SNPs. SNP arrays (Illumina, Affymetrix) genotype hundreds of thousands to millions of SNPs simultaneously. Tag SNPs represent haplotype blocks due to linkage disequilibrium.',
  ARRAY['single nucleotide polymorphism', 'SNPs', 'single nucleotide variant']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'haplotype',
  'ハプロタイプ',
  'Linked configuration block / dependency group: a set of genetic variants that are inherited together as a block (in linkage disequilibrium) — like a group of config settings that always travel as a bundle because they reside in the same config file section.',
  'A set of alleles at linked loci on a single chromosome that are inherited together as a unit due to linkage disequilibrium (LD). Haplotype blocks are regions of high LD separated by recombination hotspots. In humans, haplotype blocks are typically 10-100 kb. Haplotypes can be inferred computationally (phasing) or determined experimentally (e.g., long-read sequencing).',
  'The HapMap Project (2002-2009) and 1000 Genomes Project characterized human haplotype diversity. Haplotype-based methods improve the power of GWAS. HLA haplotypes are critical in transplantation immunology. Haplotype reference panels (TOPMed, gnomAD) improve genotype imputation.',
  ARRAY['haplotypes', 'haplotype block']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'qtl',
  'QTL',
  'Performance-influencing configuration region: a genomic region statistically associated with variation in a quantitative (continuous) trait — like identifying which configuration parameter ranges correlate with measurable performance differences in a system.',
  'Quantitative Trait Locus, a region of DNA associated with variation in a quantitative (continuously variable) phenotype such as height, weight, blood pressure, or gene expression level (eQTL). Identified by statistical association between genetic markers and phenotypic variation in a population. QTL mapping uses linkage analysis in crosses (model organisms) or association studies (humans) to localize trait-influencing genomic regions.',
  'eQTLs (expression QTLs) link genetic variants to gene expression levels and are used to interpret GWAS findings. QTL mapping in crops has improved agricultural breeding programs. GTEx project catalogs eQTLs across human tissues.',
  ARRAY['quantitative trait locus', 'quantitative trait loci', 'eQTL']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'gwas',
  'GWAS',
  'Large-scale A/B test analytics: a statistical comparison of genetic variants across thousands of cases and controls to identify which variants are associated with a trait — like analyzing millions of A/B test results across a massive user base to find which feature flags correlate with specific outcomes.',
  'Genome-Wide Association Study, an observational study of a genome-wide set of genetic variants (typically SNPs) in a large cohort of individuals to identify statistically significant associations between variants and a trait or disease. Requires stringent significance thresholds (p < 5x10^-8 for genome-wide significance) due to massive multiple testing. Uses genotyping arrays and imputation. Results are visualized as Manhattan plots.',
  'Over 6,000 GWAS have been published, identifying >300,000 variant-trait associations (GWAS Catalog). Limitations include explaining only a fraction of heritability (missing heritability problem), population bias (overrepresentation of European ancestry), and identifying associations (not causation).',
  ARRAY['genome-wide association study', 'genome-wide association studies']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'heritability',
  '遺伝率',
  'Code vs. environment attribution ratio: a statistical measure of how much of the observed variation in a trait is attributable to genetic differences (source code variation) versus environmental factors (runtime configuration) — like measuring whether performance differences are due to code quality or server hardware.',
  'The proportion of phenotypic variation in a population attributable to genetic variation. Broad-sense heritability (H^2) includes all genetic variance (additive, dominance, epistatic). Narrow-sense heritability (h^2) includes only additive genetic variance and determines the response to selection. Estimated from twin studies, family studies, or genomic methods (GCTA, LDSC). Ranges from 0 (entirely environmental) to 1 (entirely genetic). Population-specific, not individual-level.',
  'Height has high heritability (~0.8) while specific diseases have variable heritability. GWAS-based heritability (SNP heritability) often accounts for less than total heritability estimated from twin studies — the "missing heritability" problem. Critical concept in quantitative genetics and breeding.',
  ARRAY['genetic heritability', 'h-squared', 'H2']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'polygenic trait',
  '多因子形質',
  'Complex emergent behavior from many small settings: a trait influenced by many genes with small individual effects — like system performance that depends on hundreds of configuration parameters, each contributing a tiny amount, making it difficult to attribute to any single setting.',
  'A phenotypic trait influenced by the combined effects of many genes, each contributing a small effect, often interacting with environmental factors. Examples include height, skin color, intelligence, and susceptibility to common diseases (diabetes, heart disease, schizophrenia). Typically shows continuous (quantitative) variation with normal distribution in a population. Modeled by polygenic risk scores (PRS) summing the weighted effects of many variants.',
  'Most medically important traits are polygenic. Polygenic risk scores (PRS) aggregate small effects from thousands of GWAS-identified variants to predict individual disease risk. PRS clinical utility is debated; ancestry bias and limited predictive power are current limitations.',
  ARRAY['polygenic', 'multifactorial trait', 'complex trait', 'quantitative trait']
) ON CONFLICT DO NOTHING;
