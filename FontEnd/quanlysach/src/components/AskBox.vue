<template>

    <div>
        <BoxContainer  :widthBox="width" :heightBox="height" >
        <template #header>
            <div class="header-box">
                    <h3>{{titleBox}}</h3>

                    <div class="close-ask-box" >
                        <img src="https://img.icons8.com/fluency-systems-regular/20/000000/x.png" class="close-icon" @click="closeBox()">    
                    </div>
                </div>
        </template>

        <template #content >
            <v-btn variant="flat"
            color="error"
            @click="closeBox">

            Hủy
            </v-btn>

            <v-btn
            variant="flat"
            color="info"
            @click="confirmDelete"
            >
            {{actionButton}}
            </v-btn>

        </template>


    
    </BoxContainer>


</div>
</template>

<script>
import BoxContainer from './BoxContainer.vue';

export default {
    name: "AskBox",
    props: ['widthBox', 'heightBox', 'title', 'actionButton'],
    components: { BoxContainer },
    data() {
        return {
            width: this.widthBox,
            height: this.heightBox,       
            loading: true,
            titleBox: this.title,
            actionButton: this.actionButton
        }
    },
    computed:{
        cssProps(){
            return {
                '--widthBox': this.width,
                '--heightBox': this.height
            }
        }   
    },

    methods:{
        confirmDelete(){
            this.$emit('confirm')
        },

        closeBox(){
            this.$emit('close-box')
        },

    }
}

</script>

<style>

.line-break{
    border: 1px solid #E7E9EB;
}
.close-icon{
    width: 20px;
    height: 20px;
    
}

.header-box{
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.close-icon:hover{
    cursor: pointer;
}

.loading{
   height: 100px;
}
</style>