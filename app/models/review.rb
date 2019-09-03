class Review < ApplicationRecord
  belongs_to :booking

  def convert_date(date_at)
    months = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"]
    datum = date_at.to_s
    year = datum[0..3]
    month = months[datum[5..6].to_i - 1]
    datum[8..9].to_i < 10 ? day = datum[9] : day = datum[8..9]
    return "#{day} #{month} #{year}"
  end

end
