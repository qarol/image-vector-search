ActiveSupport.on_load(:active_record) do
  $image_embedding = CLIP::ImageEmbedding.new
end