module CompaniesHelper
  def format_phone(phone)
    "(#{phone[0..1]}) #{phone[2..6]}-#{phone[7..]}"
  end

  def format_cep(cep)
    "#{cep[0..4]}-#{cep[5..]}"
  end
end
