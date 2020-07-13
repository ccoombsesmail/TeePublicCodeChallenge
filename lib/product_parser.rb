#!/usr/bin/env ruby

require "json"
require_relative "ProductOptionsMap"


class ProductParser
  attr_reader :product_options_map

  def initialize
    @product_options_map = pre_proccess_product_list
  end

  def pre_proccess_product_list
    file = File.open "./products.json"
    products = JSON.load file
    product_options_map = ProductOptionsMap.new
    
    products.each do |product|
      product_options_map.add_product(product)
    end

    product_options_map.product_options_map
  end


  def format_output(remaining_options)
    remaining_options.each do |category, values|
      puts category.capitalize  + ": " + values.to_a.join(", ")
    end
  end


  def remaining_options(input = ARGV) 
      begin
        if @product_options_map[input.join("")]
          return @product_options_map[input.join("")]
        else
          raise ArgumentError.new "Invalid Input Combination"
        end
      rescue ArgumentError => e
        puts e.message
        return []
      end
  end
end


# added this check b/c rspec command was adding spec file name to ARGV which was causing issues when requiring product_parser file
if ARGV[0] && !ARGV[0].include?("product_parser_spec.rb")
  product_parser = ProductParser.new
  product_parser.format_output(product_parser.remaining_options)
end





