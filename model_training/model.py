import matplotlib.pyplot as plt
import os
import re
import shutil
import string
import tensorflow as tf

from tensorflow.keras import layers
from tensorflow.keras import losses

epochs = 1
batch_size = 32
embedding_dim = 16
max_features = 10000
sequence_length = 1000
seed = 42

# Define a learning rate schedule
learning_rate_schedule = tf.keras.optimizers.schedules.ExponentialDecay(
    initial_learning_rate=0.01,
    decay_steps=1000,
    decay_rate=0.96
)

# Create an optimizer with the learning rate schedule
optimizer = tf.keras.optimizers.Adam(learning_rate=learning_rate_schedule)

raw_train_ds = tf.keras.utils.text_dataset_from_directory(
    '../data_preparation/training', 
    batch_size=batch_size, 
    validation_split=0.2, 
    subset='training', 
    seed=seed)

raw_val_ds = tf.keras.utils.text_dataset_from_directory(
    '../data_preparation/training', 
    batch_size=batch_size, 
    validation_split=0.2, 
    subset='validation', 
    seed=seed)

raw_test_ds = tf.keras.utils.text_dataset_from_directory(
    '../data_preparation/testing', 
    batch_size=batch_size)

def custom_standardization(input_data):
  lowercase = tf.strings.lower(input_data)
  return lowercase
#   stripped_html = tf.strings.regex_replace(lowercase, '<br />', ' ')
#   return tf.strings.regex_replace(stripped_html,
#                                   '[%s]' % re.escape(string.punctuation),
#                                   '')

vectorize_layer = layers.TextVectorization(
    standardize=custom_standardization,
    max_tokens=max_features,
    output_mode='int',
    output_sequence_length=sequence_length)

# Make a text-only dataset (without labels), then call adapt
train_text = raw_train_ds.map(lambda x, y: x)
vectorize_layer.adapt(train_text)

def vectorize_text(text, label):
  text = tf.expand_dims(text, -1)
  return vectorize_layer(text), label

# retrieve a batch (of 32 reviews and labels) from the dataset
text_batch, label_batch = next(iter(raw_train_ds))
first_review, first_label = text_batch[0], label_batch[0]
print("Review", first_review)
print("Label", raw_train_ds.class_names[first_label])
print("Labels", raw_train_ds.class_names)
print("Vectorized review", vectorize_text(first_review, first_label))

train_ds = raw_train_ds.map(vectorize_text)
val_ds = raw_val_ds.map(vectorize_text)
test_ds = raw_test_ds.map(vectorize_text)

AUTOTUNE = tf.data.AUTOTUNE

train_ds = train_ds.cache().prefetch(buffer_size=AUTOTUNE)
val_ds = val_ds.cache().prefetch(buffer_size=AUTOTUNE)
test_ds = test_ds.cache().prefetch(buffer_size=AUTOTUNE)

model = tf.keras.Sequential([
  layers.Embedding(max_features, embedding_dim),
  layers.Dropout(0.5),
  layers.GlobalAveragePooling1D(),
  layers.Dropout(0.5),
  layers.Dense(len(raw_train_ds.class_names))])

model.summary()

model.compile(loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
              optimizer=optimizer,
              metrics=['accuracy'])

history = model.fit(
    train_ds,
    validation_data=val_ds,
    epochs=epochs)

loss, accuracy = model.evaluate(test_ds)

print("Loss: ", loss)
print("Accuracy: ", accuracy)

history_dict = history.history
history_dict.keys()

acc = history_dict['accuracy']
val_acc = history_dict['val_accuracy']
loss = history_dict['loss']
val_loss = history_dict['val_loss']

epochs = range(1, len(acc) + 1)

# "bo" is for "blue dot"
plt.plot(epochs, loss, 'bo', label='Training loss')
# b is for "solid blue line"
plt.plot(epochs, val_loss, 'b', label='Validation loss')
plt.title('Training and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()

plt.show()

plt.plot(epochs, acc, 'bo', label='Training acc')
plt.plot(epochs, val_acc, 'b', label='Validation acc')
plt.title('Training and validation accuracy')
plt.xlabel('Epochs')
plt.ylabel('Accuracy')
plt.legend(loc='lower right')

plt.show()

export_model = tf.keras.Sequential([
  vectorize_layer,
  model,
  layers.Activation('sigmoid')
])

export_model.compile(
    loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True), optimizer=optimizer, metrics=['accuracy']
)

print(vectorize_layer.get_vocabulary())

# Test it with `raw_test_ds`, which yields raw strings
loss, accuracy = export_model.evaluate(raw_test_ds)
print(accuracy)

  # result = model.predict("""
  # import { jQuery } from "../core.js"
  #     // abdef
  #     jQuery.readyException = function( error ) {
  #         // abasef
  #         window.setTimeout( function() {
  #             throw error
  #         } )
  #     }
  #     // abcdef
  # """)

  # print('plain result')
  # print(result)

result = export_model.predict(['import{jQuery}from"../core.js"import{access}from"../core/access.js"import{nodeName}from"../core/nodeName.js"import{rnothtmlwhite}from"../var/rnothtmlwhite.js"import{isIE}from"../var/isIE.js"import"../selector.js"jQuery.fn.extend({attr:function(t,e){return access(this,jQuery.attr,t,e,1<arguments.length)},removeAttr:function(t){return this.each(function(){jQuery.removeAttr(this,t)})}}),jQuery.extend({attr:function(t,e,r){var o,u,i=t.nodeTypeif(3!==i&&8!==i&&2!==i)return void 0===t.getAttribute?jQuery.prop(t,e,r):(1===i&&jQuery.isXMLDoc(t)||(u=jQuery.attrHooks[e.toLowerCase()]),void 0!==r?null===r?void jQuery.removeAttr(t,e):u&&"set"in u&&void 0!==(o=u.set(t,r,e))?o:(t.setAttribute(e,r),r):!(u&&"get"in u&&null!==(o=u.get(t,e)))&&null==(o=t.getAttribute(e))?void 0:o)},attrHooks:{},removeAttr:function(t,e){var r,o=0,u=e&&e.match(rnothtmlwhite)if(u&&1===t.nodeType)for(r=u[o++])t.removeAttribute(r)}}),isIE&&(jQuery.attrHooks.type={set:function(t,e){var rif("radio"===e&&nodeName(t,"input"))return r=t.value,t.setAttribute("type",e),r&&(t.value=r),e}}),jQuery.each(jQuery.expr.match.bool.source.match(/\w+/g),function(t,u){jQuery.attrHooks[u]={get:function(t){var e,r=jQuery.isXMLDoc(t),o=u.toLowerCase()return e=r?e:null!=t.getAttribute(u)?o:null},set:function(t,e,r){return!1===e?jQuery.removeAttr(t,r):t.setAttribute(r,r),r}}})'])
print('uglify result')
print(result)

export_model.save("model.keras", save_format="keras")
export_model.save("model.idk")