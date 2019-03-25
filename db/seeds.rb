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
  model: (@model_landing = 'landing'),
  name: 'index',
  description: 'Просмотр всех лендингов',
  access: true,
  role_id: @role.id
)

@function = Function.create!(
  model: @model_landing,
  name: 'edit',
  description: 'Редактирование лендинга',
  access: true,
  role_id:@role.id
)

@function = Function.create!(
  model: @model_landing,
  name: 'show',
  description: 'Просмотр лендинга',
  access: true,
  role_id: @role.id 
)

@function = Function.create!(
  model: @model_landing,
  name: 'new',
  description: 'Создание лендинга',
  access: true,
  role_id: @role.id 
)

@function = Function.create!(
  model: @model_landing,
  name: 'destroy',
  description: 'Удаление лендинга',
  access: true,
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

OrderStatus.all.each do |order_status|
  RoleOrderStatus.create!(
    order_status_id: order_status.id,
    role_id: @role.id
    )
end

# if Rails.env.test? 
  if Rails.env.development?

  def add_image_to_product(product, file)
    fixtures_path = Rails.root.join('app', 'assets', 'images', 'fixtures', "#{file}.jpg")
    product.picture.attach(io: File.open(fixtures_path), filename: "#{file}.jpg")
  end

  tree = Product.create(
    name: 'Елка',
    price: 25000,
    description: 'Искусственная Новогодняя елка'
    )

  add_image_to_product(tree,'tree')

  Order.create!(
    client_name: 'Василий',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Пушкина 77',
    order_price: 25000,
    quantity: 2,
    total_price: 50000,
    status: 'new_order',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Иван',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Ленина 77',
    order_price: 25000,
    quantity: 2,
    total_price: 50000,
    status: 'confirmed',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Николай',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Сталина 77',
    order_price: 25000,
    quantity: 2,
    total_price: 50000,
    status: 'unconfirmed',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Глеб',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Абая 77',
    order_price: 25000,
    quantity: 3,
    total_price: 75000,
    status: 'rejection',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Олег',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Маркса 77',
    order_price: 25000,
    quantity: 3,
    total_price: 75000,
    status: 'find_out',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Павел',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Энгельса 77',
    order_price: 25000,
    quantity: 3,
    total_price: 75000,
    status: 'deferred',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Владимир',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Шакарима 77',
    order_price: 25000,
    quantity: 4,
    total_price: 100000,
    status: 'assemblage',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Станислав',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Макатаева 77',
    order_price: 25000,
    quantity: 4,
    total_price: 100000,
    status: 'prepared',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Анатолий',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Навои 77',
    order_price: 25000,
    quantity: 4,
    total_price: 100000,
    status: 'sent',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Дмитрий',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Гоголя 77',
    order_price: 25000,
    quantity: 1,
    total_price: 25000,
    status: 'handed_in',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Антон',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Крылова 77',
    order_price: 25000,
    quantity: 1,
    total_price: 25000,
    status: 'handed_and_paid',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Захар',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Толстого 77',
    order_price: 25000,
    quantity: 1,
    total_price: 25000,
    status: 'return',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Михаил',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Лермонтова 77',
    order_price: 25000,
    quantity: 1,
    total_price: 25000,
    status: 'refund_received',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Кирилл',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Фета 77',
    order_price: 25000,
    quantity: 5,
    total_price: 125000,
    status: 'delivered',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Константин',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Тютчева 77',
    order_price: 25000,
    quantity: 5,
    total_price: 125000,
    status: 'reminder_1',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Евгений',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Сейфулина 77',
    order_price: 25000,
    quantity: 5,
    total_price: 125000,
    status: 'reminder_2',
    product_id: '1'
    )
  Order.create!(
    client_name: 'Афанасий',
    client_phone: '+123456789',
    client_email: 'test@test',
    client_addres: 'ул. Блока 77',
    order_price: 25000,
    quantity: 5,
    total_price: 125000,
    status: 'wanted',
    product_id: '1'
    )
end