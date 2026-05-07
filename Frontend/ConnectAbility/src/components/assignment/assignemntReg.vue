<script setup>
import axios from 'axios';
import { ref } from 'vue';

let v_clientFk = ref('');
let v_title = ref('');
let v_description = ref('');
let v_site = ref('');
let v_site_ZipCode = ref('');
let v_site_Adress = ref('');
let v_assistenceSystems = ref([]);
let v_requiredNeeds = ref('');
let v_hourlyRate = ref('55.55');
let v_timeRequired = ref('10');


function sendData(){
  axios.post("http://localhost:3000/assignment",{
    ClientFk : v_clientFk.value,
    Title : v_title.value,
    Description : v_description.value,
    Site : v_site.value,
    Site_ZipCode : v_site_ZipCode.value,
    Site_Adress : v_site_Adress.value,
    HourlyRate : v_hourlyRate.value,
    TimeRequired : v_timeRequired.value,
    AssistenceSystems : v_assistenceSystems.value,
    RequiredNeeds : v_requiredNeeds.value
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
          <p>ClientFk</p>
          <input v-model="v_clientFk">
          <p>Title</p>
          <input v-model="v_title">
          <p>Description</p>
          <input v-model="v_description">
          <p>PLZ</p>
          <input v-model="v_site_ZipCode">
          <p>Addresse</p>
          <input v-model="v_site_Adress">
        </div>
        <div class="needs">
          <p>Needs (bitte mit ',' trennen)</p>
          <input v-model="v_requiredNeeds">
        </div>
        <div class="Asys">
          <p>Assistenz Systeme</p>
          <input type="checkbox" id="Braillezeile" value="Braillezeile" v-model="v_assistenceSystems" />
          <label for="Braillezeile">Braillezeile</label>
          <input type="checkbox" id="Zoom" value="Zoom" v-model="v_assistenceSystems" />
          <label for="Zoom">Zoom</label>
          <input type="checkbox" id="InvertierteFarben" value="Invertierte Farben" v-model="v_assistenceSystems" />
          <label for="InvertierteFarben">Invertierte Farben</label>
          <input type="checkbox" id="Screendreader" value="Screendreader" v-model="v_assistenceSystems" />
          <label for="Screendreader">Screendreader</label>
        </div>
        <div class="workingsite">
          <p>Reisebereitschaft</p>
          <input type="radio" id="Remote" value="Remote" v-model="v_site" />
          <label for="Remote">Remote</label>
          <input type="radio" id="OnSite" value="OnSite" v-model="v_site" />
          <label for="OnSite">Onsite</label>
          <input type="radio" id="Hybrid" value="Hybrid" v-model="v_site" />
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