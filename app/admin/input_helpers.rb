module ActiveAdmin::ViewHelpers
  ATTR_INPUT_HELPERS = {
  }

  def inputs_for_regular_attributes(f, attrs)
    attrs.each do |attr|
      attr = attr.to_sym
      if ATTR_INPUT_HELPERS[attr]
        self.send(ATTR_INPUT_HELPERS[attr], f, attr)
      else
        f.input attr
      end
    end
  end

  def translations(translated)
  	ary = Array.new
  	languages = %w[de en]
    translated.each do |prop|
      languages.each do |lang|
         ary.push "#{prop}_#{lang}".to_sym
      end
    end
    ary
  end

  def date_select(f, field, input_options={})
    f.input(field, input_options.merge({as: :datepicker}))
  end

  def number_as_text(f, field, input_options={})
    f.input(field, input_options.merge({as: :string}))
  end

  def spatial_as_text(f, field, input_options={})
    f.input(field, input_options.merge({as: :string}))
  end

  def add_check_boxes_to_field(form, field, collection, input_options={})
    input_options = input_options.merge({
      member_label: Proc.new { |a| a },
      collection: collection
    })
    form.input(field, input_options.merge({:as => :check_boxes}))
  end

  def humanize_time(secs)
    [[60, :s], [60, :m], [24, :h]].map{ |count, name|
      secs, n = secs.divmod(count)
      "%02d#{name}" % n.to_i
    }.compact.reverse.join(' ')
  end
end
