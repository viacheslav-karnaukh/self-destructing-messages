module Web::Controllers::Messages
  class Show
    include Web::Action

    expose :message

    def call(params)
    	@message = MessageRepository.find_by_link(params[:id])
    	unless @message.nil?
    		MessageRepository.delete(@message) 	
    	end
    end
  end
end