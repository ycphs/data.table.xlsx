#' Data.table Summen von Variablen
#'
#' creates a sum dependend of variables
#'
#' @param dt Datatable
#' @param bylist list of group by elements
#' @param ind_var indipendent variable vector index or names
#' @param dep_var dependent variable  vector index or names
#' @param dep_on dependent on varibale name or index one or per dependent variable
#' @param na.rm handles the na.rm variable at summing
#' @return summarized data.table
#' @export



dt_sum <-
      function(dt,
               ind_var,
               dep_var,
               dep_on,
               bylist,
               na.rm = TRUE) {
            requireNamespace(data.table)
            dt1 <- dt[, lapply(.SD, sum, na.rm), .SDcols = ind_var, by = bylist]
            dt2 <-
                  dt[, lapply(.SD, function(i)
                        sum(i * dep_on, na.rm) / sum(dep_on)), .SDcols = dep_var, by = bylist]
            setkeyv(dt1, bylist)
            setkeyv(dt2, bylist)
            dt1[dt2]
      }
