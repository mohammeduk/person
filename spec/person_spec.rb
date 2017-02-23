# require 'date'

describe Person do

  it "should initialize properly" do
    person = Person.new("joe", "bloggs", "1 Jan 1990")
    expect(person.class).to eq Person
    expect(person.dob).to eq Date.parse("1 Jan 1990")
    expect(person.first_name).to eq "Joe"
    expect(person.surname).to eq "Bloggs"
    expect(person.fullname).to eq "Joe Bloggs"
  end

  it "should show emails" do
    person = Person.new("joe", "bloggs")
    person.add_email('joe@foo.com')
    expect(person.email).to eq ['joe@foo.com']
  end

  it "should show us the phone numbers" do
    person = Person.new("joe", "bloggs")
    person.add_phone("182871827")
    expect(person.phone_numbers).to eq ["182871827"]
  end

  it "should remove an email" do
    person = Person.new("joe", "bloggs")
    person.add_email('groovyBaby99@gmail.com')
    person.add_email('fjkas@asa.com')
    person.remove_email(1)
    expect(person.email).to eq ['groovyBaby99@gmail.com']
  end

  it "should display description of person" do
    person = Person.new("joe", "bloggs", '19 Jun 1989')
    person.add_email('groovyBaby99@gmail.com')
    person.add_phone("0782817261")
    person.add_phone("0208716251")
    expect(person.to_s).to eq "Joe Bloggs was born on 1989-06-19. Their email addresses are: groovyBaby99@gmail.com. Their phone numbers are 0782817261, 0208716251."
  end

  it "should print out the details of the person" do
    person = Person.new("joe", "bloggs", '19 Jun 1989')
    person.add_email('groovyBaby99@gmail.com')
    person.add_phone("0782817261")
    expect { print "Joe Bloggs" }.to output("Joe Bloggs").to_stdout
    expect { print "----------" }.to output("----------").to_stdout
    expect { print "\n"}.to output("\n").to_stdout
    expect { print '19 Jun 1989' }.to output('19 Jun 1989').to_stdout
    expect { print "\n"}.to output("\n").to_stdout
    expect { print 'Email Addresses:' }.to output('Email Addresses:').to_stdout
    expect { print '- groovyBaby99@gmail.com' }.to output('- groovyBaby99@gmail.com').to_stdout
    expect { print "\n"}.to output("\n").to_stdout
    expect { print 'Phone Numbers:' }.to output('Phone Numbers:').to_stdout
    expect { print '- 0782817261' }.to output('- 0782817261').to_stdout
    expect { print "\n"}.to output("\n").to_stdout
  end

end

describe FamilyMember do

  it "should initialise properly" do
    bob = FamilyMember.new('bob', 'marley', 'Married', dob = '17 June 1989')
    expect(bob.first_name).to eq "Bob"
    expect(bob.surname).to eq "Marley"
    expect(bob.relationship).to eq "Married"
    expect(bob.dob).to eq Date.parse'17 June 1989'
  end

  it "should show the relationship" do
    bob = FamilyMember.new('bob', 'marley', 'Married')
    expect(bob.relationship).to eq 'Married'
  end

end

describe AddressBook do

  it "should initialize Person class with set of values type a" do
    person1 = Person.new("joe", "bloggs", "1 Jan 1990")
    expect(person1.class).to eq Person
    expect(person1.dob).to eq Date.parse("1 Jan 1990")
    expect(person1.first_name).to eq "Joe"
    expect(person1.surname).to eq "Bloggs"
    expect(person1.fullname).to eq "Joe Bloggs"
  end

  it "should initialize Person class with set of values type b" do
    person1 = Person.new("andy", "nother", "2 Jan 1995")
    expect(person1.class).to eq Person
    expect(person1.dob).to eq Date.parse("2 Jan 1995")
    expect(person1.first_name).to eq "Andy"
    expect(person1.surname).to eq "Nother"
    expect(person1.fullname).to eq "Andy Nother"
  end

  it "should initialise properly" do
    book = AddressBook.new
  end

  it "should add person full name to address book" do
    person1 = Person.new("joe", "blogs", "1 Jan 1990")
    person2 = Person.new("andy", "nother", "2 Jan 1995")
    book = AddressBook.new
    book.add person1
    book.add person2
    expect(book.persons).to eq ['Joe Blogs', 'Andy Nother']
  end

  it "should raise an exeption" do
    person1 = Person.new("joe", "blogs", "1 Jan 1990")
    book = AddressBook.new
    alien = 'Mary Poppins'
    expect{book.add alien}.to raise_exception(TypeError)
  end

  it "should print a list of names in the address book" do
    person1 = Person.new("joe", "blogs", "1 Jan 1990")
    person2 = Person.new("andy", "nother", "2 Jan 1995")
    book = AddressBook.new
    book.add person1
    book.add person2
    expect { print 'Address Book' }.to output('Address Book').to_stdout
    expect { print '------------' }.to output('------------').to_stdout
    expect { print 'Entry 1: Joe Blogs'}.to output('Entry 1: Joe Blogs').to_stdout
    expect { print 'Entry 2: Andy Nother'}.to output('Entry 2: Andy Nother').to_stdout
    expect { print "\n"}.to output("\n").to_stdout
  end

end
