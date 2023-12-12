# FireApi

Bring your [mojo](https://www.modular.com/max/mojo) API to the web with a simple TCP & HTTP FireApi server!!

### Dependencies
 - mojo version 0.6.0 or newer
 - Python version 3.10 or newer (exact version doesn't really matter)
 - need to set the python library environment variable to compile

### Hello FireApi
Step 1: `$ mkdir hello_fire_api && cd hello_fire_api` <br>

Step 2: `$ curl -sS https://raw.githubusercontent.com/Jensen-holm/FireApi/main/install.sh | bash`

Step 3: Once you have made a project and cloned the FireApi you can get coding! Bellow is the hello world.

### Simple TCP Server Fibonacci Example

this is a demonstration of a FireApi HTTPLite service that computes the kth fibonnaci number given as input in the request body from a client.

run the service first using the mojo cli: `mojo run app.🔥` <br>
then, run the client to connect to the service: `mojo run client.🔥` <br>

### Roadmap

Currently simple TCP Servers / Clients like the one shown above is the only thing working. In the near future I plan on implementing clients and servers that follow HTTP so that users of FireApi can host their mojo api's on the web.
