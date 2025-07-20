  # app.R
  
  # Load necessary libraries for the Shiny app
  library(shiny)
  library(keras)
  library(tensorflow)
  library(jpeg)
  
  
  # Define the UI
  ui <- fluidPage(
    titlePanel(" "),
    sidebarLayout(
      sidebarPanel(
        fileInput("image", "Upload an image", accept = c('image/jpeg', 'image/png'))
      ),
      mainPanel(
        textOutput("prediction"),
        plotOutput("imagePlot")
      )
    )
  )
  
  # Define server logic
  server <- function(input, output) {
    
    
    # Load the pre-trained model
    model <- load_model_hdf5("./mnist_model.h5")
    
    
    # Function to preprocess the image
    preprocess_image <- function(image_path) {
      img <- keras::image_load(image_path, target_size = c(28, 28), grayscale = TRUE)
      img <- keras::image_to_array(img)
      img <- array_reshape(img, c(1, 28, 28, 1))
      img <- img / 255
      return(img)
    }
    
    # Reactive expression to process image
    processed_image <- reactive({
      req(input$image)
      preprocess_image(input$image$datapath)
    })
    
    # Display prediction
    output$prediction <- renderText({
      req(processed_image())
      # Predict and format output
      prediction <- model %>% predict(processed_image())
      predicted_class <- which.max(prediction) - 1
      paste("Predicted Class:", predicted_class)
    })
    
    # Display image
    output$imagePlot <- renderPlot({
      req(input$image)
      img <- jpeg::readJPEG(input$image$datapath)
      plot(as.raster(img))
    })
  }
  
  # Run the application
  shinyApp(ui, server)
