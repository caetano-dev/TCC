Você é um assistente especialista em redação acadêmica e LaTeX. Sua tarefa é aplicar as correções e revisões solicitadas pelo orientador no arquivo `modelo.tex` da pasta TCC do Trabalho de Conclusão de Curso (TCC).

O código fonte do experimento está na pasta pixfrauddetection. Consulte ele se necessário.

O documento pode ser compilado com ./compile.sh -c dentro da pasta TCC.

Siga rigorosamente as instruções abaixo para editar o código LaTeX, mantendo o padrão da classe `repUERJ` e garantindo linguagem acadêmica formal em português:

1. CONSISTÊNCIA DE NOTAÇÃO MATEMÁTICA (FUNDAMENTAÇÃO TEÓRICA):
   - Formalize o algoritmo PageRank no início da Seção 1.3.2.1, garantindo que ele seja teoricamente apresentado antes de sua utilização metodológica.

2. REORGANIZAÇÃO E COMPLEMENTAÇÃO DA METODOLOGIA (CAPÍTULO 2):
   - Na abertura da Metodologia, insira uma visão geral/diagrama da arquitetura preditiva proposta antes de descrever os detalhes de implementação de software (DuckDB e Apache Parquet).
   - Na Seção 2.1 (Base de Dados), inclua um parágrafo de reflexão metodológica sobre o uso de dados sintéticos (AMLworld), destacando suas vantagens para rotulagem confiável e sigilo bancário, mas discutindo os desafios de generalização para ambientes financeiros reais.
   - Adicione a explicação teórica da validação cruzada temporal (Forward-Chaining) no Referencial Teórico (Capítulo 1) e especifique na Seção 2.4.1 a composição exata das janelas históricas de treinamento do XGBoost.
   - Na Seção 2.5, forneça a lista completa das 21 variáveis comportamentais e financeiras do Modelo Base (seja em texto, tabela ou anexo).
   - Adicione o link direto para o repositório do projeto no GitHub.

3. REVISÃO DO CAPÍTULO DE RESULTADOS E DISCUSSÃO (CAPÍTULO 3):
   - Na Tabela 2 e no texto correspondente, esclareça se as métricas consolidadas representam a média simples ou média ponderada das janelas temporais de teste.
   - Ajuste o tom das afirmações diretas: substitua termos categóricos como "é" por expressões acadêmicas mais cautelosas, como "parece ser" ou "indica tendência de".
   - Na discussão sobre atributos, adicione uma nota justificando a presença de transações via cheque no dataset (instrumento comum na economia americana simulada pelo AMLworld).
   - Na Seção 3.3.1 e na Conclusão, liste explicitamente quais foram os principais atributos topológicos que geraram o ganho discriminativo (ex: HITS, in-degree, modularidade de comunidades) e restrinja as generalizações aos modelos de Gradient Boosting avaliados.

4. ELEMENTOS PÓS-TEXTUAIS:
   - Adicione a subseção padronizada "Uso de IA" com a seguinte redação:
     "A ferramenta [nome da ferramenta], baseada em Inteligência Artificial, foi utilizada neste trabalho para [finalidade de uso, ex: suporte à revisão textual e formatação de código]. O conteúdo final foi produzido de maneira autoral, com curadoria crítica, sendo o resultado final de inteira responsabilidade dos autores."

Execute as alterações no documento mantendo a compilação limpa no LaTeX sem erros de sintaxe ou referências quebradas (`\ref{}`).