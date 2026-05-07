<script setup>
import { ref } from 'vue';
import axios from 'axios';


let v_name = ref('');
let v_password = ref('');
let v_description = ref('');
let v_profilepictureURL = ref('');
let v_email = ref('');

let serverMessage = ref('');
let insertedID = ref('');


function sendData(){
    axios.post('http://localhost:3000/client',{
    name : v_name.value,
    password : v_password.value,
    description : v_description.value,
    profilepictureURL : v_profilepictureURL.value,
    email : v_email.value
    })
    .then((response)=> {
      serverMessage.value = response.message;
      insertedID.value = "Ihre ClientFK: "+response.data.insertId;
    })
    .catch((error) => console.log(error))
}


</script>

<template>

    <div class="registration-box">
        <div class="registration-title">Registration</div>
        <div class="registration-subtitle">Client</div>
        <p>Name</p>
        <input v-model="v_name">
        <p>Password</p>
        <input v-model="v_password">
        <p>Description</p>
        <input v-model="v_description">
        <p>ProfilepictureURL</p>
        <input v-model="v_profilepictureURL">
        <p>Email</p>
        <input v-model="v_email" type="email">
        <button @click="sendData()">senden</button>
        <p>{{ insertedID }}</p>

        
    </div>


</template>
<style scoped>
    /*.registration-box {
      width: 250px;
      height: 200px;
      border-radius: 20px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }*/

    .registration-title {
      font-weight: bold;
      font-size: 1.1em;
      margin-bottom: 10px;
    }

    .registration-subtitle {
      font-size: 0.9em;
    }
</style>