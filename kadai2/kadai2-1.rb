require "csv"
require_relative "./class_only.rb"
data = Array.new
CSV.foreach("./personal_infomation.csv", headers: true) do |row|
    personal_data = Class_Only.new(row)
    data.push(personal_data)
end
data.each do |personal_data|
    personal_data.name
end