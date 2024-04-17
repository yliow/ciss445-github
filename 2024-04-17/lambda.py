import sys
from copy import deepcopy


def is_lambda_expr(x):
    return LambdaExpr in x.__class__.__bases__

def is_variable(x):
    return isinstance(x, Variable)

def is_abstraction(x):
    return isinstance(x, Abstraction)

def is_application(x):
    return isinstance(x, Application)

def assert_lambda_expr(x):
    if not is_lambda_expr(x): raise ValueError("%s is not a LambdaExpr" % x)
    
def assert_variable(x):
    if not is_variable(x): raise ValueError("%s is not a Variable" % x)
    
def assert_abstraction(x):
    if not is_abstraction(x): raise ValueError("%s is not an Abstraction" % x)
    
def assert_application(x):
    if not is_application(x): raise ValueError("%s is not an Application" % x)


class LambdaExpr:
    pass

    
class Variable(LambdaExpr):
    def __init__(self, name):
        self.name = name
    def __repr__(self):
        return self.name
    def __eq__(self, v):
        return is_variable(v) and self.name == v.name


class Abstraction(LambdaExpr):
    def __init__(self, var, e):
        assert_variable(var)
        assert_lambda_expr(e)
        self.var = deepcopy(var)
        self.e = e # deepcopy instead?
    def __repr__(self):
        return "(lambda %s.%s)" % (self.var, self.e)
    def __eq__(self, e):
        return is_abstraction(e) and self.var == e.var and self.e == e.e


class Application(LambdaExpr):
    def __init__(self, e1, e2):
        assert_lambda_expr(e1)
        assert_lambda_expr(e2)        
        self.e1 = deepcopy(e1)
        self.e2 = deepcopy(e2)
    def __repr__(self):
        return "(%s %s)" % (self.e1, self.e2)
    def __eq__(self, e):
        return is_application(e) and self.e1 == e.e1 and self.e2 == e.e2


def replace(e1, v1, e2):
    # Replace v1 in e1 with e2
    # In lambda notation, this is e1[e2/v1]
    assert_lambda_expr(e1)
    assert_variable(v1)
    assert_lambda_expr(e2)

    e1, v1, e2 = deepcopy(e1), deepcopy(v1), deepcopy(e2)
    if is_variable(e1):
        if e1.name == v1.name:
            return e2
        else:
            return e1
    elif is_abstraction(e1):
        return Abstraction(e1.var,
                           replace(e1.e, v1, e2))
    elif is_application(e1):
        return Application(replace(e1.e1, v1, e2),
                           replace(e1.e2, v1, e2))
    else:
        raise Exception("Unknown lambda expression!!!")
            
    
def beta(e):
    # Formally this is beta reduction
    assert_lambda_expr(e)
    newe = deepcopy(e)
    if is_variable(newe):
        return newe
    elif is_abstraction(newe):
        return Abs(newe.var, beta(newe.e))
    elif is_application(e):
        e1, e2 = beta(newe.e1), beta(newe.e2)
        if is_abstraction(e1):
            ret = replace(e1.e, e1.var, e2)
            if ret == App(e1, e2): return ret # to prevent infinite recursion
            else: return beta(ret)
        else:
            return App(e1, e2)
    else:
        raise ValueError("Unknown lambda expression!!!")
            
        
# SHORTHAND
Var = Variable
Abs = Abstraction
App = Application

x = Var('x')
y = Var('y')
print 
print x

f = Abs(x, x); print f
g = Abs(x, f); print g

print
x = Var('x')
y = Var('y')
f = Abs(x, x); print f
g = App(f, y); h = beta(g)
print g, '--->', h


x = Var('x')
f = Abs(x, x)
g = App(f, f)
h = beta(g)
print g, '--->', h

x = Var('x')
y = Var('y')
f = Abs(x, x)
g = App(x, f)
h = Abs(x, g)
i = App(h, y)
j = beta(i)
print i, "--->", j

x = Var('x')
y = Var('y')
z = Var('z')
f = Abs(z, x)
g = App(x, f)
h = Abs(x, g)
i = App(h, y)
j = beta(i)
print i, "--->", j


print "Testing Church's numerals"
x = Var('x')
f = Var('f')
m = Var('m')
n = Var('n')

