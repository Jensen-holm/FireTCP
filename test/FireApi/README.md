# FireApi

Bring your [mojo]() AI model to the web with a simple HTTP FireApi server!!
FireApi is an HTTP API for the AI programming language [mojo]()

### Dependencies
 - mojo version 0.6.0 or newer
 - Python version 3.10 or newer (exact version doesn't really matter)
 - need to set the python library environment variable to compile

### Hello FireApi Micro Server
Step 1: `$ mkdir hello_fire_api && cd hello_fire_api` <br>
Step 2: `$ curl -o- https://raw.githubusercontent.com/Jensen-holm/FireApi/main/install.sh | bash -x`
Step 3: Once you have made a project and cloned the FireApi you can get coding! Check out the example in examples/hello_fireapi.🔥


FireApi HTTP Micro Servers can only run one route at a time, that route has to be a struct that inherits from the Route trait defined in the FireApi.route file.
