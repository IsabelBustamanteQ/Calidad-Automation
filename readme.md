## COLABORATORS
* Isabel Bustamante Quiroz
* Jose Carlos Lozada Peralta
* Santiago Jose Torrico Hinojosa 

# GMO PAGE TESTING
This project is a set of automated Smoke tests for the <a href=https://demo.borland.com/gmopost/>GMO Page</a>

<a href=https://demo.borland.com/gmopost/>GMO Page</a> is a demonstration website that simulates an online catalog for virtual stores. It allows you to experiment with typical e-commerce functions, such as product navigation, shopping cart and order simulation.
## FEATURES
### gmo_home_page.feature
Scenarios for testing the home page and catalog of the website

### place_order.feature
Scenarios to check the purchase order for different product combinations as well as the total order cost
### reset_order.feature
Scenarios to validate that a place order can be cancelled
### billing.feature
Scenarios to validate correct billing operation as valid phone number, zip code and more
### full_flow.feature
Scenarios to validate the complete use of the application, making a complete purchase from searching the site to returning to the home page after making a purchase.

## COMANDS TO RUN THE TEST
### Run a feature file
...> cucumber features\place_order.feature

### Run a feature file without report dialog
...> cucumber features\place_order.feature
 --publish-quiet

### Run a feature file and export results to HTML format
...> cucumber features\place_order.feature
 -f html -o reportExecution.html

### Run all features
...> cucumber features

