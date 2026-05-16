<script setup>
import axios from 'axios';
import { ref } from 'vue';

let v_clientFk = ref('0');
let v_title = ref('');
let v_description = ref('');
let v_site = ref('');
let v_site_ZipCode = ref('');
let v_site_Adress = ref('');
let v_assistenceSystems = ref([]);
let v_requiredNeeds = ref('');
let v_distance = ref('0');
let v_hourlyRate = ref('55.55');
let v_timeRequired = ref('10');

let v_reqAsys = ref([]);
let v_candidates = ref([]);
let v_einCandidadteAsys = ref([]);

function sendAssignmentData(){
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
  .then((response) => {
    console.log(response.data.insertId);
    axios.get(`http://localhost:3000/assignment/${response.data.insertId}/candidates/${v_distance.value}`)
    .then((response2)=>{
      let x = response2.data.Asys+"";
      v_reqAsys.value = x.split(',');
      v_candidates.value = response2.data.candidaten;
    })
  })
  .catch((error) => {console.log(error)})
}

function zumEntfernen(zumEntfernen){
  let temp = v_reqAsys.value;
  temp = temp+"";
  zumEntfernen = zumEntfernen+"";
  
  temp = temp.split(',');
  zumEntfernen = zumEntfernen.split(',');

  v_reqAsys.value = temp.filter((elem)=> zumEntfernen.includes(elem));
  
  if(v_reqAsys.value.length == 0) v_reqAsys.value = ["Alle Assistiven Technologien abgedeckt!"];
  
}

</script>


<template>
    <div class="registration-box">
        <div class="registration-title">Registration</div>
        <div class="registration-subtitle">Auftrag</div>
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
          <input type="checkbox" id="a_Braillezeile" value="Braillezeile" v-model="v_assistenceSystems" />
          <label for="a_Braillezeile">Braillezeile</label>
          <input type="checkbox" id="a_Zoom" value="Zoom" v-model="v_assistenceSystems" />
          <label for="a_Zoom">Zoom</label>
          <input type="checkbox" id="a_HoherKontrast" value="Hoher Kontrast" v-model="v_assistenceSystems" />
          <label for="a_HoherKontrast">Hoher Kontrast</label>
          <input type="checkbox" id="a_Screenreader" value="Screenreader" v-model="v_assistenceSystems" />
          <label for="Screenreader">Screenreader</label>
        </div>
        <div class="workingsite">
          <p>Reisebereitschaft</p>
          <input type="radio" id="a_Remote" value="Remote" v-model="v_site" />
          <label for="a_Remote">Remote</label>
          <input type="radio" id="a_OnSite" value="OnSite" v-model="v_site" />
          <label for="a_OnSite">Onsite</label>
          <input type="radio" id="a_Hybrid" value="Hybrid" v-model="v_site" />
          <label for="a_Hybrid">Hybrid</label>
        </div>
        <div calss="distance">
          <p>Entfernun (Umkreis KM)</p>
          <input type="number" name="Distance" id="Distance" v-model="v_distance">
        </div>
        <button @click="sendAssignmentData()">Senden</button>
    </div>

    <div class="reqiredAsys-box">
      <label id="reqAsys">Sie haben folgende Assistenz Systeme Angefordert: </label>
      <li v-for="x in v_reqAsys.values()">
        <label for={{ x }}>{{ x }}</label>
      </li>
      <div class="candidates-box">
        <li v-for="einCandidat in v_candidates">
          <div class="einCandidate">
            <label for="Vorname">Name: {{ einCandidat.vorname +" "}} </label>
            <label for="Nachname"> {{ einCandidat.nachname }} </label>
            <div>
              <label for="tAsys"> Assiste Systeme : 
                <li v-for="einAsys in JSON.parse(JSON.parse(JSON.stringify(einCandidat.tAsys))).Asys">{{ einAsys }}</li>
              </label>
            </div>
            <button type="button" @click="zumEntfernen(JSON.parse(JSON.parse(JSON.stringify(einCandidat.tAsys))).Asys)">Kontakt</button>
          </div>
        </li>
    </div>

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