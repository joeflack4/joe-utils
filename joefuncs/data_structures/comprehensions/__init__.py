"""Comprehensions."""


def inverse_filter_dict(dictionary, keys):
    """Filter a dictionary by any keys not given.

    Args:
        dictionary (dict): Dictionary.
        keys (iterable): Iterable containing data type(s) for valid dict key.

    Return:
        dict: Filtered dictionary.
    """
    return {key: val for key, val in dictionary.items() if key not in keys}
