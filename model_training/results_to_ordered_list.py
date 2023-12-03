
def results_to_ordered_list(labels, result):
    resultObjects = []
    for index, probability in enumerate(result[0]):
        resultObjects.append({
            'label': labels[index],
            'probability': probability
        })

    resultObjects.sort(key=lambda x: x['probability'], reverse=True)
    return resultObjects