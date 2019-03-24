
class OrderPdf < Prawn::Document

  def initialize(order)
    super(top_margin: 70)
    @order = order
    self.font_families.update("NotoSans_SemiCondensedBoldItalic" => {:normal => "#{Rails.root}/app/assets/fonts/NotoSans_SemiCondensedBoldItalic.ttf"})
    font "NotoSans_SemiCondensedBoldItalic"
    order_number
    line_items
  end


  def order_number
    text "Заказ № #{@order.id}"
  end

  def line_items
    move_down 20
    table line_item_rows do
      # row(0).font_style = :bold
      columns(1..3).align = :right
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.header = true
    end
  end

  def line_item_rows
    headline = ["Название", "Количество", "Цена продукта", "Полная стоимость"]
    data = [@order.product.name, @order.quantity, @order.order_price, @order.total_price]
    [headline, data]
  end



end