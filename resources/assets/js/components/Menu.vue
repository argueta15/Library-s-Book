<template>
  <div>
    <v-navigation-drawer
      v-model="drawer"
      clipped
      fixed
      app
    >
      <v-list dense>
        <v-list-tile route to="/admin" exact>
          <v-list-tile-action>
            <v-icon>dashboard</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>Dashboard</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile route to="/admin/categories" exact>
          <v-list-tile-action>
            <v-icon>category</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>Categories</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile route to="/admin/users" exact>
          <v-list-tile-action>
            <v-icon>group</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>Users</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile @click="logout">
          <v-list-tile-action>
            <v-icon>settings</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>Logout</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar app fixed clipped-left>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>Application</v-toolbar-title>
    </v-toolbar>
  </div>
</template>
<script>
  import {auth} from '../auth'
  export default {
    mixins: [auth],
    data: () => ({
      drawer: true
    }),
    props: {
      source: String
    },
    methods: {
      logout () {
        this.logout = this.$auth.destroyToken()
        window.location.href = '/login';
      }
    }
  }
</script>