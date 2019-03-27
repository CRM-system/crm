class OrderPdf < Prawn::Document

  def initialize(order)
    super(top_margin: 50, bottom_margin: 450)
    @order = order
    self.font_families.update("NotoSans_SemiCondensedBoldItalic" =>
                            {:normal => "#{Rails.root}/app/assets/fonts/NotoSans_SemiCondensedBoldItalic.ttf"})
    font "NotoSans_SemiCondensedBoldItalic"
    order_number
    receipt

  end

  def order_number
    indent(200) do
      text "Заказ № #{@order.id}"
    end
  end

  # def line_items
  #   move_down 20
  #   table line_item_rows do
  #     # row(0).font_style = :bold
  #     columns(1..3).align = :right
  #     self.row_colors = ['DDDDDD', 'FFFFFF']
  #     self.header = true
  #   end
  # end

  # def line_item_rows
  #   headline = ["Название", "Количество", "Цена продукта", "Полная стоимость"]
  #   data = [@order.product.name, @order.quantity, @order.order_price, @order.total_price]
  #   [headline, data]
  # end

  def receipt
    stroke_bounds
    move_down 30
    indent(40) do
      owner_name
      owner_address
      owner_company
    end
    move_down 20
    indent(280) do
      delivery_address
      delivery_person
      client_number
      total_price
    end
  end

  def owner_name
    text "От кого: #{@order.product.landing.owner}"
  end

  def owner_address
    text "Откуда : #{@order.product.landing.address}"
  end

  def owner_company
    text "Компания: #{@order.product.landing.organization}"
  end

  def delivery_address
    text "Куда: #{@order.client_addres}"
  end

  def total_price
    text "Сумма объявленной ценности: #{@order.total_price}"
  end

  def client_number
    text "Номер телефона заказчика: #{@order.client_phone}"
  end

  def delivery_person
    text "Кому: #{@order.client_name}"
  end

end

  # bounding_box([220, cursor],:width => 70,:height => 100) do
  #   text order_number
  # end

