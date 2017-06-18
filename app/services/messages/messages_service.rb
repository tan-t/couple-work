module Messages
  module MessagesService
    module_function
    def get_unread_messages user
      p user
      return Message.where(target_user:user[:id],already_read:false,delete_flg:false)
    end

    def update_messages_read! messages
      return messages.update(already_read:true)
    end

    def create_messages_with_annotation!(text,user) #,service,service_id)
      get_annotated_users(text).each do |to_user|
        Message.create(message:text,user:user,target_user:to_user.id).save
      end
    end

    def get_annotated_users text
      regexp = /@(.*?)( |$)/
      annotations = text.scan regexp
      users = []
      annotations.each do |annotation|
        user_name = annotation[0]
        if users.include? user_name
          next
        end

        if User.exists?(name:user_name)
          users.push user_name
        end
      end

      return users.map do |user_name|
        User.where(name:user_name).take
      end

    end

  end
end
