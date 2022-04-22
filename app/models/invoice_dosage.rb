class InvoiceDosage < ApplicationRecord

  after_create :inactive_others
  has_many :invoices
  validate :dead_line_date_greater_than_current_time

  def inactive_others
    InvoiceDosage.where.not(id: self.id).each do |dosage|
      if dosage.active
        dosage.update_attribute(:active, false)
      end  
    end  
  end  

  def dead_line_date_greater_than_current_time
    if self.emission_deadline < Time.now
      errors.add(:emission_deadline, "La fecha de finalización tiene que ser mayor a la fecha actual")
    end  
  end  
  
end
