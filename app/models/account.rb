require 'rake'
class Account < ApplicationRecord
  has_one_attached :image
  RESTRICTED_SUBDOMAINS = %w(www)

  belongs_to :owner, class_name: 'User', optional: false
  # enum level: [:service, :basic, :medium, :large, :pro]

  # validates :level, presence: true
  validates :subdomain, presence: true,
                        uniqueness: { case_sensitive: false },
                        format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters' },
                        exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'restricted' }


  accepts_nested_attributes_for :owner

  before_validation :downcase_subdomain

  #after_create :reindex_tenant

  private

  def downcase_subdomain
    self.subdomain = subdomain.try(:downcase)
  end
  
  #def reindex_tenant
  #  ReindexTenantJob.perform_later self.subdomain
  #end  
end
