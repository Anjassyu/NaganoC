# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
	email: 'a@a',
	password: '000000')

Customer.create!(
	email: 'b@b',
	password: '123456',
	family_name_kanji: '山田',
	family_name_kana: 'ヤマダ',
	first_name_kanji: '花子',
	first_name_kana:'ハナコ',
	postcode: '123456',
	address: '東京都渋谷区渋谷１−２−３',
    tel: '09011111111',
	admission_status: true)

Genre.create!(
	name: 'プリン',
	effectiveness: true)

Product.create!(
	genre_id: 1,
    name: 'イタリアンプリン',
    description: '大人気',
    price: 280,
    sales_status: true)

Delivery.create!(
	customer_id: 1,
	name: '浜田　雅功',
	postcode: '1234567',
	address: '東京都新宿区歌舞伎町')