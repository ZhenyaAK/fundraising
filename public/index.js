/* global Vue, VueRouter, axios */
var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email_address: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email_address, password: this.password }
      };
      axios
        .post("/user_token", params)
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
      email_address: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email_address: this.email_address,
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

        input_event_name: this.event_name,
        input_event_description: this.event_description,
        input_event_date: this.event_date,
        input_event_time: this.event_time,
        input_event_address: this.event_address
      };
      axios.post("/events", params).then(function(response) {
        router.push("/");
      }).catch(
      function(error) {
        this.errors = error.response.data.errors;
      }.bind(this)
      );

    }
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

var router = new VueRouter({
  routes: [
  { path: "/", component: HomePage },
  { path: "/signup", component: SignupPage},
  { path: "/login", component: LoginPage},
  { path: "/events/new", component: EventNewPage },
  { path: "/events/:id", component: EventsPage },
  { path: "/logout", component: LogoutPage}

  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
    //  var jwt = localStorage.getItem("jwt");
    // if (jwt) {
    //   axios.defaults.headers.common["Authorization"] = jwt;
    // }
  //}
});
