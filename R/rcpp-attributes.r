
# Call Rcpp::compileAttributes() for packages that link to Rcpp.
# Assumes Rcpp is installed
compile_rcpp_attributes <- function(path = ".") {
  path <- pkg_path(path)

  deps <- desc::desc_get_deps(path)
  links_to_rcpp <- any(deps$type == "LinkingTo" & deps$package == "Rcpp")

  if (links_to_rcpp) {
    Rcpp::compileAttributes(path)
  }
}
