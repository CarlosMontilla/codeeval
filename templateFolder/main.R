args <- commandArgs(trailingOnly=TRUE)
test.cases <- strsplit(readLines(args[[1]], warn=FALSE), '\n')
for (test in test.cases) {
   if (length(test) > 0) {
       # ignore test if it is an empty line
       # 'test' represents the test case, do something with it
   }
}
