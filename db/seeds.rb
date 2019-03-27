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
  nickname: 'Марк(админ)',
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
  description: 'Редактирование должностей',
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
tree = Product.create(
  name: 'Елка',
  price: 25000,
  description: 'Искусственная Новогодняя елка'
)

add_image_to_product(tree,'tree')


order_status = OrderStatus.create(
  title: 'find_out',
  description: 'Нужно выяснить у клиента какие - то данные',
  translate_ru: 'Выяснить'
)
order_status = OrderStatus.create(
  title: 'confirmed',
  description:'Клиент подтвердил покупку товара.Все данные клиента записаны',
  translate_ru: 'Подтверждённый'
)
order_status = OrderStatus.create(
  title: 'rejection',
  description: 'Клиент отказался от покупки товара',
  translate_ru: 'Отказ'
  )
order_status = OrderStatus.create(
  title: 'deferred',
  description: 'Покупка заказа отсрочена.Нужно позднее связаться с клиентом
                и выяснить будет ли он покупать товар',
  translate_ru:'Отсроченный'
  )
order_status = OrderStatus.create(
  title: 'assemblage',
  description: 'Заказ собирается на складе',
  translate_ru: 'Сборка заказа'
  )
order_status = OrderStatus.create(
  title: 'prepared',
  description: 'Заказ собран и подготовлен к отправке',
  translate_ru: 'Подготовленный'
  )
order_status = OrderStatus.create(
  title: 'sent',
  description: 'Заказ отправлен клиенту',
  translate_ru: 'Отправленный'
  )
order_status = OrderStatus.create(
  title: 'handed_in',
  description: 'Заказ вручен клиенту',
  translate_ru: 'Врученный'
  )
order_status = OrderStatus.create(
  title: 'handed_and_paid',
  description: 'Заказ вручен и оплачен',
  translate_ru: 'Вручен и оплачен',
  )
order_status = OrderStatus.create(
  title: 'return',
  description: 'Возврат',
  translate_ru: 'Возврат'
)
order_status = OrderStatus.create(
  title: 'refund_received',
  description: 'Возврат получен',
  translate_ru: 'Возврат получен'
  )
order_status = OrderStatus.create(
  title: 'delivered',
  description: 'Заказ доставлен',
  translate_ru: 'Доставлен'
  )
order_status = OrderStatus.create(
  title: 'reminder_1',
  description: 'Напоминание о чём то',
  translate_ru: 'Напоминание 1'
  )
order_status = OrderStatus.create(
  title: 'reminder_2',
  description: 'Напоминание о чём то',
  translate_ru: 'Напоминание 2'
  )
order_status = OrderStatus.create(
  title: 'unconfirmed',
  description: 'Заказ не подтверждён',
  translate_ru: 'Не подтверждён'
  )
order_status = OrderStatus.create(
  title: 'wanted',
  description: 'Поиск товара',
  translate_ru: 'Розыскивается'
  )
