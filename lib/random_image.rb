class RandomImage
  class << self

    def asset_base
      '/assets/unsplash.com/'
    end

    def images
      [
        "camera.png", "coffee.png", "colors.png", "dand.png", "fumes.png",
        "green1.png", "green2.png", "leaves.png", "pepper.png", "pollen1.png",
        "pollen2.png", "shoe.png", "sky.png", "sunflower.png", "tomatoes.png",
        "vegetables.png"
      ]
    end

    def get(count=1)
      if count == 1
        asset_base + images.sample
      else
        count.times.map { asset_base + images.sample }
      end
    end

  end
end

