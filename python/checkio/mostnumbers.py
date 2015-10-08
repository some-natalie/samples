OPERATION_NAMES = ("conjunction", "disjunction", "implication", "exclusive", "equivalence")
​
def boolean(x, y, operation):
    if operation == u"conjunction":
        return int(x and y)
    elif operation == u"disjunction":
        return int(x or y)
    elif operation == u"implication":
        return int(not x or y)
    elif operation == u"exclusive":
        return int((x + y) % 2)
    elif operation == u"equivalence":
        return int(x == y)
    else:
        return None
​
if __name__ == '__main__':
    #These "asserts" using only for self-checking and not necessary for auto-testing
    assert boolean(1, 0, "conjunction") == 0, "and"
    assert boolean(1, 0, "disjunction") == 1, "or"
    assert boolean(1, 1, "implication") == 1, "material"
    assert boolean(0, 1, "exclusive") == 1, "xor"
    assert boolean(0, 1, "equivalence") == 0, "same?"
