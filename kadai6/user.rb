require "date"
class User
    attr_accessor :id, :name, :ruby, :sex, :tel, :mobile, :mail, :zip,
    :address1, :address2, :address3, :address4, :address5, :birthday

    def address
        @address = [@address1, @address2, @address3, @address4, @address5].join(" ")
    end
    def age
        today = Date.today
        birthday = Date.parse(@birthday)
        @age = ((today.strftime('%Y%m%d').to_f - birthday.strftime('%Y%m%d').to_f) / 10000).to_i
    end

    def check_age(age)
        if age < 18
            raise MinorUserError.new("エラー：18歳未満のデータが挿入されました")
        end
    end

end

class MinorUserError < StandardError
    def initialize(message)
        super(message)
    end
end