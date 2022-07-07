require 'rails_helper'

RSpec.describe Upgrade, type: :model do
    describe 'relationships' do 
        it { should belong_to :car }
    end
end