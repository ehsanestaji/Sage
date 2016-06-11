##### This code works on metric dimension of graphs
##### The function codes(v,S,G) compute the mtric representation of the vertex v in graph G with respect to subset S of G
def code(v,S,G):
    return [G.distance(v,S[i]) for i in range(0,len(S))]
#####
#####  The function is_resolving check S is an resloving set of G or not
def is_resolving(S,G):
    V=G.vertices()
    R=[code(V[i],S,G) for i in range(0,len(V))]
    SS=set(tuple(R[i]) for i in range(0,len(V)))
    #print R,S,V
    if len(SS)==len(V):
        G.relabel( [tuple(R[i]) for i in range(0,len(V))], inplace=True )
        G.show(vertex_size=600)
        #print "The set "+ str(S) +" is a resloving set for the " + G.name()+ " with " + str(len(G.vertices()))+ " vertices."
        G.relabel()
        return True
    else:
        #print "The set "+ str(S) +" is not a resloving set for the " + G.name()+ " with " + str(len(G.vertices()))+ " vertices."
        G=None
        S=None
        V=None
        return False

         

#####
##### The following code find the metric dimension of graph G
def dim(G):
    V=G.vertices()
    V=set(V)
