class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def round_to_half(float)
    (float * 2.0).round / 2.0
  end

  def show_stars(num)
    a = num.divmod 1
    full_stars = a[0]
    half_stars = (a[1] * 2).to_i
    empty_stars = 5 - full_stars - half_stars
    return [full_stars, half_stars, empty_stars]
  end

end
