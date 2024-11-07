if !layer_exists("Controllers") layer_create(0, "Controllers")

// Init input manager
instance_create_layer(0, 0, "Controllers", obj_controller);