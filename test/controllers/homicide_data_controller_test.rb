require 'test_helper'

class HomicideDataControllerTest < ActionDispatch::IntegrationTest
  def setup
    HomicideDatum.create(
      country_or_area: 'USA',
      year: 2000,
      count: 100,
      rate: 5.5
    )

    HomicideDatum.create(
      country_or_area: 'Japan',
      year: 2005,
      count: 105,
      rate: 5.6
    )
  end

  test "index has correct count for homicide records" do
    get('/homicide_data')
    assert_response :ok

    homicide_data = JSON.parse(response.body)
    assert_equal HomicideDatum.count, homicide_data.length
  end

  test "index filtered by year pulls correct homicide record" do
    get('/homicide_data?year=2005')
    assert_response :ok

    homicide_data = JSON.parse(response.body)
    assert_equal 105, homicide_data[0]["count"]
  end

  test "index filtered by country pulls correct homicide record" do
    get('/homicide_data?country=USA')
    assert_response :ok

    homicide_data = JSON.parse(response.body)
    assert_equal 5.5, homicide_data[0]["rate"]
  end
end
