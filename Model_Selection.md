# Model Selection for Brain-Text Transcription

## Table of Contents

1. [Recommended Models: RNN or LSTM](#recommended-models-rnn-or-lstm)
   - [Why RNN or LSTM?](#why-rnn-or-lstm)
2. [Experimentation Plan](#experimentation-plan)
   - [Steps for Effective Experimentation](#steps-for-effective-experimentation)
   - [Tools and Libraries](#tools-and-libraries)
3. [Fast-Track Experimentation Plan](#fast-track-experimentation-plan)
   - [Steps for Quick Implementation](#steps-for-quick-implementation)
   - [Tools and Libraries](#tools-and-libraries-1)

## Recommended Models: RNN or LSTM

### Why RNN or LSTM?

1. **Sequence Modeling**: Both Recurrent Neural Networks (RNNs) and Long Short-Term Memory (LSTMs) excel at modeling sequences.
2. **Memory**: LSTMs possess a 'memory' feature.
3. **Real-time Processing**: Capable of real-time data processing.
4. **Flexibility**: Fine-tunable for specific requirements.

### Additional Considerations

Given the complexity and uniqueness of brain wave data, experimentation with different architectures and hyperparameters will likely be necessary to identify the most effective model for this specific application.

## Experimentation Plan

### Steps for Effective Experimentation

1. **Data Collection**: Gather diverse EEG data.
2. **Data Preprocessing**: Normalize and clean the data.
3. **Model Architecture**: Start with basic RNN or LSTM models.
4. **Hyperparameter Tuning**: Use techniques like grid search or random search.
5. **Training and Validation**: Split the dataset and train the model.
6. **Evaluation Metrics**: Choose metrics like accuracy, F1 score.
7. **Iterative Refinement**: Refine the model and retrain.
8. **User Testing**: Validate real-world applicability.
9. **Documentation**: Keep records of each experiment.

### Tools and Libraries

- **TensorBoard**: For monitoring.
- **Jupyter Notebooks**: For data analysis.
- **Git**: For version control.

## Fast-Track Experimentation Plan

### Steps for Quick Implementation

1. **Data Collection**: Use a small sample of EEG data.
2. **Data Preprocessing**: Apply basic normalization.
3. **Model Architecture**: Start with a simple RNN model.
4. **Hyperparameter Tuning**: Use default hyperparameters.
5. **Training and Validation**: Use a smaller dataset.
6. **Evaluation Metrics**: Focus on one or two key metrics.
7. **Iterative Refinement**: Make quick adjustments.
8. **User Testing**: Conduct a small-scale user test.

### Tools and Libraries

- **TensorBoard**: For quick monitoring.
- **Jupyter Notebooks**: For rapid data analysis.
  
---

## Data Preparation for RNN Models

### Steps for Data Preparation

1. **Sample Data**: Obtain sample EEG data that aligns with the Neurosity SDK's concepts of Predictions.
2. **Data Conversion Script**: Create a script to convert the Neurosity SDK's data format, which includes metrics like `raw`, `rawUnfiltered`, `psd`, and `powerByBand`.
3. **Expected Format for RNN**: RNN models typically expect data in a 3D array format, where the dimensions represent `[samples, timesteps, features]`.

### Data Conversion Example

Here's a simplified example in JavaScript to convert raw EEG data to the expected RNN format:

```javascript
const tf = require('@tensorflow/tfjs-node');

// Sample raw EEG data from Neurosity SDK
const raw_data = [...]  // Replace with actual data

// Convert to 3D array format for RNN
const samples = raw_data.length;
const timesteps = 1;  // Single timestep for each sample
const features = raw_data[0].length;  // Number of features in each sample

const rnn_input = tf.tensor3d(raw_data, [samples, timesteps, features]);
```
