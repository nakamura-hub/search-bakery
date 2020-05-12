# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..10).each do |number|
  Shop.create(name: '大阪店舗 ' + number.to_s, address: '大阪府' + number.to_s,
              station_name: '大阪駅' + number.to_s, open: '12:00-14:00' + number.to_s,
              close: '木曜日 金曜日' + number.to_s)
end

(1..10).each do |number|
  Shop.create(name: '東京 ' + number.to_s, address: '東京都' + number.to_s,
              station_name: '東京駅' + number.to_s, open: '11:00-14:00' + number.to_s,
              close: '火曜日 日曜日' + number.to_s)
end

(1..10).each do |number|
  Shop.create(name: '京都店舗 ' + number.to_s, address: '京都府' + number.to_s,
              station_name: '京都駅' + number.to_s, open: '12:00-14:00' + number.to_s,
              close: '木曜日 日曜日' + number.to_s)
end

(1..10).each do |number|
  Shop.create(name: '沖縄店舗 ' + number.to_s, address: '沖縄県' + number.to_s,
              station_name: '沖縄駅' + number.to_s, open: '11:00-14:00',
              close: 'なし')
end