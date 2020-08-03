% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parse-body.R
\name{parser_query}
\alias{parser_query}
\alias{parser_json}
\alias{parser_text}
\alias{parser_yaml}
\alias{parser_csv}
\alias{parser_tsv}
\alias{parser_read_file}
\alias{parser_rds}
\alias{parser_octet}
\alias{parser_multi}
\alias{parser_none}
\title{Plumber Parsers}
\usage{
parser_query()

parser_json(...)

parser_text(parse_fn = identity)

parser_yaml(...)

parser_csv(...)

parser_tsv(...)

parser_read_file(read_fn = readLines)

parser_rds(...)

parser_octet()

parser_multi()

parser_none()
}
\arguments{
\item{...}{parameters supplied to the appropriate internal function}

\item{parse_fn}{function to further decode a text string into an object}

\item{read_fn}{function used to read a the content of a file. Ex: \code{\link[=readRDS]{readRDS()}}}
}
\description{
Parsers are used in Plumber to transform the raw body content received
by a request to the API. Extra parameters may be provided to parser
functions when adding the parser to plumber. This will allow for
non-default behavior.
}
\details{
Parsers are optional. When unspecified, only the \code{\link[=parser_json]{parser_json()}},
\code{\link[=parser_octet]{parser_octet()}}, \code{\link[=parser_query]{parser_query()}} and \code{\link[=parser_text]{parser_text()}} are available.
You can use \verb{@parser parser} tag to activate parsers per endpoint.
Multiple parsers can be activated for the same endpoint using multiple \verb{@parser parser} tags.

User should be aware that \code{rds} parsing should only be done from a
trusted source. Do not accept \code{rds} files blindly.

See \code{\link[=registered_parsers]{registered_parsers()}} for a list of registered parsers.
}
\section{Functions}{
\itemize{
\item \code{parser_query}: Query string parser

\item \code{parser_json}: JSON parser

\item \code{parser_text}: Helper parser to parse plain text

\item \code{parser_yaml}: YAML parser

\item \code{parser_csv}: CSV parser

\item \code{parser_tsv}: TSV parser

\item \code{parser_read_file}: Helper parser that writes the binary post body to a file and reads it back again using \code{read_fn}.
This parser should be used when reading from a file is required.

\item \code{parser_rds}: RDS parser

\item \code{parser_octet}: Octet stream parser. Will add a filename attribute if the filename exists

\item \code{parser_multi}: Multi part parser. This parser will then parse each individual body with its respective parser

\item \code{parser_none}: No parser. Will not process the postBody.
}}

\examples{
\dontrun{
# Overwrite `text/json` parsing behavior to not allow JSON vectors to be simplified
#* @parser json simplifyVector = FALSE
# Activate `rds` parser in a multipart request
#* @parser multi
#* @parser rds
pr <- plumber$new()
pr$handle("GET", "/upload", function(rds) {rds}, parsers = c("multi", "rds"))
}
}