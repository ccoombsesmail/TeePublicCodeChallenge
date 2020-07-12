require 'set'

class ProductOptionsMap
  attr_accessor :product_options_map
  def initialize
    @product_options_map = {}                     # { user_input => {option1 => Set(option1_values...), option2 => Set(option2_values...) }}
  end

  def add_product(product)
    product_type = product['product_type']
    options_keys = product['options'].keys
    options_values = product['options'].values

    subsets = get_option_subsets([product_type, *options_values])   # get possible combinations of user input for a given product

    subsets.each do |subset|
      add_values(subset, product["options"])
    end
  end

  # add remaining options to @product_options_map for given product and potential
  # user input combo e.g tshirt+male => {color => Set(...), size => Set(...), ...}
  def add_values(subset, options)
    product_options_key = subset.join("")    # combination of product type and selected options                   
    @product_options_map[product_options_key] = {} if @product_options_map[product_options_key] == nil

    options.each do |category, value|
      if !subset.include?(value)
        !@product_options_map[product_options_key][category] ? 
          @product_options_map[product_options_key][category] = Set.new([value]) :
          @product_options_map[product_options_key][category].add(value)
      end
    end
  end


  def get_option_subsets(options)
    subsets = []
    (1..options.length).each do |i|
      subsets = subsets + options.combination(i).to_a
    end
    subsets
  end

end

