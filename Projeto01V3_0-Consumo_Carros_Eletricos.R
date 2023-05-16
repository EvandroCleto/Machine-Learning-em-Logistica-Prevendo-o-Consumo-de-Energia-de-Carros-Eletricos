# Data Science Academy - Formação Cientista de Dados

# Autor: Evandro Eulálio Cleto

# Data Início:      28/03/2023
# Data Finalização: 13/04/2023
#________________________________________________________________________________________________________________________________________________________________
# Big Data Analytics com R e Microsoft Azure Machine Learning Versão 3.0
# Projeto com Feedback 1
# Machine Learning em Logística - Prevendo o Consumo de Energia de Carros Elétricos
#________________________________________________________________________________________________________________________________________________________________
#_________________________________________________________________________________________________________________________________________________________________
# Objetivo deste projeto = Prever o Consumo de Energia de Carros Elétricos

# Tipo de Aprendizado a ser utilizado = Supervisionado para Regressão

# Variável target = mean - Energy consumption [kWh/100 km] ou Energy_consumption após pre-processamento

# Matrica a ser alcançada = 80%
#_________________________________________________________________________________________________________________________________________________________________
#_________________________________________________________________________________________________________________________________________________________________
# Algoritimos de Regressão a serem utilizados no projeto para criação dos modelos e avaliação
### 1) Regressão Linear(Benchmark);
### 2) Decision Tree;
### 3) SVM.

#----------------------------------------------------------------- Dicionário de dados --------------------------------------------------------------------------|
#----------------------------------------------------------------------------------------------------------------------------------------------------------------|
# Variável Original                        |  Nova variável       | Descrição: 		    | Classes:              	   | Descrição Classes:	           | Nova Classe:|
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 1- Car full name                         |Car_name              |- Nome do veiculo  |                            |                               |             |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 2- Make	                                 |Make                  |- Fabricante       |                            |                               |             |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 3- Model                                 |Model                 |- Modelo           |                            |                               |             |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 4- Minimal price (gross) [PLN]           |Minimal_price         |- Preço Mínimo	    |                            |                               |             |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 5- Engine power [KM]                     |Engine_power          |- Potência 	      |                            |                               |             |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 6- Maximum torque [Nm]                   |Maximum_torque        |- Torque Máximo	  |                            |                               |             |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 7- Type of brakes	                       |Type_brakes           |- Tipo Freio       | disc (front + rear)        | Disco Frente e Traseira	     | 1           |
#                                          |                      |                   | disc (front) + drum (rear) | Disco Frente e Tambor Traseira| 2           |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 8- Drive type                            |Drive_type            |- Tração           | 4WD                        | 4 Rodas                       | 3           |
#                                          |                      |                   | 2WD (front)                | Rodas Dianteiras              | 1           |
#                                          |                      |                   | 2WD (rear)                 | Rodas Traseiras               | 2           |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 9- Battery capacity [kWh]	               |Battery_capacity      |- Capacidade Bateria                                                            |             |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 10-Range (WLTP) [km]                     |Range_WLTP            |- WLTP(Worldwide Harmonised Light Vehicle Test Procedure) = Mede o alcance      |             |
#                                          |  				            |  de um carro viajando a uma velocidade média de 47 km/h em temperaturas        |             |
#								                    		   |  				            |	de verão de 100% a 0% do estado de carga.	                                     |             |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 11-Wheelbase [cm]	                       |Wheelbase             |- Distäncia entre eixos                                                         |             |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 12-Length [cm]                           |Length                |- Comprimento 	                                                                 |             |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 13-Width [cm]	                           |Width           		  |- Largura                                                                       |             |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 14-Height [kg]                           |Height		            |- Peso	                                                                         |             |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 15-Minimal empty weight [kg]             |Minimal_empty_weight  |- Peso Mínimo Vazio  	                                                         |             |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 16-Permissable gross weight[kg]          |Permissable_weight 	  |- Peso bruto(Máximo)	                                                           |             |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 17-Maximum load capacity [kg]	           |Maximum_load 	    	  |- Carga Máxima                                                                  |             |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 18-Number of seats                       |Number_seats 	    	  |- Lugares	                                                                     |2,4,5,7 e 8  |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 19-Number of doors                       |Number_doors    		  |- Número de Portas	                                                             |3,4 e 5      |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 20-Tire size [in]	                       |Tire_size		          |- Aro Roda                                                    |14, 15, 16, 17, 18, 19, 20 e 21|
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 21-Maximum speed [kph]                   |Maximum_speed    		  |- Velocidade Máxima                                                             |             |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 22-Boot capacity (VDA) [l]               |Boot_capacity_VDA  	  |- Volume Porta Mala                                                             |             |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 23-Acceleration 0-100 kph [s]	           |Acceleratio 	    	  |- Aceleração                                                                    |             |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 24-Maximum DC charging power [kW]	       |Maximum_DC            |- Potência máxima de carregamento DC                                            |             |
#------------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
# 25-mean - Energy consumption [kWh/100 km]|Energy_consumption    |- Consumo de Energia <- Variável Alvo                                           |             |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 26-Type_brakes_fac                       |Type_brakes_fac       |- Variável Type_brakes transformada em fator(vide campo Classe da Variável Type_brakes)       |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 27-Type_brakes_fac                       |Drive_type_fac        |- Variável Drive_type_fac transformada em fator(vide campo Classe da Variável Drive_type_fac) |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 28-Number_seats_fac                      |Number_seats_fac      |- Variável Type_brakes transformada em fator(vide campo Classe da Variável Drive_type_fac)    |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 29-Number_doors_fac                      |Number_doors_fac      |- Variável Number_doors transformada em fator(vide campo Classe da Variável Drive_type_fac)   |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
# 30-Tire_size_fac                         |Tire_size_fac         |- Variável Tire_size transformada em fator(vide campo Classe da Variável Drive_type_fac)      |
#--------------------------------------------------------------------------------------------------------------------------------------------------|-------------|

