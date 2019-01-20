# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
