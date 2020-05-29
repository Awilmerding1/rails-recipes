module ApplicationHelper

    def title_case(object_attribute)
      object_attribute.split(" ").map do |word|
        word[0] = word[0].upcase
        word
      end.join(" ")
    end

end
