%let pgm=utl-altair-slc-kera-deep-neural-networks-pnn-to-classify-iris-species-using-flower-meaurements;

%stop_submission;

Altair slc kera deep neural networks pnn to classify iris species using flower meaurements

Graphics
https://github.com/rogerjdeangelis/utl-altair-slc-kera-deep-neural-networks-pnn-to-classify-iris-species-using-flower-meaurements/blob/main/confusion_matrix.png
https://github.com/rogerjdeangelis/utl-altair-slc-kera-deep-neural-networks-pnn-to-classify-iris-species-using-flower-meaurements/blob/main/training_history.png

Too long to post on a list, see github
https://github.com/rogerjdeangelis/utl-altair-slc-kera-deep-neural-networks-pnn-to-classify-iris-species-using-flower-meaurements

altair community
https://community.altair.com/discussion/54087/keras-in-rapid-miner?tab=all

The Python code below is functionally equivalent to Keras classification analysis for the Iris dataset.
Both implement multi-class deep neural network classification with similar architecture,
training, and evaluation.

SOAPBOX ON
I added miss classifications to the input to aviod
perfect classifications.
PNN makes heavy use of
probability density functiond and bayse rule.
The posterior probability influences the classification.
Kind of a black box?
PNN is very powerfull
SOAPBOX OFF

Related Repos
--------------------------------------------------------------------------------------------------------------------------
https://github.com/rogerjdeangelis/utl-altair-slc-probabilistic-neural-networks-pnn-gaussain-kernel-using-r
https://github.com/rogerjdeangelis/utl-generating-complete-case-when-logic-for-decision-trees-using-altair-personal-slc
https://github.com/rogerjdeangelis/utl-visualization-of-a-decision-tree-with-horizontal-bar-charts-graphics-diagram
https://github.com/rogerjdeangelis/utl_R_and_WPS_decision_trees
https://github.com/rogerjdeangelis/altair-slc-r-simple-random-forest-classification-example-using-iris-dataset
https://github.com/rogerjdeangelis/altair-slc-rocchio-classifier-ai-text-processing
https://github.com/rogerjdeangelis/utl-convert_2018-anatomical-therapeutic-classification-to-define-daily-dose-atc-to-ddd
https://github.com/rogerjdeangelis/utl-creating-and-verifying-a-knn-nearest-neighbor-classification-model
https://github.com/rogerjdeangelis/utl-creating-dummy-variables-for-classification-variable-in-modeling
https://github.com/rogerjdeangelis/utl-r-simple-random-forest-classification-example-using-iris-dataset

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

libname workx sas7bdat "d:/wpswrkx";

proc datasets lib=workx kill;
run;

options validvarname=v7;
data workx.iris;
call streaminit(4321);
informat
  species $10.
  sepal_length
  sepal_width
  petal_length
  petal_width 8.
  ;
input
  species sepal_length sepal_width petal_length petal_width @@;
  species=lowcase(species);
  output;
  /*--- inject missclassifications ---*/
  if rand('uniform') < .05 then species='setosa';
  output; /*--- double the output ---*/
  if rand('uniform') < .05 then species='virginica';
  output;
cards4;
Setosa 50 33 14 2  Versicolor 65 28 46 15  Virginica 64 28 56 22
Setosa 46 34 14 3  Versicolor 62 22 45 15  Virginica 67 31 56 24
Setosa 46 36 10 2  Versicolor 59 32 48 18  Virginica 63 28 51 15
Setosa 51 33 17 5  Versicolor 61 30 46 14  Virginica 69 31 51 23
Setosa 55 35 13 2  Versicolor 60 27 51 16  Virginica 65 30 52 20
Setosa 48 31 16 2  Versicolor 56 25 39 11  Virginica 65 30 55 18
Setosa 52 34 14 2  Versicolor 57 28 45 13  Virginica 58 27 51 19
Setosa 49 36 14 1  Versicolor 63 33 47 16  Virginica 68 32 59 23
Setosa 44 32 13 2  Versicolor 70 32 47 14  Virginica 62 34 54 23
Setosa 50 35 16 6  Versicolor 64 32 45 15  Virginica 77 38 67 22
Setosa 44 30 13 2  Versicolor 61 28 40 13  Virginica 67 33 57 25
Setosa 47 32 16 2  Versicolor 55 24 38 11  Virginica 76 30 66 21
Setosa 48 30 14 3  Versicolor 54 30 45 15  Virginica 49 25 45 17
Setosa 51 38 16 2  Versicolor 58 26 40 12  Virginica 67 30 52 23
Setosa 48 34 19 2  Versicolor 55 26 44 12  Virginica 59 30 51 18
Setosa 50 30 16 2  Versicolor 50 23 33 10  Virginica 63 25 50 19
Setosa 50 32 12 2  Versicolor 67 31 44 14  Virginica 64 32 53 23
Setosa 43 30 11 1  Versicolor 56 30 45 15  Virginica 79 38 64 20
Setosa 58 40 12 2  Versicolor 58 27 41 10  Virginica 67 33 57 21
Setosa 51 38 19 4  Versicolor 60 29 45 15  Virginica 77 28 67 20
Setosa 49 30 14 2  Versicolor 57 26 35 10  Virginica 63 27 49 18
Setosa 51 35 14 2  Versicolor 57 29 42 13  Virginica 72 32 60 18
Setosa 50 34 16 4  Versicolor 49 24 33 10  Virginica 61 30 49 18
Setosa 46 32 14 2  Versicolor 56 27 42 13  Virginica 61 26 56 14
Setosa 57 44 15 4  Versicolor 57 30 42 12  Virginica 64 28 56 21
Setosa 50 36 14 2  Versicolor 66 29 46 13  Virginica 62 28 48 18
Setosa 54 34 15 4  Versicolor 52 27 39 14  Virginica 77 30 61 23
Setosa 52 41 15 1  Versicolor 60 34 45 16  Virginica 63 34 56 24
Setosa 55 42 14 2  Versicolor 50 20 35 10  Virginica 58 27 51 19
Setosa 49 31 15 2  Versicolor 55 24 37 10  Virginica 72 30 58 16
Setosa 54 39 17 4  Versicolor 58 27 39 12  Virginica 71 30 59 21
Setosa 50 34 15 2  Versicolor 62 29 43 13  Virginica 64 31 55 18
Setosa 44 29 14 2  Versicolor 59 30 42 15  Virginica 60 30 48 18
Setosa 47 32 13 2  Versicolor 60 22 40 10  Virginica 63 29 56 18
Setosa 46 31 15 2  Versicolor 67 31 47 15  Virginica 77 26 69 23
Setosa 51 34 15 2  Versicolor 63 23 44 13  Virginica 60 22 50 15
Setosa 50 35 13 3  Versicolor 56 30 41 13  Virginica 69 32 57 23
Setosa 49 31 15 1  Versicolor 63 25 49 15  Virginica 74 28 61 19
Setosa 54 37 15 2  Versicolor 61 28 47 12  Virginica 56 28 49 20
Setosa 54 39 13 4  Versicolor 64 29 43 13  Virginica 73 29 63 18
Setosa 51 35 14 3  Versicolor 51 25 30 11  Virginica 67 25 58 18
Setosa 48 34 16 2  Versicolor 57 28 41 13  Virginica 65 30 58 22
Setosa 48 30 14 1  Versicolor 61 29 47 14  Virginica 69 31 54 21
Setosa 45 23 13 3  Versicolor 56 29 36 13  Virginica 72 36 61 25
Setosa 57 38 17 3  Versicolor 69 31 49 15  Virginica 65 32 51 20
Setosa 51 38 15 3  Versicolor 55 25 40 13  Virginica 64 27 53 19
Setosa 54 34 17 2  Versicolor 55 23 40 13  Virginica 68 30 55 21
Setosa 51 37 15 4  Versicolor 66 30 44 14  Virginica 57 25 50 20
Setosa 52 35 15 2  Versicolor 68 28 48 14  Virginica 58 28 51 24
Setosa 53 37 15 2  Versicolor 67 30 50 17  Virginica 63 33 60 25
;;;;
run;

