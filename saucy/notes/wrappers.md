# Section Abstract
Other formulations for asynchronous time exist, but non interact with import in
this way. Rather than a constrution with counters and a queue and a theoretical
eventual delivery guarantee, our construction crafts import into a consumable
resource (i.e. tokens) and allow the programming/researcher to directly reason
about protocol execution as a function of the computational resources it has.

# Comparison to Related Works
The idea of abstracting to asynchronous code execution isn't itself the most
important design decision, but using import like paying a "parking meter" is
the non-obvious way to encode eventual delivery.

### Formal UC PL Toos
Most do not allow any kind of reasoning about poynomial behavior. In SymbolicUC, for example there is no hope for saying anything about asynchronous network guarantees.
Other formal tools give you notions of polynomial time but 
