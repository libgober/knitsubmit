#' Custom Knit function for RStudio
#'
#' @export
knit_all <- function(input, ...) {
  #the default template, suitable for website etc.
  rmarkdown::render(
    input,
    output_format=rmarkdown::pdf_document(
      latex_engine='xelatex',
      template=system.file('templates','default.tex',package="knitsubmit"),
      keep_tex=TRUE
    ),
    output_file = c(
      paste0(
        xfun::sans_ext(input), '-default.pdf'
      )
    ),
    envir = globalenv()
  );
  #a blinded template with separate title page
  rmarkdown::render(
    input,
    output_format=rmarkdown::pdf_document(
      latex_engine='xelatex',
      template=system.file('templates','blinded.tex',package="knitsubmit"),
      keep_tex=TRUE
    ),
    output_file = c(
      paste0(
        xfun::sans_ext(input), '-blinded.pdf'
      )
    ),
    params=list(blinded=TRUE),
    envir = globalenv()
  );
  # a plain title page
  rmarkdown::render(
    input,
    output_format=rmarkdown::pdf_document(
      latex_engine='xelatex',
      template=system.file('templates','titlepage.tex',package="knitsubmit"),
      keep_tex=TRUE
    ),
    output_file = c(
      paste0(
        xfun::sans_ext(input), '-titlepage.pdf'
      )
    ),
    params=list(blinded=TRUE),
    envir = globalenv()
  ) 
  # without frontmatter, good for word counts
  rmarkdown::render(
    input,
    output_format=rmarkdown::pdf_document(
      latex_engine='xelatex',
      template=system.file('templates','without_frontmatter.tex',package="knitsubmit"),
      keep_tex=TRUE
    ),
    output_file = c(
      paste0(
        xfun::sans_ext(input), '-without_frontmatter.pdf'
      )
    ),
    params=list(blinded=TRUE),
    envir = globalenv()
  )  
}