// This object is the one that initialize every other Controller

if !layer_exists("Controllers") layer_create(0, "Controllers")

// Internationalization (i18n)
instance_create_layer(0, 0, "Controllers", obj_i18n_manager);

// Init input manager
instance_create_layer(0, 0, "Controllers", obj_input_manager);