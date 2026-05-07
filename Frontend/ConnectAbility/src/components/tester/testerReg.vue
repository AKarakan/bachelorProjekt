<script setup>
import axios from 'axios';
import { ref } from 'vue';

let	v_name = ref('');
let	v_surName = ref('');
let	v_password = ref('');
let	v_zipCode = ref('');
let	v_adress = ref('');
let	v_email = ref('');
let	v_phoneNumber = ref('');
let	v_profilePicture = ref('');
let	v_needs = ref([]);
let	v_asys = ref([]);
let	v_workingSite = ref('');
let serverMessage = ref('');


function sendData(){
  axios.post("http://localhost:3000/tester",{

    Name : v_name.value,
    SurName : v_surName.value,
    Password : v_password.value,
    ZIPCode : v_zipCode.value,
    Adress : v_adress.value,
    Email : v_email.value,
    PhoneNumber : v_phoneNumber.value,
    ProfilePicture : v_profilePicture.value,
    Needs : v_needs.value,
    Asys : v_asys.value,
    WorkingSite : v_workingSite.value

  })
  .then((response) => {console.log(response.data)})
  .catch((error) => {console.log(error)})
}

</script>


<template>
    <div class="registration-box">
        <div class="registration-title">Registration</div>
        <div class="registration-subtitle">Test Person</div>
        <div class="personals">
          <p>Name</p>
          <input v-model="v_name">
          <p>NachName</p>
          <input v-model="v_surName">
          <p>Password</p>
          <input v-model="v_password">
          <p>PLZ</p>
          <input v-model="v_zipCode">
          <p>Addresse</p>
          <input v-model="v_adress">
          <p>Email</p>
          <input v-model="v_email">
          <p>Telefon Nummer</p>
          <input v-model="v_phoneNumber">
          <p>Profilbild (link)</p>
          <input v-model="v_profilePicture">
        </div>
        <div class="needs">
          <p>Needs (bitte mit ',' trennen)</p>
          <input v-model="v_needs">
        </div>
        <div class="Asys">
          <p>Assistenz Systeme</p>
          <input type="checkbox" id="Braillezeile" value="Braillezeile" v-model="v_asys" />
          <label for="Braillezeile">Braillezeile</label>
          <input type="checkbox" id="Zoom" value="Zoom" v-model="v_asys" />
          <label for="Zoom">Zoom</label>
          <input type="checkbox" id="InvertierteFarben" value="Invertierte Farben" v-model="v_asys" />
          <label for="InvertierteFarben">Invertierte Farben</label>
          <input type="checkbox" id="Screendreader" value="Screendreader" v-model="v_asys" />
          <label for="Screendreader">Screendreader</label>
        </div>
        <div class="workingsite">
          <p>Reisebereitschaft</p>
          <input type="radio" id="Remote" value="Remote" v-model="v_workingSite" />
          <label for="Remote">Remote</label>
          <input type="radio" id="OnSite" value="OnSite" v-model="v_workingSite" />
          <label for="OnSite">Onsite</label>
          <input type="radio" id="Hybrid" value="Hybrid" v-model="v_workingSite" />
          <label for="Hybrid">Hybrid</label>
        </div>
        <button @click="sendData()">Senden</button>
    </div>
</template>

<style scoped>
    .registration-title {
      font-weight: bold;
      font-size: 1.1em;
      margin-bottom: 10px;
    }

    .registration-subtitle {
      font-size: 0.9em;
    }

    .personals{
      border-color: bisque;
      border-width: 10px;
    }
</style>