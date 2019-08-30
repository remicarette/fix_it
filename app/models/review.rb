class Review < ApplicationRecord
  belongs_to :booking

  def convert_date(date_at)
    months = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Julliet", "Août", "Septembre", "Octobre", "Novembre", "Decembre"]
    datum = date_at.to_s
    year = datum[0..3]
    month = months[datum[5..6].to_i - 1]
    day = datum[8..9]
    return "#{day} #{month}, #{year}"
  end

end
