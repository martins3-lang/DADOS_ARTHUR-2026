import pandas as pd

dados = 'https://www.ispdados.rj.gov.br/Arquivos/BaseDPEvolucaoMensalCisp.csv'

df = pd.read_csv(dados, encoding='latin-1', sep=';')
print(df) # Exibe o conteúdo do DataFrame
#print(df.head(10)) # Exibe as primeiras 10 linhas do DataFrame
#print(df.tail(10)) # Exibe as últimas 10 linhas do DataFrame
#print(df.columns) # Exibe os nomes das colunas do DataFrame

df_furto_celular_cisp = df.groupby('cisp')['furto_celular'].sum().reset_index() #Dentro do() variavel qualitadtiva e Dentro do[]] variavel quantitativa
#.sum soma o que está dentro do []
#.reset_index() é usado para redefinir o índice do DataFrame resultante após a operação de agrupamento. Ele transforma o índice atual (que é a coluna 'cisp' após o agrupamento) em uma coluna normal, permitindo que o DataFrame resultante tenha um índice padrão (0, 1, 2, ...).
print(df_furto_celular_cisp) # Exibe a soma de furto de celular por CISP