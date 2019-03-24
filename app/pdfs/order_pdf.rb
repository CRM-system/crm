
class OrderPdf < Prawn::Document

  def initialize
    super()
    # self.font_families.update("AcademyOldClassic" => {:normal => "#{Rails.root}/public/AcademyOldClassic.ttf"})
    # font "AcademyOldClassic"
    text 'Order'
  end


  def order_number
    text "Order \##{@order.id}", size: 30, style: :bold
  end

  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.header = true
    end
  end
end