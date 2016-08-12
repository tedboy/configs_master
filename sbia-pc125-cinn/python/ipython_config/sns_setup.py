import seaborn as sns

#https://stanford.edu/~mwaskom/software/seaborn/generated/seaborn.color_palette.html
#http://chrisalbon.com/python/seaborn_color_palettes.html

sns.set_palette('pastel') # <- looks less glaring to the eye
_cycle = sns.get_color_cycle()
_cycle[1],_cycle[2] = _cycle[2],_cycle[1] # swap red/blue
sns.set_palette(_cycle)