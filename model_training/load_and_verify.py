import tensorflow as tf
import keras
import os
import re
from results_to_ordered_list import results_to_ordered_list
from training_string_standardization import custom_standardization

loaded_model = tf.keras.models.load_model('hypermodel-string_regex_punctuation.keras',
    custom_objects={"custom_standardization": custom_standardization},
)
print(loaded_model.summary())

labelObject = {}

labels = os.listdir(os.getcwd() + '/data/testing')
for index, label in enumerate(labels):
    labelObject[index] = label

checksTotal=0
correctChecks=0
incorrectChecks=0

for label in labels:
  folder = os.getcwd() +'/data/testing/' + label 
  files = os.listdir(folder)

  for file in files:
      filePath = folder + '/' + file

      with open(filePath, 'r', encoding = 'utf-8') as file:
          content = file.read()

          result = loaded_model.predict([content])
          results = results_to_ordered_list(labelObject, result)
          highestProbabilitylabel = results[0]['label']
          checksTotal += 1

          if highestProbabilitylabel == label:
            correctChecks += 1
          else:
            if (highestProbabilitylabel == 'plain-es5' and label == 'plain') or (highestProbabilitylabel == 'plain' and label == 'plain-es5'): 
                correctChecks += 1
            else:
                incorrectChecks += 1
                print('Prediction error')
                print('Expected {} to be {} but highest probability is {}'.format(filePath, label, results[0]['label']))


print('total:           {}'.format(checksTotal))
print('correctChecks:   {}'.format(correctChecks))
print('incorrectChecks: {}'.format(incorrectChecks))
print('correct %:       {}%'.format(correctChecks / checksTotal * 100))