# Configuração do diretório de trabalho,
setwd("D:/Cursos/Curso_FCD/1-BigDataRAzure/Arquivos/Cap22/Projeto01_V_3")
getwd()

# Importa Bibliotecas.
#Scatterplot Matrix
install.packages('psych')
install.packages('ggplot2')
install.packages('car')
install.packages('bruceR')
library(psych)
library(readxl)
library('dplyr')
require(randomForest)
require(lattice)
library(ggplot2)
library(writexl)
library(stats)
library(tidyverse)
library(car)
library(caTools)
library(bruceR)
library(caret)
search()

### 1) Efetua o carregamento da Planilha Original.
planilha_original <- read_excel('dados/FEV-data-Excel.xlsx', sheet = 'Auta elektryczne')

# Visualiza Data Frame criado na importação.
View(planilha_original)

### 2) Análise Exploratória: e Limpeza dos dados:

# Cria um novo Dataframe p/ preservar o original e dar sequência na manipulação dos dados. 
dados <- planilha_original

# Visualiza Data Frame criado na importação.
View(dados)

# Exibe resumo da estrutura dos Dados.
str(dados)

# Exibe a dimensão dos dados.
dim(dados)

# Exibe as Classes.
class(dados)

# Altera nome das colunas com nomes amigáveis.
colnames(dados)<-c('Car_name', 
                   'Make', 
                   'Model', 
                   'Minimal_price', 
                   'Engine_power',	
                   'Maximum_torque', 
                   'Type_brakes', 
                   'Drive_type', 
                   'Battery_capacity', 
                   'Range_WLTP', 
                   'Wheelbase', 
                   'Length', 
                   'Width',	 
                   'Height', 
                   'Minimal_empty_weight', 
                   'Permissable_weight', 
                   'Maximum_load', 
                   'Number_seats', 
                   'Number_doors', 
                   'Tire_size', 
                   'Maximum_speed', 
                   'Boot_capacity_VDA', 
                   'Acceleration', 
                   'Maximum_DC', 
                   'Energy_consumption')

# Exibe o sumários dos dados.
summary(dados)
# Existe algumas variáveis que estão com média e mediana com muita diferença e deverão ser analisadas.
# Ex: Minimal_price, Engine_power, Maximum_torque, Battery_capacity, etc.          

