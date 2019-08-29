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

  def next_available_slot(pro)
    ty = Date.today
    tw = Date.tomorrow
    h_ty = (Time.now.to_s[11] + Time.now.to_s[12]).to_i
    h_tw = 7
    @availability_ty = []
    @availability_tw = []
    (18 - h_ty).times do
      @availability_ty << "#{ty} #{h_ty += 1}:00"
    end
    12.times do
      @availability_tw << "#{tw} #{h_tw += 1}:00"
    end
    booked_out = []
    pro.bookings.each do |booking|
      booked_out << "#{booking.begin.date} #{booking.begin.hour}:00"
    end
    booked_out.each do |booked|
      @availability_ty.delete(booked)
      @availability_tw.delete(booked)
    end
    if @availability_ty.nil?
      @availability_tw.nil? ? "Sorry, #{pro.full_name} is booked out" : "Disponible demain #{@availability_tw.first.slice(-5..-1)}"
    else
      return "Disponible aujourd'hui #{@availability_ty.first.slice(-5..-1)}"
    end
  end

  def availability_pros(pro)
    ty = Date.today
    tw = Date.tomorrow
    h_ty = (Time.now.to_s[11] + Time.now.to_s[12]).to_i
    h_tw = 7
    @availability_ty = []
    @availability_tw = []
    (18 - h_ty).times do
      @availability_ty << "#{ty} #{h_ty += 1}:00"
    end
    12.times do
      @availability_tw << "#{tw} #{h_tw += 1}:00"
    end
    booked_out = []
    pro.bookings.each do |booking|
      booked_out << booking.begin
    end
    booked_out.each do |booked|
      @availability_ty.delete(booked)
      @availability_tw.delete(booked)
    end
    if @availability_ty.nil?
      return @availability_tw.first
    else
      return @availability_ty.first
    end
  end
end
