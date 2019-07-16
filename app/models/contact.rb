class Contact < ActiveRecord::Base

    def self.collectUsers(user_id)
        contactUsers = ContactUser.where("user_id = ?", user_id)
        users = []
        contactUsers.each do |contactUser|
            users.push(ContactUser.where("contact_id = ? and user_id <> ?", contactUser.id, user_id).first)
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
