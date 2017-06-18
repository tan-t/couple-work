class PortalController < BaseController

  def index
    @messages = Messages::MessagesService.get_unread_messages @user
  end

end
