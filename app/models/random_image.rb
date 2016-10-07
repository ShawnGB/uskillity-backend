class RandomImage
  class << self

    def asset_base
      '/assets/unsplash.com/'
    end

    def images
      [
        "colors.png", "dand.png", "fumes.png", "green1.png", "leaves.png",
        "pollen2.png"
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

