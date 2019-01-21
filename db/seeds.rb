# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def add_image_to_product(product, file)
  fixtures_path = Rails.root.join('app', 'assets', 'images', 'fixtures', "#{file}.jpg")
  product.picture.attach(io: File.open(fixtures_path), filename: "#{file}.jpg")
end

@role = Role.create!(
  name: 'admin'
)

@worker = Worker.create!(
  nickname: 'admin',
  email: 'admin@admin.com',
  password: 'qweasd',
  admin: true,
  role_id: @role.id
)

@function = Function.create!(
  model: (@model_product = 'product'),
  name: 'index',
  description: 'Просмотр всех товаров',
  access: true,
  role_id: @role.id
)

@function = Function.create!(
  model: @model_product,
  name: 'edit',
  description: 'Изменение настроек товара',
  access: true,
  role_id: @role.id
)

@function = Function.create!(
  model: @model_product,
  name: 'duplicate',
  description: 'Создание копии товара',
  access: true,
  role_id: @role.id
)

@function = Function.create!(
  model: @model_product,
  name: 'show',
  description: 'Просмотр настроек товара',
  access: true,
  role_id: @role.id
)

@function = Function.create!(
  model: @model_product,
  name: 'new',
  description: 'Создание нового товара',
  access: true,
  role_id: @role.id
)

@function = Function.create!(
  model: @model_product,
  name: 'destroy',
  description: 'Удаление товара',
  access: true,
  role_id: @role.id
)

@function = Function.create!(
  model: (@model_worker = 'worker'),
  name: 'create',
  description: 'Создание нового сотрудника',
  access: true,
  role_id: @role.id
)

wallet1 = Product.create(
  name: 'Бумажник',
  price: 5000,
  description: 'Кожанный бумажник чёрного цвета'
)
wallet2 = Product.create(
  name: 'Бумажник',
  price: 4500,
  description: 'Кожанный бумажник коричневого цвета.Качество кожи хорошее'
)
wallet3 = Product.create(
  name: 'Бумажник',
  price: 3500,
  description: 'Бумажник из материи'
)
wallet4 = Product.create(
  name: 'Бумажник',
  price: 2500,
  description: 'Бумажник чёрного цвета из кож.зама'
)
wallet5 = Product.create(
  name: 'Бумажник',
  price: 2500,
  description: 'Бумажник коричневого цвета из кожзама'
)

add_image_to_product(wallet1,'бумажник1')
add_image_to_product(wallet2,'бумажник2')
add_image_to_product(wallet3,'бумажник3')
add_image_to_product(wallet4,'бумажник4')
add_image_to_product(wallet5,'бумажник5')


