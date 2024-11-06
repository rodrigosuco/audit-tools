module ApplicationHelper
  include Pagy::Frontend

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end
end
