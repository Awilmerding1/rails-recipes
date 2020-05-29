```
class CustomFormBuilder < ActionView::Helpers::FormBuilder

  def my_fields_for(association, &block)
    association_attributes_method = "#{association}_attributes="
    object_class_downcase = @object.class.to_s.downcase
    association_attributes = "#{association}_attributes"
    object = @object
     if object.methods.include?(association.to_sym) && object.methods.include?(association_attributes_method.to_sym)
        object.send(association).each_with_index.map do |a, i|
          @object = a
          @index = i
          @object_name = "#{object_class_downcase}[#{association_attributes}][#{@index}]"
          yield(self, block)
          hidden_field(:id)
        end
     end.join("").html_safe
  end

end
```

```
<%=form_for @recipe, :builder => CustomFormBuilder do |f|%>
  <%= f.label 'Recipe Name' %><br>
    <%= f.text_field :name, required: true %><br>
      <%= f.label 'Recipe Ingredients' %><br>
    <%=f.my_fields_for(:ingredients) do |i| %>
      <%= i.label 'Ingredient Name' %><br>
      <%=i.text_field :name %><br>
    <%end%>
      <%= f.submit "Submit Recipe" %>
<%end%>

```
