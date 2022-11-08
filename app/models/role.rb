class Role < ActiveRecord::Base
    has_many :auditions

    def auditions
        Audition.where("role_id = #{self.id}")
    end
    def actors
        self.auditions.map {|a| a.actor}
    end
    def locations
        self.auditions.map {|a| a.location}
    end
    def lead
        if lead = self.auditions.find_by(hired: true)
            lead
        else
            "no actor has been hired for this role"
        end
    end
    def understudy
        hired_actors = self.auditions.select {|a| a.hired == true}
        if hired_actors[1]
            return hired_actors[1]
        else
            "no actor has been hired for understudy for this role"
        end
    end
end