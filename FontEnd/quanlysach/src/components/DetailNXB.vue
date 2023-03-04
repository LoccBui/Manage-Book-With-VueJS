<template>

<v-app>
    <v-navigation-drawer
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
        <v-list-item v-show="isRendered" prepend-icon="mdi-account-group-outline" title="Users" value="users"></v-list-item>

        <v-divider></v-divider>
     
    </v-list>

    <v-list-item prepend-icon="mdi-logout" title="Đăng xuất" color="error" value="users" @click="signOut" ></v-list-item>
       
    
    </v-navigation-drawer>

    <v-main>
        <v-container>

            <div class="cover-add-new">
                <v-btn
                v-show="displayAdd"
                flat
                color="info"
                @click="handleAddBookBox"
                prepend-icon="mdi-plus"
                > Thêm 
            </v-btn>
            </div>
            

            <div style="display: flex; align-items: center;">
                <v-text-field v-model="search"
                   label="Tìm kiếm "
                   single-line
                   hide-details
                   @keyup.enter="searchBook"
                   >  
                </v-text-field>

                <v-btn  color="info" height="50px" @click="searchBook" > Tìm</v-btn>
            </div>

            <v-alert 
                v-if="notFoundBook"
                type="error" 
                :timeout="2000"> 
                Không có quyển sách này </v-alert>

                <v-btn
                prepend-icon="mdi-refresh"
                color="info"
                @click="getDataBook"
                >
                Làm mới dữ liệu
                </v-btn>



            <div v-for="(item) in sachByNXB" :key="item.MaSach" class="container-box">
                <div class="box-cover">
                    <div class="img-book">
                        <img class="book-image-cover"  :src="require(`../assets/img/Book/${item.Image}`)" alt="Book-cover">
                    </div>

                    <div class="info-book">
                        <div>
                            <div class="book-title">{{item.TenSach}}</div>
                            <div class="book-phone">{{item.NgayCapNhat}}</div>
                        </div>

                        <div v-show="displayUpdate">
                            <v-btn          
                                v-show="displayUpdate"        
                                variant="tonal"
                                color="secondary" 
                                @click="updateSach(item.MaSach)"
                                >
                                Sửa
                            </v-btn>
            
                            <v-btn 
                                v-show="displayUpdate"
                                @click="openCloseAskDelete(item.MaSach)"
                                variant="tonal"
                                color="error" >
                                Xóa 
                            </v-btn>        
                        </div>


                        <v-card-actions>
                            <v-btn
                                color="orange-lighten-2"
                                variant="text"
                                @click="showMore = !showMore"
                            >
                                Mô tả
                            </v-btn>

                        <v-spacer></v-spacer>

                            <v-btn
                                :icon="showMore ? 'mdi-chevron-up' : 'mdi-chevron-down'"
                                @click="showMore = !showMore"
                            ></v-btn>
                        </v-card-actions>
                    
                        <v-expand-transition>
                            <div v-show="showMore">
                                <v-divider></v-divider>

                                <v-card-text class="book-des">
                                    {{item.MoTa}}
                                </v-card-text>
                            </div>
                        </v-expand-transition>
                    </div>
                </div>     
            </div>

            <div class="addbox" v-show="showAddBox">
                <div class="overlay">
                    <div class="form-add-book">
                        <v-form ref="form" v-model="valid">
                            <v-text-field v-model="nameNewBook" :rules="nameBookRules"
                                    label="Tên sách" required>
                            </v-text-field>

                            <v-text-field v-model="nameNewDesBook" :rules="desBookRules"
                                        label="Mô tả" required>
                            </v-text-field>

                            <v-file-input
                                accept="image/png, image/jpeg" 
                                v-model="fileNewBook" 
                                label="Ảnh sách"
                                :rules="imgBookRules"
                                >
                            </v-file-input>
                        </v-form>

                        <v-btn
                            flat
                            class="btn-form-add"
                            @click="addNewBook"
                            >
                            Thêm 
                        </v-btn>
                        <br>
                        <br>
                        <v-btn
                            flat
                            class="btn-form-cancel"
                            @click="handleAddBookBox"
                            >
                            Hủy
                        </v-btn>
                                       
                    </div>
                </div>
            </div>
            
        </v-container>
    </v-main>

    <v-bottom-navigation grow>
        <v-btn value="recent">
            <v-icon>mdi-history</v-icon>

            Lịch sử
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


       
        
    <UpdateBookBox v-if="showUpdateBookBox"
        :idBookSelect="idBookSelect"
        @close-box="openCloseUpdateBox"
    />


    <AskBox v-if="showAskDelete"
        :title="'Bạn có muốn xóa cuốn sách này ?'"
        :actionButton="'Xóa'"
        :widthBox="'500px'"
        :heightBox="'auto'" 
        @confirm="deleteBook"
        @close-box="openCloseAskDelete"
    />


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
   
