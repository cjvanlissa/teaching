#' @title Parse user data from BlackBoard
#' @description Copy the contents of the BlackBoard users page to the clipboard,
#' and run this function.
#' @param text Character string containing BlackBoard user data,
#' Default: readLines("clipboard")
#' @param role Character vector containing roles to retain, Default: 'student'
#' @return A \code{data.frame}
#' @examples
#' tmp <- c("\t 48483 Options Menu: Username\tFirst\tLast\tfirstlast@students.uu.nl\tstudent\t\tYes")
#' read_bb(tmp)
#' @rdname read_bb
#' @export
read_bb <- function(text = readLines("clipboard"), role = "student"){
  text <- text[grepl("Options Menu: Username", text)]
  df <- data.frame(t(sapply(text, function(x){ strsplit(x, split = "\t")[[1]]})))[, -c(1, 7:8)]
  names(df) <- c("number", "first", "last", "email","role")
  df$number <- trimws(gsub("Options Menu: Username", "", df$number, fixed = TRUE))
  if(!is.null(role)){
    df <- df[df$role %in% role, ]
  }
  rownames(df) <- NULL
  return(df)
}
