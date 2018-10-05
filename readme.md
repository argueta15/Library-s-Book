## Library Test

Library System make with:

- Laraver 5.4
- Vue.js
- Vuetify.js

## Instalación

- `git clone https://github.com/argueta15/Library-s-Book.git`
- `composer install`
- `npm install or yarn install`
- `php artisan key:generate`
- `install bd`
- `php artisan passport:install`
- De ser necesario cambiar clientSecret en el archivo resouces/assets/js/config.js
- `php artisan serve`
- `http://localhost:8000`
- De ser necesario cambiar axios.defaults.baseURL en el archivo resouces/assets/js/app.js

## Routes

- `http://localhost:8000`
- `http://localhost:8000/login`
- `http://localhost:8000/admin`
- `http://localhost:8000/categories`
- `http://localhost:8000/users`


## Apis

Login
- POST `http://localhost:8000/oauth/token`
Books
- GET `http://localhost:8000/api/v1/books/`
- GET `http://localhost:8000/api/v1/books/{id}`
- POST `http://localhost:8000/api/v1/books`
- PATCH `http://localhost:8000/api/v1/books/{id}`
- DELETE `http://localhost:8000/api/v1/books/{id}`
- POST `http://localhost:8000/api/v1/books/status/{id}`
User
- GET `http://localhost:8000/api/v1/users/`
- GET `http://localhost:8000/api/v1/users/{id}`
- POST `http://localhost:8000/api/v1/users`
- PATCH `http://localhost:8000/api/v1/users/{id}`
Categories
- GET `http://localhost:8000/api/v1/categories/`
- GET `http://localhost:8000/api/v1/categories/{id}`
- POST `http://localhost:8000/api/v1/categories`
- PATCH `http://localhost:8000/api/v1/categories/{id}`