/**************************************************************************************************************************/
/* WORKX.IRIS total obs=150                                                                                               */
/*                      sepal_    sepal_    petal_    petal_                                                              */
/* Obs    species       length     width    length     width                                                              */
/*                                                                                                                        */
/*   1    setosa          50        33        14         2                                                                */
/*   2    versicolor      65        28        46        15                                                                */
/*   3    virginica       64        28        56        22                                                                */
/*   4    setosa          46        34        14         3                                                                */
/*   5    versicolor      62        22        45        15                                                                */
/* ....                                                                                                                   */
/* 146    versicolor      68        28        48        14                                                                */
/* 147    virginica       58        28        51        24                                                                */
/* 148    setosa          53        37        15         2                                                                */
/* 149    versicolor      67        30        50        17                                                                */
/* 150    virginica       63        33        60        25                                                                */
/**************************************************************************************************************************/

/*
| | ___   __ _
| |/ _ \ / _` |
| | (_) | (_| |
|_|\___/ \__, |
         |___/
*/

1                                          Altair SLC         11:25 Tuesday, April  7, 2026

NOTE: Copyright 2002-2025 World Programming, an Altair Company
NOTE: Altair SLC 2026 (05.26.01.00.000758)
      Licensed to Roger DeAngelis
NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
NOTE: AUTOEXEC source line
1       +  ï»¿ods _all_ close;
           ^
ERROR: Expected a statement keyword : found "?"

NOTE: AUTOEXEC processing completed

1          libname workx sas7bdat "d:/wpswrkx";
NOTE: Library workx assigned as follows:
      Engine:        SAS7BDAT
      Physical Name: d:\wpswrkx

Altair SLC

The DATASETS Procedure

         Directory

Libref           WORKX
Engine           SAS7BDAT
Physical Name    d:\wpswrkx

                              Members

            Member    Member
  Number    Name      Type         File Size      Date Last Modified

--------------------------------------------------------------------

       1    IRIS      DATA            131072      07APR2026:11:24:59
2
3         proc datasets lib=workx kill;
4         run;
NOTE: Deleting WORKX.iris (type=DATA)
5
6         options validvarname=v7;
NOTE: Procedure datasets step took :
      real time : 0.047
      cpu time  : 0.015


7         data workx.iris;
8         call streaminit(4321);
9         informat
10          species $10.
11          sepal_length
12          sepal_width
13          petal_length
14          petal_width 8.
15          ;
16        input
17          species sepal_length sepal_width petal_length petal_width @@;
18          species=lowcase(species);
19          output;
20          /*--- inject missclassifications ---*/
21          if rand('uniform') < .05 then species='setosa';
22          output; /*--- double the output ---*/
23          if rand('uniform') < .05 then species='virginica';
24          output;
25        cards4;

NOTE: A new line was read when INPUT statement read past the end of a line
NOTE: Data set "WORKX.iris" has 450 observation(s) and 5 variable(s)
NOTE: The data step took :
      real time : 0.063
      cpu time  : 0.015


26        Setosa 50 33 14 2  Versicolor 65 28 46 15  Virginica 64 28 56 22
27        Setosa 46 34 14 3  Versicolor 62 22 45 15  Virginica 67 31 56 24
28        Setosa 46 36 10 2  Versicolor 59 32 48 18  Virginica 63 28 51 15
...
73        Setosa 51 37 15 4  Versicolor 66 30 44 14  Virginica 57 25 50 20
74        Setosa 52 35 15 2  Versicolor 68 28 48 14  Virginica 58 28 51 24
75        Setosa 53 37 15 2  Versicolor 67 30 50 17  Virginica 63 33 60 25
76        ;;;;
77        run;
78
ERROR: Error printed on page 1

NOTE: Submitted statements took :
      real time : 0.189
      cpu time  : 0.109

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

options validvarname=v7;
options set=PYTHONHOME "D:\py314";
proc python;
submit;
import pyreadstat as ps
import numpy as np
import pandas as pd
import matplotlib
matplotlib.use('Agg')  # Use non-interactive backend for SLC
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import confusion_matrix, classification_report, accuracy_score
from sklearn.datasets import load_iris
from sklearn.utils import Bunch
import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import DataLoader, TensorDataset
from sklearn.model_selection import StratifiedShuffleSplit
import os

# Set seed for reproducibility
np.random.seed(321)
torch.manual_seed(321)

# Set a writable directory for saving models (use current working directory)
save_dir = "d:/wpswrkx"
print(f"Working directory: {save_dir}")


# ------------------------------------------------------------------------------
# PART 1: LOAD AND PREPARE IRIS DATA
# ------------------------------------------------------------------------------

