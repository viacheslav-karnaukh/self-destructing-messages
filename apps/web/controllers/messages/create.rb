module Web::Controllers::Messages
  class Create
    include Web::Action

    expose :message

    params do
      required(:message).schema do
        required(:text).filled(:str?)
      end
    end

    def call(params)
    	self.format = :json
    	#self.headers.merge!({ 'Content-Type' => 'application/json' })
    	if params.valid?
    		@message = MessageRepository.create(
    			Message.new(
    				text: params[:message][:text],
    				link: Digest::MD5.hexdigest(Time.new.to_f.to_s)
    			)
    		)
			self.status = 200
			self.body = JSON.generate({
				:text => @message.text,
				:link => @message.link
			})
    	else
    		self.status = 422
    		self.body = JSON.generate({:error => "Params should not be empty"})
    	end

    	
    end

  end
end
