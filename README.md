# msp-data-generator

Project to create a json file containg a list of bookings.

Add an existing product included in a list in json format to a new booking and add this booking to the list being created.

Right now the app creates 100 booking from 3 products and a pool of 300 userId.

The 2 json files are in src/main/resources.

I suggest copying bookings.json in Notepad++ and using the json formatter in the JS plugin to see what's what.

Also ctrl + F to detect unwanted cases (ex: i had a problem for a long time with the TotalToPay field which was sometimes 0, searching is your friend ^^)

ObjectMapper needs a strict json format for the product list input but it could be more flexible.

Feel free to modify the code base to do it or change other things, but don't forge to comment in the code and commit message.

Good luck !
