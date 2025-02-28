module CLIP
  class ImageEmbedding
    def initialize(model_path: "model/visual.onnx", preprocessor: CLIP::ImagePreprocessor.new)
      @model = OnnxRuntime::Model.new(model_path)
      @preprocessor = preprocessor
    end

    def call(image_path)
      image = preprocessor.preprocess(image_path).to_a
      model.predict({ input: [image] })["output"].first
    end

    private

    attr_reader :model, :preprocessor
  end
end
