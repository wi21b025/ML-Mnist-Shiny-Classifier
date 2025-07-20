# train_model.R

# Load necessary libraries
library(keras)

# Load MNIST dataset
mnist <- dataset_mnist()
mnist$train$x <- array_reshape(mnist$train$x / 255, c(nrow(mnist$train$x), 28, 28, 1))
mnist$test$x <- array_reshape(mnist$test$x / 255, c(nrow(mnist$test$x), 28, 28, 1))

# Define the model
model <- keras_model_sequential() %>%
  layer_conv_2d(filters = 16, kernel_size = c(3, 3), activation = 'relu', input_shape = c(28, 28, 1)) %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>%
  layer_conv_2d(filters = 16, kernel_size = c(3, 3), activation = 'relu') %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>%
  layer_flatten() %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dense(units = 10, activation = 'softmax')

# Compile the model
model %>% compile(
  loss = 'sparse_categorical_crossentropy',
  optimizer = 'adam',
  metrics = 'accuracy'
)

# Fit the model
model %>% fit(
  mnist$train$x, mnist$train$y,
  batch_size = 32,
  epochs = 100,
  validation_split = 0.2
)

# Save the model to the HDF5 file
model %>% save_model_hdf5("mnist_model.h5")
save_model_hdf5(model, "mnist_model.h5")

