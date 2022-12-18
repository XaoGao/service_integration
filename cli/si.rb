require "thor"

class SICLI < Thor
  desc "s ENV", "Run application"
  def s(env = :development)
    if %i[test development production].all? { |e| e != env.to_sym }
      raise StandardError "env must be any [test, development, production]"
    end

    ARGV.clear
    ARGV[0] = env.to_sym
    require_relative "../config/application"
    begin
      run Sinatra::Application.run!
    rescue
    end
  end

  desc "con ENV", "Run application in irb"
  def con(env = :development)
    if %i[test development production].all? { |e| e != env.to_sym }
      raise StandardError "env must be any [test, development, production]"
    end

    ARGV.clear
    ARGV[0] = env.to_sym
    require_relative "../config/application"
    require "irb"
    binding.irb
  end
end
