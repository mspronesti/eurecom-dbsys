import pandas as pd
import matplotlib.pyplot as plt

header = ['k', 'author_count']
df = pd.read_csv('../sql/set_pubs.csv', names=header)

# remove header entry > cast entries to int > cast to list
num_pubs = df.k[1:].astype(int).to_list()
num_authors = df.author_count[1:].astype(int).to_list()

plt.bar(num_pubs, num_authors, align='center')
# log log scale
plt.xscale('log')
plt.yscale('log')

plt.xlabel('Number of Publications')
plt.ylabel('Number of Authors')

#plt.show()
plt.savefig('../../doc/vis.png')