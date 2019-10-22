import Vue from 'vue'
import VueRouter from 'vue-router'
import ListagemAnimais from '../components/ListagemAnimais.vue'
import CatalogoAdocao from '../components/CatalogoAdocao.vue'

Vue.use(VueRouter)
export default new VueRouter({
    mode: 'history',
    routes: [
        {
            path: "/",
            redirect: "/listagem_animais",
            name: "ListagemAnimais",
            component: ListagemAnimais,
        },
        {
            path: '/listagem_animais',
            name: 'ListagemAnimais',
            component: ListagemAnimais,
        },
        {
            path: '/catalogo_adocao',
            name: 'CatalogoAdocao',
            component: CatalogoAdocao,
        },
    ]
})