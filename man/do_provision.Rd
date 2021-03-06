% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/digital-ocean.R
\name{do_provision}
\alias{do_provision}
\title{Provision a DigitalOcean plumber server}
\usage{
do_provision(droplet, unstable = FALSE, example = TRUE, ...)
}
\arguments{
\item{droplet}{The DigitalOcean droplet that you want to provision (see \code{\link[analogsea:droplet]{analogsea::droplet()}}). If empty, a new DigitalOcean server will be created.}

\item{unstable}{If \code{FALSE}, will install plumber from CRAN. If \code{TRUE}, will install the unstable version of plumber from GitHub.}

\item{example}{If \code{TRUE}, will deploy an example API named \code{hello} to the server on port 8000.}

\item{...}{Arguments passed into the \code{\link[analogsea:droplet_create]{analogsea::droplet_create()}} function.}
}
\description{
Create (if required), install the necessary prerequisites, and
deploy a sample plumber application on a DigitalOcean virtual machine.
You may sign up for a Digital Ocean account \href{https://m.do.co/c/add0b50f54c4}{here}.
This command is idempotent, so feel free to run it on a single server multiple times.
}
\details{
Provisions a Ubuntu 20.04-x64 droplet with the following customizations:
\itemize{
\item A recent version of R installed
\item plumber installed globally in the system library
\item An example plumber API deployed at \verb{/var/plumber}
\item A systemd definition for the above plumber API which will ensure that the plumber
API is started on machine boot and respawned if the R process ever crashes. On the
server you can use commands like \verb{systemctl restart plumber} to manage your API, or
\verb{journalctl -u plumber} to see the logs associated with your plumber process.
\item The `nginx`` web server installed to route web traffic from port 80 (HTTP) to your plumber
process.
\item \code{ufw} installed as a firewall to restrict access on the server. By default it only
allows incoming traffic on port 22 (SSH) and port 80 (HTTP).
\item A 4GB swap file is created to ensure that machines with little RAM (the default) are
able to get through the necessary R package compilations.
}
}
