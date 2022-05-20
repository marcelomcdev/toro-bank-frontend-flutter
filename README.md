# Toro Bank - Frontend (Flutter)

O projeto do frontend foi desenvolvido em Flutter e linguagem Dart e comunica-se com a api Toro-Bank-Backend.
Como arquitetura, adotei o Clean Architecture para esta aplicação, com o fim de manter as funcionalidades o mais possivelmente desacopladas, a fim de torná-las testáveis.

Para execução deste projeto, são necessárias algumas dependências, que estão declaradas no arquivo **pubspec.yaml**:

**Intl** - Necessário para formatação dos valores *double* para *currency*.

**Dartz** - Usado para manipular a classe Either que é usada nos testes unitários.

**Dio** - Usado para requisições HTTP para comunicação com a api do Backend.

**Flutter Modular**

**Page Transition** - para aplicar efeitos de transição nas páginas.

**Lottie** - para aplicar animações em algumas telas.


# Instalação das Dependências
Para instalar as dependências do projeto, no terminal digite o comando:

```
pub get
```

# Executar a aplicação
Para executar a aplicação, execute o comando:
```
flutter run
```
Caso ocorra algum exceção de segurança nula, será necessário desabilitar, usando o seguinte comando:

```
flutter run --no-sound-null-safety
```



# Testes Unitários
Os testes unitários utilizam a biblioteca **Mocktail**.

Para executar os testes, execute o comando abaixo:

```
flutter test
```
ou 
```
flutter test --no-sound-null-safety
```

Pode-se também utilizar o Code Lens dentro do **Visual Studio Code** para execução dos testes unitários.
![image](https://user-images.githubusercontent.com/79017725/169449271-b4ddf17a-84f8-4964-aa8d-d46f0e533b91.png)

