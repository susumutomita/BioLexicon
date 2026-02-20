-- =============================================================================
-- 090_immunology.sql
-- BioLexicon seed data: Immunology & Immune System
-- Domain: Immunology / Immunobiology
-- Terms: 15
-- =============================================================================

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'immune system',
  '免疫系',
  'Multi-layered security architecture: a defense-in-depth system with perimeter defenses (skin, mucus = firewalls), rapid-response patrol units (innate immunity = IDS/IPS), and adaptive targeted strike forces (adaptive immunity = ML-based threat detection that learns and remembers attack signatures).',
  'The complex network of cells, tissues, organs, and molecules that collectively defend the host against pathogens (bacteria, viruses, fungi, parasites) and abnormal cells (cancer). Comprises the innate immune system (rapid, non-specific) and the adaptive immune system (slower, highly specific, with immunological memory). Key organs include bone marrow, thymus, spleen, lymph nodes, and mucosa-associated lymphoid tissues.',
  'Central to immunology, infectious disease, autoimmunity, transplantation, and cancer immunotherapy. Nobel Prizes awarded for innate immunity (Jules Hoffmann, Bruce Beutler, 2011) and adaptive immunity (multiple awards). Immunotherapy has revolutionized cancer treatment (checkpoint inhibitors: James Allison, Tasuku Honjo, Nobel Prize 2018).',
  ARRAY['immunity', 'host defense']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'innate immunity',
  '自然免疫',
  'Intrusion detection system (IDS) + default firewall rules: the first-line defense that recognizes generic threat patterns (PAMPs) using hardcoded rules (pattern recognition receptors) and responds within minutes — fast but not adaptive, like static firewall rules that block known malicious patterns.',
  'The evolutionarily ancient, non-specific arm of the immune system that provides immediate defense against infection. Components include physical barriers (skin, mucosa), cellular effectors (neutrophils, macrophages, dendritic cells, NK cells, mast cells), humoral factors (complement, antimicrobial peptides, cytokines), and pattern recognition receptors (TLRs, NOD-like receptors, RIG-I) that detect conserved microbial structures (PAMPs) and damage signals (DAMPs).',
  'Jules Hoffmann and Bruce Beutler received the 2011 Nobel Prize for discoveries concerning innate immunity (Toll receptors in Drosophila, TLR4 in mice). Innate immunity also instructs and shapes the adaptive immune response. Trained immunity (epigenetic reprogramming of innate cells) is an active research area.',
  ARRAY['innate immune system', 'non-specific immunity', 'natural immunity']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'adaptive immunity',
  '適応免疫',
  'Machine learning-based security system: generates highly specific threat responses through training (clonal selection = model training on specific antigens), improves accuracy over time (affinity maturation = hyperparameter tuning), and maintains persistent memory (memory cells = trained model cache) for rapid recall upon re-encounter.',
  'The arm of the immune system mediated by lymphocytes (T and B cells) that generates highly specific responses to particular antigens. Characteristics: specificity (unique receptors for each antigen via V(D)J recombination), diversity (>10^11 unique receptors), memory (faster, stronger secondary responses), and self/non-self discrimination. Humoral immunity (B cells, antibodies) targets extracellular pathogens; cell-mediated immunity (T cells) eliminates intracellular pathogens and abnormal cells.',
  'Basis of vaccination. V(D)J recombination (Susumu Tonegawa, Nobel Prize 1987) generates receptor diversity. Clonal selection theory (Burnet) explains how specific lymphocytes are activated. Dysregulation causes autoimmunity and immunodeficiency.',
  ARRAY['adaptive immune system', 'acquired immunity', 'specific immunity']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'antibody',
  '抗体',
  'Targeted search-and-tag agent: a Y-shaped protein with two variable binding domains (like regex patterns) that specifically recognize and bind to a target antigen, flagging it for destruction by immune effectors — like a targeted crawler that tags matching records for downstream processing.',
  'A Y-shaped glycoprotein (immunoglobulin) produced by plasma cells (differentiated B cells) that specifically binds to an antigen via its variable regions (Fab). The constant region (Fc) mediates effector functions: complement activation, opsonization (phagocytosis enhancement), and ADCC (antibody-dependent cellular cytotoxicity). Five classes: IgG (most abundant in serum), IgA (mucosal), IgM (first response, pentameric), IgE (allergy, parasites), IgD (B cell receptor). Generated by V(D)J recombination and somatic hypermutation.',
  'Foundation of immunology and biotechnology. Monoclonal antibodies (hybridoma technology: Kohler and Milstein, Nobel Prize 1984) are major therapeutic agents (>100 FDA-approved mAbs). Used in diagnostics (ELISA, Western blot, immunohistochemistry, flow cytometry). Bispecific antibodies, antibody-drug conjugates (ADCs), and nanobodies are next-generation formats.',
  ARRAY['antibodies', 'immunoglobulin', 'Ig', 'Ab']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'antigen',
  '抗原',
  'Threat signature / malware hash: any molecular structure that the immune system can specifically recognize and respond to — like a unique file hash or signature pattern that security software uses to identify and classify threats.',
  'Any molecule capable of being recognized by the adaptive immune system, specifically by antibodies or T cell receptors. The portion of an antigen that is directly recognized is called an epitope (B cell epitope for antibodies, T cell epitope/peptide-MHC complex for TCR). Antigens can be proteins, polysaccharides, lipids, or nucleic acids. Immunogens are antigens that elicit an immune response; haptens require carrier proteins to be immunogenic.',
  'Central to immunology, vaccine design, and diagnostics. Antigen presentation by MHC molecules is essential for T cell activation. Tumor-specific antigens (neoantigens from somatic mutations) are targets for cancer immunotherapy. Antigen tests (e.g., rapid COVID-19 antigen tests) detect pathogen proteins.',
  ARRAY['antigens', 'immunogen', 'epitope']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  't cell',
  'T細胞',
  'Specialized security agents: cytotoxic T cells are targeted assassins that kill infected cells (like a kill -9 for compromised processes), helper T cells are coordinators that direct other immune cells (like an orchestrator sending deployment commands), and regulatory T cells are governance officers that prevent friendly fire (autoimmunity).',
  'A lymphocyte that matures in the thymus and mediates cell-mediated immunity. Major subtypes: CD8+ cytotoxic T lymphocytes (CTLs) kill virus-infected and tumor cells by recognizing peptide-MHC I complexes. CD4+ helper T cells (Th1, Th2, Th17, Tfh) coordinate immune responses by secreting cytokines upon recognizing peptide-MHC II complexes. Regulatory T cells (Tregs, CD4+CD25+FOXP3+) suppress excessive immune responses and maintain self-tolerance.',
  'T cell biology is central to immunotherapy: checkpoint inhibitors (anti-PD-1/PD-L1: pembrolizumab, nivolumab; anti-CTLA-4: ipilimumab), CAR-T cell therapy (tisagenlecleucel, axicabtagene ciloleucel), and adoptive cell transfer. HIV infects CD4+ T cells, causing AIDS.',
  ARRAY['T lymphocyte', 'T cells', 'T-cell', 'thymocyte']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'b cell',
  'B細胞',
  'Antibody factory / security signature generator: upon activation, B cells differentiate into plasma cells that mass-produce antibodies (like a factory spinning up production of targeted security patches), while memory B cells persist as a cached template for rapid re-deployment upon re-infection.',
  'A lymphocyte that matures in the bone marrow and mediates humoral immunity through antibody production. B cell receptors (BCR = membrane-bound IgM/IgD) recognize native antigens. Upon activation (antigen binding + T cell help), B cells undergo clonal expansion, somatic hypermutation (affinity maturation in germinal centers), class switch recombination, and differentiate into antibody-secreting plasma cells and long-lived memory B cells.',
  'Foundation of vaccination and antibody therapeutics. B cell lymphomas and leukemias (CLL, DLBCL, multiple myeloma) are major cancers. Anti-CD20 antibodies (rituximab) deplete B cells for lymphoma and autoimmune disease treatment. B cell deficiency causes humoral immunodeficiency.',
  ARRAY['B lymphocyte', 'B cells', 'B-cell']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'mhc',
  'MHC',
  'Process display window / status dashboard: MHC molecules display protein fragments (peptides) on the cell surface for T cell inspection — like a monitoring dashboard that shows what code is running inside a container, allowing security agents (T cells) to verify no malicious processes are active.',
  'Major Histocompatibility Complex, a cluster of highly polymorphic genes (HLA in humans, chromosome 6p21) encoding cell-surface glycoproteins that present peptide antigens to T cells. MHC class I (HLA-A, -B, -C) is expressed on all nucleated cells and presents endogenous peptides (8-10 aa) to CD8+ T cells. MHC class II (HLA-DR, -DP, -DQ) is expressed on antigen-presenting cells and presents exogenous peptides (13-25 aa) to CD4+ T cells. The most polymorphic genes in the human genome.',
  'HLA matching is critical for organ and bone marrow transplantation. HLA associations are the strongest genetic risk factors for many autoimmune diseases (e.g., HLA-B27 and ankylosing spondylitis, HLA-DQ2/DQ8 and celiac disease). MHC restriction of T cell recognition was discovered by Zinkernagel and Doherty (Nobel Prize 1996).',
  ARRAY['major histocompatibility complex', 'HLA', 'human leukocyte antigen', 'MHC class I', 'MHC class II']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'complement system',
  '補体系',
  'Automated perimeter defense / autonomous defense drones: a cascade of ~30 plasma proteins that self-activate in sequence (like a chain reaction trigger), forming membrane attack complexes (MAC) that punch holes in pathogen membranes — an autonomous kill chain that operates without direct T/B cell commands.',
  'A system of ~30 soluble plasma proteins and membrane-associated regulators that form an enzymatic cascade amplifying immune defense. Three activation pathways: classical (C1q binds antibody-antigen complexes), lectin (MBL binds mannose on pathogens), and alternative (spontaneous C3 hydrolysis on pathogen surfaces). All converge on C3 convertase, generating C3a/C5a (anaphylatoxins, inflammation), C3b (opsonization), and C5b-9 (membrane attack complex, cell lysis).',
  'Complement deficiencies predispose to infections (C3 deficiency) and autoimmune disease (C1q, C4 deficiency and SLE). Complement-targeting therapeutics: eculizumab (anti-C5) for PNH and aHUS. Complement activation contributes to transplant rejection and COVID-19 pathology.',
  ARRAY['complement cascade', 'complement proteins']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'cytokine storm',
  'サイトカインストーム',
  'Cascading failure / feedback loop crash: an uncontrolled positive feedback loop where immune cells release cytokines that activate more immune cells, which release more cytokines — like a microservice cascading failure where each failing service triggers failures in dependent services, eventually crashing the entire system.',
  'A life-threatening systemic inflammatory response characterized by excessive, uncontrolled release of pro-inflammatory cytokines (IL-1, IL-6, TNF-α, IFN-γ) by hyperactivated immune cells. Creates a positive feedback loop of immune cell activation and cytokine production, leading to multi-organ damage, disseminated intravascular coagulation, and potentially death. Can be triggered by severe infections, CAR-T cell therapy (cytokine release syndrome), autoimmune conditions, and certain drugs.',
  'Major complication of COVID-19 (severe ARDS). Tocilizumab (anti-IL-6R) and dexamethasone reduced COVID-19 mortality. Cytokine release syndrome (CRS) is a known complication of CAR-T therapy, managed with tocilizumab. Also implicated in the 1918 influenza pandemic''s high mortality in young adults.',
  ARRAY['hypercytokinemia', 'cytokine release syndrome', 'CRS']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'inflammation',
  '炎症',
  'Incident response protocol: a coordinated emergency response activated when tissue damage or infection is detected — increased blood flow (scaling up resources), immune cell recruitment (deploying incident response team), and barrier activation (isolating the affected zone) — necessary for repair but harmful if unresolved.',
  'A protective biological response to harmful stimuli (pathogens, damaged cells, toxins) characterized by five cardinal signs: redness (rubor), heat (calor), swelling (tumor), pain (dolor), and loss of function (functio laesa). Involves vasodilation, increased vascular permeability, leukocyte recruitment (via selectins, integrins, chemokines), and activation of innate immune cells. Acute inflammation resolves; chronic inflammation persists and underlies many diseases.',
  'Chronic inflammation underlies cardiovascular disease, cancer, diabetes, Alzheimer''s disease, and autoimmune disorders. Anti-inflammatory drugs include NSAIDs (ibuprofen), corticosteroids, and biologics (anti-TNF: infliximab, adalimumab). Rudolf Virchow established the cellular basis of inflammation in the 19th century.',
  ARRAY['inflammatory response', 'acute inflammation', 'chronic inflammation']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'vaccine',
  'ワクチン',
  'Security training exercise / penetration test with safe payloads: introduces a harmless version of a threat (attenuated pathogen, mRNA blueprint, or protein fragment) to train the adaptive immune system, building memory so the real threat is neutralized rapidly upon first actual encounter — like a red team exercise that prepares defenses without actual damage.',
  'A biological preparation that stimulates the adaptive immune system to develop protective immunity against a specific pathogen without causing disease. Types include live attenuated (MMR, yellow fever), inactivated (IPV, hepatitis A), subunit/recombinant (hepatitis B, HPV), toxoid (tetanus, diphtheria), conjugate (pneumococcal), mRNA (COVID-19: Pfizer-BioNTech, Moderna), viral vector (COVID-19: AstraZeneca, J&J), and DNA vaccines. Induces both humoral (antibody) and cellular (T cell) immunity.',
  'Edward Jenner''s smallpox vaccine (1796) founded vaccinology. Vaccines have eradicated smallpox and nearly eliminated polio. mRNA vaccine technology (Katalin Kariko and Drew Weissman, Nobel Prize 2023) was rapidly deployed against COVID-19. Ongoing efforts target HIV, malaria, tuberculosis, and cancer (neoantigen vaccines).',
  ARRAY['vaccines', 'vaccination', 'immunization']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'immunoglobulin',
  '免疫グロブリン',
  'Security token class hierarchy: a family of Y-shaped proteins with a shared base architecture (constant domains = base class) and customizable recognition tips (variable domains = polymorphic interface implementations), organized into 5 subclasses (IgG, IgA, IgM, IgD, IgE) with different deployment specializations.',
  'A family of glycoproteins produced by B cells/plasma cells that function as antibodies. Each immunoglobulin consists of two identical heavy chains and two identical light chains (kappa or lambda), forming a Y-shaped structure. The variable domains (VH + VL) constitute the antigen-binding site (paratope). Five classes defined by heavy chain isotype: IgG (γ), IgA (α), IgM (μ), IgD (δ), IgE (ε). Ig domains are the structural basis of the immunoglobulin superfamily, which includes TCR, MHC, and many adhesion molecules.',
  'IgG is the most abundant serum antibody and crosses the placenta. IgA is dominant in mucosal secretions. IgM is the first antibody produced. IgE mediates allergic reactions. Intravenous immunoglobulin (IVIG) is used therapeutically for immunodeficiencies and autoimmune diseases.',
  ARRAY['Ig', 'immunoglobulins', 'antibody molecule']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'phagocytosis',
  '貪食',
  'Garbage collection + threat elimination: immune cells (phagocytes) engulf and digest pathogens or cellular debris — like an automated cleanup process that identifies foreign objects (via opsonization tags = garbage collection markers), internalizes them, and destroys them in an acidic lysosomal environment.',
  'The process by which specialized immune cells (phagocytes: neutrophils, macrophages, dendritic cells) recognize, engulf, and destroy particles larger than 0.5 μm, including bacteria, dead cells, and debris. Steps: (1) recognition (via PRRs, Fc receptors, complement receptors), (2) engulfment (pseudopod extension, phagosome formation), (3) killing and digestion (phagolysosome fusion, reactive oxygen species, antimicrobial enzymes, acidification). Opsonization (coating with antibodies or complement C3b) greatly enhances phagocytosis.',
  'Elie Metchnikoff discovered phagocytosis (Nobel Prize 1908, shared with Paul Ehrlich). Key defense against extracellular bacteria. Phagocyte defects (chronic granulomatous disease, leukocyte adhesion deficiency) cause severe recurrent infections. Also important for clearing apoptotic cells (efferocytosis).',
  ARRAY['phagocytic process', 'cell eating']
) ON CONFLICT DO NOTHING;

