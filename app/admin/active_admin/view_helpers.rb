module ActiveAdmin::ViewHelpers

  def translations(translated)
  	ary = Array.new
  	languages = %w[en de]
    translated.each do |prop|
      languages.each do |lang|
         ary.push "#{prop}_#{lang}".to_sym
      end
    end
    ary
  end

end
