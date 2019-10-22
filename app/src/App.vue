<template>
    <v-app id="inspire">
        <v-navigation-drawer
                v-model="drawer"
                app
                clipped
        >
            <v-list dense>
                    <v-list-item @click.stop="$router.push('/listagem_animais').catch(err => {})">
                        <v-list-item-action>
                            <v-icon>mdi-paw</v-icon>
                        </v-list-item-action>
                        <v-list-item-content>
                            <v-list-item-title>Animais</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                    <v-list-item @click.stop="$router.push('/catalogo_adocao').catch(err => {})">
                        <v-list-item-action>
                            <v-icon>mdi-format-list-bulleted</v-icon>
                        </v-list-item-action>
                        <v-list-item-content>
                            <v-list-item-title>Catálogo para Adoção</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
            </v-list>
        </v-navigation-drawer>

        <v-app-bar
                app
                clipped-left
        >
            <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
            <v-toolbar-title>Abrigo de Animais - Novo Lar</v-toolbar-title>
        </v-app-bar>

        <v-content>
            <router-view></router-view>

            <!--<FormAnimal/>-->
        </v-content>

        <v-footer app>
            <span>&copy; 2019 - Abrigo Novo Lar</span>
        </v-footer>
    </v-app>
</template>

<script>
    export default {
        name: 'App',
        props: {
            source: String,
        },
        data: () => ({
            drawer: false,
        }),
    }
</script>