INSERT INTO terms (name, name_ja, engineer_analogy, formal_definition, context, synonyms)
VALUES (
  'autoimmunity',
  '自己免疫',
  'Friendly fire / false positive security incident: the immune system mistakenly identifies self-components as threats and attacks the body''s own tissues — like a security system with miscalibrated threat detection that flags legitimate internal processes as malware and terminates them.',
  'A pathological condition in which the adaptive immune system mounts an immune response against the body''s own antigens (self-antigens), leading to tissue damage. Results from breakdown of self-tolerance mechanisms (central tolerance: thymic deletion; peripheral tolerance: Tregs, anergy, deletion). Autoimmune diseases can be organ-specific (type 1 diabetes, Hashimoto thyroiditis, multiple sclerosis) or systemic (systemic lupus erythematosus, rheumatoid arthritis).',
  'Affects ~5-8% of the population, with higher prevalence in females. Genetic susceptibility (HLA associations) and environmental triggers (infections, microbiome, molecular mimicry) contribute. Treatment includes immunosuppression (corticosteroids, methotrexate, biologics: anti-TNF, anti-IL-17, anti-CD20). Autoimmune diseases are a major burden of chronic disease.',
  ARRAY['autoimmune disease', 'autoimmune disorder', 'self-reactivity']
) ON CONFLICT DO NOTHING;
