# Documentação do Projeto: Challenge Analytics

## Objetivo
Crie um dashboard utilizando uma ferramenta de visualização de dados, em um dos seguintes players: MS Power BI, Tableau ou Looker. Como escopo, deve-se analisar a evolução, o crescimento da Internet, dos usuários, dos assinantes, etc. na Argentina e suas causas.

## Estrutura do Projeto
* **defs.py:**
  * `connect_db_sheet()`: Conecta ao Google Sheets e retorna uma instância da planilha.
  * `get_infos_api()`: Obtém os dados da API do Banco Mundial e cria um DataFrame com os indicadores desejados.
  * `insert_dataframe()`: Insere os dados do DataFrame na planilha do Google Sheets.
* **main.py:**
  * Executa o fluxo principal, chamando as funções definidas em `defs.py` para buscar os dados, limpar a planilha e inserir os novos dados.
* **requirements.txt:**
  * Possui as bibliotecas necessárias para a execução do projeto.

## Fluxo do Processo
1. **Conectar ao Google Sheets:** Estabelece uma conexão com a planilha do Google Sheets onde os dados serão armazenados.
2. **Obter dados da API:** Realiza uma consulta à API do Banco Mundial para obter os indicadores de internet e telecomunicações da Argentina.
3. **Limpar a planilha:** Remove todos os dados existentes na planilha para garantir que os novos dados sejam inseridos corretamente.
4. **Inserir dados na planilha:** Insere os dados obtidos da API na primeira linha da planilha, seguida pelos dados de cada ano.

## Visualização dos Dados
O dashboard do Tableau, disponível em [[link para o dashboard](https://public.tableau.com/app/profile/rodrigo.cruz7598/viz/AnalisedaevoluodocrescimentodaInternet/Painel1)], permite visualizar a evolução da assinatura de internet fixa e telefone ao longo do tempo, bem como o percentual da população argentina que utiliza a internet. O gráfico de "Evolução assinatura de internet fixa e telefone" demonstra como o aumento das assinaturas de planos de celular está diretamente relacionado ao crescimento do percentual da população com acesso à internet.

**Insights:**
* **Correlação entre assinaturas de celular e uso da internet:** O gráfico mostra uma clara correlação positiva entre o aumento das assinaturas de celular e o crescimento do percentual da população argentina utilizando a internet.
* **Importância da infraestrutura móvel:** A expansão da infraestrutura de telefonia móvel desempenhou um papel crucial na popularização do acesso à internet na Argentina.
* **Potencial de crescimento:** Os resultados sugerem que o mercado de internet na Argentina ainda possui um grande potencial de crescimento, impulsionado pela contínua expansão da cobertura móvel e pela crescente demanda por serviços online.
