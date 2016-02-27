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

      # Protect those who cannot protect themselves
      route(/snarkbot.*(shut|stfu)/, :protect)

      def protect(response)
        responses = [
          "Hey, lay off. He's not that smart.",
          "Go pick on someone your own size.",
          "You caught him off guard.",
          "He's a diamond in the rough.",
        ]
        sleep 1
        response.reply responses.sample
      end
    end

    Lita.register_handler(Dorks)
  end
end
