# Function to add attributes to variables based on the codebook
add_codebook_attributes <- function(data) {
  
  # Define the codebook information
  codebook <- list(
    # UCDP GED Variables
    ged_sb = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of battle-related deaths (BRDs) from state-based conflict as per the UCDP definition.",
      transform = NA
    ),
    ged_ns = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of fatalities from non-state conflict as per the UCDP definition.",
      transform = NA
    ),
    ged_os = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of fatalities from one-sided conflict as per the UCDP definition.",
      transform = NA
    ),
    
    # ACLED Variables
    acled_sb = list(
      source = "Armed Conflict Location Event Dataset",
      description = "State based conflict events count from the event types battle and remote violence, where one actor is a military force and non of the involved actors are civilians.",
      transform = NA
    ),
    acled_sb_count = list(
      source = "Armed Conflict Location Event Dataset",
      description = "State based conflict events count from the event types battle and remote violence, where one actor is a military force and non of the involved actors are civilians.",
      transform = NA
    ),
    acled_os = list(
      source = "Armed Conflict Location Event Dataset",
      description = "Fatality count from the event types battle and remote violence, where one actor is civilians.",
      transform = NA
    ),
    
    # Transformed GED Variables
    ged_sb_tsum_24 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of battle-related deaths (BRDs) from state-based conflict as per the UCDP definition.",
      transform = "24-month moving sum"
    ),
    
    # GED Temporal Lags
    ged_sb_tlag_1 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of battle-related deaths (BRDs) from state-based conflict as per the UCDP definition.",
      transform = "temporal lag of 1 months"
    ),
    ged_sb_tlag_2 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of battle-related deaths (BRDs) from state-based conflict as per the UCDP definition.",
      transform = "temporal lag of 2 months"
    ),
    ged_sb_tlag_3 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of battle-related deaths (BRDs) from state-based conflict as per the UCDP definition.",
      transform = "temporal lag of 3 months"
    ),
    ged_sb_tlag_4 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of battle-related deaths (BRDs) from state-based conflict as per the UCDP definition.",
      transform = "temporal lag of 4 months"
    ),
    ged_sb_tlag_5 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of battle-related deaths (BRDs) from state-based conflict as per the UCDP definition.",
      transform = "temporal lag of 5 months"
    ),
    ged_sb_tlag_6 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of battle-related deaths (BRDs) from state-based conflict as per the UCDP definition.",
      transform = "temporal lag of 6 months"
    ),
    ged_os_tlag_1 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of fatalities from one-sided conflict as per the UCDP definition.",
      transform = "temporal lag of 1 months"
    ),
    
    # World Development Index Variables
    wdi_sp_pop_totl = list(
      source = "World Development Index",
      description = "Population in total.",
      transform = NA
    ),
    wdi_ag_lnd_frst_k2 = list(
      source = "World Development Index",
      description = "Forest area (sq. km).",
      transform = NA
    ),
    wdi_dt_oda_odat_pc_zs = list(
      source = "World Development Index",
      description = "Net official development assistance ODA received per capita in current US dollars.",
      transform = NA
    ),
    wdi_ms_mil_xpnd_gd_zs = list(
      source = "World Development Index",
      description = "Military expenditure as percentage of GDP.",
      transform = NA
    ),
    wdi_ms_mil_xpnd_zs = list(
      source = "World Development Index",
      description = "Military expenditure as percentage of general government expenditure.",
      transform = NA
    ),
    wdi_nv_agr_totl_kd = list(
      source = "World Development Index",
      description = "Value added from agriculture in constant 2015 U.S. dollars.",
      transform = NA
    ),
    wdi_nv_agr_totl_kn = list(
      source = "World Development Index",
      description = "Value added from agriculture in constant local currency.",
      transform = NA
    ),
    wdi_ny_gdp_pcap_kd = list(
      source = "World Development Index",
      description = "GDP per capita in constant 2015 US dollars",
      transform = NA
    ),
    wdi_sp_dyn_le00_in = list(
      source = "World Development Index",
      description = "Life expectancy at birth, total years",
      transform = NA
    ),
    wdi_se_enr_prim_fm_zs = list(
      source = "World Development Index",
      description = "Gender parity index for gross enrollment ratio in primary education is the ratio of girls to boys enrolled at primary level in public and private schools.",
      transform = NA
    ),
    wdi_se_enr_prsc_fm_zs = list(
      source = "World Development Index",
      description = "Gender parity index for gross enrollment ratio in primary and secondary education is the ratio of girls to boys enrolled at primary and secondary levels in public and private schools.",
      transform = NA
    ),
    wdi_se_prm_nenr = list(
      source = "World Development Index",
      description = "School enrollment, primary percentage net",
      transform = NA
    ),
    wdi_sh_sta_maln_zs = list(
      source = "World Development Index",
      description = "Prevalence of underweight amongst children under 5 in percentage.",
      transform = NA
    ),
    wdi_sh_sta_stnt_zs = list(
      source = "World Development Index",
      description = "Prevalence of stunting amongst children under 5 in percentage.",
      transform = NA
    ),
    wdi_sl_tlf_totl_fe_zs = list(
      source = "World Development Index",
      description = "Female labor force as a percentage of the total.",
      transform = NA
    ),
    wdi_sm_pop_refg_or = list(
      source = "World Development Index",
      description = "Refugee population by country or territory of origin.",
      transform = NA
    ),
    wdi_sm_pop_netm = list(
      source = "World Development Index",
      description = "Net total of migrants during a five-year estimate.",
      transform = NA
    ),
    wdi_sm_pop_totl_zs = list(
      source = "World Development Index",
      description = "International migrant stock (number of people born in a country other than that in which they live) in percentage of population.",
      transform = NA
    ),
    wdi_sp_dyn_imrt_in = list(
      source = "World Development Index",
      description = "Infant mortality rate per 1,000 live births.",
      transform = NA
    ),
    wdi_sh_dyn_mort_fe = list(
      source = "World Development Index",
      description = "Female under-five mortality rate per 1,000 live birth.",
      transform = NA
    ),
    wdi_sp_pop_14_fe_zs = list(
      source = "World Development Index",
      description = "Female population between the ages 0 to 14 as a percentage of the total female population",
      transform = NA
    ),
    wdi_sp_pop_1564_fe_zs = list(
      source = "World Development Index",
      description = "Female population between the ages 15 to 64 as a percentage of the total female population.",
      transform = NA
    ),
    wdi_sp_pop_65up_fe_zs = list(
      source = "World Development Index",
      description = "Female population 65 years of age or older as a percentage of the total female population.",
      transform = NA
    ),
    wdi_sp_pop_grow = list(
      source = "World Development Index",
      description = "Annual population growth in percentage.",
      transform = NA
    ),
    wdi_sp_urb_totl_in_zs = list(
      source = "World Development Index",
      description = "Percentage of population living in urban population areas.",
      transform = NA
    ),
    
    # Spatial Lag WDI Variables
    splag_wdi_sl_tlf_totl_fe_zs = list(
      source = "World Development Index",
      description = "Female labor force as a percentage of the total.",
      transform = "spatial lag"
    ),
    splag_wdi_sm_pop_refg_or = list(
      source = "World Development Index",
      description = "Refugee population by country or territory of origin.",
      transform = "spatial lag"
    ),
    splag_wdi_sm_pop_netm = list(
      source = "World Development Index",
      description = "Net total of migrants during a five-year estimate.",
      transform = "spatial lag"
    ),
    splag_wdi_ag_lnd_frst_k2 = list(
      source = "World Development Index",
      description = "Forest area (sq. km).",
      transform = "spatial lag"
    ),
    
    # V-Dem Variables
    vdem_v2x_delibdem = list(
      source = "Varieties of Democracy (vdem)",
      description = "Deliberative democracy index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_egaldem = list(
      source = "Varieties of Democracy (vdem)",
      description = "Egalitarian component index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_libdem = list(
      source = "Varieties of Democracy (vdem)",
      description = "Liberal democracy index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_libdem_48 = list(
      source = "Varieties of Democracy (vdem)",
      description = "Liberal democracy index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_partip = list(
      source = "Varieties of Democracy (vdem)",
      description = "Participatory component index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_partipdem = list(
      source = "Varieties of Democracy (vdem)",
      description = "Participatory democracy index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_accountability = list(
      source = "Varieties of Democracy (vdem)",
      description = "Accountability index on a scale using a standard normal cumulative distribution function. It is thus scaled low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_civlib = list(
      source = "Varieties of Democracy (vdem)",
      description = "Civil liberties index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_clphy = list(
      source = "Varieties of Democracy (vdem)",
      description = "Physical violence index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_cspart = list(
      source = "Varieties of Democracy (vdem)",
      description = "Civil society participation index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_divparctrl = list(
      source = "Varieties of Democracy (vdem)",
      description = "Divided party control index on an interval from low to high.",
      transform = NA
    ),
    vdem_v2x_edcomp_thick = list(
      source = "Varieties of Democracy (vdem)",
      description = "Electoral component index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_egal = list(
      source = "Varieties of Democracy (vdem)",
      description = "Egalitarian component index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_execorr = list(
      source = "Varieties of Democracy (vdem)",
      description = "Executive corruption index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_frassoc_thick = list(
      source = "Varieties of Democracy (vdem)",
      description = "Freedom of association thick index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_gencs = list(
      source = "Varieties of Democracy (vdem)",
      description = "Women civil society participation index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_gender = list(
      source = "Varieties of Democracy (vdem)",
      description = "Women political empowerment index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_genpp = list(
      source = "Varieties of Democracy (vdem)",
      description = "Women political participation index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_horacc = list(
      source = "Varieties of Democracy (vdem)",
      description = "Horizontal accountability index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_neopat = list(
      source = "Varieties of Democracy (vdem)",
      description = "Neopatrimonial Rule Index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_pubcorr = list(
      source = "Varieties of Democracy (vdem)",
      description = "Public sector corruption index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_rule = list(
      source = "Varieties of Democracy (vdem)",
      description = "Rule of law index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_veracc = list(
      source = "Varieties of Democracy (vdem)",
      description = "Vertical accountability index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_ex_military = list(
      source = "Varieties of Democracy (vdem)",
      description = "Military dimension index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_ex_party = list(
      source = "Varieties of Democracy (vdem)",
      description = "Ruling party dimension index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_freexp = list(
      source = "Varieties of Democracy (vdem)",
      description = "Freedom of expression index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xcl_acjst = list(
      source = "Varieties of Democracy (vdem)",
      description = "Access to justice on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xcl_dmove = list(
      source = "Varieties of Democracy (vdem)",
      description = "Freedom of domestic movement on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xcl_prpty = list(
      source = "Varieties of Democracy (vdem)",
      description = "Property rights index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xcl_rol = list(
      source = "Varieties of Democracy (vdem)",
      description = "Equality before the law and individual liberty index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xcl_slave = list(
      source = "Varieties of Democracy (vdem)",
      description = "Freedom from forced labor index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xdd_dd = list(
      source = "Varieties of Democracy (vdem)",
      description = "Direct popular vote index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xdl_delib = list(
      source = "Varieties of Democracy (vdem)",
      description = "Deliberative component index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xeg_eqdr = list(
      source = "Varieties of Democracy (vdem)",
      description = "Equal distribution of resources index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xeg_eqprotec = list(
      source = "Varieties of Democracy (vdem)",
      description = "Equal protection index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xel_frefair = list(
      source = "Varieties of Democracy (vdem)",
      description = "Clean elections index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xel_regelec = list(
      source = "Varieties of Democracy (vdem)",
      description = "Regional government index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xme_altinf = list(
      source = "Varieties of Democracy (vdem)",
      description = "Regional government index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xnp_client = list(
      source = "Varieties of Democracy (vdem)",
      description = "Clientelism Index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xnp_regcorr = list(
      source = "Varieties of Democracy (vdem)",
      description = "Regime corruption Index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xpe_exlecon = list(
      source = "Varieties of Democracy (vdem)",
      description = "Exclusion by Socio-Economic Group Index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xpe_exlpol = list(
      source = "Varieties of Democracy (vdem)",
      description = "Exclusion by Political Group index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xpe_exlgeo = list(
      source = "Varieties of Democracy (vdem)",
      description = "Exclusion by Urban-Rural Location index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xpe_exlgender = list(
      source = "Varieties of Democracy (vdem)",
      description = "Exclusion by Gender index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xpe_exlsocgr = list(
      source = "Varieties of Democracy (vdem)",
      description = "Exclusion by Social Group index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xps_party = list(
      source = "Varieties of Democracy (vdem)",
      description = "Party institutionalization index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xcs_ccsi = list(
      source = "Varieties of Democracy (vdem)",
      description = "Core civil society index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xnp_pres = list(
      source = "Varieties of Democracy (vdem)",
      description = "Presidentialism Index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2xeg_eqaccess = list(
      source = "Varieties of Democracy (vdem)",
      description = "Presidentialism Index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2x_diagacc = list(
      source = "Varieties of Democracy (vdem)",
      description = "Diagonal accountability index on an interval from low to high (0-1).",
      transform = NA
    ),
    vdem_v2clrgunev = list(
      source = "Varieties of Democracy (vdem)",
      description = "Does government respect for civil liberties vary across different areas of the country? 0: Yes, 1: Somewhat, 2: no.",
      transform = NA
    ),
    
    # Spatial Lag V-Dem Variables
    splag_vdem_v2x_libdem = list(
      source = "Varieties of Democracy (vdem)",
      description = "Liberal democracy index on an interval from low to high (0-1).",
      transform = "spatial lag"
    ),
    splag_vdem_v2xcl_dmove = list(
      source = "Varieties of Democracy (vdem)",
      description = "Freedom of domestic movement on an interval from low to high (0-1).",
      transform = "spatial lag"
    ),
    splag_vdem_v2x_accountability = list(
      source = "Varieties of Democracy (vdem)",
      description = "Accountability index on a scale using a standard normal cumulative distribution function. It is thus scaled low to high (0-1).",
      transform = "spatial lag"
    ),
    splag_vdem_v2xpe_exlsocgr = list(
      source = "Varieties of Democracy (vdem)",
      description = "Exclusion by Social Group index on an interval from low to high (0-1).",
      transform = "spatial lag"
    ),
    splag_vdem_v2xcl_rol = list(
      source = "Varieties of Democracy (vdem)",
      description = "Equality before the law and individual liberty index on an interval from low to high (0-1).",
      transform = "spatial lag"
    ),
    
    # Other WDI Variables
    `_wdi_sm_pop_netm` = list(
      source = "World Development Index",
      description = "Net total of migrants during a five-year estimate.",
      transform = NA
    ),
    `_wdi_sp_dyn_imrt_in` = list(
      source = "World Development Index",
      description = "Infant mortality rate per 1,000 live births.",
      transform = NA
    ),
    
    # Decay Function Variables
    decay_ged_sb_5 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of battle-related deaths (BRDs) from state-based conflict as per the UCDP definition.",
      transform = "decay function"
    ),
    decay_ged_os_5 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of fatalities from one-sided conflict as per the UCDP definition.",
      transform = "decay function"
    ),
    decay_ged_sb_100 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of battle-related deaths (BRDs) from state-based conflict as per the UCDP definition.",
      transform = "decay function"
    ),
    decay_ged_sb_500 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of battle-related deaths (BRDs) from state-based conflict as per the UCDP definition.",
      transform = "decay function"
    ),
    decay_ged_os_100 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of fatalities from one-sided conflict as per the UCDP definition.",
      transform = "decay function"
    ),
    decay_ged_ns_5 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of fatalities from non-state conflict as per the UCDP definition.",
      transform = "decay function"
    ),
    decay_ged_ns_100 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of fatalities from non-state conflict as per the UCDP definition.",
      transform = "decay function"
    ),
    decay_acled_sb_5 = list(
      source = "Armed Conflict Location Event Dataset",
      description = "State based conflict events count from the event types battle and remote violence, where one actor is a military force and non of the involved actors are civilians.",
      transform = "decay function"
    ),
    decay_acled_os_5 = list(
      source = "Armed Conflict Location Event Dataset",
      description = "Fatality count from the event types battle and remote violence, where one actor is civilians.",
      transform = "decay function"
    ),
    decay_acled_ns_5 = list(
      source = "Armed Conflict Location Event Dataset",
      description = "Fatality count from the event types battle and remote violence, where one actor is civilians.",
      transform = "decay function"
    ),
    
    # AQUASTAT Variables
    agr_withdrawal_pct_t48 = list(
      source = "AQUASTAT Glossary, FAO, 2019",
      description = "Agricultural water withdrawal as percentage of total renewable water resources",
      transform = "temporal lag of 48 months"
    ),
    dam_cap_pcap_t48 = list(
      source = "AQUASTAT Glossary, FAO, 2019",
      description = "Total dam storage capacity per capita [m3/inhab]",
      transform = "temporal lag of 48 months"
    ),
    groundwater_export_t48 = list(
      source = "AQUASTAT Glossary, FAO, 2019",
      description = "Average annual quantity of groundwater leaving the country (total) 10ˆ9 m3/year",
      transform = "temporal lag of 48 months"
    ),
    fresh_withdrawal_pct_t48 = list(
      source = "AQUASTAT Glossary, FAO, 2019",
      description = "Freshwater withdrawal as percentage of total renewable water resources",
      transform = "temporal lag of 48 months"
    ),
    ind_efficiency_t48 = list(
      source = "FAO. [2022]. AQUASTAT Core Database",
      description = "Industrial Water Use Efficiency in US dollars/m3",
      transform = "temporal lag of 48 months"
    ),
    irr_agr_efficiency_t48 = list(
      source = "FAO. [2022]. AQUASTAT Core Database",
      description = "Irrigated Agriculture Water Use Efficiency in US dollars/m3",
      transform = "temporal lag of 48 months"
    ),
    services_efficiency_t48 = list(
      source = "FAO. [2022]. AQUASTAT Core Database",
      description = "Services Water Use Efficiency in US dollars/m3",
      transform = "temporal lag of 48 months"
    ),
    general_efficiency_t48 = list(
      source = "FAO. [2022]. AQUASTAT Core Database",
      description = "Water Use Efficiency in US dollars/m3",
      transform = "temporal lag of 48 months"
    ),
    water_stress_t48 = list(
      source = "FAO. [2022]. AQUASTAT Core Database",
      description = "Freshwater withdrawal as a proportion of available freshwater resources, Water Stress",
      transform = "temporal lag of 48 months"
    ),
    renewable_internal_pcap_t48 = list(
      source = "FAO. [2022]. AQUASTAT Core Database",
      description = "Total internal renewable water resources per capita m3/inhab/yr",
      transform = "temporal lag of 48 months"
    ),
    renewable_pcap_t48 = list(
      source = "FAO. [2022]. AQUASTAT Core Database",
      description = "Total annual renewable water resources per capita m3/inhab/year",
      transform = "temporal lag of 48 months"
    ),
    
    # Spatial Lag Decay Variables
    splag_1_decay_ged_sb_5 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of battle-related deaths (BRDs) from state-based conflict as per the UCDP definition.",
      transform = "spatial lag, decay function"
    ),
    splag_1_decay_ged_os_5 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of fatalities from one-sided conflict as per the UCDP definition.",
      transform = "spatial lag, decay function"
    ),
    splag_1_decay_ged_ns_5 = list(
      source = "UCDP Georeferenced Events Dataset (UCDP GED)",
      description = "The best (most likely) estimate of the total number of fatalities from non-state conflict as per the UCDP definition.",
      transform = "spatial lag, decay function"
    )
  )
  
  # Apply attributes to each variable in the dataset
  for (var_name in names(codebook)) {
    if (var_name %in% names(data)) {
      # Set the source attribute
      attr(data[[var_name]], "source") <- codebook[[var_name]]$source
      
      # Set the description attribute
      attr(data[[var_name]], "description") <- codebook[[var_name]]$description
      
      # Set the transform attribute if it exists
      if (!is.na(codebook[[var_name]]$transform)) {
        attr(data[[var_name]], "transform") <- codebook[[var_name]]$transform
      }
      
      # Create a combined label for easy viewing
      label <- codebook[[var_name]]$description
      if (!is.na(codebook[[var_name]]$transform)) {
        label <- paste0(label, " [", codebook[[var_name]]$transform, "]")
      }
      attr(data[[var_name]], "label") <- label
    }
  }
  
  return(data)
}

