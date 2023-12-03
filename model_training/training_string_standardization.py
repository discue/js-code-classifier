import keras
import tensorflow as tf
import re

@keras.saving.register_keras_serializable(package="my_package", name="custom_standardization")
def custom_standardization(input_data):
  input_data = tf.strings.lower(input_data)
  input_data = tf.strings.regex_replace(input_data,
                                  '[%s]' % re.escape(r"""[;,:\{\}]"""),
                                  ' ')
  input_data = tf.strings.regex_replace(input_data,
                                  '[%s]' % re.escape("""\\\n"""),
                                  '')
  return tf.strings.regex_replace(input_data,
                                  '[%s]' % re.escape(r"""[]"""),
                                  '')

loaded_model = tf.keras.models.load_model('hypermodel-string_regex_punctuation.keras',
    custom_objects={"custom_standardization": custom_standardization},
)