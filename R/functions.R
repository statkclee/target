clean_penguin_data <- function(penguins_data_raw) {
  penguins_data_raw |>
    select(
      species = Species,
      bill_length_mm = `Culmen Length (mm)`,
      bill_depth_mm = `Culmen Depth (mm)`
    ) |>
    remove_missing(na.rm = TRUE) |>
    # Split "species" apart on spaces, and only keep the first word
    separate(species, into = "species", extra = "drop")
}

glance_with_mod_name <- function(model_in_list) {
  model_name <- names(model_in_list)
  model <- model_in_list[[1]]
  glance(model) |>
    mutate(model_name = model_name)
}

augment_with_mod_name <- function(model_in_list) {
  model_name <- names(model_in_list)
  model <- model_in_list[[1]]
  augment(model) |>
    mutate(model_name = model_name)
}

glance_with_mod_name_slow <- function(model_in_list) {
  Sys.sleep(5)
  model_name <- names(model_in_list)
  model <- model_in_list[[1]]
  broom::glance(model) |>
    mutate(model_name = model_name)
}

augment_with_mod_name_slow <- function(model_in_list) {
  Sys.sleep(5)
  model_name <- names(model_in_list)
  model <- model_in_list[[1]]
  broom::augment(model) |>
    mutate(model_name = model_name)
}
