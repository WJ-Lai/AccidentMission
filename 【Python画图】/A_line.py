import networkx as nx
import matplotlib.pyplot as plt

G = nx.Graph()
#设置点的名称
G.add_nodes_from(['A', 'B', 'C','D', 'E'])

#设置连线
G.add_edges_from([('A', 'B'), ('A', 'C'), ('D', 'B')])

#设置点的颜色
red = ['A','B','C']
green = ['D','E']

# 设置连线的颜色
red_edges = [('A', 'C')]
black_edges = [('D', 'B')]
green_edges = [('A', 'B')]


#设置原点的编排方式
pos = nx.circular_layout(G)
#设置点的参数
nx.draw_networkx_nodes(G, pos,nodelist =red, node_color = 'r', node_size = 500)
nx.draw_networkx_nodes(G, pos,nodelist =green, node_color = 'g', node_size = 100)

#显示点的名称
nx.draw_networkx_labels(G, pos)

#设置连线的方式
nx.draw_networkx_edges(G, pos, edgelist=red_edges, edge_color='r',width = 10)
nx.draw_networkx_edges(G, pos, edgelist=black_edges, edge_color='b',width = 5)
nx.draw_networkx_edges(G, pos, edgelist=green_edges, edge_color='g',width = 10)

plt.axis('off')
plt.show()
