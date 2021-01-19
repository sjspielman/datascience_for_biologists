# Functions to build plot strings

build_sina_string <- function(args)
{
  plot_string <- glue::glue(
    "penguins %>%
            # Remove potential NAs for demonstrating visualization
            drop_na({args$x}) %>%
            ggplot(aes(x = {args$x},
                       y = {args$y})) +
    ") 
  
  if (args$color_style == color_choices[1])
  {
    plot_string <- glue::glue(
      plot_string, 
      "
          geom_sina(color = {args$color},
                    size  = 2) + 
      ")
  } else {
    plot_string <- glue::glue(
      plot_string, 
      "
          geom_sina(color = {args$x},
                    size  = 2) + 
      ")
  }
  plot_string <- glue::glue(
    plot_string, 
    "
    labs(title = {args$title})"
  )
  plot_string
}


build_jitter_string <- function(args)
{
  
  if (args$jitter_setting == jitter_choices[1])
  {
    geom <- "geom_jitter("
  } else {
    geom <- "geom_point("
    
  }
  plot_string <- glue::glue(
    "penguins %>%
            # Remove potential NAs for demonstrating visualization
            drop_na({args$x}) %>%
            ggplot(aes(x = {args$x},
                       y = {args$y})) +
    ") 
  
  if (args$color_style == color_choices[1])
  {
    plot_string <- glue::glue(
      plot_string, 
      "
          {geom}color = {args$color}, 
                      size  = 2, 
                      width = 0.2) + 
      ")
  } else {
    plot_string <- glue::glue(
      plot_string, 
      "
          {geom}aes(color = {args$x}),
                      size = 2,
                      width = 0.2) + 
      ")
  }
  plot_string <- glue::glue(
    plot_string, 
    "
    labs(title = {args$title})"
  )
  plot_string
}


build_boxplot_violin_string <- function(args, geom)
{
  plot_string <- glue::glue(
    "penguins %>%
            # Remove potential NAs for demonstrating visualization
            drop_na({args$x}) %>%
            ggplot(aes(x = {args$x},
                       y = {args$y})) +
    ") 

  if (args$color_style == color_choices[1])
  {
    plot_string <- glue::glue(
      plot_string, 
      "
          {geom}(fill = {args$fill}) + 
      ")
  } else {
    plot_string <- glue::glue(
      plot_string, 
      "
          {geom}(aes(fill = {args$x})) + 
      ")
  }
  plot_string <- glue::glue(
    plot_string, 
    "
    labs(title = {args$title})"
  )
  plot_string
}

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