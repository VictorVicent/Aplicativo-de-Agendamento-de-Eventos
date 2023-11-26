# Aplicativo-de-Agendamento-de-Eventos
**Desenvolvemos o projeto de um aplicativo simples em Flutter/DART de controle/agendamento de eventos, o objetivo do aplicativo é permitir que o usuário visualize as principais informações sobre eventos, como imagem que simbolize o evento, nome/titulo, descrição, tipo, data e local (considerando, também, a opção online).**

##  Documentação
<ul>

<li>O aplicativo tem uma página inicial que exibe uma lista de eventos futuros, Utilizamos um componente ListView para mostrar os eventos em forma de cartões, incluindo imagem do evento, nome, data e local.</li>


<li>Os usuários são capazes de clicar em um evento da lista para visualizar as informações detalhadas, onde tem uma tela que exibe todas as informações disponíveis (imagem, nome/título, descrição, tipo, data e local).</li>


<li>Os eventos são armazenados apenas em memória, utilizando Listas.</li>


<li>Contem uma funcionalidade para filtrar os eventos por tipo (reunião, festa, curso, workshop, webinar, aula), Utilizamos um componente DropDownButton para exibir a lista de tipos disponíveis e atualizar a lista de eventos de acordo com o filtro (tipo selecionado) pelo usuário.</li>


<li>Contem uma funcionalidade de paginação que permite que o usuário veja mais eventos além daqueles exibidos inicialmente para isso utilizamos um componente PageView para criar a navegação entre páginas de eventos.</li>


<li>Utilizamos Stateful Widgets para gerenciar o estado do aplicativo, como a lista de eventos, pesquisas etc.</li>


<li>Personalizamos o design do aplicativo com cores, fontes e estilos utilizando componentes como TextField, Image, ListView, PageView e DropDownButton para criar a interface do usuário.</li>
</ul>
