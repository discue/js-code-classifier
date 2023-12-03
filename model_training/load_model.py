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

max_features = 10000
sequence_length = 1000
batch_size = 32

raw_test_ds = tf.keras.utils.text_dataset_from_directory(
    '../data_preparation/testing', 
    batch_size=batch_size)

# Test it with `raw_test_ds`, which yields raw strings
loss, accuracy = loaded_model.evaluate(raw_test_ds)
print(accuracy)

labelObject = {}

labels = os.listdir(os.getcwd() + '/data/testing')
for index, label in enumerate(labels):
    labelObject[index] = label

result = loaded_model.predict(["""
import { jQuery } from "../core.js"
    jQuery.readyException = function( error ) {
        window.setTimeout( function() {
            throw error
        } )
    }
"""])

resultObjects = results_to_ordered_list(labelObject, result)

print('plain result')
print(result)
print(resultObjects)

result = loaded_model.predict(["""import{Control}from"./Control.js";import{Map}from"../map/Map.js";import*as DomUtil from"../dom/DomUtil.js";import*as DomEvent from"../dom/DomEvent.js";const Zoom=Control.extend({options:{position:"topleft",zoomInText:'<span aria-hidden="true">+</span>',zoomInTitle:"Zoom in",zoomOutText:'<span aria-hidden="true">&#x2212;</span>',zoomOutTitle:"Zoom out"},onAdd(t){var o="leaflet-control-zoom",i=DomUtil.create("div",o+" leaflet-bar"),e=this.options;return this._zoomInButton=this._createButton(e.zoomInText,e.zoomInTitle,o+"-in",i,this._zoomIn),this._zoomOutButton=this._createButton(e.zoomOutText,e.zoomOutTitle,o+"-out",i,this._zoomOut),this._updateDisabled(),t.on("zoomend zoomlevelschange",this._updateDisabled,this),i},onRemove(t){t.off("zoomend zoomlevelschange",this._updateDisabled,this)},disable(){return this._disabled=!0,this._updateDisabled(),this},enable(){return this._disabled=!1,this._updateDisabled(),this},_zoomIn(t){!this._disabled&&this._map._zoom<this._map.getMaxZoom()&&this._map.zoomIn(this._map.options.zoomDelta*(t.shiftKey?3:1))},_zoomOut(t){!this._disabled&&this._map._zoom>this._map.getMinZoom()&&this._map.zoomOut(this._map.options.zoomDelta*(t.shiftKey?3:1))},_createButton(t,o,i,e,s){i=DomUtil.create("a",i,e);return i.innerHTML=t,i.href="#",i.title=o,i.setAttribute("role","button"),i.setAttribute("aria-label",o),DomEvent.disableClickPropagation(i),DomEvent.on(i,"click",DomEvent.stop),DomEvent.on(i,"click",s,this),DomEvent.on(i,"click",this._refocusOnMap,this),i},_updateDisabled(){var t=this._map,o="leaflet-disabled";this._zoomInButton.classList.remove(o),this._zoomOutButton.classList.remove(o),this._zoomInButton.setAttribute("aria-disabled","false"),this._zoomOutButton.setAttribute("aria-disabled","false"),!this._disabled&&t._zoom!==t.getMinZoom()||(this._zoomOutButton.classList.add(o),this._zoomOutButton.setAttribute("aria-disabled","true")),!this._disabled&&t._zoom!==t.getMaxZoom()||(this._zoomInButton.classList.add(o),this._zoomInButton.setAttribute("aria-disabled","true"))}}),zoom=(Map.mergeOptions({zoomControl:!0}),Map.addInitHook(function(){this.options.zoomControl&&(this.zoomControl=new Zoom,this.addControl(this.zoomControl))}),function(t){return new Zoom(t)});export{Zoom,zoom};"""])
resultObjects = results_to_ordered_list(labelObject, result)

print()
print('uglify result')
print(result)
print(resultObjects)