# Checa dados missing(NAs):
colSums(is.na(dados)) 
# Existem dados missing nas colunas abaixo e deverão ser tratados:
## Type_brakes        = 1 registro;
## Boot_capacity_VDA  = 1 registro;
## Maximum_load       = 8 registros;
## Energy_consumption = 9 registros;
## Acceleration       = 3 registros;
## Permissable_weight = 8 registros.

# Função para Substituir NAs pela média:
substituir_na_pela_media <- function(df, coluna) {
  # Seleciona a coluna.
  coluna_selecionada <- df[[coluna]]
  
  # Calcula a média da coluna.
  media <- round(mean(coluna_selecionada, na.rm = TRUE))
  
  # Identifica quais valores são NA.
  valores_ausentes <- is.na(coluna_selecionada)
  
  # Substitui os valores NA pela média.
  coluna_selecionada[valores_ausentes] <- media
  
  # Atribui a coluna atualizada de volta ao data frame.
  df[[coluna]] <- coluna_selecionada
  
  # Retorna o data frame com os valores NAs substituídos pela média.
  return(df)
}

# Aplica a substituição dos valores NAs pela média.
dados <- substituir_na_pela_media(dados, "Boot_capacity_VDA")
dados <- substituir_na_pela_media(dados, "Maximum_load")
dados <- substituir_na_pela_media(dados, "Energy_consumption")
dados <- substituir_na_pela_media(dados, "Acceleration")
dados <- substituir_na_pela_media(dados, "Permissable_weight")
colSums(is.na(dados)) 

# Remove linha que contém o registro NA na coluna Type_brakes, pois como se trata de uma coluna fator, não 
# se tem como determinar seu valor.
dados <- na.omit(dados)
colSums(is.na(dados))
# Exibe a dimensão dos dados.
dim(dados)
# Obs: Optei por tratar os valores NAs para fins de aplicação das técnicas aprendidas durante o FCD, mas seria possível também 
# substituir os valores NAs pelos valores dos respectivos modelos de veículos, obtendo estes valores no site do fabricante, por exemplo.

### 3) Pré Processamento:

# Cria uma numeração sequêncial para identificar os modelos de veículos para facilitar a busca(Indexação).
dados$carId <- seq(from = 1, to = nrow(dados))

# Realiza o encoding das variáveis Type_brakes e Drive_type, as transforma em fator e cria as varíáveis 
# Type_brakes_fac, Drive_type_fac,Number_seats, Number_doors e Tire_size.
dados$Type_brakes_fac <- factor(dados$Type_brakes, labels = c('1','2'))
dados$Drive_type_fac <- factor(dados$Drive_type, labels = c('1','2','3'))
dados$Number_seats_fac <- factor(dados$Number_seats, labels = c('2','4','5','7','8'))
dados$Number_doors_fac  <- factor(dados$Number_doors, labels = c('3','4','5'))
dados$Tire_size_fac <- factor(dados$Tire_size, labels = c('14', '15', '16', '17', '18', '19', '20', '21'))

#Transforma as variáveis fator para numérico para fins de criação dos modelos
dados$Type_brakes_fac <- as.numeric(ordered(dados$Type_brakes_fac, levels = c('1','2')))
dados$Drive_type_fac <- as.numeric(ordered(dados$Drive_type_fac, levels =  c('1','2','3')))
dados$Number_seats_fac <- as.numeric(ordered(dados$Number_seats_fac, levels =  c('2','4','5','7','8')))
dados$Number_doors_fac <- as.numeric(ordered(dados$Number_doors_fac, levels =  c('3','4','5')))
dados$Tire_size_fac <- as.numeric(ordered(dados$Tire_size_fac, levels =   c('14', '15', '16', '17', '18', '19', '20', '21')))

# Neste ponto poderia optar por transformar as variáveis acima em Dummies, mas optei por não fazer pois corro o risco de ter tantas 
# variáveis, quanto observações impactando negativamente na generalização do modelo.

# Visualiza Data Frame criado na importação.
View(dados)
str(dados)

#write_xlsx(dados, "dados.xlsx")

### 4) Análise Estatistica

