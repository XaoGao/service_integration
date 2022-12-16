module Config
  class << self
    attr_reader :env

    def env=(env)
      raise StandardError unless %w[test development production].any? { |e| e == env }

      @env = env
    end

    def test?
      env == "test"
    end

    def development?
      env == "development"
    end

    def production?
      env == "production"
    end
  end
end
