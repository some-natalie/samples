#!/usr/bin/python

# Python 3

import re


def find_message(text):
    """Find a secret message"""
    caps = re.findall('[A-Z]', text)
    message = ''.join(caps)
    return message

if __name__ == '__main__':
    # These "asserts" using only for self-checking and not necessary for auto-testing
    assert find_message("How are you? Eh, ok. Low or Lower? Ohhh.") == "HELLO", "hello"
    assert find_message("hello world!") == "", "Nothing"
    assert find_message("HELLO WORLD!!!") == "HELLOWORLD", "Capitals"
