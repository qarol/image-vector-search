class Photo < ApplicationRecord
  has_one_attached :file
  has_neighbors :embedding, dimensions: 512

  after_create :calculate_embedding

  def similar
    nearest_neighbors(:embedding, distance: :cosine)
  end

  def self.by_description(description)
    embedding = $text_embedding.call(description)
    nearest_neighbors(:embedding, embedding, distance: :cosine)
  end

  def self.by_image(image)
    Photo.all
  end

  def file_path
    ActiveStorage::Blob.service.send(:path_for, file.key)
  end

  private

  def calculate_embedding
    PhotoEmbedJob.perform_later(self)
  end
end