# Features Selection - Explorando relacionamento entre as variávies numéricas através de Matriz de Correlação.
cor(dados[c('Minimal_price', 'Engine_power', 'Maximum_torque', 'Battery_capacity', 'Range_WLTP', 'Wheelbase', 'Length', 'Width', 'Height',
            'Minimal_empty_weight', 'Permissable_weight', 'Maximum_load', 'Maximum_speed', 'Boot_capacity_VDA', 'Acceleration', 
            'Energy_consumption','Type_brakes_fac', 'Drive_type_fac', 'Number_seats_fac', 'Number_doors_fac','Tire_size_fac')])

# Este gráfico fornece mais informações sobre o relacionamento entre variáveis.
pairs.panels(dados[c('Minimal_price', 'Engine_power', 'Maximum_torque', 'Battery_capacity', 'Range_WLTP', 'Wheelbase', 'Length', 'Width', 'Height',
                        'Minimal_empty_weight', 'Permissable_weight', 'Maximum_load', 'Maximum_speed', 
                        'Boot_capacity_VDA', 'Acceleration', 'Type_brakes_fac', 'Drive_type_fac', 'Number_seats_fac', 
                        'Number_doors_fac','Tire_size_fac')])

# Na análise de correlação, foi decidido retirar a variável Engine_power, devido à alta correlação com Minimal_price(0,90), com Maximum_torque(0,96) e com Maximum_speed(0,94), 
# a variável Minimal_empty_weight devido à alta correlação com Battery_capacity e Length devido à alta correlação com Wheelbase(0,92).
pairs.panels(dados[c('Minimal_price', 'Maximum_torque', 'Battery_capacity', 'Range_WLTP', 'Wheelbase', 'Width', 'Height', 'Permissable_weight', 'Maximum_load', 
                     'Maximum_speed', 'Boot_capacity_VDA', 'Acceleration', 'Type_brakes_fac', 'Drive_type_fac', 'Number_seats_fac', 
                     'Number_doors_fac','Tire_size_fac')])

### 5) Feature Selection
# Usando Random Forest para criar um modelo para identificar os atributos com maior importância para o modelo preditivo.
# Nessa análise inicial foi retirada as variávies com alta correlação, conforme descrito acima, as varíaveis subistituidas pelas variáveis fatoradas e as variáveis caracter. 
modelo <- randomForest(Energy_consumption ~ .
                       - Engine_power
                       - Maximum_torque
                       - Minimal_empty_weight
                       - Length
                       - Car_name
                       - Make
                       - Model
                       - Type_brakes
                       - Drive_type
                       - Number_seats
                       - Number_doors
                       - Tire_size, 
                       data = dados, 
                       ntree = 100, 
                       nodesize = 10,
                       importance = TRUE)# importance = TRUE indica ao algoritimo que identifique as variávies mais importantes.

# Plotando as variáveis por grau de importância.
varImpPlot(modelo)
# Analisando o modelo pela métrica IncMSE, poderia ter optado por deixar apenas as variáveis com  IncMSE >= 3, porém chamou atenção a variável
# Maximum_speed que é uma varíavel que sabidamente afeta o consumo do veículo.
# Desta forma vou optar por deixar esta variável no Benchmark e caso o modelo não tenha boa performance será retirada e executada nova análise.

# Variáveis selecionadas: Maximum_load, Permissable_weight, Wheelbase, Boot_capacity_VDA, Maximum_speed, Width e Acceleration.

# Cria um novo dataset com as variáveis selecionadas.
dados_modelo <- dados[, c('Maximum_load', 'Permissable_weight', 'Wheelbase', 'Boot_capacity_VDA', 'Maximum_speed', 'Width', 'Acceleration','Energy_consumption')]
View(dados_modelo)

#Salva o novo dataset em Excel 
# write_xlsx(dados_modelo, "dados_modelo.xlsx")
# dados_modelo <- read_excel('dados_modelo.xlsx', sheet = 'Sheet1')

