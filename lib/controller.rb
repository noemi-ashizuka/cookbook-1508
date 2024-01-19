require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def add
    # ask view to ask the user for name
    name = @view.ask_for("name")
    # ask view to ask the user for description
    description = @view.ask_for("description")
    # make an instance with the user input
    recipe = Recipe.new(name, description)
    # ask the repo to store the recipe
    @cookbook.create(recipe)
  end

  def remove
    # display the recipes
    display_recipes
    # ask the view to ask the user for a number (index)
    index = @view.ask_for_index
    # ask the cookbook to remove the recipe
    @cookbook.destroy(index)
  end

  private

  def display_recipes
    # get the recipes from the cookbook
    recipes = @cookbook.all # array of recipes from cookbook
    # give the recipes to the view to display
    @view.display_list(recipes)
  end
end
