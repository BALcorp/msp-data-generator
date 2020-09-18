# msp-data-generator

Project to generate two json files in src/main/resources : 
 - a list of users (users-out), with users containing duplicated userName removed 
   and duplicated bookmarks removed.
 - a list of bookings (bookings-out), with colliding bookings (on the check in and out dates) removed.

Please place in src/main/resources:
 - a users-in.json with a list of users (~100) conform to the User and Bookmark dtos.
 - a products-in.json with a list of products (~30) conform to the Product and Evaluation dtos.

With the current repartition of values in the possibleDuration array in ValueGenerator, 
I suggest these values in the MainApp :
 - APP_EARLIEST_DATE : 3 years;
 - BOOKINGS_TO_GENERATE : 6000, as it will generate around 2150 final bookings, 2 per product per month;

I suggest copying bookings.json in Notepad++ and using the json formatter in the JS plugin to see what's what.

Also ctrl + F to detect unwanted cases (ex: i had a problem for a long time with the TotalToPay field 
which was sometimes 0, searching is your friend ^^)

ObjectMapper needs a strict json format for the product list input but it could be more flexible.

Feel free to modify the code base to do it or change other things, but don't forge to comment in the code 
and commit message.

Good luck !
