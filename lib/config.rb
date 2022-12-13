module SI
  class Config
    class << self
      attr_reader :env

      def env=(env)
        raise StandardError unless %w[test dev production].any? { |e| e == env }

        @env = env
      end

      def test?
        env == "test"
      end

      def dev?
        env == "dev"
      end

      def production?
        env == "production"
      end
    end
  end
end
