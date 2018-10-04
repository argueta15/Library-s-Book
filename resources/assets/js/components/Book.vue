<template>
  <div>
    <v-toolbar flat color="grey darken-4">
      <v-toolbar-title>Books list</v-toolbar-title>
      <v-divider
        class="mx-2"
        inset
        vertical
      ></v-divider>
      <v-spacer></v-spacer>
      <v-dialog v-model="dialog" max-width="500px">
        <v-btn slot="activator" color="primary" dark class="mb-2">New Book</v-btn>
        <v-card>
          <v-card-title>
            <span class="headline">{{ formTitle }}</span>
          </v-card-title>

          <v-card-text>
            <v-container grid-list-md>
              <v-layout wrap>
                <v-flex xs12>
                  <v-text-field v-model="editedItem.name" label="Name"></v-text-field>
                </v-flex>
                <v-flex xs12>
                  <v-text-field v-model="editedItem.author" label="Author"></v-text-field>
                </v-flex>
                <v-flex xs12>
                  <v-subheader class="pa-0">Select category:</v-subheader>
                  <v-autocomplete
                    v-model="editedItem.category_id"
                    :items="categories"
                    item-text="name"
                    item-value="id"
                    :readonly="!isEditing"
                    label="Category"
                    prepend-icon="category"
                  >
                  </v-autocomplete>
                </v-flex>
                <v-flex xs12>
                  <v-menu
                    ref="menu2"
                    :close-on-content-click="false"
                    v-model="menu2"
                    :nudge-right="40"
                    :return-value.sync="editedItem.published_date"
                    lazy
                    transition="scale-transition"
                    offset-y
                    full-width
                    min-width="290px"
                  >
                    <v-text-field
                      slot="activator"
                      v-model="editedItem.published_date"
                      label="Published Date"
                      prepend-icon="event"
                      readonly
                    ></v-text-field>
                    <v-date-picker v-model="editedItem.published_date" @input="$refs.menu2.save(editedItem.published_date)"></v-date-picker>
                  </v-menu>
                </v-flex>
              </v-layout>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" flat @click.native="close">Cancel</v-btn>
            <v-btn color="blue darken-1" flat @click.native="save">Save</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
      <v-dialog v-model="dialogStatus" max-width="500px">
        <v-card>
          <v-card-title>
            <span class="headline">Borrow Book: {{editStatusItem.name}}</span>
          </v-card-title>
          <v-card-text>
            <v-container grid-list-md>
              <v-layout wrap>
                <v-flex xs12>
                  <v-subheader class="pa-0">Select user:</v-subheader>
                  <v-autocomplete
                    v-model="userBorrow"
                    :items="users"
                    item-text="name"
                    item-value="id"
                    :readonly="!isEditing"
                    label="User"
                    prepend-icon="account_circle"
                  >
                  </v-autocomplete>
                </v-flex>
              </v-layout>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" flat @click.native="closeStatus">Cancel</v-btn>
            <v-btn color="blue darken-1" flat @click.native="saveStatus">Borrow</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
      <v-dialog
        v-model="dialogGive"
        max-width="290"
      >
        <v-card>
          <v-card-title class="headline">Do you want give Book?</v-card-title>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              color="green darken-1"
              flat="flat"
              @click="dialogGive = false"
            >
              Cancel
            </v-btn>
            <v-btn
              color="green darken-1"
              flat="flat"
              @click="saveGiveBook"
            >
              Acept
            </v-btn>
          </v-card-actions>
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
        <td class="text-xs-right">{{ props.item.author }}</td>
        <td class="text-xs-right">{{ props.item.category_id }}</td>
        <td class="text-xs-right">{{ props.item.published_date }}</td>
        <td class="text-xs-right">{{ props.item.user ? props.item.user.name : 'Not user' }}</td>
        <td class="text-xs-right">
          <v-icon
            small
            :color="props.item.status == 1 ? 'green': 'red'"
          >
            fiber_manual_record
          </v-icon>
        </td>
        <td class="justify-center layout px-0">
          <v-icon
            small
            class="mr-2"
            @click="changeStatus(props.item)"
            v-if="props.item.status"
          >
            accessibility
          </v-icon>
          <v-icon
            small
            class="mr-2"
            @click="changeStatusGive(props.item)"
            v-else
          >
            loop
          </v-icon>
          <v-icon
            small
            class="mr-2"
            @click="editItem(props.item)"
          >
            edit
          </v-icon>
          <v-icon
            small
            @click="deleteItem(props.item)"
          >
            delete
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
        { text: 'Author', value: 'author' },
        { text: 'Category', value: 'category' },
        { text: 'Published Date', value: 'published_date' },
        { text: 'User', value: 'user' },
        { text: 'Status', value: 'status' },
        { text: 'Actions', value: 'name', sortable: false }
      ],
      items: [],
      editStatusItem: {
        name: ''
      },
      editedIndex: -1,
      editedItem: {
        name: '',
        author: '',
        category: '',
        published_date: '',
        user: null,
        status: null
      },
      defaultItem: {
        name: '',
        author: '',
        category: '',
        published_date: '',
        user: null,
        status: null
      },
      search: '',
      pagination: {
        rowsPerPage: 10,
        sortBy: 'name'
      },
      categories: [],
      users: [],
      isEditing: true,
      model: null,
      userBorrow: null
    }),

    computed: {
      formTitle () {
        return this.editedIndex === -1 ? 'New Book' : 'Edit Book'
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
        await axios.get('api/v1/books')
          .then(response => {
            if (response.status == 200){
              this.items = response.data.response
              this.pagination.totalItems = this.items.length
            }
          }).catch(() => {
            console.error("Error in Api books.")
          })

        await axios.get('api/v1/categories')
          .then(response => {
            if (response.status == 200){
              this.categories = response.data.response
            }
          }).catch(() => {
            console.error("Error in Api categories.")
          })

        await axios.get('api/v1/users')
          .then(response => {
            if (response.status == 200){
              this.users = response.data.response
            }
          }).catch(() => {
            console.error("Error in Api users.")
          })
      },

      editItem (item) {
        this.editedIndex = this.items.indexOf(item)
        this.editedItem = Object.assign({}, item)
        this.dialog = true
      },

      deleteItem (item) {
        const index = this.items.indexOf(item)
        confirm('Are you sure you want to delete this item?') && this.items.splice(index, 1)
        axios.delete(`api/v1/books/${item.id}`)
          .then(response => {
            if (response.status == 200){
              this.pagination.totalItems = this.items.length
              this.snackbar = true
              this.text = 'Book delete Ok..'
              this.color = 'green'
              this.close()
            }
          }).catch(error => {
            console.error("Error in Api delete books.")
            this.snackbar = true
            this.text = 'Opps. Conection error.'
            this.color = 'red'
          })
      },

      close () {
        this.dialog = false
        setTimeout(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        }, 300)
      },

      closeStatus () {
        this.dialogStatus = false
        this.userBorrow = null
      },

      saveGiveBook () {
        let newStatus = !this.editStatusItem.status
        let data = {
          "user": this.editStatusItem.user.id,
          "status": newStatus
        }
        axios.post(`api/v1/books/status/${this.editStatusItem.id}`, data)
          .then(response => {
            if (response.status == 200){
              for (let book of this.items){
                if (book.id == this.editStatusItem.id){
                  book.status = newStatus
                  book.user = null
                }
              }
              this.snackbar = true
              this.text = 'Book status Ok..'
              this.color = 'green'
              this.dialogGive = false
            }
          }).catch(error => {
            console.error("Error in Api status books.")
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
            this.dialogGive = false
          })
      },

      saveStatus () {
        let newStatus = !this.editStatusItem.status
        let data = {
          "user": this.userBorrow,
          "status": newStatus
        }
        axios.post(`api/v1/books/status/${this.editStatusItem.id}`, data)
          .then(response => {
            if (response.status == 200){
              let user = [];
              for (let usr of this.users){
                if (usr.id == this.userBorrow)
                  user = usr
              }
              for (let book of this.items){
                if (book.id == this.editStatusItem.id){
                  book.status = newStatus
                  book.user = user
                }
              }
              this.snackbar = true
              this.text = 'Book status Ok..'
              this.color = 'green'
              this.closeStatus()
            }
          }).catch(error => {
            console.error("Error in Api status books.")
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
            this.closeStatus()
          })
      },

      save () {
        if (this.editedIndex > -1) {
          Object.assign(this.items[this.editedIndex], this.editedItem)
          let data = {
            "name": this.editedItem.name,
            "author": this.editedItem.author,
            "category": this.editedItem.category_id,
            "published": this.editedItem.published_date
          }
          axios.patch(`api/v1/books/${this.editedItem.id}`, data)
            .then(response => {
              if (response.status == 200){
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
          this.close()
        } else {
          let data = {
            "name": this.editedItem.name,
            "author": this.editedItem.author,
            "category": this.editedItem.category_id,
            "published": this.editedItem.published_date,
            "status": 1
          }

          axios.post('api/v1/books', data)
            .then(response => {
              if (response.status == 201){
                this.items.push(response.data.book)
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
      changeStatus (item){
        this.editStatusItem = item
        this.dialogStatus = true
      },
      changeStatusGive (item){
        this.editStatusItem = item
        this.dialogGive = true
      }
    }
  }
</script>