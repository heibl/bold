#' Search BOLD for specimens.
#'
#' @export
#' @template args
#' @template otherargs
#' @references 
#' \url{http://v4.boldsystems.org/index.php/resources/api?type=webservices}
#'
#' @param format (character) One of xml, json, tsv (default). tsv format gives 
#' back a data.frame object. xml gives back parsed XML as \code{xml_document}
#' object. 'json' (JavaScript Object Notation) and 'dwc' (Darwin Core Archive)
#' are supported in theory, but the JSON can be malformed, so we don't support
#' that here, and the DWC option actually returns TSV.
#'
#' @examples \dontrun{
#' bold_specimens(taxon='Osmia')
#' bold_specimens(taxon='Osmia', format='xml')
#' bold_specimens(taxon='Osmia', response=TRUE)
#' res <- bold_specimens(taxon='Osmia', format='xml', response=TRUE)
#' res$url
#' res$status_code
#' res$response_headers
#'
#' # More than 1 can be given for all search parameters
#' bold_specimens(taxon=c('Coelioxys','Osmia'))
#'
#' ## curl debugging
#' ### These examples below take a long time, so you can set a timeout so that 
#' ### it stops by X sec
#' head(bold_specimens(taxon='Osmia', verbose = TRUE))
#' # head(bold_specimens(geo='Costa Rica', timeout_ms = 6))
#' }

bold_specimens <- function(taxon = NULL, ids = NULL, bin = NULL, 
  container = NULL, institutions = NULL, researchers = NULL, geo = NULL, 
  response=FALSE, format = 'tsv', ...) {

  format <- match.arg(format, choices = c('xml', 'tsv'))
  args <- bc(list(taxon = pipeornull(taxon), geo = pipeornull(geo), 
                  ids = pipeornull(ids), bin = pipeornull(bin), 
                  container = pipeornull(container), 
                  institutions = pipeornull(institutions), 
                  researchers = pipeornull(researchers), 
                  format = format))
  check_args_given_nonempty(args, c('taxon','ids','bin','container',
                                    'institutions','researchers','geo'))
  out <- b_GET(paste0(bbase(), 'API_Public/specimen'), args, ...)
  if (response) {
    out
  } else {
    tt <- rawToChar(out$content)
    switch(format,
           xml = xml2::read_xml(tt),
           tsv = utils::read.delim(text = tt, header = TRUE, sep = "\t",
                            stringsAsFactors = FALSE)
    )
  }
}