# Criação dos Boxplots das variáveis antes da remoção dos outliers.
boxplot(dados_modelo$Maximum_load, main = 'Boxplot Maximum_Load', ylab = 'Em kg') 
boxplot(dados_modelo$Permissable_weight, main = 'Boxplot Permissable_weight', ylab = 'Peso Bruto maximo') 
boxplot(dados_modelo$Wheelbase, main = 'Boxplot Wheelbase', ylab = 'Em cm')
boxplot(dados_modelo$Boot_capacity_VDA, main = 'Boxplot Boot_capacity_VDA', ylab = 'Em VDA')
boxplot(dados_modelo$Maximum_speed, main = 'Boxplot Maximum_speed', ylab = 'Em kph')
boxplot(dados_modelo$Width, main = 'Boxplot Width', ylab = 'Em cm')
boxplot(dados_modelo$Acceleration, main = 'Boxplot Acceleration', ylab = 'Em kph') 

# Após análise dos boxplots foi verificado que será necessário tratar outliers das variáveis Maximum_load, Width, Wheelbase.

# Função para remover outliers com menos 3 desvios padrão ou mais de 3 desvios padrão do dataset:
remove_outliers <- function(data, variable_name) {
  variable <- data[[variable_name]]
  Q1 <- quantile(variable, .25)
  Q3 <- quantile(variable, .75)
  IQR <- IQR(variable)
  
  # Identifica as linhas que contêm outliers.
  outliers <- which(variable < (Q1 -1.5*IQR) | variable > (Q3 + 1.5*IQR))
  
  # Remove as linhas com outliers do dataframe.
  data_clean <- data[-outliers, ]
  
  # Imprime mensagem com o número de linhas removidas.
  cat(paste("Foram removidas", length(outliers), "linhas contendo outliers de", nrow(data), "no total.\n"))
  
  # Retorna o dataframe sem as linhas com outliers.
  return(data_clean)
}

# Executa a função para remover outliers:
dados_modelo <- remove_outliers(dados_modelo, "Maximum_load")
dados_modelo <- remove_outliers(dados_modelo, "Width")
#dados_modelo <- remove_outliers(dados_modelo, "Wheelbase")
# Para cada remoção de outliers foi gerado novos Boxplots de todas as variáveis para validação da remoção dos outliers da variável em questão, bem como, avaliar impacto nas demais variáveis.
# Não será executada a função remove_outliers(dados_modelo, "Wheelbase") pois quando executa a remove_outliers(dados_modelo, "Maximum_load") remove 
# tambem os outliers de Wheelbase.

# Geração dos Boxplots das variáveis após da remoção dos outliers.
boxplot(dados_modelo$Maximum_load, main = 'Boxplot Maximum_Load', ylab = 'Em kg') 
boxplot(dados_modelo$Permissable_weight, main = 'Boxplot Permissable_weight', ylab = 'Peso Bruto maximo') 
boxplot(dados_modelo$Wheelbase, main = 'Boxplot Wheelbase', ylab = 'Em cm')
boxplot(dados_modelo$Boot_capacity_VDA, main = 'Boxplot Boot_capacity_VDA', ylab = 'Em VDA')
boxplot(dados_modelo$Maximum_speed, main = 'Boxplot Maximum_speed', ylab = 'Em kph')
boxplot(dados_modelo$Width, main = 'Boxplot Width', ylab = 'Em cm')
boxplot(dados_modelo$Acceleration, main = 'Boxplot Acceleration', ylab = 'Em kph')

# Criação dos Histogramas das variáveis. 
hist(dados_modelo$Maximum_load, main = 'Histograma Maximum_Load', yxab = 'Em kg') 
hist(dados_modelo$Permissable_weight, main = 'Histograma Permissable_weight', yxab = 'Peso Bruto maximo') 
hist(dados_modelo$Wheelbase, main = 'Histograma Wheelbase', yxab = 'Em cm')
hist(dados_modelo$Boot_capacity_VDA, main = 'Histograma Boot_capacity_VDA', yxab = 'Em VDA')
hist(dados_modelo$Maximum_speed, main = 'Histograma Maximum_speed', yxab = 'Em kph')
hist(dados_modelo$Width, main = 'Histograma Width', yxab = 'Em cm') 
hist(dados_modelo$Acceleration, main = 'Histograma Acceleration', yxab = 'Em kph') 

