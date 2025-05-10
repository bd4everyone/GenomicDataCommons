library(dplyr)
library(tibble)
library(GenomicDataCommons)

#build queries to get simple somatic mutations
q_primsite_1 = ssm_occurrences() |> GenomicDataCommons::filter(case.primary_site== 'Esophagus') |> GenomicDataCommons::expand(c('ssm','case')) |> GenomicDataCommons::results_all() |> as_tibble()

#add search criteria
q_primsite_2 = ssm_occurrences() |> GenomicDataCommons::filter(case.primary_site== 'Esophagus' & case.lost_to_followup == 'No' ) |> GenomicDataCommons::expand(c('ssm','case')) |> GenomicDataCommons::results_all() |> as_tibble()

################
q_consent = ssm_occurrences() |> GenomicDataCommons::filter(case.consent_type== 'Consent by Death') |> GenomicDataCommons::expand(c('ssm','case')) |> GenomicDataCommons::results_all() |> as_tibble()

write.csv(q_consent,file="ssm_consentbyDeath.txt",row.names=FALSE,quote=FALSE)

q_del = ssm_occurrences() |> GenomicDataCommons::filter(ssm.mutation_subtype == 'Small deletion') |> GenomicDataCommons::expand(c('ssm')) |> GenomicDataCommons::results_all() |> as_tibble()

write.csv(q_del,file="ssm_subtypeDeletions.txt",row.names=FALSE,quote=FALSE)

#get simple somatic mutations on chr one
q_chrone = ssm_occurrences() |> GenomicDataCommons::filter(ssm.chromosome == 'chr1') |> GenomicDataCommons::expand(c('ssm')) |> GenomicDataCommons::results_all() |> as_tibble()

write.csv(q_chrone,file="simplesomaticmutschr1.txt",row.names=FALSE,quote=FALSE)

######################------------------------------################################
####get all simple somatic mutations on chr 17
q_1 = ssm_occurrences() |> GenomicDataCommons::filter(ssm.chromosome == 'chr17') |> GenomicDataCommons::expand(c('ssm')) |> GenomicDataCommons::results_all() |> as_tibble()

write.csv(q_1,file="simplesomaticmutschr17.txt",row.names=FALSE,quote=FALSE)


#pull  mutations on chr17 for TP53

q_2 = ssm_occurrences() |> GenomicDataCommons::filter(ssm.consequence.transcript.gene.symbol == 'TP53' & ssm.chromosome == 'chr17') |> GenomicDataCommons::expand(c('case','ssm')) |> GenomicDataCommons::results_all() |> as_tibble()

write.csv(q_2,file="TP53var_samples17.txt",row.names=FALSE,quote=FALSE)
#sanity check: TP53 gene located on chr17 , so same results
q_3 = ssm_occurrences() |> GenomicDataCommons::filter(ssm.consequence.transcript.gene.symbol == 'TP53') |> GenomicDataCommons::expand(c('case','ssm')) |> GenomicDataCommons::results_all() |> as_tibble()

write.csv(q_3,file="TP53var_samples.txt",row.names=FALSE,quote=FALSE)


#pull  mutations on chr17 for NF1
q_4 = ssm_occurrences() |> GenomicDataCommons::filter(ssm.consequence.transcript.gene.symbol == 'NF1' & ssm.chromosome == 'chr17') |> GenomicDataCommons::expand(c('case','ssm')) |> GenomicDataCommons::results_all() |> as_tibble()

write.csv(q_4,file="NF1var_samples17.txt",row.names=FALSE,quote=FALSE)

#sanity check : NF1 gene located on chr17, so same results
q_5 = ssm_occurrences() |> GenomicDataCommons::filter(ssm.consequence.transcript.gene.symbol == 'NF1') |> GenomicDataCommons::expand(c('case','ssm')) |> GenomicDataCommons::results_all() |> as_tibble()
write.csv(q_5,file="NF1var_samples.txt",row.names=FALSE,quote=FALSE)

