import networkx as nx
import matplotlib.pyplot as plt

G = nx.Graph()
a = 'CSV'
b = 'CS'
c = 'OVA'
d = 'SP'
e = 'HF'
nodes_size = 1500
edges_multiple = 40
data_edges_list = [[(a, c)],[(a, d)],[(a ,e)],
                   [(c, d)],[(c ,e)],
                  ]
data_edges_color = ['darkslategrey','darkslategrey','darkslategrey',
                    'darkslategrey','darkslategrey',
                    ]
data_edges_width = [0.095, 0.411, 0.124,
                    0.032, 0.037,
                    ]
for index in range(len(data_edges_width)):
   data_edges_width[index] = data_edges_width[index]*edges_multiple

print(data_edges_width)

#设置点的名称
G.add_nodes_from([a, b, c, d, e])

#设置连线
G.add_edges_from([(a, c),(a, d),(a ,e),
                  (c, d),(c ,e),
                  ])

#设置点的颜色
red = [a, b, c]
blue = [d]
yello = [e]


#设置原点的编排方式
pos = nx.circular_layout(G)
#设置点的参数
nx.draw_networkx_nodes(G, pos,nodelist =red, node_color = 'firebrick', node_size = nodes_size)
nx.draw_networkx_nodes(G, pos,nodelist =blue, node_color = 'royalblue', node_size = nodes_size)
nx.draw_networkx_nodes(G, pos,nodelist =yello, node_color = 'gold', node_size = nodes_size)

#显示点的名称
nx.draw_networkx_labels(G, pos,font_color ='white')

#设置连线的方式
for index in range(len(data_edges_color)):
   nx.draw_networkx_edges(G, pos, edgelist=data_edges_list[index],
                          edge_color=data_edges_color[index],
                          width = data_edges_width[index])


plt.axis('off')
plt.show()