# Function to view attributes of a specific variable
view_var_info <- function(data, var_name) {
  if (!var_name %in% names(data)) {
    cat("Variable", var_name, "not found in dataset\n")
    return(NULL)
  }
  
  cat("Variable:", var_name, "\n")
  cat("Source:", attr(data[[var_name]], "source"), "\n")
  cat("Description:", attr(data[[var_name]], "description"), "\n")
  
  transform <- attr(data[[var_name]], "transform")
  if (!is.null(transform)) {
    cat("Transform:", transform, "\n")
  }
  
  cat("\n")
}

# Function to create a searchable codebook dataframe
create_codebook_df <- function(data) {
  cb_list <- list()
  
  for (var_name in names(data)) {
    source <- attr(data[[var_name]], "source")
    description <- attr(data[[var_name]], "description")
    transform <- attr(data[[var_name]], "transform")
    
    if (!is.null(source) || !is.null(description)) {
      cb_list[[length(cb_list) + 1]] <- data.frame(
        variable = var_name,
        source = ifelse(is.null(source), NA, source),
        description = ifelse(is.null(description), NA, description),
        transform = ifelse(is.null(transform), NA, transform),
        stringsAsFactors = FALSE
      )
    }
  }
  
  if (length(cb_list) > 0) {
    codebook_df <- do.call(rbind, cb_list)
    return(codebook_df)
  } else {
    return(data.frame(variable = character(), source = character(), 
                     description = character(), transform = character()))
  }
}

