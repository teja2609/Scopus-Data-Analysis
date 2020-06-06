library(sqldf)
dat <- read.csv("scopus1.csv")
dat1 <- read.csv("scopus1.csv")
colnames(dat)
colnames(dat1)[1] <- "author"
colnames(dat1)[2] <- "id"
colnames(dat1)[5] <- "source_title"
colnames(dat1)[12] <- "cit_no"
colnames(dat1)[15] <- "address"
colnames(dat)[1] <- "author"
colnames(dat)[2] <- "id"
colnames(dat)[5] <- "source_title"
colnames(dat)[12] <- "cit_no"
colnames(dat)[15] <- "address"

sort(dat1$cit_no,decreasing = TRUE)
dat1$cit_no[1]
Ans1 <- sqldf(" select author from dat where cit_no = '3391' ")
Ans1
dat1$Publisher
AnsC <- sqldf(" select address from dat where author='Shor P.W.' ")
Ans <- sqldf(" select author,cit_no,address from dat where address LIKE '%india%' ")
AnsH <- sqldf("select author,MAX(cit_no) from Ans ")
AnsH
Ans
ans11 <- sqldf(" select author from Ans ")

s <- strsplit(Ans$author, split = ",")
kk <- data.frame(cit_no = rep(Ans$cit_no, sapply(s, length)),address = rep(Ans$address, sapply(s, length)), author = unlist(s))
AnsG <- sqldf(" select author,address from kk where cit_no = ( select MAX(cit_no) from kk)")
AnsG
