module RecipesHelper
  def time_hrs(time)
    return 'N/A' if time.nil?

    "#{time} hour" + time == 1 ? '' : 's'
  end
end
