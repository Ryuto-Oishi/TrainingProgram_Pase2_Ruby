require "csv"
require "json"
require_relative "./user.rb"
require_relative "./age_error.rb"
users = Array.new
minor_users = Array.new
CSV.foreach("./personal_infomation.csv", headers: true) do |row|
    personal_data = User.new
    personal_data.id = row['no']
    personal_data.name = row['namae']
    personal_data.ruby = row['rubi']
    personal_data.sex = row['seibetu']
    personal_data.tel = row['denwa']
    personal_data.mobile = row['keitai']
    personal_data.mail = row['mairu']
    personal_data.zip = row['yuubinbango']
    personal_data.address1 = row['jusho1']
    personal_data.address2 = row['jusho2']
    personal_data.address3 = row['jusho3']
    personal_data.address4 = row['jusho4']
    personal_data.address5 = row['jusho5']

    begin
        personal_data.birthday = row['tanjobi']
    rescue AgeError
        minor_users.push(personal_data)
    end
    
    users.push(personal_data)
end

