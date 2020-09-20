# msp-data-generator

Project to generate two json files and a sql import file in target/data : 
 - a json of users (users-import.json), with users containing duplicated userName removed 
   and duplicated bookmarks removed.
 - a json of bookings (bookings-import.json), with colliding bookings (on the check in and out dates) removed,
   and generated user evaluation.
 - the sql import for the msp-product-housing db (msp-product-housing-import.sql), 
   with the evaluations generated here.

Files included in src/main/resources/data:
 - a "users.json" with a list of users (1000) conform to the User and Bookmark dtos.
 - a "products.json" with a list of products (30) conform to the Product and Evaluation dtos.
 - the three parts of the sql import file that will be pieced together along with the evaluations to form
   the final import file.
 - the script used to make users in www.json-generator.com
 - the conf file to use in Logstash on the msp-product-housing mySql db to generate the products.json in ElasticSearch
 (there will be some metadata to remove), using the "elk" stack.

With the current repartition of values in the possibleDuration array in ValueGenerator, 
I suggest these values in the MainApp :
 - APP_EARLIEST_DATE : 3 years.
 - BOOKINGS_TO_GENERATE : 6000.
 
This will generate around 2150 final bookings, 2 per product per month;

I suggest copying bookings.json in Notepad++ and using the json formatter, or use the json formatter plugin for intellij.

Also ctrl + F to detect unwanted cases (ex: i had a problem for a long time with the TotalToPay field 
which was sometimes 0, searching is your friend ^^)

ObjectMapper needs a strict json format for the inputs but it could be more flexible.

Feel free to modify the code base to do it or change other things, but don't forge to comment in the code 
and commit message.

Good luck !
