food <- "eucalyptus leaves"
habitat <- "trees"

# the glue library contains a function glue (glue::glue) that is BETTER THAN paste()!!!!
# Learn more with `get_help("glue")`
phrase <- glue::glue("Koalas eat {food}, and they live in {habitat}.")

print(phrase)