# Load SAS
iris_df, meta = ps.read_sas7bdat('d:/wpswrkx/iris.sas7bdat')

# Must match sklearn's exact structure (why i do not like python - so many datastructures)
iris_data = Bunch(
    data=iris_df[['sepal_length', 'sepal_width', 'petal_length', 'petal_width']].values,  # Exact column names!
    target=pd.Categorical(iris_df['species'], categories=['setosa','versicolor','virginica']).codes,
    feature_names=['sepal length (cm)', 'sepal width (cm)', 'petal length (cm)', 'petal width (cm)'],
    target_names=np.array(['setosa','versicolor','virginica']),
    frame=iris_df,
    DESCR="Iris from SAS7BDAT"
)

input_df = pd.DataFrame(iris_data.data, columns=iris_data.feature_names)
target = iris_data.target
target_names = iris_data.target_names

# Rename columns for clarity
# input_df.columns = ['sepal_length', 'sepal_width', 'petal_length', 'petal_width']

# Create output dataframe (one-hot encoded)
output_df = pd.get_dummies(pd.Series(target), prefix='species')

print("Input dataframe shape:", input_df.shape)
print("Output dataframe shape:", output_df.shape)
print("\nFirst 5 rows of input dataframe:")
print(input_df.head())
print("\nFirst 5 rows of output dataframe:")
print(output_df.head())

# ------------------------------------------------------------------------------
# PART 2: PREPARE DATA
# ------------------------------------------------------------------------------

# Convert to numpy arrays
X = input_df.values
y = output_df.values

# Normalize features
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

sss = StratifiedShuffleSplit(n_splits=1, test_size=0.15, random_state=456)
train_val_idx, test_idx = next(sss.split(X_scaled, target))
X_test = X_scaled[test_idx]
y_test = y[test_idx]

sss2 = StratifiedShuffleSplit(n_splits=1, test_size=0.1765, random_state=456)  # 15/85
train_idx, val_idx = next(sss2.split(X_scaled[train_val_idx], target[train_val_idx]))
X_train = X_scaled[train_val_idx][train_idx]
X_val = X_scaled[train_val_idx][val_idx]
y_train = y[train_val_idx][train_idx]
y_val = y[train_val_idx][val_idx]

print(f"\nData split sizes:")
print(f"Training: {X_train.shape[0]} samples")
print(f"Validation: {X_val.shape[0]} samples")
print(f"Testing: {X_test.shape[0]} samples")

sample_sizes_df = pd.DataFrame({
    'Dataset': ['Training', 'Validation', 'Testing'],
    'Samples': [X_train.shape[0], X_val.shape[0], X_test.shape[0]]
})

# Convert to PyTorch tensors
X_train_tensor = torch.FloatTensor(X_train)
y_train_tensor = torch.FloatTensor(y_train)
X_val_tensor = torch.FloatTensor(X_val)
y_val_tensor = torch.FloatTensor(y_val)
X_test_tensor = torch.FloatTensor(X_test)
y_test_tensor = torch.FloatTensor(y_test)

# Create DataLoaders
train_dataset = TensorDataset(X_train_tensor, y_train_tensor)
val_dataset = TensorDataset(X_val_tensor, y_val_tensor)
test_dataset = TensorDataset(X_test_tensor, y_test_tensor)

train_loader = DataLoader(train_dataset, batch_size=8, shuffle=True)
val_loader = DataLoader(val_dataset, batch_size=8, shuffle=False)
test_loader = DataLoader(test_dataset, batch_size=8, shuffle=False)

# ------------------------------------------------------------------------------
# PART 3: BUILD PYTORCH MODEL
# ------------------------------------------------------------------------------

class IrisClassifier(nn.Module):
    def __init__(self, input_size, hidden_sizes, num_classes):
        super(IrisClassifier, self).__init__()

        self.layers = nn.Sequential(
            nn.Linear(input_size, hidden_sizes[0]),
            nn.ReLU(),
            nn.Dropout(0.2),
            nn.Linear(hidden_sizes[0], hidden_sizes[1]),
            nn.ReLU(),
            nn.Dropout(0.1),
            nn.Linear(hidden_sizes[1], num_classes),
            nn.Softmax(dim=1)
        )

    def forward(self, x):
        return self.layers(x)

# Initialize model
input_size = X_train.shape[1]
hidden_sizes = [16, 8]
num_classes = y_train.shape[1]

model = IrisClassifier(input_size, hidden_sizes, num_classes)

# Define loss function and optimizer
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.01)
scheduler = optim.lr_scheduler.ReduceLROnPlateau(optimizer, mode='min', factor=0.5, patience=10)

print("\nModel Architecture:")
print(model)

# ------------------------------------------------------------------------------
# PART 4: TRAIN THE MODEL (WITHOUT SAVING TO DISK)
# ------------------------------------------------------------------------------

# Training loop
epochs = 100
best_val_loss = float('inf')
patience = 20
patience_counter = 0
best_model_state = None  # Store best model in memory instead of disk

train_losses = []
val_losses = []
train_accuracies = []
val_accuracies = []

for epoch in range(epochs):
    # Training phase
    model.train()
    train_loss = 0
    train_correct = 0
    train_total = 0

    for batch_X, batch_y in train_loader:
        optimizer.zero_grad()
        outputs = model(batch_X)
        loss = criterion(outputs, torch.argmax(batch_y, dim=1))
        loss.backward()
        optimizer.step()

        train_loss += loss.item()
        _, predicted = torch.max(outputs.data, 1)
        train_total += batch_y.size(0)
        train_correct += (predicted == torch.argmax(batch_y, dim=1)).sum().item()

    train_accuracy = 100 * train_correct / train_total
    train_losses.append(train_loss / len(train_loader))
    train_accuracies.append(train_accuracy)

    # Validation phase
    model.eval()
    val_loss = 0
    val_correct = 0
    val_total = 0

    with torch.no_grad():
        for batch_X, batch_y in val_loader:
            outputs = model(batch_X)
            loss = criterion(outputs, torch.argmax(batch_y, dim=1))
            val_loss += loss.item()
            _, predicted = torch.max(outputs.data, 1)
            val_total += batch_y.size(0)
            val_correct += (predicted == torch.argmax(batch_y, dim=1)).sum().item()

    val_accuracy = 100 * val_correct / val_total
    val_losses.append(val_loss / len(val_loader))
    val_accuracies.append(val_accuracy)

    # Learning rate scheduling
    scheduler.step(val_loss / len(val_loader))

    # Early stopping with in-memory model saving
    current_val_loss = val_loss / len(val_loader)
    if current_val_loss < best_val_loss:
        best_val_loss = current_val_loss
        patience_counter = 0
        # Save best model state in memory (no disk write)
        best_model_state = {k: v.cpu().clone() for k, v in model.state_dict().items()}
    else:
        patience_counter += 1

    if (epoch + 1) % 20 == 0:
        print(f'Epoch [{epoch+1}/{epochs}], '
              f'Train Loss: {train_losses[-1]:.4f}, Train Acc: {train_accuracy:.2f}%, '
              f'Val Loss: {val_losses[-1]:.4f}, Val Acc: {val_accuracy:.2f}%')

    if patience_counter >= patience:
        print(f"Early stopping at epoch {epoch+1}")
        break

