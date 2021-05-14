import seaborn as sns

iris = sns.load_dataset('iris')
print(iris.head())

sns.set()
sns.pairplot(iris, hue='species', height=1.5)

X_iris = iris.drop('species', axis=1)

print(X_iris.shape)



