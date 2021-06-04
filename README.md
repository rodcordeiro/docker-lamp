# Creating a LAMP With Docker

## Dockerfile
 Primeiro, vamos criar o Dockerfile com o conteúdo abaixo:
```dockerfile
FROM php:7.3-apache
RUN a2enmod rewrite
RUN docker-php-ext-install mysqli
```
 - Na primeira linha, dizemos ao Docker que usaremos como base a imagem php:7.3-apache.
 - Na segunda linha, permitimos o modrewrite para os arquivos .htaccess . Isso será útil caso você precise fazer algum redirecionamento ou precisar manipular a URL do seu site.
 - Na terceira linha, executamos a instalação e habilitamos o mysqli para manipulação do banco de dados.

## Docker-compose
 Vamos ao arquivo do docker-compose:
```yaml
version: "3.1"
services:
    www:
        build: .
        ports:
            - "8001:80"
        volumes:
            - ./:/var/www/html/
        links:
            - db
        networks:
            - default
    db:
        image: mysql:8.0
        ports:
            - "3306:3306"
        command: --default-authentication-plugin=mysql_native_password
        environment:
            MYSQL_DATABASE: meubanco
            MYSQL_USER: admin
            MYSQL_PASSWORD: admin
            MYSQL_ROOT_PASSWORD: root
        volumes:
            - ./mysql:/docker-entrypoint-initdb.d
            - ./mysql/config:/etc/mysql/conf.d
            - persistent:/var/lib/mysql
        networks:
            - default
    phpmyadmin:
        image: phpmyadmin/phpmyadmin
        links:
            - db:db
        ports:
            - 8000:80
        environment:
            MYSQL_USER: admin
            MYSQL_PASSWORD: admin
            MYSQL_ROOT_PASSWORD: root
        volumes:
        persistent:
```
- ports: diz que a porta 8001 do host (sua máquina) é vinculada a porta 80 do container.
volumes: indica que a pasta raíz do seu projeto, que está no host, estará vinculada a pasta /var/www/html/ do container.
links: indica que www depende de db e, por isso, db será iniciado primeiro.
### Reference
[https://medium.com/comunidade-vale-livre/criando-uma-imagem-lamp-no-docker-be74536866a9](https://medium.com/comunidade-vale-livre/criando-uma-imagem-lamp-no-docker-be74536866a9)
