require "csv"
data = Array.new
CSV.foreach(path="./personal_infomation.csv", headers: true) do |row|
    personal_data = {
        id: row['no'],
        name: row['namae'],
        ruby: row['rubi'],
        sex: row['seibetu'],
        tel: row['denwa'],
        mobile: row['keitai'],
        mail: row['mair'],
        zip: row['yuubinbango'],
        address1: row['jusho1'],
        address2: row['jusho2'],
        address3: row['jusho3'],
        address4: row['jusho4'],
        address5: row['jusho5'],
        birthday: row['tanjobi']
    }
    data.push personal_data
end
data.each do |personal_data|
    puts personal_data[:name]
end