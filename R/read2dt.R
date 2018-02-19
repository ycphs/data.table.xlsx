



#' @title  Read from an Excel file or Workbook object
#' @description Read data from an Excel file or Workbook object into a data.frame
#' @param xlsxFile An xlsx file, Workbook object or URL to xlsx file.
#' @param sheet The name or index of the sheet to read data from.
#' @param startRow first row to begin looking for data.  Empty rows at the top of a file are always skipped, 
#' regardless of the value of startRow.
#' @param colNames If \code{TRUE}, the first row of data will be used as column names. 
#' @param skipEmptyRows If \code{TRUE}, empty rows are skipped else empty rows after the first row containing data 
#' will return a row of NAs.
#' @param rowNames If \code{TRUE}, first column of data will be used as row names.
#' @param detectDates If \code{TRUE}, attempt to recognise dates and perform conversion.
#' @param cols A numeric vector specifying which columns in the Excel file to read. 
#' If NULL, all columns are read.
#' @param rows A numeric vector specifying which rows in the Excel file to read. 
#' If NULL, all rows are read.
#' @param check.names logical. If TRUE then the names of the variables in the data frame 
#' are checked to ensure that they are syntactically valid variable names
#' @param namedRegion A named region in the Workbook. If not NULL startRow, rows and cols paramters are ignored.
#' @param na.strings A character vector of strings which are to be interpreted as NA. Blank cells will be returned as NA.
#' @param fillMergedCells If TRUE, the value in a merged cell is given to all cells within the merge.
#' @param skipEmptyCols If \code{TRUE}, empty columns are skipped.
#' @seealso \code{\link{getNamedRegions}}
#' @details Formulae written using writeFormula to a Workbook object will not get picked up by read.xlsx().
#' This is because only the formula is written and left to be evaluated when the file is opened in Excel.
#' Opening, saving and closing the file with Excel will resolve this.
#' @author Alexander Walker
#' @return data.frame
#' @export
#' @examples
#' xlsxFile <- system.file("readTest.xlsx", package = "openxlsx")
#' df1 <- read.xlsx(xlsxFile = xlsxFile, sheet = 1, skipEmptyRows = FALSE)
#' sapply(df1, class)
#' 
#' df2 <- read.xlsx(xlsxFile = xlsxFile, sheet = 3, skipEmptyRows = TRUE)
#' df2$Date <- convertToDate(df2$Date)
#' sapply(df2, class)
#' head(df2)
#' 
#' df2 <- read.xlsx(xlsxFile = xlsxFile, sheet = 3, skipEmptyRows = TRUE,
#'                    detectDates = TRUE)
#' sapply(df2, class)
#' head(df2)
#' 
#' wb <- loadWorkbook(system.file("readTest.xlsx", package = "openxlsx"))
#' df3 <- read.xlsx(wb, sheet = 2, skipEmptyRows = FALSE, colNames = TRUE)
#' df4 <- read.xlsx(xlsxFile, sheet = 2, skipEmptyRows = FALSE, colNames = TRUE)
#' all.equal(df3, df4)
#' 
#' wb <- loadWorkbook(system.file("readTest.xlsx", package = "openxlsx"))
#' df3 <- read.xlsx(wb, sheet = 2, skipEmptyRows = FALSE,
#'  cols = c(1, 4), rows = c(1, 3, 4))
#' 
#' ## URL
#' ## 
#' #xlsxFile <- "https://github.com/awalker89/openxlsx/raw/master/inst/readTest.xlsx"
#' #head(read.xlsx(xlsxFile))
#' 
#' 
#' @export
read2dt<-function(xlsxFile, sheet = 1, startRow = 1, colNames = TRUE,
                  rowNames = FALSE, detectDates = TRUE, skipEmptyRows = TRUE,
                  skipEmptyCols = TRUE, rows = NULL, cols = NULL, check.names = FALSE,
                  namedRegion = NULL, na.strings = "NA", fillMergedCells = FALSE)
{
      #require(openxlsx)
      dat<-read.xlsx(xlsxFile, sheet , startRow , colNames ,
                rowNames , detectDates , skipEmptyRows ,
                skipEmptyCols, rows, cols, check.names ,
                namedRegion , na.strings , fillMergedCells )
      setDT(dat)
      return(dat)
}
