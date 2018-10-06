## Library

Sistema para una Libreria hecho con:

- Laraver 5.4
- Vue.js
- Vuetify.js

## Instalación.

- `git clone https://github.com/argueta15/Library-s-Book.git`
- `composer install`
- `npm install or yarn install`
- `Cambia el archivo .env.example por .env y configura la base de datos.`
- `php artisan key:generate`
- `php artisan migrate --seed`
- `php artisan passport:install`

- Copie el Client Secret con ID 2 que acaba de generar y cambielo en la siguiente ruta:
- `resouces/assets/js/config.js`
- `yarn run dev`
- `php artisan serve`
- `Ingresa a http://localhost:8000`
- `Disfrute.`


Opcional:

- En caso de requerirlo cambie axios.defaults.baseURL en el archivo resouces/assets/js/app.js por la url deseada.


Seleccione algun usuario de tipo admin e inicie sesion.

email: example@example.com
password: secret

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

Ejemplo:

<img src="/library_system.png" alt="">
