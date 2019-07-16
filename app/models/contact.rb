class Contact < ActiveRecord::Base

    def self.collectContacts(user_id)
        contactUsers = ContactUser.where("user_id = ?", user_id)
        contacts = []
        contactUsers.each do |contactUser|
            contacts.push(contactUser.contact_id)
        end
        return contacts
    end
    
    def self.collectUsers(user_id)
        contacts = ContactUser.where("user_id = ?", user_id)
        users = []
        contacts.each do |contact|
            users.push(ContactUser.where("contact_id = ? and user_id <> ?", contact.id, user_id).first)
        end
        return users
    end

    def self.pairUser(user_id, contact_id)
        contactUser = ContactUser.where("contact_id = ? and user_id <> >", contact_id, user_id).first
        return User.find_by(user_id: contactUser.user_id)
    end

end
