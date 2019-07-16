module ContactHelper
    class MessageData
        attr_reader :name, :message, :isMe
        
        def initialize(name, message, isMe)
            @name = name
            @message = message
            @isMe = isMe
        end
    end
end
