# Задание
Реализация GFS2 хранилища на виртуалках

# Подготовка
1. Требуется коллекция ansible: community.general >= 7.3.0
2. В каталоге ansible создать файл ```aws_credentials.conf``` с параметрами доступа к API облака Крок:
```
[default]
aws_access_key_id = <access key>
aws_secret_access_key = <secret key>
```
3. В каталоге terraform создать файл ```cc.auto.tfvars``` с параметрами доступа к API облака Крок:
```
cc_access_key = "<access key>"
cc_secret_key = "<secret key>"
```
# Запуск
```terraform apply```

Дождаться запуска вм.

```ansible-playbook setup.yaml```
