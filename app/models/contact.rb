class Contact < ActiveRecord::Base

    def self.collectUsers(user_id)
        contactUsers = ContactUser.where("user_id = ?", user_id)
        users = []
        contactUsers.each do |contactUser|
            contactUsers2 = ContactUser.where("contact_id = ? and user_id <> ?", contactUser.contact_id, user_id).first
            if contactUsers2
                user = User.find_by(user_id: contactUsers2.user_id)
                users.push(user)
            end
        end
        return users
    end

    def self.findContactId(user_id1, user_id2)
        contactUser = ContactUser.where("user_id = ?",  user_id1)
        return ContactUser.where("contact_id = ? and user_id = ?", contactUser.contact_id, user_id2).first
    end
    
    def self.pairUser(user_id, contact_id)
        contactUser = ContactUser.where("contact_id = ? and user_id <> >", contact_id, user_id).first
        return User.find_by(user_id: contactUser.user_id)
    end

end
