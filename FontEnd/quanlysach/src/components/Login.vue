<template>
    <v-app>
        <v-container>
                <v-card width="500" class="mx-auto mt-9" ref="form">
                    <v-card-title>Lac Hong University</v-card-title>

                    <v-form ref="form" v-model="vaild">
                        <v-card-text>
                            <v-text-field v-model="username" :rules="usernameRules"
                                            label="Tài khoản" prepend-icon="mdi-account-circle"
                                            required>
                            </v-text-field>

                            <v-text-field v-model="password" :rules="passwordRules"
                                            label="Mật khẩu"
                                            :type="showPassword ? 'text' : 'password' " prepend-icon="mdi-lock"
                                            :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off' "
                                            v-on:keyup.enter="signUp"
                                            @click:append="showPassword = !showPassword" required>
                            </v-text-field>


                            <v-btn 
                                color="info" 
                                block
                                v-on:click="signUp" 
                                >
                                Đăng nhập 
                            </v-btn>

                            <br>
                            <h5 class="text-to-register"
                            @click="moveToRegister" 
                            >  
                            Bạn chưa có tài khoản ? Đăng kí ngay</h5>

                        </v-card-text>

                        <v-alert 
                        v-if="errorLoginToast"
                        type="error" 
                        :value="alert" 
                        :timeout="2000"> 
                        Tài khoản hoặc mật khẩu không chính xác </v-alert>
                        </v-form>
                </v-card>
    </v-container>
    </v-app>   
</template>

<script>
import router from '@/router';
import axios from 'axios'

    export default {
      name: 'Login',
      data() {
        return{
        valid: true,
        userID: '',
        userRight: '',
          errorLoginToast: false,
          alert: false,
          showPassword: false,
          valid: true,
          password: '',
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

        authUser(){
            axios.get(`/AuthenUser/${this.userID}`)
            .then((response) => {
                this.userRight = response.data[0].UserRight
                this.setLocalStorage()
            }
            )
            .catch(error => console.log(error));
        },

        setLocalStorage(){
            window.localStorage.setItem("user-permission", this.userRight)
            router.push("home")

        },



        async signUp() {
            if (this.username != '' && this.password != '') {
                let result = await axios.get(`/AuthLogin/${this.username}/${this.password}`)
    
                if (result.status == 200 && result.data.length > 0) {
                    this.userID = result.data[0].UserID
                    this.authUser()
                    window.localStorage.setItem("user-info", JSON.stringify(result.data[0]))
                }
                else {
                    this.errorLoginToast = true
                    this.alert = true
                    setTimeout(() => {
                        this.errorLoginToast = false
                        this.alert = false
                    }, 2000)
                }
            }
            else {
                const { valid } = await this.$refs.form.validate()
            }
        },

        moveToRegister() {
            router.push("register")
        }
      },
    
    }
    </script>


<style scoped>
.text-to-register{
    display: flex;
    justify-content: end;
    font-size: 15px;
}

.text-to-register:hover{
    color: #385898;
    cursor: pointer;
}

</style>
    