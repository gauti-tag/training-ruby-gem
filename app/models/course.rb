class Course < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true, length: {minimum: 5}
    belongs_to :user
    has_rich_text :description
    
    def to_s
     title
    end
    
    extend FriendlyId
    # friendlyId from title
    #friendly_id :title, use: :slugged
    
    #friendlyId from random number -- use for finance transaction
    friendly_id :generated_slug, use: :slugged
    
    def generated_slug
        require 'securerandom'
        @random_slug ||= persisted? ? friendly_id : SecureRandom.hex(4) 
    end
end
