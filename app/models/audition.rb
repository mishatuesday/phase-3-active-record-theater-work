class Audition < ActiveRecord::Base
    belongs_to :role

    def role
        Role.find_by(id: self.role_id)
    end
    def call_back
        self.hired = true
        self.save
    end
end