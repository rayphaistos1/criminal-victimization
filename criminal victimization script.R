## Script for analyzing criminal victimization data
## Script written by Raymond K Roberts 2019
## Contact me at raymond.k.roberts@gmail.com


## Data provided by U.S. Department of Justice Office of Justice Programs
## Rachel E Morgan, PhD, and Barbara A. Oudekerk, PhD., BJS Statisticians
## Link to paper: https://www.bjs.gov/content/pub/pdf/cv18.pdf


library(ggplot2)


#loading raw data for each ethinicity into vectors

#Raw count totals of incidents for each race, in the order of [white,black, hispanic, asian]
raw_count <- c(3581360,563940,734410,182,230)

#proportionality vectors. Note that proportions do not total to 1.00 since not all columns were utilized.
white_prop <-c(.621,.153,.102,.022)
black_prop <-c(.106,.703,.079,.01)
hisp_prop <- c(.282,.153,.454,.06)
asian_prop <- c(.241,.275,.07,.241)

#creating raw counts from provided proportion data above
white <- raw_count[1]*white_prop
black <- raw_count[2]*black_prop
hispanic <- raw_count[3]*hisp_prop
asian <- raw_count[4]*asian_prop

#creating working dataframe
df <- as.data.frame(cbind(white,black,hispanic,asian))
ef <-stack(df)
ef$killer <- c("white", "black", "hispanic", "asian","white", "black", "hispanic", "asian","white", "black", "hispanic", "asian","white", "black", "hispanic", "asian")


#naming columns
colnames(ef)<-c("incidents", "victim", "actor")



# GRaphs with different views

#Stacked Data
ggplot(ef, aes(fill=actor, y=incidents, x=victim)) + 
  geom_bar(position="stack", stat="identity")+ labs(title= "Raw Count of Violent Crimes", subtitle = "Source: Criminal Victimization, 2018; Morgan & Oudekerk",caption = "Graph Creator: Raymond.K.Roberts@gmail.com")+
  scale_fill_brewer(palette="Set1") + scale_fill_manual(values=c("purple", "blue", "red", "yellow"))

#Proportionality by Victim Group
ggplot(ef, aes(fill=actor, y=incidents, x=victim)) + 
  geom_bar(position="fill", stat="identity")+ labs(title= "Proportion of Violent Crimes", subtitle = "Source: Criminal Victimization, 2018; Morgan & Oudekerk",caption = "Graph Creator: Raymond.K.Roberts@gmail.com")+
  scale_fill_brewer(palette="Set1") + scale_fill_manual(values=c("purple", "blue", "red", "yellow"))

#Bar Chart grouped by victim
ggplot(ef, aes(fill=actor, y=incidents, x=victim)) + 
  geom_bar(position="dodge", stat="identity")+ labs(title= "Raw Count (grouped) of Violent Crimes", subtitle = "Source: Criminal Victimization, 2018; Morgan & Oudekerk",caption = "Graph Creator: Raymond.K.Roberts@gmail.com")+
  scale_fill_brewer(palette="Set1") + scale_fill_manual(values=c("purple", "blue", "red", "yellow"))


