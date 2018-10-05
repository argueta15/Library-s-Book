<template>
  <div>
    <v-toolbar flat color="grey darken-4">
      <v-toolbar-title>Categories list</v-toolbar-title>
      <v-divider
        class="mx-2"
        inset
        vertical
      ></v-divider>
      <v-spacer></v-spacer>
      <v-dialog v-model="dialog" max-width="500px">
        <v-btn slot="activator" color="primary" dark class="mb-2">New Category</v-btn>
        <v-card>
          <v-card-title>
            <span class="headline">{{ formTitle }}</span>
          </v-card-title>
          <v-form novalidate @submit.stop.prevent="save">
            <v-card-text>
              <v-container grid-list-md>
                <v-layout wrap>
                  <v-flex xs12>
                    <v-text-field
                      v-validate="'required'"
                      :error-messages="errors.collect('name')"
                      data-vv-name="name"
                      v-model="editedItem.name"
                      label="Name"
                      required>
                    </v-text-field>
                  </v-flex>
                  <v-flex xs12>
                    <v-textarea
                      v-validate="'required'"
                      :error-messages="errors.collect('description')"
                      data-vv-name="description"
                      v-model="editedItem.description"
                      label="Description"
                    ></v-textarea>
                  </v-flex>
                </v-layout>
              </v-container>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" flat @click.native="close">Cancel</v-btn>
              <v-btn color="blue darken-1" flat type="submit">Save</v-btn>
            </v-card-actions>
          </v-form>
        </v-card>
      </v-dialog>
    </v-toolbar>

    <v-toolbar
      dark
      color="grey darken-3"
      class="mb-2"
    >
      <v-text-field
          v-model="search"
          append-icon="search"
          label="Search by name..."
          single-line
          hide-details
        ></v-text-field>
    </v-toolbar>

    <v-data-table
      :headers="headers"
      :items="items"
      :search="search"
      :pagination.sync="pagination"
      hide-actions
      class="elevation-1"
    >
      <template slot="items" slot-scope="props">
        <td>{{ props.item.name }}</td>
        <td class="text-xs-right">{{ props.item.description }}</td>
        <td class="justify-center layout px-0">
          <v-icon
            small
            class="mr-2"
            @click="editItem(props.item)"
          >
            edit
          </v-icon>
        </td>
      </template>
      <v-alert slot="no-results" :value="true" color="error" icon="warning">
        Your search for "{{ search }}" found no results.
      </v-alert>
      <template slot="no-data">
        Not Fount.
      </template>
    </v-data-table>
    <div class="text-xs-center pt-2">
      <v-pagination v-model="pagination.page" :length="pages"></v-pagination>
    </div>
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
  </div>
</template>
<script>
  export default {
    data: () => ({
      menu2: false,
      snackbar: false,
      y: 'bottom',
      x: null,
      mode: '',
      timeout: 6000,
      text: 'Hello, I\'m a snackbar',
      color: '',
      dialog: false,
      dialogStatus: false,
      dialogGive: false,
      headers: [
        {
          text: 'Name',
          align: 'left',
          value: 'name'
        },
        { text: 'Description', value: 'author' },
        { text: 'Actions', value: 'name', sortable: false }
      ],
      editStatusItem: {
        name: ''
      },
      editedIndex: -1,
      editedItem: {
        name: '',
        description: ''
      },
      defaultItem: {
        name: '',
        description: ''
      },
      search: '',
      pagination: {
        rowsPerPage: 10,
        sortBy: 'name'
      },
      items: [],
      isEditing: true,
      model: null,
    }),

    computed: {
      formTitle () {
        return this.editedIndex === -1 ? 'New Category' : 'Edit Category'
      },
      pages () {
        if (this.pagination.rowsPerPage == null ||
          this.pagination.totalItems == null
        ) return 0

        return Math.ceil(this.pagination.totalItems / this.pagination.rowsPerPage)
      }
    },

    watch: {
      dialog (val) {
        val || this.close()
      }
    },

    created () {
      this.initialize()
    },

    methods: {
      async initialize () {
        await axios.get('api/v1/categories')
          .then(response => {
            if (response.status == 200){
              this.items = response.data.response
            }
          }).catch(() => {
            console.error("Error in Api categories.")
          })
      },

      editItem (item) {
        this.editedIndex = this.items.indexOf(item)
        this.editedItem = Object.assign({}, item)
        this.dialog = true
      },

      close () {
        this.dialog = false
        setTimeout(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        }, 300)
      },

      async save () {
        let validate = await this.$validator.validate()
        if (!validate) {
          this.snackbar = true
          this.text = 'All fields are required.'
          this.color = 'red'
          return false
        }
        if (this.editedIndex > -1) {
          Object.assign(this.items[this.editedIndex], this.editedItem)
          let data = {
            "name": this.editedItem.name,
            "description": this.editedItem.description,
          }
          axios.patch(`api/v1/categories/${this.editedItem.id}`, data)
            .then(response => {
              if (response.status == 200){
                this.pagination.totalItems = this.items.length
                this.snackbar = true
                this.text = 'Book update Ok..'
                this.color = 'green'
                this.close()
              }
            }).catch(error => {
              console.error("Error in Api update books.")
              if (error.response.status == 422){
                var msg = ''
                let err = error.response.data
                for(let i in err){
                  msg += err[i] + " "
                }
                this.snackbar = true
                this.text = msg
                this.color = 'red'
                return false
              }
              this.snackbar = true
              this.text = 'Opps. Conection error.'
              this.color = 'red'
              this.close()
            })
          this.close()
        } else {
          let data = {
            "name": this.editedItem.name,
            "description": this.editedItem.description
          }
          axios.post('api/v1/categories', data)
            .then(response => {
              if (response.status == 201){
                this.items.push(response.data.category)
                this.pagination.totalItems = this.items.length
                this.snackbar = true
                this.text = 'Book create Ok..'
                this.color = 'green'
                this.close()
              }
            }).catch(error => {
              console.error("Error in Api create books.")
              if (error.response.status == 422){
                var msg = ''
                let err = error.response.data
                for(let i in err){
                  msg += err[i] + " "
                }
                this.snackbar = true
                this.text = msg
                this.color = 'red'
                return false
              }
              this.snackbar = true
              this.text = 'Opps. Conection error.'
              this.color = 'red'
              this.close()
            })
        }
      },
    }
  }
</script>