# Load best model from memory
if best_model_state is not None:
    model.load_state_dict(best_model_state)
    print("Loaded best model from memory")

# ------------------------------------------------------------------------------
# PART 5: VISUALIZE TRAINING HISTORY
# ------------------------------------------------------------------------------

fig, axes = plt.subplots(1, 2, figsize=(12, 4))

axes[0].plot(train_losses, label='Training Loss')
axes[0].plot(val_losses, label='Validation Loss')
axes[0].set_title('Model Loss During Training')
axes[0].set_xlabel('Epoch')
axes[0].set_ylabel('Loss')
axes[0].legend()
axes[0].grid(True)

axes[1].plot(train_accuracies, label='Training Accuracy')
axes[1].plot(val_accuracies, label='Validation Accuracy')
axes[1].set_title('Model Accuracy During Training')
axes[1].set_xlabel('Epoch')
axes[1].set_ylabel('Accuracy (%)')
axes[1].legend()
axes[1].grid(True)

plt.tight_layout()
plt.savefig('d:/png/training_history.png')  # Save instead of show
print("Training history plot saved as 'training_history.png'")

# ------------------------------------------------------------------------------
# PART 6: EVALUATE THE MODEL
# ------------------------------------------------------------------------------

# Evaluate on test set
model.eval()
test_correct = 0
test_total = 0
all_predictions = []
all_actuals = []

with torch.no_grad():
    for batch_X, batch_y in test_loader:
        outputs = model(batch_X)
        _, predicted = torch.max(outputs.data, 1)
        test_total += batch_y.size(0)
        test_correct += (predicted == torch.argmax(batch_y, dim=1)).sum().item()

        all_predictions.extend(predicted.numpy())
        all_actuals.extend(torch.argmax(batch_y, dim=1).numpy())

test_accuracy = 100 * test_correct / test_total
print(f"\nTest Set Accuracy: {test_accuracy:.2f}%")

# ------------------------------------------------------------------------------
# PART 7: CONFUSION MATRIX AND METRICS
# ------------------------------------------------------------------------------

# Convert back to species names
predicted_species = [target_names[i] for i in all_predictions]
actual_species = [target_names[i] for i in all_actuals]

# Confusion matrix
cm = confusion_matrix(actual_species, predicted_species, labels=target_names)
cm_df = pd.DataFrame(cm, index=target_names, columns=target_names)

# Plot confusion matrix
plt.figure(figsize=(8, 6))
sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
            xticklabels=target_names, yticklabels=target_names)
plt.title('Confusion Matrix')
plt.ylabel('Actual')
plt.xlabel('Predicted')
plt.savefig('d:/png/confusion_matrix.png')  # Save instead of show
print("Confusion matrix plot saved as 'confusion_matrix.png'")

# Print classification report
print("\nClassification Report:")
print(classification_report(actual_species, predicted_species,
   target_names=target_names,
   labels=target_names))  # Key addition

# ------------------------------------------------------------------------------
# PART 8: CREATE RESULTS DATAFRAME
# ------------------------------------------------------------------------------

results_df = pd.DataFrame({
    'Actual': actual_species,
    'Predicted': predicted_species,
    'Correct': np.array(actual_species) == np.array(predicted_species)
})

print("\nFirst 10 predictions:")
print(results_df.head(10))

print(f"\nOverall Accuracy: {test_accuracy:.2f}%")

# ------------------------------------------------------------------------------
# PART 9: PREDICT ON NEW DATA
# ------------------------------------------------------------------------------

# Example: Predict on new iris measurements
new_iris_data = pd.DataFrame({
    'sepal_length': [5.1, 6.5, 4.8],
    'sepal_width': [3.5, 3.0, 3.4],
    'petal_length': [1.4, 5.2, 1.6],
    'petal_width': [0.2, 2.0, 0.3]
})

# Scale the new data using the same scaler
new_data_scaled = scaler.transform(new_iris_data)

# Convert to tensor and predict
model.eval()
with torch.no_grad():
    new_data_tensor = torch.FloatTensor(new_data_scaled)
    new_predictions = model(new_data_tensor)
    new_predictions_class = torch.argmax(new_predictions, dim=1)
    new_predictions_species = [target_names[i] for i in new_predictions_class.numpy()]
    new_predictions_confidence = torch.max(new_predictions, dim=1)[0].numpy()

# Create output dataframe with predictions
predictions_output_df = pd.DataFrame({
    'sepal_length': new_iris_data['sepal_length'],
    'sepal_width': new_iris_data['sepal_width'],
    'petal_length': new_iris_data['petal_length'],
    'petal_width': new_iris_data['petal_width'],
    'predicted_species': new_predictions_species,
    'confidence': new_predictions_confidence
})

print("\nPredictions on new iris measurements:")
print(predictions_output_df)

print("\n" + "="*50)
print("Analysis complete! Model successfully trained using PyTorch.")
print("="*50)
endsubmit;
import python=predictions_output_df  data=workx.prediction  ;
import python=results_df             data=workx.results     ;
import python=cm_df                  data=workx.cm          ;
import python=sample_sizes_df        data=workx.sample_sizes;
run;

proc sql;
 create
   table workx.true_false as
 select
   actual
  ,predicted
  ,case (correct)
     when (1) then 'TRUE'
     else          'FALSE'
   end as correct
 from
   workx.results
;quit;


