using Graphs
using GraphViz

g = simple_graph(3)  #Directed Graph (3 vertices, 0 edges)
add_edge!(g, 1, 2)   #edge [1]: 1 -- 2
add_edge!(g, 3, 2)   #edge [2]: 3 -- 2
add_edge!(g, 3, 1)   #edge [3]: 3 -- 1

GraphViz.Graph(Graphs.to_dot(g))
