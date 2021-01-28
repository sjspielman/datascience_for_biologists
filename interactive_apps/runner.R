run_module <- function(module_id)
{

  if (module_id == "types_of_plots")
  {
    shiny::runApp("types_of_plots/")
  } else {  
    rmd_file <- dplyr::case_when(
      module_id == "data_figures" ~ "module_intro_data-figures.Rmd",
      module_id == "intro_R" ~ "module_intro_R.Rmd",
      module_id == "dplyr" ~ "module_intro_dplyr.Rmd",
      module_id == "ggplot" ~ "module_intro_ggplot.Rmd"
    )
    rmarkdown::run(rmd_file)
  }
  
}
