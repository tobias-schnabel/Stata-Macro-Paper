***SET WORKING DIRECTORY
cd "/Users/ts/OneDrive/Uni/UM OD/Year 1/Macro/stata/"

qui include "/Users/ts/Git/Stata_Macro_UM/do/paths.do"

use "${apidata}/WBAPI_merged_raw.dta", clear
des
*BEGIN DATA CLEANING

**ORDER VARS LIKE PREVIOUS ANALYSIS STRUCTURE (PER COUNTRY,EXCEL DATA)
order bg_gsr_nfsv_gd_zs - si_spr_pcap_zg

order CC Year, first

foreach oldvar of varlist bg_gsr_nfsv_gd_zs - si_spr_pcap_zg {
	notes `oldvar' : `oldvar'
}

*Batch rename
rename (bg_gsr_nfsv_gd_zs -  si_spr_pcap_zg) v#, addnumber

format Year %ty

la val v* .

save "${apidata}/WBAPI_cleaned_renamed.dta", replace