# Na análise dos histogramas, foi Verificado que nenhuma variável segue uma distribuição normal e para a validação desta suposição, será gerado o qqplot das variáveis e 
# aplicado o teste Shapiro-Wilk.
# Teste da distribuição Normal de variáveis:
qqPlot(dados_modelo$Maximum_load) 
# Variável Maximum_load -> Possui pontos pontos fora da área sombreada, logo parece não seguir uma dstribuição normal.
qqPlot(dados_modelo$Permissable_weight) 
# Variável Permissable_weight -> Possui pontos pontos fora da área sombreada, logo parece não seguir uma distribuição normal.
qqPlot(dados_modelo$Wheelbase)
# Variável Wheelbase -> Possui pontos pontos fora da área sombreada, logo parece não seguir uma distribuição normal.
qqPlot(dados_modelo$Boot_capacity_VDA)
# Variável Boot_capacity_VDA -> Não possui pontos pontos fora da área sombreada, logo parece seguir uma distribuição normal.
qqPlot(dados_modelo$Maximum_speed)
# Variável Maximum_speed -> Possui pontos pontos fora da área sombreada, logo parece não seguir uma distribuição normal.
qqPlot(dados_modelo$Width) 
# Variável Width -> Possui pontos pontos fora da área sombreada, logo parece não seguir uma distribuição normal.
qqPlot(dados_modelo$Acceleration) 
# Variável Acceleration -> Não possui pontos pontos fora da área sombreada, logo parece seguir uma distribuição normal.

# Validando a Suposição de Distribuição Normal com teste de normalidade shapiro.test():
# Para dizer que uma distribuição é normal, o valor-p precisa ser maior do que 0,05.
# H0 = Os dados seguem uma distribuição normal.

shapiro.test(dados_modelo$Maximum_load)
# p-value = 0.06795 
# Como p-value 0.06795 é maior que 0.05 poderia Falhar em Rejeitar H0.
# Devido a difereça ser muito pequena e no qqPlot demonstrou haver pontos fora da área sombreada, vou optar em Rejeitar H0 e 
# aplicar a padronização nesta variável.  
shapiro.test(dados_modelo$Permissable_weight) 
# p-value = 0.003847 < 0.05. 
# H0 rejeitada. Será aplicada a padronização nesta variável.  
shapiro.test(dados_modelo$Wheelbase)
# p-value = 0.002378 < 0.05. 
# H0 rejeitada. Será aplicada a padronização nesta variável.  
shapiro.test(dados_modelo$Boot_capacity_VDA)
#  p-value = 0.009571 < 0.05. 
# H0 rejeitada. Será aplicada a padronização nesta variável. 
shapiro.test(dados_modelo$Maximum_speed)
# p-value = 6.337e-05 < 0.05. 
# H0 rejeitada. Será aplicada a padronização nesta variável. 
shapiro.test(dados_modelo$Width) 
# p-value = 0.01301 < 0.05. 
# H0 rejeitada. Será aplicada a padronização nesta variável. 
shapiro.test(dados_modelo$Acceleration)
# p-value = 0.3512 > 0.05. 
# Falha em rejeitar H0. A padronização não será necessária nesta variável. 

dados_padronizdos <- dados_modelo[, c('Maximum_load', 'Permissable_weight', 'Wheelbase', 'Boot_capacity_VDA', 'Maximum_speed', 'Width')]
View(dados_padronizdos)

# Padronização do z-score Usando a função scale():
dados_padronizdos <- as.data.frame(scale(dados_padronizdos))
View(dados_padronizdos)

# Volta as variáveis Acceleration e Energy_consumption para do dataframe:
dados_padronizdos$Acceleration <- dados_modelo$Acceleration
dados_padronizdos$Energy_consumption <- dados_modelo$Energy_consumption
summary(dados_padronizdos)

# Normalização das variáveis Acceleration e Energy_consumption:
dados_padronizdos$Acceleration <- scaler(dados_padronizdos$Acceleration, min = 0.01, max = 1)
dados_padronizdos$Energy_consumption <- scaler(dados_padronizdos$Energy_consumption, min = 0.01, max = 1)

# Salvo dataframe
# write_xlsx(dados_padronizdos, "dados_padronizdos.xlsx")

#Transforma os dataframe:
df_padNorm <- dados_padronizdos

# Salvo dataframe
# write_xlsx(df_padNorm, "df_padNorm.xlsx")
# df_padNorm <- read_excel('df_padNorm.xlsx', sheet = 'Sheet1')

