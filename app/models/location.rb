class Location < ActiveRecord::Base
  include Locatable

  has_many :employees
  geocoded_by :address
  after_validation :geocode

  accepts_nested_attributes_for :employees, allow_destroy: true, reject_if: :has_blank_attributes

  after_initialize do
    if employees.empty?
      employees.build
    end
  end

  def address
    # 1234 Some St. Apt 4, Salt Lake City, UT 84123, US
    "#{street_address} #{street_address2}, #{city}, #{state} #{zip}, US"
  end

  private

  def has_blank_attributes(employee_attrs)
    employee_attrs['name'].blank?
  end

end
