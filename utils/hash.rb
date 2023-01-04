class Hash
  def deep_transform_to_snake_case
    deep_transform_keys { |key| key.to_s.underscore.to_sym }
  end

  def deep_transform_keys(&block)
    result = {}
    each do |key, value|
      result[yield(key)] = value.is_a?(Hash) ? value.deep_transform_keys(&block) : value
    end
    result
  end
end
