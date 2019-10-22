<template xmlns:v-slot="http://www.w3.org/1999/XSL/Transform">
    <v-container fluid>
        <v-expansion-panels v-model="panel">
            <v-expansion-panel>
                <v-expansion-panel-header>Filtros

                </v-expansion-panel-header>
                <v-expansion-panel-content>
                    <v-row>

                        <v-col cols="12" sm="6" md="3">
                            <v-container fluid>
                                <v-radio-group v-model="filterData.especie_codigo" @change="filtrarAnimais(filterData)" row>
                                    <v-radio label="Cachorro" value="1" color="primary"></v-radio>
                                    <v-radio label="Gato" value="2" color="primary"></v-radio>
                                </v-radio-group>
                            </v-container>
                        </v-col>

                        <v-col cols="12" sm="6" md="3">
                                <v-combobox
                                        v-model="filterData.raca"
                                        :items="racas"
                                        label="Raça"
                                        @change="filtrarAnimais(filterData)"
                                        @keyup="filtrarAnimais(filterData)"
                                ></v-combobox>
                        </v-col>

                        <v-col cols="12" sm="6" md="3">
                            <v-text-field
                                    v-model="filterData.idade"
                                    @keyup="filtrarAnimais(filterData)"
                                    label="Idade"
                            ></v-text-field>
                        </v-col>

                        <v-col cols="12" sm="6" md="3">
                            <v-container fluid>
                                <v-radio-group v-model="filterData.sexo" @change="filtrarAnimais(filterData)" row>
                                    <v-radio label="Fêmea" value="F" color="primary"></v-radio>
                                    <v-radio label="Macho" value="M" color="primary"></v-radio>
                                </v-radio-group>
                            </v-container>
                        </v-col>
                    </v-row>
                    <v-row align="center" justify="center">
                        <v-tooltip bottom>
                            <template v-slot:activator="{ on }">
                                <v-btn v-on="on" text icon center color="red" @click="filterData = {}; animaisFiltrados = animais">
                                    <v-icon>mdi-close-circle</v-icon>
                                </v-btn>
                            </template>
                            <span>Limpar Filtros</span>
                        </v-tooltip>
                    </v-row>
                </v-expansion-panel-content>
            </v-expansion-panel>
        </v-expansion-panels>
        <v-row>
            <v-col cols="12">
                <v-row
                        align="center"
                        justify="center"
                        class="grey lighten-5"
                        style="height: 300px;"
                >
                    <v-card
                            v-for="animal in animaisFiltrados"
                            :key="animal.id"
                            class="ma-3 pa-6"
                            outlined
                            tile
                            max-width="240"
                            color="#90caf9"
                    >
                        <v-list-item>
                            <v-list-item-content>
                                <v-list-item-title class="headline">
                                    <v-icon v-if="animal.especie_nome === 'Cachorro'">mdi-dog</v-icon>
                                    <v-icon v-if="animal.especie_nome === 'Gato'">mdi-cat</v-icon>
                                    {{animal.nome_animal}}
                                </v-list-item-title>

                            </v-list-item-content>
                        </v-list-item>
                        <v-container>
                            <v-row>
                                <v-col cols="12" sm="12" md="12">
                                    <div>Sexo: {{(animal.sexo ? (animal.sexo === 'F' ? 'Fêmea' : 'Macho') : '---')}}</div>
                                </v-col>
                                <v-col cols="12" sm="12" md="12">
                                    <div>Idade: {{(animal.idade ? (animal.idade === '1' ? animal.idade+' ano' : animal.idade+' anos') : '---')}}</div>
                                </v-col>
                            </v-row>

                        </v-container>
                    </v-card>
                </v-row>
            </v-col>
        </v-row>

        <v-snackbar v-model="snackbar" v:color="snackColor" top>
            {{ snackText }}
            <v-btn dark text @click="snackbar = false">
                Fechar
            </v-btn>
        </v-snackbar>

    </v-container>
</template>

<script>
    import axios from 'axios'

    export default {
        data: () => ({
            panel: 0,
            animais: [],
            racas: [],
            filterData: {},
            animaisFiltrados: [],
            snackbar: false,
            snackText: "",
            snackColor: "",
        }),
        mounted () {
            this.listarAnimais();
            this.listarRacas();
        },
        methods: {
            filtrarAnimais (filterData){
                this.animaisFiltrados = this.animais;

                // Filtro de Espécie
                if(typeof filterData.especie_codigo !== 'undefined' && filterData.especie_codigo !== null){
                    this.animaisFiltrados = this.animaisFiltrados.filter(function(animal) {
                        return animal.especie_codigo === filterData.especie_codigo;
                    });
                }

                // Filtro de Raça
                if(typeof filterData.raca !== 'undefined' && filterData.raca !== null && filterData.raca !== ""){
                    /* eslint-disable no-console */
                    console.log(filterData.raca);
                    /* eslint-enable no-console */
                    this.animaisFiltrados = this.animaisFiltrados.filter(function(animal) {
                        return animal.nome_raca === filterData.raca.text;
                    });
                }

                //Filtro de Idade
                if(typeof filterData.idade !== 'undefined' && filterData.idade !== null && filterData.idade != ""){
                    this.animaisFiltrados = this.animaisFiltrados.filter(function(animal) {
                        return animal.idade === filterData.idade;
                    });
                }

                //Filtro de Sexo
                if(typeof filterData.sexo !== 'undefined' && filterData.sexo !== null){
                    this.animaisFiltrados = this.animaisFiltrados.filter(function(animal) {
                        return animal.sexo === filterData.sexo;
                    });
                }
            },
            listarAnimais () {
                axios.get('http://localhost:8090/api/animais/listar_animais').then(response => {
                    this.animais = response.data.filter(function(animal) {
                        return animal.estado === "Vivo";
                    });
                    this.animaisFiltrados = this.animais;
                }).catch(() =>{ this.tratamentoServidorOffline()});
            },
            listarRacas () {
                axios.get('http://localhost:8090/api/racas/listar_racas').then(response => {
                    this.racas = response.data
                }).catch(() =>{ this.tratamentoServidorOffline()});
            },
            tratamentoServidorOffline() {
                this.snackText = "O servidor parece estar offline. Consulte o setor de sistemas.";
                this.snackbar = true;
            }
        },
    }
</script>