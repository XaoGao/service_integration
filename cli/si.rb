require "thor"

class SICLI < Thor
  desc "start ENV", "Run application"
  def start(env = :development)
    if %i[test development production].all? { |e| e != env.to_sym }
      raise StandardError "env must be any [test, development, production]"
    end

    ARGV.clear
    ARGV[0] = env.to_sym
    require_relative "../config/application"
    begin
      run ApplicationController.run!
    rescue
    end
  end

  map s: :start

  desc "console ENV", "Run application in irb"
  def console(env = :development)
    if %i[test development production].all? { |e| e != env.to_sym }
      raise StandardError "env must be any [test, development, production]"
    end

    ARGV.clear
    ARGV[0] = env.to_sym
    require_relative "../config/application"
    require "irb"
    binding.irb
  end

  map c: :console
end
