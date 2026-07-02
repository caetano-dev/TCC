corrigir numeros da tabela HI medium para serem os mesmos da imagem

O Mistério do "Two-Stage Cascade": Na Introdução e no título da Seção 3.4, você cita uma arquitetura em cascata de dois estágios para mitigar falsos positivos. No entanto, o texto da Seção 3.4 e 3.5 pula direto para a validação temporal e treino do XGBoost puro. Falta explicar: O que acontece no primeiro estágio? O estágio 1 filtra os dados para o estágio 2? Explique como os dois estágios se comunicam.  

O algoritmo SHAP-RFE sumiu da Metodologia: O objetivo específico 5 cita uma otimização por eliminação recursiva de atributos guiada por SHAP (SHAP-RFE). A conclusão também diz que você reduziu o conjunto de features de 49 para 43 atributos no HI Small. No entanto, no Capítulo 3 (Metodologia), você não descreveu em momento algum como esse algoritmo de poda foi implementado, quais critérios de colinearidade usou e em qual etapa ele roda. Crie uma subseção para detalhar o funcionamento desse pipeline de seleção de atributos.  

adicionar citações
