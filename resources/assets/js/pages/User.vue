<template>
  <v-app id="inspire" dark>
    <Menu />
    <v-content>
      <v-container fluid fill-height>
        <v-layout justify-center align-center>
          <v-flex shrink>
            <User />
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
    <v-footer app fixed>
      <span>&copy; 2018</span>
    </v-footer>
  </v-app>
</template>

<script>
  import Menu from '../components/Menu'
  import User from '../components/User'
  export default {
    components: {
      Menu,
      User
    }
  }
</script>