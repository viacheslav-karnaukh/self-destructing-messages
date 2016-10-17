class MessageRepository
  include Hanami::Repository

  def self.find_by_link(link)
  	query do
		where(link: link)
  	end.first
  end
end
