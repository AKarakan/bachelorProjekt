<script setup>
import AssignemntReg from './components/assignment/assignemntReg.vue';
import ClientReg from './components/Clients/clientReg.vue';
import RegistrationsArea from './components/registrations-area/registrations-area.vue';
import TesterReg from './components/tester/testerReg.vue';

</script>

<template>
  <RegistrationsArea>
    <ClientReg/>
    <TesterReg/>
    <AssignemntReg/>
  </RegistrationsArea>
</template>

<style>
    body {
      font-family: Arial, sans-serif;
      color: black;
      margin: 20px;
      background: bisque;
      list-style: none;
    }

    div {
      border: 1px solid black;
      padding: 10px;
      margin: 5px;
      box-sizing: border-box;
    }
</style>