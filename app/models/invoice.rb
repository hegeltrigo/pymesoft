require 'complicode'
require 'rqrcode_png'
class Invoice < ApplicationRecord
  belongs_to :invoice_dosage
  has_many :sales
  after_create :create_control_code
  before_create :set_number

  def qr_code_text
    "#{CompanyDetail.last.nit}|#{self.invoice_dosage.authorization_number}|#{self.issue_date.strftime('%d/%m/%Y')}|#{self.amount}|#{self.applicable_tax_credit_amount || 0}|#{self.control_code}|#{self.customer_nit}|#{self.ice_iehd_amount || 0}|#{self.amount_for_sales_at_zero_rate || 0}|#{self.amount_not_subject_to_tax_credit || 0}|#{self.rebates_and_discounts_earned ||0}"
  end

  def create_control_code
    authorization_code = self.invoice_dosage.authorization_number.to_s
    invoice_number = self.number.to_i
    issue_date = self.issue_date.to_s(:number).to_i
    nit = self.customer_nit.to_i || 0
    amount = self.amount.round(2)
    key = self.invoice_dosage.dosage_key.to_s
    self.control_code = Complicode::Generate.call(authorization_code: authorization_code,
                                                  invoice_number: invoice_number,
                                                  issue_date: issue_date,
                                                  nit: nit,
                                                  amount: amount,
                                                  key: key)    
      self.save
  end

  def set_number
    invoices = Invoice.all
    if(invoices.length > 0 )
      self.number = invoices.last.number + 1
    else
      self.number = self.invoice_dosage.invoice_initial_number
    end
    
  end

  def qr_code_image
    RQRCode::QRCode.new(qr_code_text).to_img.resize(200, 200).to_data_url
  end
end