# Divisão treino teste:

split = sample.split(df_padNorm$Energy_consumption, SplitRatio = 0.70)

dados_treino = subset(df_padNorm, split == TRUE)
dados_teste = subset(df_padNorm, split == FALSE)

# Visualiza dados de treino e teste:
View(dados_treino)
View(dados_teste)

# Salvo dados de treino e teste:
#write_xlsx(dados_treino, "dados_treino.xlsx")
#write_xlsx(dados_teste, "dados_teste.xlsx")

#dados_treino <- read_excel('dados_treino.xlsx', sheet = 'Sheet1')
#dados_teste <- read_excel('dados_teste.xlsx', sheet = 'Sheet1')

### 6)  Criação dos Modelos:
### 6.1) Modelo Benchmark Regressão LInear. 
modelo_Regessao <- lm(Energy_consumption ~ ., data = dados_treino)
modelo_Regessao

### 6.1.1) Fazendo as previsões:
pred_Regressao <- predict(modelo_Regessao,dados_teste)
View(pred_Regressao)
#Plot.
plot(dados_teste$Energy_consumption, pred_Regressao)

### 6.1.2)  Avaliação do modelo de Regressão:
summary(modelo_Regessao)
# Multiple R-squared:   0.7945	
# Adjusted R-squared:   0.737 
# Residual standard error: 0.1173 

### 6.2) Modelo Random Forest usando o pacote Caret:
modelo_RF <- train(Energy_consumption ~ .,data = dados_treino, method ='rf')

### 6.2.1) Fazendo as previsões:
pred_RF <- predict(modelo_RF,dados_teste)
View(modelo_RF)
plot(dados_teste$Energy_consumption, pred_RF)

### 6.2.2)  Avaliação do modelo Random Forest:
postResample(pred = pred_RF, obs = dados_teste$Energy_consumption)
# Rsquared: 0.7241112 
# RMSE: 0.1815963 
# MAE: 0.1192776   

### 6.3) Modelo SVM with Linear Kernel usando o pacote Caret:
modelo_SVM <- train(Energy_consumption ~ .,data = dados_treino, method ='svmLinear3')

### 6.3.1) Fazendo as previsões:
pred_SVM <- predict(modelo_SVM,dados_teste)
View(modelo_SVM)
plot(dados_teste$Energy_consumption, pred_SVM)

### 6.3.2)  Avaliação do modelo SVM:
postResample(pred = pred_SVM, obs = dados_teste$Energy_consumption)
# Rsquared: 0.5647205 
# RMSE: 0.2216713  
# MAE: 0.1497117   

### 7) Otimização do modelo SVM com Linear Kernel usando o pacote Caret com Tunning Parameters:
### 7.1) 
modelo_SVM_V1 <- train(Energy_consumption ~ .,data = dados_treino, method ='svmLinear3',
                       trControl = trainControl(method = "cv", number = 10),
                       tuneGrid = expand.grid(cost = c(0.1, 1, 10),
                                              Loss = c("epsilonInsensitive", "epsilonSensitive")))

### 7.1.2) Fazendo as previsões:
pred_SVM_1 <- predict(modelo_SVM_V1,dados_teste)
View(modelo_SVM_V1)
plot(dados_teste$Energy_consumption, pred_SVM_1)

### 7.1.3)  Avaliação do modelo SVM:
postResample(pred = pred_SVM_1, obs = dados_teste$Energy_consumption)
# Rsquared: 0.6274227  
# RMSE: 0.2048517  
# MAE: 0.1355462   

### 8) Avaliação Final
# Foram construídas 4 versões de modelos preditivos usando diferentes abordagens. 
# Na avaliação, o modelo que apresentou melhor performace foi o modelo de Benchmark(usando Regressão LInear) com Rsquared 0.7945 que praticamente 
# atingiu métrica definida no início do projeto(80%).
# O modelo Random Forest também apresentou um Rsquared interessante, mas abaixo do modelo de Benchmark.
# Já o modelo SVM, mesmo com otimização de parâmetros não apresentou um desempenho satisfatório.
# Todos os modelos tem espaço para melhorias, seja no pré-processamento de dados ou na otimização de hiperparâmetros.