</v-app>
   
</template>
<script>
import axios from "axios";  
import router from "@/router";
import AskBox from './AskBox.vue';
import UpdateBookBox from './UpdateBookBox.vue';

   export default {
        name: 'DetailNXB',
        components: { AskBox, UpdateBookBox },
       data(){
           return{
               idNXB: '',
               sachByNXB: [],
               ok_snackbar: false,
              
               newNV: true,
               search:'',
               nameNewBook: '',
               nameNewDesBook: '',
               fileNewBook:'',
               showMore: false,  
               showAddBox: false,   
               overlay: false,
               showAskDelete: false,
                idBookDelete: '',
                snackbar: false,
                snackbarText: '',
                timeout: 2000,
                isRendered: '',
                showUpdateBookBox: false,
                idBookSelect: '',
                rail: true,
                notFoundBook: false,
                arrProxy: [],

                displayAdd: true,
                displayUpdate: true,
                
                valid: true,
                nameBookRules: [
                    v => !!v || 'Bạn cần nhập tên sách',
                    v => (v && v.length > 0) || 'Tên sách không được để trống',
                ],
                desBookRules: [
                    v => !!v || 'Bạn cần nhập mô tả',
                    v => (v && v.length > 0) || 'Mô tả không được để trống',
                ],
                imgBookRules: [
                    v => !!v || 'Bạn cần thêm hình',
                    v => (v && v.length > 0) || 'Hình không được để trống',
                ],

           }
       },
       

       mounted(){
            const arrSachByNXB = []
            this.sachByNXB = arrSachByNXB

            let user = window.localStorage.getItem("user-info");
            let idNXB = window.localStorage.getItem("idNXB");
            let userPermission = JSON.parse(window.localStorage.getItem("user-permission"))
            this.idNXB = idNXB


            if(userPermission === 0){
                this.isRendered = true
                this.displayAdd = true
                this.displayUpdate = true
            }
            else {
                this.isRendered = false
                this.displayAdd = false
                this.displayUpdate = false
            }


            if (!user) {
                router.push('/')
            }
            else {
                this.getDataBook();
            }

            if (!idNXB) {
                router.push('/home')
            }
       },
   
       methods:{

        async searchBook(){

            if(this.search === ''){
                this.sachByNXB = []

                this.getDataBook();
            }
            else{
                let result = await axios.get(`/FindSach/${this.search}/${this.idNXB}`)
                if (result.status == 200 && result.data.length > 0) {
                    this.notFoundBook = false
                    this.sachByNXB = []
                    this.sachByNXB.push(...result.data);
                }
                else {
                    this.sachByNXB = []
                    this.notFoundBook = true
                    setTimeout(() => {
                        this.notFoundBook = false
                    }, 2000)
                    
                }
            }
        
        },

        openCloseRail(){
            this.rail = !this.rail

        },

        openCloseUpdateBox(){
            this.showUpdateBookBox = !this.showUpdateBookBox
        },

        openCloseAskDelete(idBook){
            this.idBookDelete = idBook
            this.showAskDelete = !this.showAskDelete
        },

        updateSach(idBook){
            this.idBookSelect = idBook
            this.showUpdateBookBox = true
        },

         getDataBook() {
            this.sachByNXB = []
            this.notFoundBook = false

            axios.get(`/DetailNXB/${this.idNXB}`)
                .then(response => {
                    this.sachByNXB.push(...response.data);
                    console.log(this.sachByNXB)
                })
        },

        moveToHomePage(){
            router.push("home")
        },

        signOut(){     
            localStorage.removeItem("user-info");
            localStorage.removeItem("idNXB");
            localStorage.removeItem("user-permission");
            router.push('/')
        },

        handleAddBookBox(){
            var addbox = document.querySelector('.addbox')
            if(addbox.style.display === 'none'){
                addbox.style.display = 'block'
            }
            else{
                addbox.style.display = 'none'
            }
        },

        async addNewBook(){
            var fileCheck = Object.assign({}, this.fileNewBook)
         

            if(this.nameNewBook === '' || this.nameNewDesBook === '' || Object.keys(fileCheck).length === 0){
                const { valid } = await this.$refs.form.validate()      
            }
            else{
                console.log(fileCheck[0].name)

                let result = await axios.post('/AddSach',{
                    "TenSach": `${this.nameNewBook}`,
                    "MoTa": `${this.nameNewDesBook}`,
                    "MaNXB": this.idNXB,
                    "Image": `${fileCheck[0].name}`
                })


                if (result.status == 200 && result.data.length > 0) {
                    this.getDataBook();
                    this.snackbar = true
                    this.snackbarText = 'Thêm thành công';

                    setTimeout(() => {
                        location.reload()
                    },1000)

                    }

                else{
                    this.snackbar = true
                    this.snackbarText = 'Thêm không thành công';
                }
            } 
        },

        async deleteBook(){
            let result = await axios.delete(`/DeleteSach/${this.idBookDelete}`)
            
            if (result.status == 200 && result.data.length > 0) {
                this.getDataBook();
                location.reload()
            }
            else {
                this.snackbar = true
                this.snackbarText = 'Xóa không thành công';
            }

        },


       }   
   }
   </script>
   
   <style scoped>

   .header{
        width: 100%;
        position: fixed; 
        z-index: 2;
        left: 0px;
   }

   .cover-add-new{
        position: fixed;
        right: 0;
        bottom: 0;
        margin-bottom: 80px;
        z-index: 100;
   }


   .box-cover{
    display: flex;
        width: 50%;
        margin: auto;

        max-height: 1000px;
        padding: 20px;
        box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
        border-radius:20px;
        border: thin solid rgba(84, 84, 87, 0.25);   
   }
   
   .btn-sign-out{
        margin-top: 20px;
        display: none;
    }

   .container-box + .container-box{
       margin-top: 20px;
   }

   .info-book{
        padding-left: 50px;
   }

   .book-title{
        font-weight: 500;
        font-size: 30px;
   }

   .book-des{
        font-size: 20px;
   }

   .img-book{
        height: 300px;
        display: flex;
        align-items: center;
        justify-content: center;
   }
   
   .book-image-cover{
        object-fit: cover;
    }

    .overlay{
        display: flex;
        align-items: center;
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-color: rgba(0,0,0, 0.4);
        z-index: 3;
    }

    .addbox{
        display: none;
    }

    .form-add-book{
        width: 800px;
        margin: 0 auto;
        height: auto;
        background-color: white;
        box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
        border-radius: 12px;
        padding: 20px;
    }

    .btn-form-add{
        color: white !important;
        width: 100%;
        background-color: #1565C0;
        
    }

    .btn-form-cancel{
        color: black !important;
        width: 100%;
        background-color: gainsboro;
        
    }


    /* toast  */
    .toast{
        background-color: #1565C0;
        position: absolute;
        top: 20px;
        right: 10px;
        border-radius: 15px;
        height: 60px;
        width: 250px;
        display: flex;
        align-items: center;
        animation: slideIn  ease 1.5s, fadeOut linear 1s 3s;
        box-shadow: -1px 2px 10px 0px rgba(0,0,0,0.75);
        z-index: 1000;
    }
    .toast-message{
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        color: white;
    }
    .toast-icon{
        height: 30px;
        padding: 0 10px;
    }
    @keyframes slideIn{
        from {
            right: -40px;       
            opacity: 0;
        }
        to {
            right: 10px;
            opacity: 1;
        }
    }
    @keyframes fadeOut{
        to{
            opacity: 0;
        }
    }
   
   </style>