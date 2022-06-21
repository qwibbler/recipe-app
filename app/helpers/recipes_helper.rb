module RecipesHelper
  def time_hrs(time)
    return 'N/A' if time.nil?

    "#{time} hour" + time == 1 ? '' : 's'
  end

  def update_public(recipe)
    if recipe.update(params.permit(public:))
      flash.now[:notice] = 'Recipe was successfully updated.'
    else
      flash.now[:error] = 'Recipe was not updated.'
    end
  end
end
