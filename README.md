TeePublic Coding Challenge
======

To solve this problem, I proccessed the json file of products into a HashMap where the keys are possible input combinations, and the values are themselves HashMaps whose keys are possible options that point to Sets that hold the option values.

e.g

```ruby
{
  "tshirt" => {"gender"=> <Set: {"male", "female"}>, 
              "color"=> <Set: {"red", "green", "navy", "white", "black"}>, 
              "size"=> <Set: {"small", "medium", "large", "extra-large", "2x-large"}>
}, ...

```

Obtaining the remaining options for a given input is then just an O(1) HashMap lookup.

### How to view
  The program output can be viewed in the terminal
### How to Run

  The cmd app can be run in the terminal from the root directory using:
  - ruby lib/product_parser.rb product_type option1 option2 ... 
  OR
  - lib/product_parser.rb product_type option1 option2 

## Testing
  I used Rspec for testing. I've inlcuded several example inputs and a few edges cases, as well as printing out the actual output of each test case. 

  Tests can be run by navigating to the root directory and typing:
    <br />
    - bundle exec rspec spec/product_parser_spec.rb
    <br />

  Making sure to run bundle install first

### Time Complexity Analysis

  Proccessing the json file is a one time operation after which extracting the remaining options for a given input combination is O(1)

  If 'n' is the number of products in the list, and 'O' is the product type with the maximum number of option categories, the processing takes O(n * 2^O) time.
  
  The 2^O comes from the possible combinations of option inputs for a given product type. For each product, the number of combinations is: 
  <br />
  ![equation](https://i.ibb.co/2YSSPnC/comb1.png)
  <br />
  which has an upper bound of 2^O
  
  Depending on the real-world constraints, the number of option categories could be considered constant. For example, in the data set given, O = 3.
  
  Adding a product to the HashMap is O(2^O)
  




