class Admin::CommentsController < AdminController
	def create
		@order = Order.find(params[:order_id])
		@comment = @order.comments.create(comment_params)

		respond_to do |format|
			format.html { redirect_to @order }
			format.js {}
		end
	end

	def destroy
		@order = Order.find(params[:order_id])	
		@comment = @order.comments.find(params[:id])
		@comment.destroy
		redirect_to admin_order_path(@order)
	end

	private

	def comment_params
		params.require(:comment).permit(:worker_id, :body)
	end

end