# Function to search variables by keyword
search_variables <- function(data, keyword, search_in = c("variable", "description", "source")) {
  codebook_df <- create_codebook_df(data)
  
  keyword <- tolower(keyword)
  matches <- rep(FALSE, nrow(codebook_df))
  
  if ("variable" %in% search_in) {
    matches <- matches | grepl(keyword, tolower(codebook_df$variable))
  }
  if ("description" %in% search_in) {
    matches <- matches | grepl(keyword, tolower(codebook_df$description))
  }
  if ("source" %in% search_in) {
    matches <- matches | grepl(keyword, tolower(codebook_df$source))
  }
  
  return(codebook_df[matches, ])
}

# Example usage:
# Load your data
# data <- read.csv("your_data.csv")

# Add attributes to your dataset
# data_with_attrs <- add_codebook_attributes(data)

# View information about a specific variable
# view_var_info(data_with_attrs, "ged_sb")

# Create a searchable codebook dataframe
# codebook_df <- create_codebook_df(data_with_attrs)
# View(codebook_df)

# Search for variables containing specific keywords
# conflict_vars <- search_variables(data_with_attrs, "conflict")
# print(conflict_vars)

# Search for variables from a specific source
# vdem_vars <- search_variables(data_with_attrs, "vdem", search_in = "source")
# print(vdem_vars)
