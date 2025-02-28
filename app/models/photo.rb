class Photo < ApplicationRecord
  has_one_attached :file
  has_neighbors :embedding, dimensions: 512

  after_create :calculate_embedding

  def similar
    Photo.all
  end

  def self.by_description(description)
    Photo.all
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
