

##Projeto Rede Linux
###### Projeto para disciplina Laboratório de programação 2, USP
###### Grupo: Bandeco
###### Autores: Amadeu Shigeo, Carybé Gonçalves, Caio Dadauto, Gustavo Covas, Lucas Helfstein


###Como instalar o ambiente DEV, testes e Produção


Para baixar o ruby e o rails nas versões mais novas e estáveis (2.2.1 e 4.2.4, respectivamente):
```
 curl -L https://get.rvm.io | bash -s stable --autolibs=enabled --ruby --rails
```

Para usar a versão instalada do Ruby, caso o rvm não a tenha definido corretamente:
```
rvm use 2.2.1
```

Baixe o projeto:
```
git clone https://github.com/Bandeco-IME/Rede-Linux.git
```

Para subir o servidor:
```
cd Rede-Linux/

bundle install

rails server -db 0.0.0.0 -p 80 
```

### Rspec
Para rodar o rspec faça:
``` ruby
bundle exec rspec
```

Como concordamos em usar as ultimas versões, o Rspec utilizado é o 3.3.0, o qual possui uma syntax bem diferente
das versões < 3, que a apresentada no livro. Por isso, encontrei as diferenças de syntax
[aqui](http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/) e
[aqui](http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/). O grosso sobre o funcionamento
foi pelo livro mesmo.

