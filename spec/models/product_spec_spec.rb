require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do 
      @category = Category.new(name: "TestTrees")
    end

    it "Should save successfully with all four fields set" do
      @product = Product.new(
        name: "TestTree",
        price: 100,
        quantity: 10,
        category: @category
      )

      @product.save
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end

    it "Should fail validation without name" do
      @product = Product.new(
        name: nil,
        price: 100,
        quantity: 10,
        category: @category
      )

      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end  
    
    it "Should fail validation without price" do
      @product = Product.new(
        name: "TestName",
        price_cents: nil,
        quantity: 10,
        category: @category
      )

      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end   

    it "Should fail validation without Quantity" do
      @product = Product.new(
        name: "TestName",
        price_cents: 100,
        quantity: nil,
        category: @category
      )

      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end 

    it "Should fail validation without Category" do
      @product = Product.new(
        name: "TestName",
        price_cents: 100,
        quantity: 10,
        category: nil
      )

      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end 
      
    

  end
end
