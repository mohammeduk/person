require 'date'

class Person < String
  attr_accessor :dob, :first_name, :surname
  attr_reader :fullname, :email, :phone_numbers

  def initialize(first_name, surname, dob = '17, June, 1989')
    @first_name = first_name.capitalize!
    @surname = surname.capitalize!
    @dob = Date.parse(dob)
    @fullname = "#{@first_name} #{@surname}"
    @email = []
    @phone_numbers = []
  end

  def add_email(email)
    @email << email
  end

  def add_phone(phone)
      @phone_numbers << phone
  end

  def remove_email(position)
    @email.delete_at(position)
  end

  def to_s
    "#{@fullname} was born on #{@dob}. Their email addresses are: #{@email.join(", ")}. Their phone numbers are #{@phone_numbers.join(", ")}."
  end

  def print_details
    puts @fullname
    @fullname.length.times do
      print '-'
    end
    puts
    puts @dob.strftime("Date of Birth: %B %e %Y")
    puts
    puts 'Email Addresses:'

    @email.each do |x|
      puts "- #{x.to_s}"
    end
    puts
    puts 'Phone Numbers:'

    @phone_numbers.each do |x|
      puts "- #{x.to_s}"
    end
    print
  end

end

class FamilyMember < Person
  attr_accessor :relationship

  def initialize(first_name, surname, relationship, dob = '17, June, 1989')
    super(first_name, surname, dob)
    @relationship = relationship
  end

end

class AddressBook < Person
  attr_accessor :persons

  def initialize
    @persons = []
  end

  def add(person)
    raise raise_exception unless person.is_a? Person
    @persons << person.fullname
  end

  def list
    puts 'Address Book'
    puts '------------'
    num = 1
    @persons.each do |x|
      puts "Entry #{num}: #{x}"
      num += 1
    end
    print
  end

  def raise_exception
    puts 'Argument is not of type Person or FamilyMember'
  end


end
