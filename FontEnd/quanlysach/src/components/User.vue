<template>

    <v-app>
    
        <v-navigation-drawer
            v-model="drawer"
            :rail="rail"
            permanent
            @click="openCloseRail"   
        >
        <v-list-item
            prepend-icon="mdi-plus-circle"
            title="Quản lý sách"
        >
    
        <template v-slot:append>
            <v-btn
                variant="text"
                icon="mdi-chevron-left"
                @click.stop="openCloseRail"
            ></v-btn>
        </template>
    
        </v-list-item>
    
        <v-divider></v-divider>
    
        <v-list density="compact" nav>
            <v-list-item prepend-icon="mdi-home" title="Home" value="home" @click="moveToHomePage"></v-list-item>
            <v-list-item prepend-icon="mdi-account-group-outline" title="Quản lý người dùng" value="users"></v-list-item>
    
            <v-divider></v-divider>

        </v-list>
        
        <v-list-item prepend-icon="mdi-logout" title="Đăng xuất" color="error" value="users" @click="signOut" ></v-list-item>
           
    
        
        </v-navigation-drawer>
    
        <v-main class="main">
            <v-container>
      
            <v-card>
                <v-tabs
                    v-model="tab"
                    bg-color="info"
                  
                >
                    <v-tab value="one">User Account</v-tab>
                    <v-tab value="two">Admin Account</v-tab>
                </v-tabs>

                <v-card-text>
                <v-window v-model="tab"  class="tab-container">
                    <!-- User Role -->
                    <v-window-item value="one">
                        <div v-for="(item) in userRole" :key="item.UserID" class="container-box">
                            <div class="box-cover">
                                <div class="author-title">Tên: {{item.UserName}}</div>
                                
                                <div class="author-title">Vai trò:  {{item.UserRight === 0 ? 'admin' : 'user'}}</div>

                                <div class="box-function">
                                    <v-btn 
                                    variant="tonal"
                                    color="info" 
                                    @click="openCloseAskBox(item.UserID)"
                                    >
                                    Thêm làm quản trị viên
                                    </v-btn>
                                </div>
                            </div>

                         </div>
                    </v-window-item>

                    <!-- Admin Role -->
                    <v-window-item value="two" class="tab-container">
                        <div v-for="(item) in adminRole" :key="item.UserID" class="container-box">
                            <div class="box-cover">
                                <div class="author-title">Tên {{item.UserName}}</div>
                                
                                <div class="author-title">Vai trò:  {{item.UserRight === 0 ? 'admin' : 'user'}}</div>

                                <div class="box-function">
                                    <v-btn 
                                    variant="tonal"
                                    color="error" 
                                    @click="openCloseAskBoxDeleteAdmin(item.UserID)"
                                    >
                                    Xóa quyền quản trị
                                    </v-btn>
                                </div>
                            </div>

                         </div>
                    </v-window-item>
                </v-window>
                </v-card-text>
            </v-card>
                
                
                    
    
            </v-container>
        </v-main>
        
        <v-bottom-navigation grow>
            <v-btn value="recent">
                <v-icon>mdi-history</v-icon>
    
                Recent
            </v-btn>
    
            <v-btn value="favorites">
                <v-icon>mdi-heart</v-icon>
    
                Favorites
            </v-btn>
    
            <v-btn value="nearby">
                <v-icon>mdi-map-marker</v-icon>
    
                Nearby
            </v-btn>
        </v-bottom-navigation>


        <AskBox v-if="showAskBox"
        :title="'Bạn có thêm người dùng này làm quản trị viên ?'"
        :actionButton="'Thêm'"
        :widthBox="'500px'"
        :heightBox="'auto'" 
        @confirm="addToBeAdmin"
        @close-box="openCloseAskBox"
        />

        <AskBox v-if="showAskBoxDeleteAdmin"
        :title="'Bạn có muốn xóa người này khỏi quản trị viên ?'"
        :actionButton="'Xóa'"
        :widthBox="'500px'"
        :heightBox="'auto'" 
        @confirm="addToBeUser"
        @close-box="openCloseAskBoxDeleteAdmin"
        />

    
    </v-app>
 
