require "roda/bin/version"
require 'rerun'

class Roda
  module BIN
    extend self

    def server
      args = [
        'thin', 'start', '--threaded', '--max-persistent-conns', '300',
        "--max-conns", "400", "-p", "8080"
      ].concat(argv)

      options = {
        cmd: args.join(' '),
        signal: 'TERM',
        background: true,
        growl: false,
        name: 'Roda Server',
        ignore: [],
        dir: ["."],
        pattern: "{Gemfile,Gemfile.lock,.gems,.bundle,.env*,config.ru,Rakefile,**/*.{rb,js,coffee,css,scss,sass,styl,erb,html,haml,ru,yml,slim,md,mab,rake}}"
      }

      Rerun::Runner.keep_running(options[:cmd], options)
    end

    def envs
      @envs ||= {}
    end

    private

    def argv
      @argv ||= begin
        ARGV.shift
        ARGV
      end
    end
  end
end
