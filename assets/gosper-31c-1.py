from math import sin, cos, radians
import turtle

"""
    "gosper-31c-1" :   {"axiom": "AA+B-A--A+B++BB+A+BB+A-B-AA--A-B++B+A-B-AAA--A-BB++B+AA-BB+", "turn": 60, "draw": "AB"},
"""

inverse = str.maketrans(dict(zip("AB+-", "BA-+")))

a = "A-B--B+A++AA+B-"
a = "AA+B-A--A+B++BB+A+BB+A-B-AA--A-B++B+A-B-AAA--A-BB++B+AA-BB+"
b = str.translate(''.join(reversed(a)), inverse)
order = 2
steps = a

sub = str.maketrans({"A": a, "B": b})

for _ in range(1, order):
    steps = str.translate(steps, sub)

points = [[0,0]]
angle = 30
draw = {"A","B"}
size = 4.5
size = 6


turtle.speed(0)
turtle.left(angle)
for s in steps:
    if s in draw:
        turtle.forward(size)
        x, y = points[-1]
        ang = radians(angle)
        points.append([x+size*cos(ang),y+size*sin(ang)])
    elif s == "-":
        turtle.left(60)
        angle -= 60
    elif s == "+":
        turtle.right(60)
        angle += 60

#input()
#print(points)

instructions = ["$fn = 32;", "", "module gosper() {"]

for a, b in zip(points[:-1], points[1:]):
    instructions.append(f'    line2d(p1={a}, p2={b}, width=2, p1Style="CAP_ROUND", p2Style="CAP_ROUND");')

instructions.extend(["}"])

with open("gosper-31c-1-ins.scad", "w") as f:
    f.write("\n".join(instructions))