</template>
    
<script>
import router from "@/router";
import axios from "axios";
import AskBox from './AskBox.vue';
    
    export default {
        name: 'User',
        components: { AskBox },
        data() {
            return {
                drawer: true,
                items: [
                    { title: 'Home', icon: 'mdi-home-city' },
                    { title: 'My Account', icon: 'mdi-account' },
                    { title: 'Users', icon: 'mdi-account-group-outline' },
                ],
                rail: true,
                users: [],
                loaders: false,
                ok_snackbar: false,
                overlay: false,
                newNV: true,
                permission: '',
                userRole: [],
                adminRole: [],
                tab: null,
                showAskBox: false,
                showAskBoxDeleteAdmin: false,
                IDUser: '',
                rail: true,
            };
        },
        mounted() {
 
            let user = window.localStorage.getItem("user-info");
            let userPermission = JSON.parse(window.localStorage.getItem("user-permission"))

            if(userPermission === 0){
                this.isRendered = true
            }
            else {
                this.isRendered = false
                router.push('home')
            }


            if (!user) {
                router.push('/')
            }
            else {
                this.getDataUsers();
            }
           
        },
        methods: {
            moveToHomePage(){
                router.push('home')
            },

            async addToBeUser(){
                let result = await axios.put('/ChangeToUser',{
                    "UserID": `${this.IDUser}`
                })
            
                if (result.status == 200 && result.data.length > 0) {
                    this.getDataUsers();
                    location.reload()
                }
                else {
                    this.snackbar = true
                    this.snackbarText = 'Thay đổi không thành công';
                }
            },

            openCloseAskBoxDeleteAdmin(idUser){
                this.IDUser = idUser
                this.showAskBoxDeleteAdmin = !this.showAskBoxDeleteAdmin
            },

            openCloseAskBox(idUser){
                this.IDUser = idUser
                this.showAskBox = !this.showAskBox
            },

            async addToBeAdmin(){
                let result = await axios.put('/ChangeToAdmin',{
                    "UserID": `${this.IDUser}`
                })
            
                if (result.status == 200 && result.data.length > 0) {
                    this.getDataUsers();
                    location.reload()
                }
                else {
                    this.snackbar = true
                    this.snackbarText = 'Thay đổi không thành công';
                }
            },

            handleRole(dataRole){

                for (const [key, value]  of Object.entries(dataRole)) {
                    if(value.UserRight === 0){
                        this.adminRole.push(value)
                    }else {
                        this.userRole.push(value)
                    }
                }

            },

            getDataUsers() {
                this.loaders = true;
                axios.get("/SelectAllUser")
                    .then((response) => {
                    this.users.push(...response.data);
                    this.handleRole(response.data)        

                })
                .catch(error => console.log(error));
            },

           


            detailNXB(id) {
                window.localStorage.setItem("idNXB", id)
                router.push("detail");
            },
    
            signOut(){     
                localStorage.removeItem("user-info");
                localStorage.removeItem("idNXB");
                router.push('/')
            },
    
            openCloseRail(){
                this.rail = !this.rail
            },
        },
    
      
    }
    </script>
    
    <style scoped>
    
    ::-webkit-scrollbar {
        display: none;
    }
    .main{
        height: auto;
        width: 100%;
    }
    
    .btn-sign-out{
        margin-top: 20px;
        display: none;
    }

    .tab-container{
        min-height: 600px;
    }
    
    .box-cover{
        width: 40%;
        height: 150px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        margin: auto;
        box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
        border-radius:20px;
        border: thin solid rgba(84, 84, 87, 0.25);  
    }
    
    .container-box + .container-box{
        margin-top: 20px;
    }
    
    .author-title{
        font-weight: bold;
        font-size: 20px;
        color: #385898;
    }
    
    </style>