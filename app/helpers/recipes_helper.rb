module RecipesHelper
  def time_hrs(time)
    return 'N/A' if time.nil? || time.strftime("%-I") == 0

    time.strftime("%-I Hour") + (time.strftime("%-I").to_i != 1 ? 's' : '')
  end
end
