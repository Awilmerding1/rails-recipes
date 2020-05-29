class RecipeValidator < ActiveModel::Validator

  def validate(record)

    unless record.description.include?("time")
      record.errors[:description] << "must include time"
    end

  end

end
