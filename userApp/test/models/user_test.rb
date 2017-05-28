# Unit tests for the user model
#
# Author:: Patricia Reinoso

require 'test_helper'

class UserTest < ActiveSupport::TestCase


	test "should not save user without attributes" do 
		user = User.new
		assert_not user.save, "Saved the user without attributes"	
	end


	test "create an user normal case" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert user.valid?

	end

	# FAMILY NAME ATTRIBUTE TESTS

	test "should not save user without family name" do
		user = User.new(
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user is invalid without family name'
		assert_not_nil user.errors[:family_name], 'no validation error for family name presence'
	end

	test "family name exceeds max length" do
		user = User.new(family_name: 'Doe Joe Joe Joe Joe Joe Joe Joe Joe Je Joe Joe Joe Joe',
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user family name should not exceeds 50 characteres'
		assert_not_nil user.errors[:family_name], 'no validation error for family name length exceeds'
	end

	test "family name should not include numbers" do
		user = User.new(family_name: 'Doe24',
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user family name should include numbers'
		assert_not_nil user.errors[:family_name], 'no validation error for family name numbers'
	end

	test "family name may include spaces" do
		user = User.new(family_name: 'Doe Doe Doe ',
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert user.valid?, 'user family name may include spaces'
		assert_equal [], user.errors[:family_name], 'no validation error for family spaces'
	end

	test "family name shoud not include special characteres" do
		user = User.new(family_name: 'Doe+-!',
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user family name should not include special characteres'
		assert_not_nil user.errors[:family_name], 'no validation error for family name spacial characteres'
	end

	# NAME ATTRIBUTE TESTS
	
	test "should not save user without name" do
		user = User.new(family_name: 'Doe',
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user is invalid without name'
		assert_not_nil user.errors[:name], 'no validation error for name presence'
	end

	test "name exceeds length" do
		user = User.new(family_name: 'Doe',
						name: 'Joe Joe Joe Joe Joe Joe Joe Joe Joe Je Joe Joe Joe Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user name should not exceeds 50 characteres'
		assert_not_nil user.errors[:name], 'no validation error for name length exceeds'
	end

	test "name should not include numbers" do
		user = User.new(family_name: 'Doe',
						name: 'Joe22', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user name should not include numbers'
		assert_not_nil user.errors[:name], 'no validation error for name numbers'
	end

	test "name may includes spaces" do
		user = User.new(family_name: 'Doe',
						name: 'Joe Jose', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert user.valid?, 'user name may include numbers'
		assert_equal [], user.errors[:name], 'no validation error for name with spaces'
	end

	test "name should not include special characteres" do
		user = User.new(family_name: 'Doe',
						name: 'Joe +++', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user name should not include special characteres'
		assert_not_nil user.errors[:name], 'no validation error for name with special characteres'
	end

	# EMAIL ATTRIBUTE TESTS
	
	test "should not save user without email" do
		user = User.new(family_name: 'Doe',
						name: 'Joe', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user is not valid without email'
		assert_not_nil user.errors[:email], 'no validation error for email presence'
	end

	test "email incorrect format" do
		user = User.new(family_name: 'Doe',
						name: 'Joe', 
						email: 'johndoe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'email has an invalid format'
		assert_not_nil user.errors[:email], 'no validation error for email bad format'
	end

	# BIRTHDAY TESTS
	
	test "should not save user without birthday" do
		user = User.new(family_name: 'Doe',
						name: 'Joe', 
						email: 'john@doe.com', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user is not valid without birthday'
		assert_not_nil user.errors[:birthday], 'no validation error for birthday presence'
	end

	test "birthday in the future" do
		user = User.new(family_name: 'Doe',
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'2018-07-05',
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'birthday should not be in the future'
		assert_not_nil user.errors[:birthday], 'no validation error for birthday in the future'
	end

	# PHONE ATTRIBUTE TESTS

	test "should save user without phone" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05',
						phone:'0612345678',  
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert user.valid?, 'user should be valid without phone'
		assert_equal [], user.errors[:phone], 'no validation error for phone presence'
	end

	test "phone follows format 0xxxxxxxxx" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05',
						phone:'0612345678',  
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert user.valid?, 'user should be valid with format 0xxxxxxxxx'
		assert_equal [], user.errors[:phone], 'no validation error for phone format 0xxxxxxxxx'
	end

	test "phone follows format 0x xx xx xx xx0" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05',
						phone:'06 12 34 56 78', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert user.valid?, 'user should be valid with phone format 0x xx xx xx xx'
		assert_equal [], user.errors[:phone], 'no validation error for phone format 0x xx xx xx xx'
	end

	test "phone follows format +33 x xx xx xx xx" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'+33 6 12 34 56 78', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert user.valid?, 'user should be valid with phone phoneformat +33 x xx xx xx xx'
		assert_equal [], user.errors[:phone], 'no validation error for phone format +33 x xx xx xx xx'
	end

	test "phone follows format +33xxxxxxxxx" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'+33123456789',
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert user.valid?, 'user should be valid with phone format +33xxxxxxxxx'
		assert_equal [], user.errors[:phone], 'no validation error for phone format +33xxxxxxxxx'
	end

	test "phone should not follows format +33xxxxxxxxxy" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'+336123456781', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user should be valid with phone format +33xxxxxxxxxy'
		assert_not_nil user.errors[:phone], 'no validation error for phone format +33xxxxxxxxxy'
	end

	test "phone should not follows format xxx" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'xxx', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user should be valid with phone format xxx'
		assert_not_nil user.errors[:phone], 'no validation error for phone format xxx'
	end


	# CELLPHONE ATTRIBUTE TESTS
	
	test "should not save user without cellphone" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05',
						phone:'0612345678',  
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user should be valid without cellphone'
		assert_not_nil user.errors[:cellphone], 'no validation error for cellphone presence'
	end
	
	test "cellphone follows format 0xxxxxxxxx" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05',
						phone:'0612345678',  
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert user.valid?, 'user should be valid with cellphone format 0xxxxxxxxx'
		assert_equal [], user.errors[:phone], 'no validation error for cellphone format 0xxxxxxxxx'
	end

	test "cellphone follows format 0x xx xx xx xx" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05',
						phone:'0123456789', 
						cellphone:'06 12 34 56 78', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert user.valid?, 'user should be valid with cellphone format 0x xx xx xx xx'
		assert_equal [], user.errors[:cellphone], 'no validation error for cellphone format 0x xx xx xx xx'
	end

	test "cellphone follows format +33 x xx xx xx xx" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0123456789', 
						cellphone:'+33 6 12 34 56 78', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert user.valid?, 'user should be valid with cellphone format +33 x xx xx xx xx'
		assert_equal [], user.errors[:cellphone], 'no validation error for phone format +33 x xx xx xx xx'
	end

	test "cellphone follows format +33xxxxxxxxx" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0123456789', 
						cellphone:'+33612345678', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert user.valid?, 'user should be valid with cellphone format +33xxxxxxxxx'
		assert_equal [], user.errors[:cellphone], 'no validation error for cellphone format +33xxxxxxxxx'
	end

	test "cellphone should not follows format +33xxxxxxxxxy" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0123456789', 
						cellphone:'+336123456781', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user should be valid with cellphone format +33xxxxxxxxxy'
		assert_not_nil user.errors[:cellphone], 'no validation error for cellphone format +33xxxxxxxxxy'
	end

	test "cellphone should not follows format xxx" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0123456789', 
						cellphone:'xxx', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user should be valid with cellphone format xxx'
		assert_not_nil user.errors[:cellphone], 'no validation error for cellphone format xxx'
	end

	# BIO ATTRIBUTE TESTS

	test "should save user without bio" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert user.valid?, 'user should be valid without bio'
		assert_equal [], user.errors[:bio], 'no validation error for bio presence'
	end

	test "bio exceeds length" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie'*100, 
						career: 'John Doe\'s career description', 
						rate: '10')
		assert_not user.valid?, 'user should not be valid with bio exceeds length'
		assert_not_nil user.errors[:bio], 'no validation error for bio exceeds length'
	end

	# CAREER ATTRIBUTE TESTS

	test "should save user without career" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						rate: '10')
		assert user.valid?, 'user should be valid without career'
		assert_equal [], user.errors[:career], 'no validation error for career presence'
	end

	test "career exceeds length" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description'*100, 
						rate: '10')
		assert_not user.valid?, 'user should not be valid with career exceeds length'
		assert_not_nil user.errors[:career], 'no validation error for career exceeds length'
	end

	# RATE ATTRIBUTE TESTS

	test "should not save user without rate" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description')
		assert_not user.valid?, 'user should not be valid without rate'
		assert_not_nil user.errors[:rate], 'no validation error for rate presence'
	end

	test "rate should not be a negative number" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '-5')
		assert_not user.valid?, 'user should not be valid with negative rate'
		assert_not_nil user.errors[:rate], 'no validation error for rate negative'
	end

	test "rate may be zero" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: '0')
		assert user.valid?, 'user should be valid with rate zero'
		assert_equal [], user.errors[:rate], 'no validation error for rate zero'
	end

	test "rate should not include characteres" do
		user = User.new(family_name: 'Doe', 
						name: 'Joe', 
						email: 'john@doe.com', 
						birthday:'1994-07-05', 
						phone:'0612345678', 
						cellphone:'0123456789', 
						bio: 'John Doe\'s biographie', 
						career: 'John Doe\'s career description', 
						rate: 'dd')
		assert_not user.valid?, 'user should not be valid with rate with characteres'
		assert_not_nil user.errors[:rate], 'no validation error for rate with characteres'
	end

end
