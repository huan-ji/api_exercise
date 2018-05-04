require 'csv'

class CreateHomicideData < ActiveRecord::Migration[5.2]
  def change
    create_table :homicide_data do |t|
      t.string :country_or_area, null: false
      t.integer :year, null: false
      t.integer :count
      t.float :rate
      t.string :source
      t.string :source_type

      t.timestamps
    end

    homicide_data = CSV.read('UNdata_Export_20180503_213736953.csv')
    homicide_data.each do |row|
      next if row.length == 0

      homicide_datum = HomicideDatum.new

      homicide_datum.country_or_area = row[0]
      homicide_datum.year = row[1]
      homicide_datum.count = row[2]
      homicide_datum.rate = row[3]
      homicide_datum.source = row[4]
      homicide_datum.source_type = row[5]

      homicide_datum.save
    end
  end
end
