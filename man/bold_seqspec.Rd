% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bold_seqspec.R
\name{bold_seqspec}
\alias{bold_seqspec}
\title{Get BOLD specimen + sequence data.}
\usage{
bold_seqspec(taxon = NULL, ids = NULL, bin = NULL, container = NULL,
  institutions = NULL, researchers = NULL, geo = NULL, marker = NULL,
  response = FALSE, format = "tsv", sepfasta = FALSE, ...)
}
\arguments{
\item{taxon}{(character) Returns all records containing matching taxa. Taxa 
includes the ranks of  phylum, class, order, family, subfamily, genus, 
and species.}

\item{ids}{(character) Returns all records containing matching IDs. IDs 
include Sample IDs, Process IDs, Museum IDs and Field IDs.}

\item{bin}{(character) Returns all records contained in matching BINs. A 
BIN is defined by a Barcode Index Number URI.}

\item{container}{(character) Returns all records contained in matching 
projects or datasets. Containers include project codes and dataset codes}

\item{institutions}{(character) Returns all records stored in matching 
institutions. Institutions are the Specimen Storing Site.}

\item{researchers}{(character) Returns all records containing matching 
researcher names. Researchers include collectors and specimen identifiers.}

\item{geo}{(character) Returns all records collected in matching geographic 
sites. Geographic sites includes countries and province/states.}

\item{marker}{(character) Returns all records containing matching marker
codes. See Details.}

\item{response}{(logical) Note that response is the object that returns 
from the Curl call, useful for debugging, and getting detailed info on 
the API call.}

\item{format}{(character) One of xml or tsv (default). tsv format gives
back a data.frame object. xml gives back parsed xml as a}

\item{sepfasta}{(logical) If \code{TRUE}, the fasta data is separated into
a list with names matching the processid's from the data frame.
Default: \code{FALSE}}

\item{...}{Further args passed on to \code{\link[crul]{HttpClient}}, main 
purpose being curl debugging}
}
\value{
Either a data.frame, parsed xml, a http response object, or a list
with length two (a data.frame w/o nucleotide data, and a list with
nucleotide data)
}
\description{
Get BOLD specimen + sequence data.
}
\section{Marker}{

Notes from BOLD on the \code{marker} param:
"All markers for a specimen matching the search string will be returned. 
ie. A record with COI-5P and ITS will return sequence data for both 
markers even if only COI-5P was specified."

You will likely end up with data with markers that you did not request -
just be sure to filter those out as needed.
}

\examples{
\dontrun{
bold_seqspec(taxon='Osmia')
bold_seqspec(taxon='Osmia', format='xml')
bold_seqspec(taxon='Osmia', response=TRUE)
res <- bold_seqspec(taxon='Osmia', sepfasta=TRUE)
res$fasta[1:2]
res$fasta['GBAH0293-06']

# records that match a marker name
res <- bold_seqspec(taxon="Melanogrammus aeglefinus", marker="COI-5P")

# records that match a geographic locality
res <- bold_seqspec(taxon="Melanogrammus aeglefinus", geo="Canada")

## curl debugging
### You can do many things, including get verbose output on the curl call,
### and set a timeout
head(bold_seqspec(taxon='Osmia', verbose = TRUE))
## timeout
# head(bold_seqspec(taxon='Osmia', timeout_ms = 1))
}
}
\references{
\url{http://v4.boldsystems.org/index.php/resources/api?type=webservices}
}
