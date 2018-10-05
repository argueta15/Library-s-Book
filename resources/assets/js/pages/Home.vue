<template>
  <v-app id="inspire" dark>
    <v-content>
      <v-container fluid fill-height>
        <v-layout justify-center align-center>
          <v-flex shrink>
            <h1>Library System</h1>
            <p>Make with Laravel 5.4, Vue.js and Vuetify.js</p>
            <v-btn color="info" route to='/login'>Login</v-btn>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
    <v-footer app fixed>
      <span>&copy; 2018</span>
    </v-footer>
  </v-app>
</template>