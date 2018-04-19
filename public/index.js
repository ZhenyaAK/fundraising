/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Home Page. Events for you",
      events: []
    };
  },
  created: function() {
    axios.get("/events").then(function(response) {
      console.log(response.data);
      this.events = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};


var EventsPage = {
  template: "#events-show-page",
  data: function() {
    return {
      message: "a specific event!",
      event: {}
    };
  },
  created: function() {
    axios.get("/events/" + this.$route.params.id).then(function(response) {
      console.log(response.data);
      this.event = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
  { path: "/", component: HomePage },
  { path: "/events/:id", component: EventsPage }


  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});
