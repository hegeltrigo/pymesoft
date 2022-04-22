class ReindexTenantJob < ApplicationJob
  queue_as :urgent

  def perform(subdomain)
    Rails.application.eager_load!
    Apartment::Tenant.switch!(subdomain)   
    Searchkick.models.each do |model|
      puts "Reindexing #{model.name} on #{subdomain}"
      model.reindex
    end
  end
end
