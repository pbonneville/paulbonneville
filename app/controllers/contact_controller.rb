class ContactController < ApplicationController

	def new
		@title = 'Contact'
		@contact = Contact.new
	end

	def create
		@title = 'Contact'
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
			flash.now[:notice] = 'Your message has been delivered.'
		else
			flash.now[:error] = 'That\'s odd. I can\'t seem to send your message.'
			render :new
		end
	end
end
