class HomicideDataController < ApplicationController
  def index
    year = params[:year]
    country = params[:country]

    # validations
    if year && !year.to_i > 1000
      return render json: {errors: ["Invalid year format"]}, :unprocessible_entity
    end

    homicide_data = HomicideDatum.all
    if year
      homicide_data = homicide_data.where(year: year)
    end

    if country
      homicide_data = homicide_data.where(country_or_area: country)
    end

    render json: homicide_data
  end
end
