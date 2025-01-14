import z3

# Wrapper for allowing Z3 ASTs to be stored into Python Hashtables. 
def askey(n):
    assert isinstance(n, z3.AstRef)
    return n

def get_vars(f):
    r = set()
    def collect(f):
      if z3.is_const(f): 
          if f.decl().kind() == z3.Z3_OP_UNINTERPRETED and not askey(f) in r:
              r.add(askey(f))
      else:
          for c in f.children():
              collect(c)
    collect(f)
    return r

def get_clause(body,head):
    all_vars = list(get_vars(body))
    return z3.ForAll(all_vars, z3.Implies(body, head))


def prove(f):
    s = z3.Solver()
    s.add(z3.Not(f))
    if s.check() == z3.unsat:
        print ("proved")
    else:
        print ("failed to prove")
    return s

def prove_inductive(_ts, _property):
    # The verification conitions from TS.
    f1 = get_clause(_ts.Init, _property)
    print ("Prove init => property.")
    prove(f1)
    f2 = get_clause(z3.And(_property, _ts.Tr), _ts.to_post(_property))
    print ("Prove property is inductive.")
    prove(f2)
    
    
