import networkx as nx
import matplotlib.pyplot as plt

G = nx.Graph()
a = 'CSV'
b = 'CS'
c = 'OVA'
d = 'SP'
e = 'HF'
#设置点的名称
G.add_nodes_from([a, b, c, d, e])

#设置连线
G.add_edges_from([(a, b),(a, c),(a, d),(a ,e),
                  (b, c),(b, d),(b, e),
                  (c, d),(c ,e),
                  (d, e)])

#设置点的颜色
red = [a, b, c]
blue = [d]
yello = [e]

# 设置连线的颜色
red_edges = [(a, c)]
black_edges = [(d, b)]
green_edges = [(a, b)]


#设置原点的编排方式
pos = nx.circular_layout(G)
#设置点的参数
nx.draw_networkx_nodes(G, pos,nodelist =red, node_color = 'r', node_size = 900)
nx.draw_networkx_nodes(G, pos,nodelist =blue, node_color = 'b', node_size = 900)
nx.draw_networkx_nodes(G, pos,nodelist =yello, node_color = 'y', node_size = 900)

#显示点的名称
nx.draw_networkx_labels(G, pos)

#设置连线的方式
nx.draw_networkx_edges(G, pos, edgelist=red_edges, edge_color='r',width = 10)
nx.draw_networkx_edges(G, pos, edgelist=black_edges, edge_color='b',width = 5)
nx.draw_networkx_edges(G, pos, edgelist=green_edges, edge_color='g',width = 10)

plt.axis('off')
plt.show()
