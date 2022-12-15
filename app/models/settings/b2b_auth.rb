module SI
  module Settings
    class B2bAuth
      attr_reader :intervals, :reserves

      def initialize(b2b_auth)
        raise StandardError "intervals can be nil or empty" if b2b_auth[:intervals].nil?
        raise StandardError "reserves can be nil or empty" if b2b_auth[:reserves].nil?

        @intervals = b2b_auth[:intervals].map { |interval| Interval.new(interval) }
        @reserves = Reserves.new b2b_auth[:reserves]
      end
    end
  end
end
