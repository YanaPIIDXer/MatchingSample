module ContactListHelper
    class ContactListData
        attr_reader :user_id, :name, :has_not_read
        
        def initialize(user_id, name, has_not_read)
            @user_id = user_id
            @name = name
            @has_not_read = has_not_read
        end
    end
end
