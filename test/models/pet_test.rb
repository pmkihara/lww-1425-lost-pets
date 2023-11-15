require "test_helper"

class PetTest < ActiveSupport::TestCase
  test '#found_days_ago returns an Integer' do
    snoopy = pets(:snoopy)
    assert_instance_of Integer, snoopy.found_days_ago
  end

  test '#found_days_ago returns the correct number' do
    snoopy = pets(:snoopy)
    assert_equal(snoopy.found_days_ago, 10)
  end

  test 'cannot create without a name' do
    pet = Pet.new(address: pets(:snoopy).address, species: pets(:snoopy).species, found_on: pets(:snoopy).found_on)
    assert_not pet.valid?
  end

  test 'cannot create with an unexisting species' do
    pet = Pet.new(name: pets(:snoopy).name, address: pets(:snoopy).address, species: 'cow', found_on: pets(:snoopy).found_on)
    assert_not pet.valid?
  end
end
