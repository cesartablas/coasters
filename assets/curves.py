""" Space Filling Curves

Dragon curve
Gosper curve
Hilbert curve
Koch curve
Moore curve
Murray polygon
Sierpiński curve
Space-filling tree
Spatial index
Hilbert R-tree
Bx-tree
Peano
Cantor?
"""

from math import sin, cos, radians
import turtle

curves = {
    "hilbert"      :   {"axiom": "+BF-AFA-FB+", "turn": 90, "draw": "F"},
    "gosper-7"     :   {"axiom": "A-B--B+A++AA+B-", "turn": 60, "draw": "AB"},
    "gosper-13"    :   {"axiom": "B-A--A+B++B-AA--A-B+A-B++B+A+", "turn": 60, "draw": "AB"},
    "gosper-19"    :   {"axiom": "AA+BB+A+BB++B+A--A-B-AA-B-AAA-BB+", "turn": 60, "draw": "AB"},
    "gosper-31a-1" :   {"axiom": "B-AA--A-B++B+A+BB+A+BB-AA-B-AA--A-B++B+A+B-AA-B-A--A+B++BB+A+", "turn": 60, "draw": "AB"},
    "gosper-31b-1" :   {"axiom": "AA-B++B+A+BB-A--AA+BB++B+A-B-A--A+B-AA-B+A--A-B+A+BB++B+A--A-B+", "turn": 60, "draw": "AB"},
    "gosper-31b-2" :   {"axiom": "AA-B++B+A--A-B++B+A+BB+A-B-A--A+B++B-A--A+B-AA--A-B++B+A+B-A--A+BB+", "turn": 60, "draw": "AB"},
    "gosper-31b-3" :   {"axiom": "A+B-A--A+B++B-A+B++B-A+BB+A--A-B+A--A-B+A+B++B-A--AA-B+A--A-B++B+A-B+", "turn": 60, "draw": "AB"},
    "gosper-31b-4" :   {"axiom": "A+B++B-A--AA-B-A+B++B-A+B++B-AA-B++B+A-B-A--A+B-AA-B+A--A-B++B+A-B+", "turn": 60, "draw": "AB"},
    "gosper-31b-5" :   {"axiom": "A+B++B-A--A+B++B-A--A+B-AA-B+A--A-B-A+B++B-A+B-A+B++B-A+B++B-A--AA-B+", "turn": 60, "draw": "AB"},
    "gosper-31c-1" :   {"axiom": "AA+B-A--A+B++BB+A+BB+A-B-AA--A-B++B+A-B-AAA--A-BB++B+AA-BB+", "turn": 60, "draw": "AB"},
    "gosper-37a-1" :   {"axiom": "AAA+BBB+AA+BBB+A+BB+A+B++B-A--AA-B-AA-BB-AAA-BB-AAAA-BBB+", "turn": 60, "draw": "AB"},
    "gosper-37b-1" :   {"axiom": "AA-B++B+A-B++B+A-B-A--A+B-AA-B++B+A+BB-A+B++B-A--A+B-A--A+B-AA-B+A+B-A--A+BB+", "turn": 60, "draw": "AB"},
    "gosper-37b-2" :   {"axiom": "AA-B++B+A-B++B+A-B-A--A+B++B-A+B-A--A+B-AA--A-B++B+A-B+A-B++B+A+B-A--A+B-A--A+BB+", "turn": 60, "draw": "AB"},
    "gosper-37c-1" :   {"axiom": "A+B++B-A+B-A--A+B-AA--A-B++B+A-B+A-B++B+A-B++B+A--A-B+A+BB-A--AA+B-A--A+BB+A-B+", "turn": 60, "draw": "AB"},
    "gosper-37c-2" :   {"axiom": "A+B++B-A+B-A--A+B-AA+B++BB-A--AA+B-A--A+B-A+B-A--A+BB++B+A-B+A-B++B+A-B+A--A-B+", "turn": 60, "draw": "AB"},
    "gosper-37c-3" :   {"axiom": "A+B-AA-B++B+A-B++B+A-B-A+B++B-A--A+B-A--A+B-AA-B++B+A+BB-A--AA+B-A--A+BB+A-B+", "turn": 60, "draw": "AB"},
    "gosper-37d-1" :   {"axiom": "B-A--A+B++B-A+B++B-A--A+B++B-A+B++B-A--A+B-A--A+B++B-A--AA-B+A-B++B+A--A-B+A--A-B++B+A+", "turn": 60, "draw": "AB"},
    "gosper-37d-2" :   {"axiom": "B-A--A+B++B-A+B++B-A+B-A+B-A--A+B++B-A--AA-B+A--A-B++B+A-B++B+A-B+A--A-B+A--A-B++B+A+", "turn": 60, "draw": "AB"},
}

curve = curves["gosper-31c-1"]
order = 2
size  = 10

a = curve["axiom"]
inverse = str.maketrans(dict(zip("AB+-", "BA-+")))
b = str.translate(''.join(reversed(a)), inverse)
steps = a
sub = str.maketrans({"A": a, "B": b})
for _ in range(1, order):
    steps = str.translate(steps, sub)

angle = 0
turtle.speed(0)
turtle.left(angle) # ccw
draw = curve["draw"]
turn = curve["turn"]
for s in steps:
    if s in draw:
        turtle.forward(size)
    elif s == "+": # ccw
        turtle.left(turn)
        angle -= turn
    elif s == "-": # cw
        turtle.right(turn)
        angle += turn


input()
