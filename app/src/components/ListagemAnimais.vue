<template xmlns:v-slot="http://www.w3.org/1999/XSL/Transform">
    <v-container fluid>
        <v-row>
            <v-col cols="12">
                <v-row
                        align="center"
                        justify="center"
                        class="grey lighten-5"
                        style="height: 300px;"
                >

                    <v-card
                            v-for="animal in animais"
                            :key="animal.id"
                            class="ma-3 pa-6"
                            shaped
                            raised
                            outlined
                            tile
                            min-height="255"
                            max-width="344"
                            min-width="260"
                            v-bind:style="{background:(animal.estado ==='Morto' ? '#e3f2fd' : '#90caf9')}"
                    >
                        <!-- blue lighten-5 -->
                        <v-list-item>
                            <v-list-item-content>
                                <v-list-item-title class="headline">
                                    <v-icon v-if="animal.especie_nome === 'Cachorro'">mdi-dog</v-icon>
                                    <v-icon v-if="animal.especie_nome === 'Gato'">mdi-cat</v-icon>
                                    {{animal.nome_animal}}
                                    <v-icon v-if="animal.estado === 'Morto'">mdi-grave-stone</v-icon>
                                </v-list-item-title>

                            </v-list-item-content>
                        </v-list-item>
                        <v-container>
                            <div v-if="animal.numero_chip">Número do Chip: {{animal.numero_chip}}</div>
                            <v-row>
                                <v-col cols="6" sm="6" md="6">
                                    <div>Sexo: {{(animal.sexo ? (animal.sexo === 'F' ? 'Fêmea' : 'Macho') : '---')}}</div>
                                </v-col>
                                <v-col cols="6" sm="6" md="6">
                                    <div>Idade: {{(animal.idade ? (animal.idade === '1' ? animal.idade+' ano' : animal.idade+' anos') : '---')}}</div>
                                </v-col>
                            </v-row>
                        </v-container>
                        <v-card-actions>
                            <v-spacer></v-spacer>
                            <v-btn @click="modalEditar(animal)">Editar</v-btn>
                        </v-card-actions>
                    </v-card>
                </v-row>
            </v-col>
        </v-row>

        <!-- Botão Inserir Novo Animal -->
        <v-fab-transition>
            <v-btn
                    @click="modalInserir"
                    color="primary"
                    fixed
                    bottom
                    right
                    fab
            >
                <v-icon>mdi-plus</v-icon>
            </v-btn>
        </v-fab-transition>

        <v-row justify="center">
            <v-dialog v-model="showInsertEditDialog" max-width="600px">
                <v-card>
                    <v-card-title>
                        <span class="headline">{{((editar? 'Editar Animal' : 'Inserir Novo Animal'))}}</span>
                    </v-card-title>
                    <v-card-text>
                        <v-container>
                            <v-row>
                                <!-- Input de Nome -->
                                <v-col cols="12" sm="12" md="12">
                                    <v-text-field label="Nome*" v-model="formData.nome_animal"></v-text-field>
                                </v-col>
                                <!-- /Input de Nome-->

                                <!-- Input Número do Chip -->
                                <v-col cols="12" sm="12" md="12">
                                    <v-text-field label="Número do Chip" v-model="formData.numero_chip"></v-text-field>
                                </v-col>
                                <!-- /Input Número do Chip -->

                                <!-- Input Raça -->
                                <v-col cols="12" sm="12" md="12">
                                    <v-combobox
                                            v-model="formData.raca"
                                            :items="racas"
                                            label="Selecione uma raça ou insira uma nova"
                                    ></v-combobox>
                                </v-col>
                                <!-- /Input de Raça -->

                                <!-- Input de Gênero-->
                                <v-col cols="6" sm="6" md="6">
                                    <v-container fluid>
                                        <p>Gênero</p>
                                        <v-radio-group v-model="formData.sexo" row>
                                            <v-radio label="Fêmea" value="F" color="primary"></v-radio>
                                            <v-radio label="Macho" value="M" color="red"></v-radio>
                                        </v-radio-group>
                                    </v-container>
                                </v-col>
                                <!-- /Input de Gênero -->

                                <!-- Input de Espécie-->
                                <v-col cols="6" sm="6" md="6">
                                    <v-container fluid>
                                        <p>Espécie*</p>
                                        <v-radio-group v-model="formData.especie_codigo" row>
                                            <v-radio label="Cachorro" value="1" color="primary"></v-radio>
                                            <v-radio label="Gato" value="2" color="primary"></v-radio>
                                        </v-radio-group>
                                    </v-container>
                                </v-col>
                                <!-- /Input de Espécie -->

                                 <!--Input Data Nascimento-->
                                <v-col cols="12" sm="12" md="12">
                                    <template>
                                        <v-menu
                                                ref="menuNascimento"
                                                v-model="menuNascimento"
                                                :close-on-content-click="false"
                                                transition="scale-transition"
                                                offset-y
                                                min-width="290px"
                                        >
                                            <template v-slot:activator="{ on }">
                                                <v-text-field
                                                        v-model="formData.data_nascimento_formatada"
                                                        label="Data de Nascimento"
                                                        readonly
                                                        v-on="on"
                                                ></v-text-field>
                                            </template>
                                            <v-date-picker
                                                    ref="pickerNascimento"
                                                    v-model="formData.data_nascimento"
                                                    :max="new Date().toISOString().substr(0, 10)"
                                                    locale="pt-BR"
                                                    min="1950-01-01"
                                                    @change="salvarDataNascimento"
                                            ></v-date-picker>
                                        </v-menu>
                                    </template>
                                </v-col>
                                <!-- /Input Data Nascimento -->

                                <!--Input Data Falecimento-->
                                <v-col cols="12" sm="12" md="12" v-if="editar">
                                    <template>
                                        <v-menu
                                                ref="menuFalecimento"
                                                v-model="menuFalecimento"
                                                :close-on-content-click="false"
                                                transition="scale-transition"
                                                offset-y
                                                min-width="290px"
                                        >
                                            <template v-slot:activator="{ on }">
                                                <v-text-field
                                                        v-model="formData.data_falecimento_formatada"
                                                        label="Data de Falecimento"
                                                        readonly
                                                        v-on="on"
                                                ></v-text-field>
                                            </template>
                                            <v-date-picker
                                                    ref="pickerFalecimento"
                                                    v-model="formData.data_falecimento"
                                                    :max="new Date().toISOString().substr(0, 10)"
                                                    locale="pt-BR"
                                                    min="1950-01-01"
                                                    @change="salvarDataFalecimento"
                                            ></v-date-picker>
                                        </v-menu>
                                    </template>
                                </v-col>
                                <!-- /Input Data Falecimento -->

                            </v-row>
                        </v-container>
                        <small>*Campos obrigatórios</small>
                    </v-card-text>
                    <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn color="value" text @click="showInsertEditDialog = false">Fechar</v-btn>
                        <v-btn color="value" text @click="inserirEditarAnimal(formData)">{{(editar? 'Editar' : 'Inserir')}}</v-btn>
                    </v-card-actions>
                </v-card>
            </v-dialog>
        </v-row>

        <v-snackbar v-model="snackbar" :color="snackColor" top>
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
            animais: [],
            racas: [],
            // Variável responsável pelo modo editar ou inserir no formulário
            editar: false,
            menuNascimento: false,
            menuFalecimento: false,
            showInsertEditDialog: false,
            dialog: false,
            formData: {},
            snackbar: false,
            snackText: "",
            snackColor: "",
        }),
        mounted () {
            this.listarAnimais();
            this.listarRacas();
        },
        watch: {
            menuNascimento (val) {
                val && setTimeout(() => (this.$refs.pickerNascimento.activePicker = 'YEAR'))
            },
            menuFalecimento (val) {
                val && setTimeout(() => (this.$refs.pickerFalecimento.activePicker = 'YEAR'))
            },
        },
        methods: {
            inserirEditarAnimal (formData){
                // Valida o campo Nome
                if(formData.nome_animal === "" || typeof formData.nome_animal === 'undefined'){
                    this.snackText = "Nome é um campo obrigatório";
                    this.snackbar = true;
                    this.snackColor = 'danger';
                }
                // Valida o campo Espécie
                else if(typeof formData.especie_codigo === 'undefined'){
                    this.snackText = "Espécie é um campo obrigatório";
                    this.snackbar = true;
                }
                else {
                    if (this.editar) {
                        axios.put('https://apiabrigonovolar.serveo.net'+'/api/animais/atualizar_animal/' + formData.id, formData).then(response => {
                            this.listarAnimais();
                            // Lista novamente as raças caso tenha sido inserida uma nova
                            if(typeof formData.raca === 'string'){
                                this.listarRacas();
                            }
                            this.showInsertEditDialog = false;
                            this.tratamentoSucesso(response.data.mensagem);
                        }).catch(response =>{ this.tratamentoErroServidor(response)});
                    } else {
                        axios.post('https://apiabrigonovolar.serveo.net'+'/api/animais/inserir_animal', formData).then(response => {
                            this.listarAnimais();
                            // Lista novamente as raças caso tenha sido inserida uma nova
                            if(typeof formData.raca === 'string'){
                                this.listarRacas();
                            }
                            this.showInsertEditDialog = false;
                            this.tratamentoSucesso(response.data.mensagem);
                        }).catch(response =>{ this.tratamentoErroServidor(response)});
                    }
                }
            },
            formataData (data) {
                if (!data) return null;
                const [year, month, day] = data.split('-');
                return `${day}/${month}/${year}`;
            },
            salvarDataNascimento (data) {
                this.formData.data_nascimento_formatada = this.formataData(data);
                this.$refs.menuNascimento.save(data)
            },
            salvarDataFalecimento (data) {
                this.formData.data_falecimento_formatada = this.formataData(data);
                this.$refs.menuFalecimento.save(data)
            },
            modalInserir (){
                // Limpa os campos
                this.formData = {};

                // Seta modo edição como falso
                this.editar = false;

                // Abre o modal de formulário
                this.showInsertEditDialog = true;
            },
            modalEditar (animal){
                // Seta os campos do formulário de acordo com o card que foi clicado
                this.formData = Object.assign({}, animal);
                this.formData.data_nascimento_formatada = this.formataData(this.formData.data_nascimento);
                this.formData.data_falecimento_formatada = this.formataData(this.formData.data_falecimento);
                this.formData.raca = {"text": this.formData.nome_raca, "value": this.formData.raca_id};
                delete this.formData.nome_raca;
                delete this.formData.raca_id;

                // Seta modo edição
                this.editar = true;

                // Abre o modal de formulário
                this.showInsertEditDialog = true;

            },
            listarAnimais () {
                axios.get('https://apiabrigonovolar.serveo.net'+'/api/animais/listar_animais').then(response => {
                    this.animais = response.data;
                }).catch(() =>{ this.tratamentoErroServidor()});
            },
            listarRacas () {
                axios.get('https://apiabrigonovolar.serveo.net'+'/api/racas/listar_racas').then(response => {
                    this.racas = response.data;
                }).catch(error =>{ this.tratamentoErroServidor(error)});
            },
            tratamentoErroServidor(error) {
                if (error.response) {
                    this.snackText = error.response.data.error.description;
                    this.snackColor = 'error';
                    this.snackbar = true;
                }
                else{
                    this.snackText = "O servidor parece estar offline. Consulte o setor de sistemas.";
                    this.snackbar = true;
                }
            },
            tratamentoSucesso(mensagem) {
                    this.snackText = mensagem;
                    this.snackColor = 'success';
                    this.snackbar = true;
            },
        },
    }
</script>