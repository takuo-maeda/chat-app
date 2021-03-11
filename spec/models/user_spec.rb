require 'rails_helper'
  RSpec.describe User, type: :model do
    describe '#create' do
      before do
        @user = FactoryBot.build(:user)
      end
  
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
        #何も見ない
        # name =! "" to valied?
        # password =! "" to varid?
        # password_confirmation =! "" to varid?
        #みて
        #修正＆解答
        expect(@user).to be_valid?
      end
  
      it 'nameが空では登録できないこと' do
        #見ないで
        # name = "" to valied?
        #みて
        # name = ""
        # name.varid?
        # expect(name.errors.full_messages).to includes("name can't be blank")
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name cant't be blank")
      end
    it 'emailが空では登録できないこと' do
      #見ないで
      # email = "" to be valied?
      #見て
      # email = ""
      # email.varid?
      # expect(email.errors.full_messages).to includes("Email can't be blank")
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email cant't be blank")
    end
    
    it 'passwordが空では登録できないこと' do
      #見ないで
      # password = "" to be varid?
      #見て
      # password=""
      # password.varid?
      # expect(email.erroers.full_messages).to includes("password can't be blank")
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password cant't be blank")
      end

      it 'passwordが6文字以上であれば登録できること' do
        #見ないで
        # password_long = password > "aaaaaa".min_length
        # password_long is matchers
        #見て
        # password = "aaaaaaa"
        # password.varid?
        # expect(password.errors.full_messages).to includes("Password is too long(maximum is 6charactors)")
        @user.passworf = '123456'
        @user.password_confirmation = '123456'
        expect(@user).to be_valid?
      end
  
      it 'passwordが5文字以下であれば登録できないこと' do
         #見ないで
        #  password = "aaaaa"
        #  password.save to varid?
         #見て
        #  password = "aaaaa"
        #  password_confirmation = "aaaaa"
        #  password_confirmation.varid?
        #  password.varid?
        #  expect(password.erroers.full_messages).to includes("Password is too short(minimum is 6 charactors)")
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short(minimum is 6charactors)')        
        end
  
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
         #見ないで
        #  password =! password_confirmation
        #  password.save to be varid?
        #  password_confirmation.save to be varid?
        #正しくは
        @user.password ='123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation does't match Password")
      end


      it '重複したemailが存在する場合登録できないこと' do
        #見ないで 
        # free_email was saved?
        # @user.save
        # another_user = FactoryBot.build(:user)
        # another.user.email = @user.email
        # another.user.valid?
        # expect(another_user.errors.full_messages).to includes('Email has already been tken')
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
    end
  end

