require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    context 'name' do
      it 'should be invalid without a name' do
        @user = User.new(name: nil, email: 'a@a.a', password: 'a', password_confirmation: 'a')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Name can\'t be blank')
      end
    end

    context 'email' do
      it 'should be invalid without an email' do
        @user = User.new(name: 'a', email: nil, password: 'a', password_confirmation: 'a')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Email can\'t be blank')
      end

      it 'should be invalid if email is not unique' do
        @user1 = User.create(name: 'a', email: 'a@a.a', password: '1234', password_confirmation: '1234')
        @user2 = User.new(name: 'a', email: 'a@A.a', password: '1234', password_confirmation: '1234')
        expect(@user2).to_not be_valid
        expect(@user2.errors.full_messages).to include('Email has already been taken')
      end
    end

    context 'password' do
      it 'should be invalid without a password' do
        @user = User.new(name: 'a', email: 'a@a.a', password: nil, password_confirmation: 'a')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password can\'t be blank')        
      end
      it 'should be invalid without password confirmation' do
        @user = User.new(name: 'a', email: 'a@a.a', password: 'a', password_confirmation: nil)
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password confirmation can\'t be blank')
      end
      it 'should be invalid when password and password confirmation do not match' do
        @user = User.new(name: 'a', email: 'a@a.a', password: 'a', password_confirmation: 'b')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
      end
      it 'should be invalid when password is less than 4 characters' do
        @user = User.new(name: 'a', email: 'a@a.a', password: '123', password_confirmation: '123')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 4 characters)')
      end

    end

  end

end
