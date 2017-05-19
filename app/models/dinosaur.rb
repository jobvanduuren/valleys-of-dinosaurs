class Dinosaur < ApplicationRecord
  def self.order_by_name
    order(:name)
  end

  def is_baby?
    age < 3
  end

  def create
      dinosaur_params = params.require(:dinosaur).permit(:name, :age, :image_url)

      @dinosaur = Dinosaur.new(dinosaur_params)

      if @dinosaur.save
         redirect_to @dinosaur
      else
         render 'new'
      end
  end

end