/**************************************************************************************************************************/
/* PYTHON                                                   |  SLC OUTPUT DATA SETS                                       */
/*                                                          |                                                             */
/*                                                          |                                                             */
/* Altair SLC                                               |  WORKX.SAMPLE_SIZES total obs=3                             */
/*                                                          |  Obs     Dataset      Samples                               */
/* The PYTHON Procedure                                     |                                                             */
/*                                                          |   1     Training        314                                 */
/* Working directory: d:/wpswrkx                            |   2     Validation       68 *                               */
/*                                                          |   3     Testing          68                                 */
/* Input dataframe shape:                                   |                                                             */
/* (450, 4)                                                 |                                                             */
/*                                                          |  WORKX.CM total obs=3 (CONFUSION MATRIX)                    */
/* Output dataframe shape:                                  |  Obs    setosa    versicolor    virginica                   */
/* (450, 3)                                                 |                                                             */
/*                                                          |   1       24           0             0                      */
/* First 5 rows of input dataframe:                         |   2        0          20             2                      */
/*                                                          |   3        0           0            22                      */
/*     sepal    sepal    petal     petal                    |                                                             */
/*     length   width   length     width                    |                                                             */
/*      (cm)     (cm)    (cm)       (cm)                    |  WORKX.TRUE_FALSE total obs=68                              */
/*                                                          |  Obs    Actual        Predicted     correct                 */
/* 0   50.0     33.0     14.0       2.0                     |                                                             */
/* 1   50.0     33.0     14.0       2.0                     |    1    setosa        setosa         TRUE                   */
/* 2   50.0     33.0     14.0       2.0                     |    2    setosa        setosa         TRUE                   */
/* 3   65.0     28.0     46.0      15.0                     |    3    setosa        setosa         TRUE                   */
/* 4   65.0     28.0     46.0      15.0                     |    4    versicolor    virginica      FALSE                  */
/*                                                          |    5    setosa        setosa         TRUE                   */
/*                                                          |   ...                                                       */
/* First 5 rows of output dataframe:                        |   64    virginica     virginica      TRUE                   */
/*                                                          |   65    versicolor    versicolor     TRUE                   */
/*    species_0  species_1  species_2                       |   66    virginica     virginica      TRUE                   */
/* 0       True      False      False                       |   67    virginica     virginica      TRUE                   */
/* 1       True      False      False                       |   68    virginica     virginica      TRUE..                 */
/* 2       True      False      False                       |                                                             */
/* 3      False       True      False                       |                                                             */
/* 4      False       True      False                       |   WORKX.PREDICTION total obs=3                              */
/*                                                          |  sepal_ sepal_  petal_  petal_  predicted_                  */
/*                                                          |  length  width  length  width   species   confidence        */
/* Data split sizes:                                        |                                                             */
/* Training: 314 samples                                    |     5.1    3.5     1.4    0.2   setosa       1.00000        */
/* Validation: 68 samples                                   |     6.5    3.0     5.2    2.0   versicolor   0.65683        */
/* Testing: 68 samples                                      |     4.8    3.4     1.6    0.3   setosa       1.00000        */
/*                                                          |                                                             */
/*                                                          |                                                             */
/* Model Architecture:                                      |                                                             */
/*                                                          |                                                             */
/* IrisClassifier(                                          |                                                             */
/*  (layers): Sequential(                                   |                                                             */
/*   (0): Linear(in_features=4,out_features=16,bias=True)   |                                                             */
/*   (1): ReLU()                                            |                                                             */
/*   (2): Dropout(p=0.2, inplace=False)                     |                                                             */
/*   (3): Linear(in_features=16,out_features=8,bias=True)   |                                                             */
/*   (4): ReLU()                                            |                                                             */
/*   (5): Dropout(p=0.1, inplace=False)                     |                                                             */
/*   (6): Linear(in_features=8,out_features=3,bias=True)    |                                                             */
/*   (7): Softmax(dim=1)                                    |                                                             */
/*  )                                                       |                                                             */
/* )                                                        |                                                             */
/*                                                          |                                                             */
/* Epoch [20/100],Train Loss:0.6288,Train Acc: 93.31%,      |                                                             */
/* Epoch [40/100],Train Loss:0.6037,Train Acc: 94.59%,      |                                                             */
/*                                                          |                                                             */
/* Epoch [20/100],Val Loss: 0.5794,Val Acc:97.06%           |                                                             */
/* Epoch [40/100],Val Loss: 0.5796,Val Acc:97.06%           |                                                             */
/*                                                          |                                                             */
/* Early stopping at epoch 46                               |                                                             */
/* Loaded best model from memory                            |                                                             */
/* Training history plot saved as 'training_history.png'    |                                                             */
/*                                                          |                                                             */
/* Test Set Accuracy: 97.06%                                |                                                             */
/* Confusion matrix plot saved as 'confusion_matrix.png'    |                                                             */
/*                                                          |                                                             */
/* Classification Report:                                   |                                                             */
/*                                                          |                                                             */
/*               precision    recall  f1-score   support    |                                                             */
/*                                                          |                                                             */
/*       setosa       1.00      1.00      1.00        24    |                                                             */
/*   versicolor       1.00      0.91      0.95        22    |                                                             */
/*    virginica       0.92      1.00      0.96        22    |                                                             */
/*                                                          |                                                             */
/*     accuracy                           0.97        68    |                                                             */
/*    macro avg       0.97      0.97      0.97        68    |                                                             */
/* weighted avg       0.97      0.97      0.97        68    |                                                             */
/*                                                          |                                                             */
/*                                                          |                                                             */
/* First 10 predictions:                                    |                                                             */
/*                                                          |                                                             */
/*        Actual   Predicted  Correct                       |                                                             */
/* 0      setosa      setosa     True                       |                                                             */
/* 1      setosa      setosa     True                       |                                                             */
/* 2      setosa      setosa     True                       |                                                             */
/* 3  versicolor   virginica    False                       |                                                             */
/* 4      setosa      setosa     True                       |                                                             */
/* 5  versicolor  versicolor     True                       |                                                             */
/* 6   virginica   virginica     True                       |                                                             */
/* 7      setosa      setosa     True                       |                                                             */
/* 8  versicolor  versicolor     True                       |                                                             */
/* 9      setosa      setosa     True                       |                                                             */
/*                                                          |                                                             */
/*                                                          |                                                             */
/* Overall Accuracy: 97.06%                                 |                                                             */
/*                                                          |                                                             */
/*                                                          |                                                             */
/* Predictions on new iris measurements:                    |                                                             */
/*      sepal  sepal                                        |                                                             */
/*     length  width  ..predicted_species  confidence       |                                                             */
/* 0      5.1    3.5  ..           setosa    1.000000       |                                                             */
/* 1      6.5    3.0  ..       versicolor    0.656830       |                                                             */
/* 2      4.8    3.4  ..           setosa    0.999999       |                                                             */
/*                                                          |                                                             */
/* [3 rows x 6 columns]                                     |                                                             */
/*                                                          |                                                             */
/*                                                          |                                                             */
/* =========================================================|                                                             */
/*                                                          |                                                             */
/* Analysis complete! Model successfully trained  PyTor|ch. |                                                             */
/*                                                          |                                                             */
/* =========================================================|                                                             */
/**************************************************************************************************************************/