print "Defining numerals 0,...,6:"
ZERO = Abs(f, Abs(x, x))
ONE = Abs(f, Abs(x, App(f, x)))
TWO = Abs(f, Abs(x, App(f, App(f, x))))
THREE = Abs(f, Abs(x, App(f, App(f, App(f, x)))))
FOUR = Abs(f, Abs(x, App(f, App(f, App(f, App(f, x))))))
FIVE = Abs(f, Abs(x, App(f, App(f, App(f, App(f, App(f, x)))))))
SIX = Abs(f, Abs(x, App(f, App(f, App(f, App(f, App(f, App(f, x))))))))

print "0 =", ZERO
print "1 =", ONE
print "2 =", TWO
print "3 =", THREE
print "4 =", FOUR
print "5 =", FIVE
print "6 =", SIX
print


print "Defining SUCC, PLUS, MULT:"
SUCC = Abs(n, Abs(f, Abs(x, App(f, App(App(n, f), x)))))

PLUS = Abs(m,
           Abs(n,
               Abs(f,
                   Abs(x,
                       App(App(m,
                               f),
                           App(App(n, f),x)
                           )
                       )
                   )
               )
           )


MULT = Abs(m,
           Abs(n,
               Abs(f,
                   Abs(x,
                       App(App(n,
                               App(m,f)),
                           x)
                       )
                   )
               )
           )


print "SUCC:", SUCC
print "PLUS:", PLUS
print "MULT:", MULT
print

def test(e):
    print ">", e
    g = beta(e)
    print "=", g

def pretty(e):
    if is_lambda_expr(e):
        e = deepcopy(e)
        e = beta(e)
        if e == ONE:
            return "1"
        elif e == TWO:
            return "2"
        elif e == THREE:
            return "3"
        elif e == FOUR:
            return "4"
        elif e == FIVE:
            return "5"
        elif e == SIX:
            return "6"
        else:
            return "%s" % e
    else:
        return "%s" % e

def multiapp(*args):
    if len(args) < 1:
        raise ValueError("not enough args for multiapp!")
    elif len(args) == 1:
        return args[0]
    else:
        ret = App(args[0], args[1])
        for arg in args[2:]:
            ret = App(ret, arg)
        return ret

print "SUCC ZER0 =", App(SUCC, ZERO)
print "          =", beta(App(SUCC, ZERO))
print "          =", pretty(App(SUCC, ZERO))
print

print "SUCC ONE =", App(SUCC, ONE)
print "         =", beta(App(SUCC, ONE))
print "         =", pretty(App(SUCC, ONE))
print

print "SUCC TWO =", App(SUCC, TWO)
print "         =", beta(App(SUCC, TWO))
print "         =", pretty(App(SUCC, TWO))
print

print "PLUS TWO TWO =", (App(App(PLUS, TWO), TWO))
print "             =", beta(App(App(PLUS, TWO), TWO))
print "             =", pretty(App(App(PLUS, TWO), TWO))
print

print "PLUS TWO THREE =", (App(App(PLUS, TWO), THREE))
print "               =", beta(App(App(PLUS, TWO), THREE))
print "               =", pretty(App(App(PLUS, TWO), THREE))
print


print "MULT TWO THREE:",  (App(App(MULT, TWO), THREE))
print "               =", beta(App(App(MULT, TWO), THREE))
print "               =", pretty(App(App(MULT, TWO), THREE))
print

print "creating PLUSTWO = (PLUS TWO)..."
PLUSTWO = App(PLUS, TWO)
print "PLUSTWO =", PLUSTWO
print

print "PLUSTWO ONE   =", App(PLUSTWO, ONE)
print "              =", beta(App(PLUSTWO, ONE))
print "              =", pretty(App(PLUSTWO, ONE))
print

print "PLUSTWO TWO   =", App(PLUSTWO, TWO)
print "              =", beta(App(PLUSTWO, TWO))
print "              =", pretty(App(PLUSTWO, TWO))
print

print "PLUSTWO THREE =", App(PLUSTWO, THREE)
print "              =", beta(App(PLUSTWO, THREE))
print "              =", pretty(App(PLUSTWO, THREE))
print


f = App(App(MULT, FIVE), FIVE)
print f
s = "%s" % beta(f)
print s
print "num (f:", s.count("(f ") # should be 25
