require "csv"
require "json"
require_relative "./user.rb"
users = Array.new
CSV.foreach("./personal_infomation.csv", headers: true) do |row|
    personal_data = User.new
    personal_data.id = row['no']
    personal_data.name = row['namae']
    personal_data.ruby = row['rubi']
    personal_data.sex = row['seibetu']
    personal_data.tel = row['denwa']
    personal_data.mobile = row['keitai']
    personal_data.mail = row['mair']
    personal_data.zip = row['yuubinbango']
    personal_data.address1 = row['jusho1']
    personal_data.address2 = row['jusho2']
    personal_data.address3 = row['jusho3']
    personal_data.address4 = row['jusho4']
    personal_data.address5 = row['jusho5']
    personal_data.birthday = row['tanjobi']

    users.push(personal_data)
end

# age_by_prefectures = Hash.new
# users.each do |user|
#     prefecture = user.address1
#     if age_by_prefectures[prefecture.to_sym]
#         age_by_prefectures[prefecture.to_sym].push(user.age)
#     else
#         age_by_prefectures[prefecture.to_sym] = Array.new([user.age])
#     end
# end


# ハッシュだけを用いた方法
age_by_prefectures = Hash.new
users.each do |user|
    prefecture = user.address1
    name = user.name
    if age_by_prefectures[prefecture.to_sym]
        age_by_prefectures[prefecture.to_sym][name.to_sym] = user.age
    else
        age_by_prefectures[prefecture.to_sym] = Hash.new({name.to_sym => user.age})
    end
end
# puts JSON.pretty_generate(age_by_prefectures)



CSV.open("./average_age.csv", "w") do |csv|
    csv.puts(["prefecture", "average age"])
    age_by_prefectures.each do |key, value|
        total_age = 0
        count = 0
        age_by_prefectures[key].each do |key, value|
            total_age = total_age + value
            count = count + 1
        end
        age_by_prefectures[key][:average_age] = total_age/count
        csv.puts([key.to_s, age_by_prefectures[key][:average_age].to_s])
    end
end
