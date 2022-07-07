require 'rails_helper'

describe Car, type: :model do 
    describe "validations" do 
        it { should validate_presence_of :brand_of_car}
    end

    describe 'relationships' do 
        it { should have_many :upgrades}
    end
end