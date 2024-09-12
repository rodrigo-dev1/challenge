## Documentação do Projeto - Análise de Ofertas Mercado Livre

### Visão Geral



### Estrutura do Projeto

O projeto está organizado da seguinte forma:

* **defs.py:** Contém funções auxiliares para realizar as chamadas à API, processar os dados e criar o DataFrame.
* **`desenho_diag.png`:** Diagrama visual que representa o fluxo do processo.
* **dados.csv:** Arquivo CSV que armazena os dados coletados e processados.
* **exploration.ipynb:** Notebook Jupyter para análise exploratória dos dados.
* **main.py:** Script principal que executa o fluxo principal do projeto.

### Funcionamento Detalhado

#### defs.py
* **check_error:** Decorador para tratamento de exceções.
* **get_ids:** Realiza uma requisição à API para obter os IDs dos produtos para um determinado termo de pesquisa.
* **get_item:** Obtém os detalhes completos de um produto a partir do seu ID.
* **create_list_from_df:** Cria uma lista de dicionários com os dados relevantes de cada produto.
* **create_df_for_analysis:** Converte a lista de dicionários em um DataFrame do Pandas e realiza algumas transformações nos dados.

#### main.py
* **Parâmetros:** Define os termos de pesquisa e as chaves a serem extraídas dos dados.
* **Processamento:** Chama as funções em defs.py para coletar e processar os dados.
* **Saída:** Salva os resultados em um arquivo CSV.

### Consumo da API
O projeto utiliza a API do Mercado Livre para obter informações sobre os produtos. As requisições são realizadas para os endpoints `/sites/MLA/search` e `/items/{item_id}`.

### nálise Exploratória
* **Análise Exploratória:** Realizar uma análise mais profunda dos dados utilizando o notebook Jupyter.
* **Visualizações:** Criar gráficos e visualizações para melhor entender os resultados.
* **Expansão:** Adicionar novas funcionalidades, como análise de preços, comparação de vendedores, etc.


