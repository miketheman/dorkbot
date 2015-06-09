module Lita
  # It's a Handler, not anything else!
  module Handlers
    # And it's for our beloved Dorks!
    class Dorks < Handler
      # Inline response callback
      route(/\bfoo\b/) do |response|
        response.reply 'bar'
      end

      # definition-based callback
      route('baz', :quux)
      def quux(response)
        response.reply 'quux'
      end

      # Only respone to a command when spken to directly
      route(/crazy/, command: true) do |response|
        response.reply "You think I'M crazy? YOU'RE CRAZY!"
      end
    end

    Lita.register_handler(Dorks)
  end
end
