# FireTCP

Bring your [mojo](https://www.modular.com/max/mojo) Api to the web with a simple FireTCP server!!

### Dependencies
 - mojo version 0.6.0 or newer
 - Python version 3.10 or newer (exact version doesn't really matter)
 - need to set the python library environment variable to compile

### Hello FireApi

Step 1: Create your FireTCP project. <br>
    `$ mkdir hello_fire_api && cd hello_fire_api`

Step 2: Clone the Repository. <br>
    `$ git clone https://github.com/Jensen-holm/FireTCP.git`

Step 3: Install using the Makefile. <br>
    `$ cd FireTCP && make install && mv FireTCP.📦 .. && cd ..`

Step 3: Once you have made a project and cloned the FireApi you can get coding! Check out the examples below or in the examples directory before getting started or [read this tutorial I made on medium](https://medium.com/@jensen.dev.01/socket-programming-in-mojo-e113f6c8cbef).


### Goals

The main purpose of FireTCP is to create the base of the foundation when it comes to web programming. HTTP frameworks are built around TCP sockets, and I hope that since FireTCP is pretty user friendly and simple, an http web framework for mojo can easily be built around it.
