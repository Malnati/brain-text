# Model Selection for Brain-Text Transcription

---

## Table of Contents

1. [Recommended Models: RNN or LSTM](#recommended-models-rnn-or-lstm)
   - [Why RNN or LSTM?](#why-rnn-or-lstm)
2. [Experimentation Plan](#experimentation-plan)
   - [Steps for Effective Experimentation](#steps-for-effective-experimentation)
   - [Tools and Libraries](#tools-and-libraries)
3. [Fast-Track Experimentation Plan](#fast-track-experimentation-plan)
   - [Steps for Quick Implementation](#steps-for-quick-implementation)
   - [Tools and Libraries](#tools-and-libraries-1)
4. [Data Preparation for RNN Models](#data-preparation-for-rnn-models)
   - [Steps for Data Preparation](#steps-for-data-preparation)
   - [Data Conversion Example](#data-conversion-example)
5. [Hyperparameter Tuning in Node.js](#hyperparameter-tuning-in-nodejs)
   - [Techniques for Hyperparameter Tuning](#techniques-for-hyperparameter-tuning)
   - [Grid Search Example](#grid-search-example)
   - [Random Search Example](#random-search-example)

---

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
  **Raw**
The raw brainwaves parameter emits events of 16 samples for Crown and 25 for Notion 1 and 2. We call these groups of samples Epochs.
```javascript
const neurosity = new Neurosity();

neurosity.brainwaves("raw").subscribe((brainwaves) => {
  console.log(brainwaves);
});
```
The code above will output new epochs of 16 samples approximately every 62.5ms (see the data property). Here's an example of 1 event:
```javascript
{
  label: 'raw',
  data: [
    [
        4.457080580994754,   4.851055413759571,
       2.7564288713972513, -0.5027899221971044,
       -2.738312652550817, -1.4222768509324195,
       3.7224881424127774,  10.026623768677425,
       13.387940036943913,   10.26958811063134,
      0.40214439930276313,  -10.90689891807639,
       -16.32031531728357,  -13.21110292437311,
       -4.346339152926361,   5.098462672115731
    ],
    [
       1.5414324608328491,   1.352550875105505,
       0.6428681224481866,  0.3647622839064659,
        1.106405158893898,    3.33535030106603,
        6.439447624257519,   8.453867322080404,
        7.755719477492251,  3.8854840128526726,
       -2.468418708869076,  -8.666576946507902,
      -11.279063910921169,   -9.32163910159064,
      -4.6549399985975555, 0.22830321396497988
    ],
    [
       6.2342484244030345,   5.845156697083605,
       3.8819440822537112,   1.452431055127227,
      -0.5878084105038387, -0.7746780077287738,
       1.8154316196085094,   6.074662974618359,
        9.322430831260775,   8.910160063433407,
       3.5874046672323043,  -4.554187036159066,
        -10.5813322711113, -11.267696723897789,
       -6.818338145262863,  0.6177864457464617
    ],
    [
      -0.03815349843983071, -0.3068494494059635,
       -2.2075671327003255,  -3.776991642244289,
        -3.708252867923816, -1.2505125622236009,
        3.2487010722502587,   7.931368090269462,
        10.511652358411597,   9.297157466389192,
         4.118487064147775,  -2.970255165231891,
        -8.603434324519576, -10.495401970387743,
        -8.913968355428027,  -5.576315727924461
    ],
    [
      0.4087987173450871, 1.9781686568610883,
      2.4009012312957907, 2.3444623435812657,
       2.017191526524595,  2.021880260660721,
       2.982232584662937,  4.815498699074363,
      6.7093290202119835,  7.201157697368587,
       5.116090777276677, 0.6675802498302112,
      -4.274751517565271, -7.425134286013973,
      -7.838523284654038, -5.779233789541195
    ],
    [
       5.2762700288652935,   6.831919893235682,
        6.468141714172544,   5.147606136919876,
        4.117592132996127,   4.788874365858218,
        7.116782027901927,    9.33554991116211,
        9.233167024756574,   5.130966403760715,
      -2.8162586562506586,  -11.22160733448037,
      -15.538132012307846, -13.939535958562475,
        -7.83032193319038, -0.5139467086717411
    ],
    [
      -1.0706877843314648,  1.6368537502872518,
        2.022946637839514,   0.940183871324582,
      -0.2837858448921892,  0.3170369574339986,
        3.778225479624427,   8.805770181583913,
       12.446309024446833,  11.648691354684154,
        5.113617281379798,  -4.345975093596486,
       -11.05811376487729, -11.719256256733335,
       -7.336025188705039,  -1.276174494743728
    ],
    [
        7.286685329938873,    8.201842402616839,
        5.517128178717949,   1.2864058791627557,
      -1.5101995538838966, -0.19819079250913285,
        5.195437241439434,   11.512563735679437,
       14.388370410845482,   10.711863367882668,
       0.8428177428317678,  -10.126402143316568,
       -15.75585412249734,  -13.887360795976967,
       -6.836657125920971,   1.1706118773123455
    ]
  ],
  info: {
    channelNames: [
      'CP3', 'C3',
      'F5',  'PO3',
      'PO4', 'F6',
      'C4',  'CP4'
    ],
    notchFrequency: '60Hz',
    samplingRate: 256,
    startTime: 1628194299499
  }
}
```
Epochs are pre-filtered on the device's Operating System to give you the cleanest data possible with maximum performance. These filters include:

Notch of 50Hz or 60Hz and a bandwidth of 1.
Bandpass with cutoff between 2Hz and 45Hz.
The order of these filters is set to 2, and the characteristic used is butterworth.

To apply your own filters, you can use the rawUnfiltered brainwaves parameter (see next section) and use the Neurosity Pipes library for fine-grained customization.
4. **Expected Format for RNN**: RNN models typically expect data in a 3D array format, where the dimensions represent `[samples, timesteps, features]`.

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
---

## Hyperparameter Tuning in Node.js

### Techniques for Hyperparameter Tuning

1. **Grid Search**: Systematically work through multiple combinations of parameter tunes, cross-validate as you go to determine which tune gives the best performance.
2. **Random Search**: Randomly sample the search space and perform K-Fold CV (Cross-Validation), typically faster and can yield high-performing models.

### Grid Search Example

Here's a simplified example in JavaScript using TensorFlow.js:

```javascript
const tf = require('@tensorflow/tfjs-node');

// Define the parameter grid
const learningRates = [0.01, 0.001];
const batchSizes = [32, 64];

// Loop through the parameter grid
for (const lr of learningRates) {
  for (const batch of batchSizes) {
    const model = tf.sequential();
    // ... (define your model architecture here)
    
    const optimizer = tf.train.adam(lr);
    model.compile({ optimizer, loss: 'meanSquaredError', metrics: ['accuracy'] });
    
    // Train the model
    const history = await model.fit(trainData, trainLabels, {
      epochs: 10,
      batch,
      validationData: [valData, valLabels]
    });
    
    console.log(`Learning Rate: ${lr}, Batch Size: ${batch}, Validation Accuracy: ${history.history.val_acc}`);
  }
}
```

### Random Search Example

Random search can be implemented similarly, but you would randomly sample from your hyperparameter space instead of iterating through a predefined list.

```javascript
const randomLearningRate = Math.random() * 0.01;  // Randomly sample learning rate
const randomBatchSize = [32, 64][Math.floor(Math.random() * 2)];  // Randomly sample batch size
```

---
