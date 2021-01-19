# Functions to build plot strings

build_histogram_string <- function(args)
{

  # single
  glue::glue("ggplot(penguins, aes(x = {args$x})) + 
                      geom_histogram(binwidth = {args$binwidth}, fill = {args$fill}, color = 'black') +
                      labs(title    = {args$title_single},
                           subtitle = {args$sub_single})") -> single
  
  # faceted
  faceted <- glue::glue(
    "penguins %>%
            # Remove potential NAs for demonstrating visualization
            drop_na({args$facet}) %>%
            ggplot(aes(x = {args$x})) +
          "
  )
  
  if (args$color_style == color_choices[1])
  {
    
    faceted <- glue::glue(
      faceted, 
      "
        geom_histogram(fill     = {args$fill},
                       color    = 'black',
                       binwidth = {args$binwidth}) + 
             ")
  } else {
    faceted <- glue::glue(
      faceted, 
      "
        geom_histogram(aes(fill = {args$facet}),
                       color    = 'black', 
                       binwidth = {args$binwidth}) +
            ")
  }
  
  faceted <- glue::glue(
    faceted, 
    "  
        facet_wrap(vars({args$facet})) +
        labs(title = {args$title_faceted},
             subtitle = {args$sub_faceted})")
  
  list("single" = single,
       "faceted" = faceted)

  }