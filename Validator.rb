require 'csv'

class Validator
  attr_reader :data
  def initialize (filename)
    @filename = filename
    @data = []
    CSV.foreach(@filename, headers:true) do |row|
      @data << row.to_hash
      end
  end

  def validate
    errors = []
    passed_counter = 0
    data.each_with_index { |row, index|
      checker = [index+2]
      if userchecker_joined(row["joined"]) == nil
        checker << "Joined date is incorrect"
      end

      if userchecker_email(row["email"]) == nil
        checker << "Email syntax is incorrect"
      end

      if userchecker_phone(row["phone"]) == nil
        checker << "Phone syntax is incorrect"
      end

      if checker.count > 1
        errors << checker
      else
        passed_counter+=1
      end
    }

    #errors = errors.each{|x| puts x.inspect}

    puts "These lines had errors:"
    errors = errors.each{|x| puts x.inspect}

    puts "#{passed_counter} records were correct."
    #cycle through each row of the CSV, pull out values, run against other methods
    #2 groups - ones that pass or fail
    #count the ones that pass
    #puts the failed rows
  end

  def userchecker_joined (a)
    true
    #a.to_s.match(regex)
    #regex for joined, needs to return true or false
  end

  def userchecker_email (a)
    true
    #regex for email, needs to return true or false
  end

  def userchecker_phone (a)
    a.to_s.match(/^\d{3}[\.\-]\d{3}[\.\-]\d{4}|^[\(]\d{3}[\)]\d{3}[\.\-]\d{4}|\d{10}|^[\(]\d{3}[\)]\s\d{3}[\.\-]\d{4}/)
    #regex for phone, needs to return true or false
  end
end

a = Validator.new('userinfo.csv')

a.validate
#p a.data
