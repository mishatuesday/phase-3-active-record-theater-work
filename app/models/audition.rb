class Audition < ActiveRecord::Base
    belongs_to :role

    def role
        Role.find_by(id: self.role_id)
    end
end