/*
| | ___   __ _
| |/ _ \ / _` |
| | (_) | (_| |
|_|\___/ \__, |
         |___/
*/

1                                          Altair SLC         13:34 Tuesday, April  7, 2026

NOTE: Copyright 2002-2025 World Programming, an Altair Company
NOTE: Altair SLC 2026 (05.26.01.00.000758)
      Licensed to Roger DeAngelis
NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
NOTE: AUTOEXEC source line
1       +  ï»¿ods _all_ close;
           ^
ERROR: Expected a statement keyword : found "?"
NOTE: Library workx assigned as follows:
      Engine:        SAS7BDAT
      Physical Name: d:\wpswrkx

NOTE: Library slchelp assigned as follows:
      Engine:        WPD
      Physical Name: C:\Progra~1\Altair\SLC\2026\sashelp

NOTE: Library worksas assigned as follows:
      Engine:        SAS7BDAT
      Physical Name: d:\worksas

NOTE: Library workwpd assigned as follows:
      Engine:        WPD
      Physical Name: d:\workwpd


LOG:  13:34:28
NOTE: 1 record was written to file PRINT

NOTE: The data step took :
      real time : 0.031
      cpu time  : 0.015


NOTE: AUTOEXEC processing completed

1         options validvarname=v7;
2         options set=PYTHONHOME "D:\py314";
3         proc python;
4         submit;
5         import pyreadstat as ps
6         import numpy as np
7         import pandas as pd
8         import matplotlib
9         matplotlib.use('Agg')  # Use non-interactive backend for SLC
10        import matplotlib.pyplot as plt
11        import seaborn as sns
12        from sklearn.model_selection import train_test_split
13        from sklearn.preprocessing import StandardScaler
14        from sklearn.metrics import confusion_matrix, classification_report, accuracy_score
15        from sklearn.datasets import load_iris
16        from sklearn.utils import Bunch
17        import torch
18        import torch.nn as nn
19        import torch.optim as optim
20        from torch.utils.data import DataLoader, TensorDataset
21        from sklearn.model_selection import StratifiedShuffleSplit
22        import os
23
24        # Set seed for reproducibility
25        np.random.seed(321)
26        torch.manual_seed(321)
27
28        # Set a writable directory for saving models (use current working directory)
29        save_dir = "d:/wpswrkx"
30        print(f"Working directory: {save_dir}")
31
32
33        # ------------------------------------------------------------------------------
34        # PART 1: LOAD AND PREPARE IRIS DATA
35        # ------------------------------------------------------------------------------
36
37        # Load SAS
38        iris_df, meta = ps.read_sas7bdat('d:/wpswrkx/iris.sas7bdat')
39
40        # Must match sklearn's exact structure (why i do not like python - so many datastructures)
41        iris_data = Bunch(
42            data=iris_df[['sepal_length', 'sepal_width', 'petal_length', 'petal_width']].values,  # Exact column names!
43            target=pd.Categorical(iris_df['species'], categories=['setosa','versicolor','virginica']).codes,
44            feature_names=['sepal length (cm)', 'sepal width (cm)', 'petal length (cm)', 'petal width (cm)'],
45            target_names=np.array(['setosa','versicolor','virginica']),
46            frame=iris_df,
47            DESCR="Iris from SAS7BDAT"
48        )
49
50        input_df = pd.DataFrame(iris_data.data, columns=iris_data.feature_names)
51        target = iris_data.target
52        target_names = iris_data.target_names
53
54        # Rename columns for clarity
55        # input_df.columns = ['sepal_length', 'sepal_width', 'petal_length', 'petal_width']
56
57        # Create output dataframe (one-hot encoded)
58        output_df = pd.get_dummies(pd.Series(target), prefix='species')
59
60        print("Input dataframe shape:", input_df.shape)
61        print("Output dataframe shape:", output_df.shape)
62        print("\nFirst 5 rows of input dataframe:")
63        print(input_df.head())
64        print("\nFirst 5 rows of output dataframe:")
65        print(output_df.head())
66
67        # ------------------------------------------------------------------------------
68        # PART 2: PREPARE DATA
69        # ------------------------------------------------------------------------------
70
71        # Convert to numpy arrays
72        X = input_df.values
73        y = output_df.values
74
75        # Normalize features
76        scaler = StandardScaler()
77        X_scaled = scaler.fit_transform(X)
78
79        sss = StratifiedShuffleSplit(n_splits=1, test_size=0.15, random_state=456)
80        train_val_idx, test_idx = next(sss.split(X_scaled, target))
81        X_test = X_scaled[test_idx]
82        y_test = y[test_idx]
83
84        sss2 = StratifiedShuffleSplit(n_splits=1, test_size=0.1765, random_state=456)  # 15/85
85        train_idx, val_idx = next(sss2.split(X_scaled[train_val_idx], target[train_val_idx]))
86        X_train = X_scaled[train_val_idx][train_idx]
87        X_val = X_scaled[train_val_idx][val_idx]
88        y_train = y[train_val_idx][train_idx]
89        y_val = y[train_val_idx][val_idx]
90
91        print(f"\nData split sizes:")
92        print(f"Training: {X_train.shape[0]} samples")
93        print(f"Validation: {X_val.shape[0]} samples")
94        print(f"Testing: {X_test.shape[0]} samples")
95
96        sample_sizes_df = pd.DataFrame({
97            'Dataset': ['Training', 'Validation', 'Testing'],
98            'Samples': [X_train.shape[0], X_val.shape[0], X_test.shape[0]]
99        })
100
101       # Convert to PyTorch tensors
102       X_train_tensor = torch.FloatTensor(X_train)
103       y_train_tensor = torch.FloatTensor(y_train)
104       X_val_tensor = torch.FloatTensor(X_val)
105       y_val_tensor = torch.FloatTensor(y_val)
106       X_test_tensor = torch.FloatTensor(X_test)
107       y_test_tensor = torch.FloatTensor(y_test)
108
109       # Create DataLoaders
110       train_dataset = TensorDataset(X_train_tensor, y_train_tensor)
111       val_dataset = TensorDataset(X_val_tensor, y_val_tensor)
112       test_dataset = TensorDataset(X_test_tensor, y_test_tensor)
113
114       train_loader = DataLoader(train_dataset, batch_size=8, shuffle=True)
115       val_loader = DataLoader(val_dataset, batch_size=8, shuffle=False)
116       test_loader = DataLoader(test_dataset, batch_size=8, shuffle=False)
117
118       # ------------------------------------------------------------------------------
119       # PART 3: BUILD PYTORCH MODEL
120       # ------------------------------------------------------------------------------
121
122       class IrisClassifier(nn.Module):
123           def __init__(self, input_size, hidden_sizes, num_classes):
124               super(IrisClassifier, self).__init__()
125
126               self.layers = nn.Sequential(
127                   nn.Linear(input_size, hidden_sizes[0]),
128                   nn.ReLU(),
129                   nn.Dropout(0.2),
130                   nn.Linear(hidden_sizes[0], hidden_sizes[1]),
131                   nn.ReLU(),
132                   nn.Dropout(0.1),
133                   nn.Linear(hidden_sizes[1], num_classes),
134                   nn.Softmax(dim=1)
135               )
136
137           def forward(self, x):
138               return self.layers(x)
139
140       # Initialize model
141       input_size = X_train.shape[1]
142       hidden_sizes = [16, 8]
143       num_classes = y_train.shape[1]
144
145       model = IrisClassifier(input_size, hidden_sizes, num_classes)
146
147       # Define loss function and optimizer
148       criterion = nn.CrossEntropyLoss()
149       optimizer = optim.Adam(model.parameters(), lr=0.01)
150       scheduler = optim.lr_scheduler.ReduceLROnPlateau(optimizer, mode='min', factor=0.5, patience=10)
151
152       print("\nModel Architecture:")
153       print(model)
154
155       # ------------------------------------------------------------------------------
156       # PART 4: TRAIN THE MODEL (WITHOUT SAVING TO DISK)
157       # ------------------------------------------------------------------------------
158
159       # Training loop
160       epochs = 100
161       best_val_loss = float('inf')
162       patience = 20
163       patience_counter = 0
164       best_model_state = None  # Store best model in memory instead of disk
165
166       train_losses = []
167       val_losses = []
168       train_accuracies = []
169       val_accuracies = []
170
171       for epoch in range(epochs):
172           # Training phase
173           model.train()
174           train_loss = 0
175           train_correct = 0
176           train_total = 0
177
178           for batch_X, batch_y in train_loader:
179               optimizer.zero_grad()
180               outputs = model(batch_X)
181               loss = criterion(outputs, torch.argmax(batch_y, dim=1))
182               loss.backward()
183               optimizer.step()
184
185               train_loss += loss.item()
186               _, predicted = torch.max(outputs.data, 1)
187               train_total += batch_y.size(0)
188               train_correct += (predicted == torch.argmax(batch_y, dim=1)).sum().item()
189
190           train_accuracy = 100 * train_correct / train_total
191           train_losses.append(train_loss / len(train_loader))
192           train_accuracies.append(train_accuracy)
193
194           # Validation phase
195           model.eval()
196           val_loss = 0
197           val_correct = 0
198           val_total = 0
199
200           with torch.no_grad():
201               for batch_X, batch_y in val_loader:
202                   outputs = model(batch_X)
203                   loss = criterion(outputs, torch.argmax(batch_y, dim=1))
204                   val_loss += loss.item()
205                   _, predicted = torch.max(outputs.data, 1)
206                   val_total += batch_y.size(0)
207                   val_correct += (predicted == torch.argmax(batch_y, dim=1)).sum().item()
208
209           val_accuracy = 100 * val_correct / val_total
210           val_losses.append(val_loss / len(val_loader))
211           val_accuracies.append(val_accuracy)
212
213           # Learning rate scheduling
214           scheduler.step(val_loss / len(val_loader))
215
216           # Early stopping with in-memory model saving
217           current_val_loss = val_loss / len(val_loader)
218           if current_val_loss < best_val_loss:
219               best_val_loss = current_val_loss
220               patience_counter = 0
221               # Save best model state in memory (no disk write)
222               best_model_state = {k: v.cpu().clone() for k, v in model.state_dict().items()}
223           else:
224               patience_counter += 1
225
226           if (epoch + 1) % 20 == 0:
227               print(f'Epoch [{epoch+1}/{epochs}], '
228                     f'Train Loss: {train_losses[-1]:.4f}, Train Acc: {train_accuracy:.2f}%, '
229                     f'Val Loss: {val_losses[-1]:.4f}, Val Acc: {val_accuracy:.2f}%')
230
231           if patience_counter >= patience:
232               print(f"Early stopping at epoch {epoch+1}")
233               break
234
235       # Load best model from memory
236       if best_model_state is not None:
237           model.load_state_dict(best_model_state)
238           print("Loaded best model from memory")
239
240       # ------------------------------------------------------------------------------
241       # PART 5: VISUALIZE TRAINING HISTORY
242       # ------------------------------------------------------------------------------
243
244       fig, axes = plt.subplots(1, 2, figsize=(12, 4))
245
246       axes[0].plot(train_losses, label='Training Loss')
247       axes[0].plot(val_losses, label='Validation Loss')
248       axes[0].set_title('Model Loss During Training')
249       axes[0].set_xlabel('Epoch')
250       axes[0].set_ylabel('Loss')
251       axes[0].legend()
252       axes[0].grid(True)
253
254       axes[1].plot(train_accuracies, label='Training Accuracy')
255       axes[1].plot(val_accuracies, label='Validation Accuracy')
256       axes[1].set_title('Model Accuracy During Training')
257       axes[1].set_xlabel('Epoch')
258       axes[1].set_ylabel('Accuracy (%)')
259       axes[1].legend()
260       axes[1].grid(True)
261
262       plt.tight_layout()
263       plt.savefig('d:/png/training_history.png')  # Save instead of show
264       print("Training history plot saved as 'training_history.png'")
265
266       # ------------------------------------------------------------------------------
267       # PART 6: EVALUATE THE MODEL
268       # ------------------------------------------------------------------------------
269
270       # Evaluate on test set
271       model.eval()
272       test_correct = 0
273       test_total = 0
274       all_predictions = []
275       all_actuals = []
276
277       with torch.no_grad():
278           for batch_X, batch_y in test_loader:
279               outputs = model(batch_X)
280               _, predicted = torch.max(outputs.data, 1)
281               test_total += batch_y.size(0)
282               test_correct += (predicted == torch.argmax(batch_y, dim=1)).sum().item()
283
284               all_predictions.extend(predicted.numpy())
285               all_actuals.extend(torch.argmax(batch_y, dim=1).numpy())
286
287       test_accuracy = 100 * test_correct / test_total
288       print(f"\nTest Set Accuracy: {test_accuracy:.2f}%")
289
290       # ------------------------------------------------------------------------------
291       # PART 7: CONFUSION MATRIX AND METRICS
292       # ------------------------------------------------------------------------------
293
294       # Convert back to species names
295       predicted_species = [target_names[i] for i in all_predictions]
296       actual_species = [target_names[i] for i in all_actuals]
297
298       # Confusion matrix
299       cm = confusion_matrix(actual_species, predicted_species, labels=target_names)
300       cm_df = pd.DataFrame(cm, index=target_names, columns=target_names)
301
302       # Plot confusion matrix
303       plt.figure(figsize=(8, 6))
304       sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
305                   xticklabels=target_names, yticklabels=target_names)
306       plt.title('Confusion Matrix')
307       plt.ylabel('Actual')
308       plt.xlabel('Predicted')
309       plt.savefig('d:/png/confusion_matrix.png')  # Save instead of show
310       print("Confusion matrix plot saved as 'confusion_matrix.png'")
311
312       # Print classification report
313       print("\nClassification Report:")
314       print(classification_report(actual_species, predicted_species,
315          target_names=target_names,
316          labels=target_names))  # Key addition
317
318       # ------------------------------------------------------------------------------
319       # PART 8: CREATE RESULTS DATAFRAME
320       # ------------------------------------------------------------------------------
321
322       results_df = pd.DataFrame({
323           'Actual': actual_species,
324           'Predicted': predicted_species,
325           'Correct': np.array(actual_species) == np.array(predicted_species)
326       })
327
328       print("\nFirst 10 predictions:")
329       print(results_df.head(10))
330
331       print(f"\nOverall Accuracy: {test_accuracy:.2f}%")
332
333       # ------------------------------------------------------------------------------
334       # PART 9: PREDICT ON NEW DATA
335       # ------------------------------------------------------------------------------
336
337       # Example: Predict on new iris measurements
338       new_iris_data = pd.DataFrame({
339           'sepal_length': [5.1, 6.5, 4.8],
340           'sepal_width': [3.5, 3.0, 3.4],
341           'petal_length': [1.4, 5.2, 1.6],
342           'petal_width': [0.2, 2.0, 0.3]
343       })
344
345       # Scale the new data using the same scaler
346       new_data_scaled = scaler.transform(new_iris_data)
347
348       # Convert to tensor and predict
349       model.eval()
350       with torch.no_grad():
351           new_data_tensor = torch.FloatTensor(new_data_scaled)
352           new_predictions = model(new_data_tensor)
353           new_predictions_class = torch.argmax(new_predictions, dim=1)
354           new_predictions_species = [target_names[i] for i in new_predictions_class.numpy()]
355           new_predictions_confidence = torch.max(new_predictions, dim=1)[0].numpy()
356
357       # Create output dataframe with predictions
358       predictions_output_df = pd.DataFrame({
359           'sepal_length': new_iris_data['sepal_length'],
360           'sepal_width': new_iris_data['sepal_width'],
361           'petal_length': new_iris_data['petal_length'],
362           'petal_width': new_iris_data['petal_width'],
363           'predicted_species': new_predictions_species,
364           'confidence': new_predictions_confidence
365       })
366
367       print("\nPredictions on new iris measurements:")
368       print(predictions_output_df)
369
370       print("\n" + "="*50)
371       print("Analysis complete! Model successfully trained using PyTorch.")
372       print("="*50)
373       endsubmit;

