module RecipesHelper
  def time_hrs(time)
    return 'N/A' if time.nil? || time.hour.zero?

    "#{time.hour} hour#{time.hour == 1 ? '' : 's'}"
  end
end
