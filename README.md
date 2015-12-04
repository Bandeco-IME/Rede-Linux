

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
    
Não se esqueça de atualizar o crontab do servidor, para que a tarefa Rake de atualizar os status das impressoras execute corretamente (veja os detalhes de como ela faz isso abaixo):    
```
whenever -w
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

### Cucumber
Para rodar os testes Cucumber:
``` 
bundle exec cucumber
```

### Status das impressoras
Temos uma tarefa Rake responsável pela atualização dos status das impressoras. Você pode, por exemplo, atualizar o status da impressora Euclides fazendo:
``` 
rake printers:update_euclides_status
```    
O código executará o método update_status no objeto da classe Printer correspondente à euclides. Primeiramente, update_status verifica se a impressora está aceitando trabalhos, conforme seu status no servidor CUPS, usando a gem cupsffi. Em caso positivo, o método visita a página de status da impressora e verifica se há alguma mensagem de erro. Note que cada impressora possui uma interface diferente em sua página de status, então não há realmente uma maneira DRY para isso. Assim, é necessário que a task forneça código com métodos do Capybara ao método update_status, para que a página de erro seja processada corretamente. Finalmente, o campo status da entrada "Euclides" da tabela printers é atualizado.
Todo o processo descrito é automatizado via crontab, usando a gem wheneverize, cujo arquivo de configuração é config/schedule.rb.