NOTE: Submitting statements to Python:

NOTE: D:\py314\Lib\site-packages\sklearn\utils\validation.py:2684: UserWarning: X has feature names, but StandardScaler was fitted without feature names
        warnings.warn(


374       import python=predictions_output_df  data=workx.prediction  ;
NOTE: Creating data set 'WORKX.prediction' from Python data frame 'predictions_output_df'
NOTE: Data set "WORKX.prediction" has 3 observation(s) and 6 variable(s)

375       import python=results_df             data=workx.results     ;
NOTE: Creating data set 'WORKX.results' from Python data frame 'results_df'
NOTE: Data set "WORKX.results" has 68 observation(s) and 3 variable(s)

376       import python=cm_df                  data=workx.cm          ;
NOTE: Creating data set 'WORKX.cm' from Python data frame 'cm_df'
NOTE: Data set "WORKX.cm" has 3 observation(s) and 3 variable(s)

377       import python=sample_sizes_df        data=workx.sample_sizes;
NOTE: Creating data set 'WORKX.sample_sizes' from Python data frame 'sample_sizes_df'
NOTE: Data set "WORKX.sample_sizes" has 3 observation(s) and 2 variable(s)

378       run;
NOTE: Procedure python step took :
      real time : 11.720
      cpu time  : 0.031


379
380       proc sql;
381        create
382          table workx.true_false as
383        select
384          actual
385         ,predicted
386         ,case (correct)
387            when (1) then 'TRUE'
388            else          'FALSE'
389          end as correct
390        from
391          workx.results
392       ;quit;
NOTE: Data set "WORKX.true_false" has 68 observation(s) and 3 variable(s)
NOTE: Procedure sql step took :
      real time : 0.013
      cpu time  : 0.015


ERROR: Error printed on page 1

NOTE: Submitted statements took :
      real time : 11.930
      cpu time  : 0.093

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
