<template>
  <v-container fluid fill-height>
    <v-layout align-center justify-center>
      <v-flex xs12 sm8 md6 class="text-xs-center">
        <img class="imgLogo" src="../../img/library-logo.png" alt="The Library">
        <v-card class="elevation-12">
          <v-toolbar dark color="primary">
            <v-toolbar-title class="titleResponsive">Welcome back!</v-toolbar-title>
          </v-toolbar>
          <v-form novalidate @submit.stop.prevent="submit">
            <v-card-text>
              <v-text-field
                v-validate="'required|email'"
                v-model="email"
                :error-messages="errors.collect('email')"
                label="E-mail"
                data-vv-name="email"
                required
              ></v-text-field>
              <v-text-field
                v-validate="'required'"
                v-model="password"
                :error-messages="errors.collect('password')"
                label="Password"
                data-vv-name="password"
                type="password"
                required
              ></v-text-field>
            </v-card-text>
            <v-card-actions>
              <v-btn
                block
                color="primary"
                :loading="loading"
                :disabled="loading || !isFormDirty || errors.any()"
                type="submit">Login
              </v-btn>
            </v-card-actions>
          </v-form>
          <v-snackbar
            v-model="snackbar"
            :color="color"
            :bottom="y === 'bottom'"
            :left="x === 'left'"
            :multi-line="mode === 'multi-line'"
            :right="x === 'right'"
            :timeout="timeout"
            :top="y === 'top'"
            :vertical="mode === 'vertical'"
          >
            {{ text }}
            <v-btn
              color="white"
              flat
              @click="snackbar = false"
            >
              Close
            </v-btn>
          </v-snackbar>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
  import {clientId, clientSecret, loginUrl, getHeader, userUrl} from '../config'
  export default {
    data: () => ({
      drawer: null,
      password: '',
      email: '',
      dictionary: {
        attributes: {
          email: 'E-mail Address'
        }
      },
      snackbar: false,
      y: 'bottom',
      x: null,
      mode: '',
      timeout: 6000,
      text: 'Hello, I\'m a snackbar',
      color: '',
      loader: null,
      loading: false
    }),
    props: {
      source: String
    },
    mounted () {
      this.$validator.localize('en', this.dictionary)
    },
    computed: {
      isFormDirty () {
        return Object.keys(this.fields).some(key => this.fields[key].dirty)
      }
    },
    methods: {
      async submit () {
        this.loader = 'loading'
        let validate = await this.$validator.validate()
        if (!validate) {
          this.snackbar = true
          this.text = 'All fields are required.'
          this.color = 'red'
          return false
        }
        var data = {
            grant_type: 'password',
            client_id: clientId,
            client_secret: clientSecret,
            username: this.email,   
            password: this.password
        }
        const authUser = {}
        await axios.post(loginUrl, data)
          .then(response => {
            if (response.status == 200){
              this.snackbar = true
              this.text = 'Successfully connected.'
              this.color = 'green'
              this.$auth.setToken(response.data.access_token, response.data.expires_in + Date.now())
              axios.get(userUrl, {headers: getHeader()})
                .then(response => {
                  localStorage.setItem('user', JSON.stringify(response.data))
                  const UserType = response.data.type
                  this.$router.replace('/admin')
                })
                .catch (error => {
                    console.error("Error de Auth")
                });
            }
          }).catch(() => {
            this.snackbar = true
            this.text = 'Invalid email or password.'
            this.color = 'red'
          })
      }
    },
    watch: {
      loader () {
        const l = this.loader
        this[l] = !this[l]
        setTimeout(() => (this[l] = false), 3000)
        this.loader = null
      }
    }
  }
</script>

<style>
  .custom-loader {
    animation: loader 1s infinite;
    display: flex;
  }
  @-moz-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @-webkit-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @-o-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
</style>