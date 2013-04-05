raw_schools <- read.csv("SchoolLevelValueAdded2010_2012.csv")

schools <- raw_schools[raw_schools$Grade == "All Grades",]

va.2010 <- schools[schools$Year == '2010',
                   c("School.ID",
                     "Value.Added.Score",
                     "Value.Added.Score.1")]
va.2011 <- schools[schools$Year == '2011',
                   c("School.ID",
                     "Value.Added.Score",
                     "Value.Added.Score.1")]
va.2012 <- schools[schools$Year == '2012',
                   c("School.ID",
                     "Value.Added.Score",
                     "Value.Added.Score.1")]

va <- merge(va.2010, va.2011, by="School.ID")
va <- merge(va, va.2012, by="School.ID")

names(va) <- c("School.ID",
               "reading.2010",
               "math.2010",
               "reading.2011",
               "math.2011",
               "reading.2012",
               "math.2012")
va$reading.2010 <- as.numeric(as.character(va$reading.2010))
va$reading.2011 <- as.numeric(as.character(va$reading.2011))
va$reading.2012 <- as.numeric(as.character(va$reading.2012))

va$math.2010 <- as.numeric(as.character(va$math.2010))
va$math.2011 <- as.numeric(as.character(va$math.2011))
va$math.2012 <- as.numeric(as.character(va$math.2012))

plot(reading.2011 ~ reading.2010, data=va)
summary(lm(reading.2011 ~ reading.2010, data=va))
