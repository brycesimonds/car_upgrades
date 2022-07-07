require 'rails_helper'

describe Car, type: :model do 
    describe "validations" do 
        it { should validate_presence_of :brand_of_car}
        it { should validate_presence_of :what_line_of_car}
        it { should validate_presence_of :year}
        it { should allow_value(true).for(:is_used) }
        it { should allow_value(false).for(:is_used) }
    end

    describe 'relationships' do 
        it { should have_many :upgrades}
    end
end


