
# 🧠 MNIST Digit Classifier – Shiny App Deployment

This project demonstrates how to deploy a convolutional neural network (CNN) model for handwritten digit recognition using R and Shiny. The model is trained on the MNIST dataset and integrated into a Shiny web application to allow users to classify uploaded digit images in real-time.

---

## 🎯 Purpose

To provide a hands-on example of machine learning model deployment using Shiny for educational purposes. It showcases end-to-end development, from model training to building an interactive web interface for predictions.

---

## 🚀 Features

- 📷 Upload interface for `.jpeg` and `.png` digit images
- 🔄 Image preprocessing to match MNIST input format
- 🧠 CNN trained with Keras and TensorFlow in R
- 🔍 Real-time digit prediction with visual feedback
- 💡 Fully integrated Shiny web interface for non-technical users

---

## 🛠 Technology Stack

- **Language:** R
- **Machine Learning:** Keras + TensorFlow (R interface)
- **Frontend:** Shiny
- **Model Format:** HDF5 (`.h5`)
- **Deployment Ready:** via RStudio Connect

---

## 📂 Project Structure

```
.
├── app.R                  # Shiny application (UI + server logic)
├── train_model.R          # CNN model training script
├── mnist_model.h5         # Pre-trained Keras model (used by app)
├── data/                  # Optional input data samples
└── rsconnect/             # RStudio Connect deployment configuration
```

---

## 🧠 Model Details

Trained using the MNIST dataset of handwritten digits:

- 2 convolutional layers (16 filters, 3x3 kernel)
- MaxPooling layers
- Dense + Flatten layers
- Output layer: softmax with 10 units (digits 0–9)

**Training Configuration:**
- Optimizer: Adam
- Epochs: 100
- Batch Size: 32
- Loss Function: Sparse Categorical Crossentropy
- Validation Split: 0.2

---

## ⚙️ Running the Application

### 1. Install Required Libraries

```R
install.packages(c("shiny", "jpeg"))
library(keras)
install_keras()
```

### 2. Start the App

Open `app.R` in RStudio and click **Run App**.

### 3. Upload Image

Upload a 28x28 grayscale image (`.jpeg` or `.png`) of a digit for prediction.

---

## 🧪 Model Training (Optional)

To train the model from scratch, run:

```R
source("train_model.R")
```

This generates `mnist_model.h5`, which the app uses for predictions.

---

## 📌 Version

**v1.0** — MNIST Digit Classifier with Shiny front-end

---

## 📜 License

This project is provided for educational purposes. All rights reserved.
