require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "validations" do
    it { should validate_presence_of :status }
    it { should validate_presence_of :customer_id }
  end
  describe "relationships" do
    it { should belong_to :customer }
    it { should have_many(:items).through(:invoice_items) }
    it { should have_many(:merchants).through(:items) }
    it { should have_many(:bulk_discounts).through(:invoice_items) }
    it { should have_many :transactions}
  end
  describe "instance methods" do
    it "total_revenue" do
      @merchant1 = Merchant.create!(name: 'Hair Care')
      @item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: @merchant1.id, status: 1)
      @item_8 = Item.create!(name: "Butterfly Clip", description: "This holds up your hair but in a clip", unit_price: 5, merchant_id: @merchant1.id)
      @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')
      @invoice_1 = Invoice.create!(customer_id: @customer_1.id, status: 2, created_at: "2012-03-27 14:54:09")
      @ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 9, unit_price: 10, status: 2)
      @ii_11 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_8.id, quantity: 1, unit_price: 10, status: 1)

      expect(@invoice_1.total_revenue).to eq(100)
    end

    it ' #total_revenue_by_merchant' do
      merchant1 = Merchant.create!(name: 'Hair Care')
      merchant2 = Merchant.create!(name: 'Book Store')
      item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: merchant1.id, status: 1)
      item_2 = Item.create!(name: "Conditioner", description: "This makes your hair shiny", unit_price: 8, merchant_id: merchant1.id)
      item_3 = Item.create!(name: "Book", description: "This is a book", unit_price: 10, merchant_id: merchant2.id)
      customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')
      invoice_1 = Invoice.create!(customer_id: customer_1.id, status: 2, created_at: "2012-03-27 14:54:09")
      ii_1 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 19, unit_price: 10, status: 2)
      ii_2 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_2.id, quantity: 5, unit_price: 8, status: 2)
      ii_3 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_3.id, quantity: 5, unit_price: 10, status: 2)

      expect(invoice_1.total_revenue_by_merchant(merchant1.id)).to eq(230)
      expect(invoice_1.total_revenue_by_merchant(merchant1.id)).to_not eq(280)
    end

    it "total_discounted_revenue" do
      merchant1 = Merchant.create!(name: 'Hair Care')
      item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: merchant1.id, status: 1)
      item_2 = Item.create!(name: "Conditioner", description: "This makes your hair shiny", unit_price: 8, merchant_id: merchant1.id)
      customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')
      invoice_1 = Invoice.create!(customer_id: customer_1.id, status: 2, created_at: "2012-03-27 14:54:09")
      ii_1 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 19, unit_price: 10, status: 2)
      bulk_discount_1 = merchant1.bulk_discounts.create!(percentage_discount: 5.0, quantity_threshold: 5)
      bulk_discount_2 = merchant1.bulk_discounts.create!(percentage_discount: 10.0, quantity_threshold: 15)
      bulk_discount_3 = merchant1.bulk_discounts.create!(percentage_discount: 15.0, quantity_threshold: 20)
      expect(invoice_1.total_revenue).to eq(190)
      expect(invoice_1.discounted_revenue).to eq(171.0)
    end
  end
end
