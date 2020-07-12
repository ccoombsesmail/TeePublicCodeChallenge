require "rspec"
require_relative "../lib/product_parser"
# require_relative "../lib/ProductOptionsMap"


describe ProductParser do 

  subject(:product_parser) {  ProductParser.new }
  
  context "when product type tshirt is specified with no options" do
    let (:remaining_options)  {product_parser.remaining_options(["tshirt"]) }
    it "remaining options includes category gender and options male/female" do 
      expect(remaining_options).to include("gender")
      expect(remaining_options["gender"]).to include("male")
      expect(remaining_options["gender"]).to include("female")
    end
     it "remaining options includes category color and options red/green/navy/white/black" do 
      expect(remaining_options).to include("color")
      expect(remaining_options["color"]).to include("red")
      .and include("green")
      .and include("navy")
      .and include("white")
      .and include("black")
    end
      it "remaining options includes category size and options small/medium/large/extra-large/2x-large" do 
        expect(remaining_options).to include("size")
        expect(remaining_options["size"]).to include("small")
        .and include("medium")
        .and include("large")
        .and include("extra-large")
        .and include("2x-large")
       
    end

      it "                " do
        puts
        puts "-----------|input: tshirt|----------------"
        product_parser.format_output(remaining_options)
        puts "------------------------------------------"
      end
      
  end
  
   

  context "when product type tshirt is specified with option male" do
    # p product_parser.product_options_map
    let (:remaining_options)  {product_parser.remaining_options(["tshirt", "male"]) }
    it "remaining options does not includes category gender" do 
      expect(remaining_options).to_not include("gender")
     
    end
     it "remaining options includes category color and options red/green/navy/white/black" do 
      expect(remaining_options).to include("color")
      expect(remaining_options["color"]).to include("red")
      .and include("green")
      .and include("navy")
      .and include("white")
      .and include("black")
    end
      it "remaining options includes category size and options small/medium/large/extra-large/2x-large" do 
        expect(remaining_options).to include("size")
        expect(remaining_options["size"]).to include("small")
        .and include("medium")
        .and include("large")
        .and include("extra-large")
        .and include("2x-large")
    end
      it " " do
        puts
        puts "------------|input: tshirt male|---------------"
        product_parser.format_output(remaining_options)
        puts "-----------------------------------------------"
      end
  end


  context "when product type tshirt is specified with option male and red" do
      # p product_parser.product_options_map
      let (:remaining_options)  {product_parser.remaining_options(["tshirt", "male", "red"]) }
      it "remaining options does not includes category gender" do 
        expect(remaining_options).to_not include("gender")
      end
      it "remaining options does not includes category color" do 
        expect(remaining_options).to_not include("color")
      end
      it "remaining options includes category size and options small/medium/large/extra-large/2x-large" do 
        expect(remaining_options).to include("size")
        expect(remaining_options["size"]).to include("small")
        .and include("medium")
        .and include("large")
        .and include("extra-large")
        .and include("2x-large")
      end
      it " " do
        puts
        puts "------------|input: tshirt male red|----------------"
        product_parser.format_output(remaining_options)
        puts "----------------------------------------------------"
      end
    end

    context "when product type sticker is specified with option matte" do
    # p product_parser.product_options_map
    let (:remaining_options)  {product_parser.remaining_options(["sticker", "matte"]) }
    it "remaining options does not includes category style" do 
      expect(remaining_options).to_not include("style")
     
    end
    it "remaining options includes category size and options x-small/small/medium/large/x-large" do 
      expect(remaining_options).to include("size")
      expect(remaining_options["size"]).to include("x-small")
      .and include("small")
      .and include("medium")
      .and include("large")
      .and include("x-large")
    end
    it " " do
      puts
      puts "-----------|input: sticker matte|----------------"
      product_parser.format_output(remaining_options)
      puts "-------------------------------------------------"
    end
  end


  context "when all options of a product are selected" do
    let (:remaining_options)  {product_parser.remaining_options(["tshirt", "male", "red", "small"]) }
    it "returns an empty hash" do
      expect(remaining_options).to eq({})
    end
     it "does not print anything to stdout" do
      expect{ product_parser.remaining_options(["tshirt", "male", "red", "small"]) }.to output("").to_stdout
    end
  end

   context "when unavailable option or option combination is selected" do
    it "should handle exception and output error message" do
      expect {product_parser.remaining_options(["tshirt", "male", "orange", "small"])}.to output("Invalid Input Combination\n").to_stdout
    end
  end

end