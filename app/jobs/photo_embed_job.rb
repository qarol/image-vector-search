class PhotoEmbedJob < ApplicationJob
  def perform(photo)
    embedding = $image_embedding.call(photo.file_path)
    photo.update(embedding: embedding)
  end
end