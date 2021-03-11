require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end

    it 'contentとimageが存在していれば保存できること' do
       #見て
      #  expect(messages, images).to be valid?
      expect(@messageI).to be_valid
    end

    it 'contentが空でも保存できること' do
       #見て
      #  cotent = ""
      #  expect(content).to be valid?
      #修正
      @message.content = ''
      expect(@message).to be valid
    end

    it 'imageが空でも保存できること' do
      #見て初めて一部修正でOK
      @message.image = nil
      expect(@message).to be_valid
    end

    it 'contentとimageが空では保存できないこと' do
      @message.content = ''
      @message.image = nil
      @message.valid?
      # image.be valid?
      expect(@messge.errors.full_messages).to include("Content can't be blank")

    end

    it 'roomが紐付いていないと保存できないこと' do
      #見当がつかず
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_messages).to include('Room must exist')
    end
    
    it 'userが紐付いていないと保存できないこと' do
      #見当がつかず
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include('User must exist')
    end
  end
end