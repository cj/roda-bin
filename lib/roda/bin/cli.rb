require 'rerun'

class BIN
  module CLI
    extend self

    def server
      args = [
        'thin', 'start', '--threaded', '--max-persistent-conns', '300',
        "--max-conns", "400", "-p", "8080"
      ].concat(argv)

      options = {
        cmd: args.join(' '),
        signal: 'TERM',
        growl: true,
        name: 'BrowserIO',
        ignore: [],
        dir: ["."],
        pattern: "**/*.{rb,js,coffee,css,scss,sass,styl,erb,html,haml,ru,yml,slim,md}"
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
