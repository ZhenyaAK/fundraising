/* global Vue, VueRouter, axios */
var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/organiser_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};
var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/organisers", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Home Page. Events for you",
      events: [], 
      searchTerm: ""

    };
  },
  created: function() {
    axios.get("/events").then(function(response) {
      console.log(response.data);
      this.events = response.data;
    }.bind(this));
  },
  methods: { 

    isValidEvent: function(event) {
      console.log(event.event_name.includes(this.searchTerm));
      console.log(event);
     return event.event_name.includes(this.searchTerm);
     }

  }, 
  computed: {},

  mounted: function() {
    // var uluru = {lat: -25.363, lng: 131.044};
    // var map = new google.maps.Map(document.getElementById('map'), {
    //       zoom: 4,
    //       center: uluru
    // });
    // var marker = new google.maps.Marker({
    //   position: uluru,
    //   map: map
    // });

    // var places = [
    // {latitude: -25.363, longitude: 131.044},
    // {latitude: -20.363, longitude: 111.044}
    // ];

    // for (var i =0; i<places.length; i++)
    // {
    //   console.log('in the loop');
    //   var contentString = 'Hey';

    //   var infowindow = new google.maps.InfoWindow({
    //     content: contentString
    //    });

    //   var marker = new google.maps.Marker({
    //     position: {lat: places[i].latitude, lng: places[i].longitude},
    //     map: map,
    //     title: 'Uluru (Ayers Rock)'
    //    });

    //    marker.addListener('click', function() {
    //     infowindow.open(map, marker);
    //   });
    // }

  }
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

var EventNewPage = {
  template: "#event-new-page",
  data: function() {
    return {
      message: "to create an event!",
      event_name: "",
      event_description: "",
      event_date: "",
      event_time: "",
      event_address: "",
      errors: []
      
    };
  },
  created: function() {},
  methods: {
    submit: function() {
      var params = {

        event_name: this.event_name,
        event_description: this.event_description,
        event_date: this.event_date,
        event_time: this.event_time,
        event_address: this.event_address
      };
      axios.post("/events", params).then(function(response) {
        router.push("/");
      }).catch(
      function(error) {
        this.errors = error.response.data.errors;
      }.bind(this));
      }, 
    },
  computed: {}
}; 

var EventEditPage = {
  template: "#event-edit-page",
  data: function() {
    return {
      message: "to update an event!",
      event: {},
      errors: []
      
    };
  },
  created: function() {
     axios.get("/events/" + this.$route.params.id).then(function(response) {
        this.event = response.data;
      }.bind(this));

  },
  methods: {
    submit: function() {
      var params = {

        event_name: this.event.event_name,
        event_description: this.event.event_description,
        event_date: this.event.event_date,
        event_time: this.event.event_time,
        event_address: this.event.event_address
      };
      axios.patch("/events/" + this.$route.params.id, params).then(function(response) {
        router.push("/");
      }).catch(
      function(error) {
        this.errors = error.response.data.errors;
      }.bind(this)
      );
    },
    DeleteEvent: function(theEvent) {
      axios.delete("/events/" + this.$route.params.id).then(function(response) {
        router.push("/");
      }).catch(
      function(error) {
        this.errors = error.response.data.errors;
      }.bind(this)
      );

    //   var index = this.event.indexOf(theEvent);
    //   this.event.splice(index, 1);
    },

  },
  computed: {}
};


var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var OrganiserEventsPage = {
  template: "#organiser-events-page",
  data: function() {
    return {
      message: "Your Events",
      events: []

    };
  },
  created: function() {
    axios.get("/organiserevents").then(function(response) {
      console.log(response.data);
      this.events = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {},

  // mounted: function() {
 
};

var router = new VueRouter({
  routes: [
  { path: "/", component: HomePage },
  { path: "/signup", component: SignupPage},
  { path: "/login", component: LoginPage},
  { path: "/events/new", component: EventNewPage },
  { path: "/organiserevents", component: OrganiserEventsPage },
  { path: "/events/:id", component: EventsPage },
  { path: "/events/:id/edit", component: EventEditPage },
  { path: "/logout", component: LogoutPage}

  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }, 
  data: function() {
    return {
      // searchTerm: ""
    };
  }
});