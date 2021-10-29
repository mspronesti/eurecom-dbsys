import matplotlib.pyplot
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np


header = ['k', 'pub_count']
df = pd.read_csv('../sql/set_pubs.csv', names=header)

num_authors = df.k.to_list()
num_pubs = df.pub_count.to_list()

plt.bar(num_pubs, num_authors, align='center')
# log log scale
plt.xscale('log')
plt.yscale('log')

plt.xlabel('Number of Authors')
plt.ylabel('Number of Pubblications')
plt.show()