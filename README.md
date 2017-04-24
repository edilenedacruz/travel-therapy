Travel Therapy is a travel planning app where you can choose a city you would like to visit and then create a to do list. It also has a section that displays prices of basic items in the city, like gas, milk, restaurant meals etc.

This project makes uses of :

* an external provider to authenticate users
* Consumption of an external API
* Creating of an internal API

Visit this page in the near future to checkout new enhancements.

## Setup
1. `git clone https://github.com/edilenedacruz/travel-therapy.git`

2. `bundle install`

3. `rake db:setup`

4. Please note that you will need an api key for the following services: Numbeo and Google.

## localhost
`rails s`

`http://localhost:3000`

## Production
`http://traveltherapy.herokuapp.com/`
