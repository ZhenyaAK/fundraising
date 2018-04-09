require 'unirest'

#make a new user/organiser
response = Unirest.post("localhost:3000/organisers", 
  parameters: {
   
    name: "x",
    email_address: "x@gmail.com",
    password: "passwordX",

  }
  )
p response.body