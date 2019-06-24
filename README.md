# README

* RUBY_VERSION="2.5.1"
* RAILS_VERSION="5.0.7"
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

{"task": {"title": "Arrumar a casa","description": "ja viu ne","deadline": "2019-06-30 18:00:00","done": "false"}}