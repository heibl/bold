#' bold: A programmatic interface to the Barcode of Life data.
#'
#' @section About:
#'
#' This package gives you access to data from BOLD System 
#' \url{http://www.boldsystems.org/} via their API 
#' (\url{http://v4.boldsystems.org/index.php/api_home})
#'
#' @section Functions:
#'
#' \itemize{
#'  \item \code{\link{bold_specimens}} - Search for specimen data.
#'  \item \code{\link{bold_seq}} - Search for and retrieve sequences.
#'  \item \code{\link{bold_seqspec}} - Get sequence and specimen data together.
#'  \item \code{\link{bold_trace}} - Get trace files - saves to disk.
#'  \item \code{\link{read_trace}} - Read trace files into R.
#'  \item \code{\link{bold_tax_name}} - Get taxonomic names via input names.
#'  \item \code{\link{bold_tax_id}} - Get taxonomic names via BOLD identifiers.
#'  \item \code{\link{bold_identify}} - Search for match given a COI sequence.
#' }
#'
#' Interestingly, they provide xml and tsv format data for the specimen data, 
#' while  they provide fasta data format for the sequence data. So for the 
#' specimen data  you can get back raw XML, or a data frame parsed from the 
#' tsv data, while for sequence data you get back a list (b/c sequences are 
#' quite long and would make a data frame unwieldy).
#' 
#' @importFrom crul HttpClient url_build
#' @importFrom xml2 read_xml xml_find_all xml_find_first xml_text 
#' xml_name as_list
#' @importFrom jsonlite fromJSON
#' @importFrom reshape sort_df
#' @importFrom plyr rbind.fill
#' @docType package
#' @name bold-package
#' @aliases bold
NULL

#' List of 3 nucleotide sequences to use in examples for the 
#' \code{\link{bold_identify}} function 
#' 
#' @details Each sequence is a character string, of lengths 410, 600, and 696.
#' @name sequences
#' @docType data
#' @keywords data
NULL
