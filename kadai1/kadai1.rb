require "csv"
data = Array.new
CSV.foreach("personal_infomation.csv") do |row|
    personal_data = {
        id: row[0],
        name: row[1],
        ruby: row[2],
        sex: row[3],
        tel: row[4],
        mobile: row[5],
        mail: row[6],
        zip: row[7],
        address1: row[8],
        address2: row[9],
        address3: row[10],
        address4: row[11],
        address5: row[12],
        birthday: row[13]
    }
    data.push personal_data
end
data.each do |personal_data|
    puts personal_data[:name]
end