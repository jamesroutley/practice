"""
pre_batch implements a function for calculating the ratios for pre-batched
cocktails.

"""

def calculate_ratios(bottle_capacity, spec, water_ratio=0.2):
    """
    Return the ratios for a pre-batched cocktail

    """
    drink_capacity = bottle_capacity * (1 - water_ratio)
    scaled_spec = {
        name: ratio/float(sum(spec.values()))
        for name, ratio in spec.items()
    }
    ratios = {
        name.title(): ratio * drink_capacity
        for name, ratio in scaled_spec.items()
    }
    ratios["Water"] = water_ratio * bottle_capacity
    print ratios
    assert sum(ratios.values()) == bottle_capacity
    return ratios


if __name__ == "__main__":
    print calculate_ratios(1000, {"gin": 2, "vermouth": 1})
