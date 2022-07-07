require 'rails_helper'

RSpec.describe Upgrade, type: :model do
    describe "validations" do 
        it { should validate_presence_of :car_part_name}
        it { should validate_presence_of :cost_of_part}
        it { should allow_value(true).for(:need_mechanic) }
        it { should allow_value(false).for(:need_mechanic) }
    end

    describe 'relationships' do 
        it { should belong_to :car }
    end
end