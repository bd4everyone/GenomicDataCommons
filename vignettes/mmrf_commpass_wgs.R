

#building queries

#get  available info for project MMRF-COMMPASS
q_1 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'MMRF-COMMPASS') |> manifest()

#save info to file for future use
write.csv(q_1,file="out.txt",quote=FALE,row.names=FALSE)

#list only open access entries
q_2 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'MMRF-COMMPASS') |> filter(access == "open")|> manifest()

# restrict data to WGS  


q_3=files() |> GenomicDataCommons::filter(cases.project.project_id == 'MMRF-COMMPASS') |> filter(access == "open") |> filter(experimental_strategy == "WGS") |> manifest() 


#restrict data to WGS Copy Number Segment
q_4=files() |> GenomicDataCommons::filter(cases.project.project_id == 'MMRF-COMMPASS') |> filter(access == "open") |> filter(experimental_strategy == "WGS" & data_type == 'Copy Number Segment') |> manifest() 


#get files less than size 32000

q_5=files() |> GenomicDataCommons::filter(cases.project.project_id == 'MMRF-COMMPASS') |> filter(access == "open") |> filter(experimental_strategy == "WGS" & data_type == 'Copy Number Segment' & file_size < 32000) |> manifest() 

#get the files
for(i in seq(1,dim(q_5)[1]))
{
uid<-0;
uid<-as.character(q_6[i,"id"])
gdcdata(uid)
}
