<template>
    <v-card width="500" class="mx-auto mt-9" ref="form">
        <v-card-title>Đăng kí tài khoản</v-card-title>

        <v-form ref="form" v-model="valid">
            <v-card-text>
                <v-text-field v-model="username" :rules="usernameRules"
                                label="Tài khoản" prepend-icon="mdi-account-circle"
                                required>
                </v-text-field>

                <v-text-field v-model="password" :rules="passwordRules"
                                label="Mật khẩu"
                                :type="showPassword ? 'text' : 'password' " prepend-icon="mdi-lock"
                                :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off' "
                                v-on:keyup.enter="registerAccount"
                                @click:append="showPassword = !showPassword" required>
                </v-text-field>

                <v-btn block color="success" v-on:click="registerAccount"> Đăng kí </v-btn>
                <br>
                <v-btn 
                    block
                    color="info" 
                    @click="backToHomePage" 
                    >
                    Quay lại
                </v-btn>

            </v-card-text>

                
                <v-alert 
                v-if="errorLoginToast"
                type="error" 
                :value="alert" 
                :timeout="2000"> 
                Tài khoản hoặc mật khẩu không chính xác </v-alert>


            <v-snackbar
                v-model="snackbar"
                :timeout="timeout"
                >
                {{snackbarText}}

            <template v-slot:actions>
                <v-btn
                color="blue"
                variant="text"
                @click="snackbar = false"
                >
                Close
                </v-btn>
            </template>
            </v-snackbar>


        </v-form>

    </v-card>
    
</template>
    
    <script>
import router from '@/router';
import axios from 'axios'

    export default {
      name: 'Register',
      data() {
        return{
        snackbar: false,
        snackbarText: '',
        timeout: 2000,
        errorLoginToast: false,
        alert: false,
        showPassword: false,
        valid: true,
        password: '',
        valid: true,
        passwordRules: [
            v => !!v || 'Bạn cần nhập mật khẩu',
            v => (v && v.length > 0) || 'Mật khẩu không được để trống',
        ],
        username: '',
        usernameRules: [
            v => !!v || 'Bạn cần nhập tài khoản',
            v => (v && v.length > 0) || 'Tài khoản không được để trống',
        ],
        }
      },

      mounted(){
        let user = window.localStorage.getItem("user-info");
        if (user) {
            router.push('/home')
        }
    },  
    
      methods: {
        async registerAccount() {
            console.log(this.username)
            if (this.username != '' && this.password != '') {

                let result = await axios.post('/AddNewUser',{
                    "UserName": `${this.username}`,
                    "UserPass": `${this.password}`,
                })
    
                if (result.status == 200 && result.data.length > 0) {

                    this.snackbar = true
                    this.snackbarText = 'Thêm tài khoản thành công'

                    setTimeout(() => {
                        router.push("/")
                    },1500)    
                }
                else {
                    this.snackbar = true
                    this.snackbarText = 'Thêm tài khoản không thành công'
                }
            }
            else {
                const { valid } = await this.$refs.form.validate()
            }
        },

        backToHomePage() {
            router.push("/")
        }
      },
    
    }
    </script>
    