# README

* RUBY_VERSION="2.4.0"
* RAILS_VERSION="5.0.2"
* MYSQL_PASSWORD="123456"

# task-manager-api

* Host:
127.0.1.1	api.task-manager.dev

* endpoint para criar login (POST)
- Content-Type : application/json
- Accept : application/vnd.task-manager.v1
- http://api.task-manager.dev:3000/users

- JSON: 
{ "user":{ "email": "joao@mail.com", "password": "123456" } }