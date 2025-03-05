

#building queries

#get  available info for project MMRF-COMMPASS
q_1 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'MMRF-COMMPASS') |> manifest()

#save info to file for future use
write.csv(q_3,file="out.txt",quote=FALE,row.names=FALSE)

#list only open access entries
q_2 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'MMRF-COMMPASS') |> filter(access == "open")|> manifest()

# restrict data to WXS  


q_3=files() |> GenomicDataCommons::filter(cases.project.project_id == 'MMRF-COMMPASS') |> filter(access == "open") |> filter(experimental_strategy == "WXS") |> manifest() 


#restrict data to WXS Masked Somatic Mutation
q_4=files() |> GenomicDataCommons::filter(cases.project.project_id == 'MMRF-COMMPASS') |> filter(access == "open") |> filter(experimental_strategy == "WXS" & data_type == 'Masked Somatic Mutation') |> manifest() 


#list files by timestamp

q_5=files() |> GenomicDataCommons::filter(cases.project.project_id == 'MMRF-COMMPASS') |> filter(access == "open") |> filter(experimental_strategy == "WXS" & data_type == 'Masked Somatic Mutation' & created_datetime < "2022-08-22T10:48:06.705961-05:00" ) |> manifest() 

#get the files
for(i in seq(1,dim(q_5)[1]))
{
uid<-0;
uid<-as.character(q_5[i,"id"])
gdcdata(uid)
}
