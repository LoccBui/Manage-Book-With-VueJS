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
        
        <v-list-item v-show="isRendered" prepend-icon="mdi-account-group-outline" title="Quản lý người dùng"  value="users" @click="moveToUser" ></v-list-item>
        <v-divider></v-divider>
    </v-list>

    
    <v-list-item prepend-icon="mdi-logout" title="Đăng xuất" color="error" value="users" @click="signOut" ></v-list-item>


    
    </v-navigation-drawer>

    <v-main class="main">
        <v-container>       
                <div v-for="(item) in sach" :key="item.id" class="container-box">
                    <div class="box-cover">
                        <div>
                            <img class="author-image-cover" :src="require(`../assets/img/NXB/${item.Image}`)" alt="Logo Nha Xuat Ban">
                        </div>


                        <div>
                            <div>
                                <div class="author-title">{{item.TenNXB}}</div>
                                <div class="author-des">{{item.DiaChi}}</div>
                                <div class="author-phone">{{item.DienThoai}}</div>
                            </div>

                            <div class="box-function">
                                <v-btn 
                                variant="tonal"
                                color="secondary" 
                                @click="detailNXB(item.MaNXB)"
                                >
                                Xem Chi Tiết
                                </v-btn>
                            </div>
                        </div>

                    </div>

                </div>


                <v-btn color="info" icon class="btn-To-Top" @click="moveToTop">
                    <v-icon >
                        mdi-arrow-up
                    </v-icon>
                </v-btn>
        </v-container>
    </v-main>
    
    <v-bottom-navigation grow>
        <v-btn value="recent">
            <v-icon>mdi-history</v-icon>

            Đã đọc
        </v-btn>

        <v-btn value="favorites">
            <v-icon>mdi-heart</v-icon>

            Yêu thích
        </v-btn>

        <v-btn value="nearby">
            <v-icon>mdi-map-marker</v-icon>

            Gần đây
        </v-btn>
    </v-bottom-navigation>

</v-app>
</template>

<script>
import router from "@/router";
import axios from "axios";

export default {
    data() {
        return {
            drawer: true,
            items: [
                { title: 'Home', icon: 'mdi-home-city' },
                { title: 'My Account', icon: 'mdi-account' },
                { title: 'Users', icon: 'mdi-account-group-outline' },
            ],
            rail: true,
            sach: [],
            loaders: false,
            ok_snackbar: false,
            overlay: false,
            newNV: true,
            ho: "",
            ten: "",
            phai: "",
            diachi: "",
            dienthoai: "",
            isRendered: '',
            isAdmin: ''
        };
    },

   
    mounted() {
        let userPermission = JSON.parse(window.localStorage.getItem("user-permission"))
        let user = window.localStorage.getItem("user-info");

        if(userPermission === 0){
            this.isRendered = true
        }
        else {
            this.isRendered = false
        }


        if (!user) {
            router.push('/')
        }
        else {
            this.getDataNXB();
            
        }
       
    },
    methods: {
        getDataNXB() {
            this.loaders = true;
            axios.get("/SelectAllNXB")
                .then((response) => {
                this.sach.push(...response.data);

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
            localStorage.removeItem("user-permission");
            router.push('/')
        },

        openCloseRail(){
            this.rail = !this.rail
           
        },

        moveToUser(){
            router.push('user')
        },

        moveToTop(){
            document.documentElement.scrollTop = 0;
        }


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


.box-cover{
    width: 40%;
    margin: auto;
    padding: 20px;
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

.author-image-cover{
    width: 100px;
    height: 100px;
}


.btn-To-Top{
    position: fixed;
    right: 0;
    bottom: 30px;
    z-index: 1000;
}
</style>