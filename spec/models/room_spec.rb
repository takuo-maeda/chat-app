require 'rails_helper'
  RSpec.describe Room, type: :model do
    describe '#create' do
      before do
        @room = FactoryBot.build(:room)
      end
  
      it 'nameの値が存在すれば登録できること' do
        #見ないで
        #  name :presence?
        #見て⇨DBにある（be_valid?)
         expect(@room).to be_valid?
      end
  
      it 'nameが空では登録できないこと' do
        #いくつか見てから書いて
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
  end
end
