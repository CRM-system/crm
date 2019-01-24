# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def add_functions_for(role)
  Function.all.each do |function|
    role.functions << function.dup
  end
end

def set_functions_accesses_to_false(role)
  role.functions.each do |function|
    function.update(access: false)
  end
end

def add_image_to_product(product, file)
  fixtures_path = Rails.root.join('app', 'assets', 'images', 'fixtures', "#{file}.jpg")
  product.picture.attach(io: File.open(fixtures_path), filename: "#{file}.jpg")
end

@role = Role.create!(
  name: 'Администратор'
)
@worker = Worker.create!(
  nickname: 'admin',
  email: 'admin@admin.com',
  password: 'qweasd',
  admin: true,
  role_id: @role.id
)

@function = Function.create!(
  model: (@model_order = 'order'),
  name: 'index',
  description: 'Просмотр всех заказов',
  access: true,
  role_id: @role.id
  )

@function = Function.create!(
  model: @model_order,
  name: 'edit',
  description: 'Редактирование заказа',
  access: true,
  role_id: @role.id
  )

@function = Function.create!(
  model: @model_order,
  name: 'show',
  description: 'Просмотр заказа',
  access: true,
  role_id: @role.id
  )

@function = Function.create!(
  model: @model_order,
  name: 'new',
  description: 'Создание заказа',
  access: true,
  role_id: @role.id
  )

@function = Function.create!(
  model: @model_order,
  name: 'destroy',
  description: 'Удаление заказа',
  access: true,
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

@function = Function.create!(
  model: @model_worker,
  name: 'index',
  description: 'Просмотр всех сотрудников',
  access: true,
  role_id: @role.id
)

@function = Function.create!(
  model: @model_worker,
  name: 'destroy',
  description: 'Удаление сотрудников',
  access: true,
  role_id: @role.id
)

@function = Function.create!(
  model: @model_worker,
  name: 'edit',
  description: 'Редактирование сотрудников',
  access: true,
  role_id: @role.id
)

@function = Function.create!(
  model: (@model_role = 'role'),
  name: 'index',
  description: 'Просмотр всех должностей',
  access: true,
  role_id: @role.id
)

@function = Function.create!(
  model: @model_role,
  name: 'new',
  description: 'Создание новых должностей',
  access: true,
  role_id: @role.id
)

@function = Function.create!(
  model: @model_role,
  name: 'destroy',
  description: 'Удаление должностей',
  access: true,
  role_id: @role.id
)

@function = Function.create!(
  model: @model_role,
  name: 'edit',
  description: 'Удаление должностей',
  access: true,
  role_id: @role.id
)

# Директор и оператор
@role_director = Role.create!(
  name: 'Директор'
)
@worker_director = Worker.create!(
  nickname: 'director',
  email: 'director@dir.com',
  password: 'qweasd',
  admin: false,
  role_id: @role_director.id
)
add_functions_for(@role_director)
@role_director.functions.where(model: 'product', name: 'destroy').first.update(access: false)
@role_director.functions.where(model: 'worker', name: 'destroy').first.update(access: false)
@role_director.functions.where(model: 'worker', name: 'edit').first.update(access: false)
@role_director.functions.where(model: 'worker', name: 'create').first.update(access: false)
@role_director.functions.where(model: 'role', name: 'new').first.update(access: false)
@role_director.functions.where(model: 'role', name: 'destroy').first.update(access: false)
@role_director.functions.where(model: 'role', name: 'edit').first.update(access: false)


@role_operator = Role.create!(
  name: 'Оператор'
)
@worker_operator = Worker.create!(
  nickname: 'operator',
  email: 'operator@op.com',
  password: 'qweasd',
  admin: false,
  role_id: @role_operator.id
)
add_functions_for(@role_operator)
set_functions_accesses_to_false(@role_operator)
@role_operator.functions.where(model: 'product', name: 'index').first.update(access: true)
# --------------------------------------------------


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
