module Lita
  module Handlers
    class Compliment < Handler
      FIRST = %w(
        BEAUTIFUL
        BUBBLY
        CHARMING
        CHEERFUL
        CONSIDERATE
        COURAGEOUS
        DEVOTED
        FABULOUS
        GALLANT
        GLOWING
        HAPPY
        PRECIOUS
        MARVELOUS
        PLEASANT
        RADIANT
        SHINING
        SUPPORTIVE
        VALIANT
        WITTY
      )

      SECOND = %w(
        AGREEABLE
        BREATHTAKING
        CAPABLE
        CLEAN
        ELEGANT
        ENCHANTING
        ENTHUSIASTIC
        GIFTED
        GRACEFUL
        HARDY
        HIGH-CLASS
        INNOCENT
        LIKABLE
        LOYAL
        NOBLE
        PURE
        RESILIENT
        VIGOROUS
      )

      THIRD = %w(
        KITTEN
        PUPPY
        FLUFFBALL
        LEADER
        FRIEND
        LOVER
        PERFORMER
        PLAYER
        WIZARD
        TEACHER
        HIPSTER
        GANGSTER
        STAR
        SERVANT
        DOMINATOR
        GO-GETTER
        MATE
        EMPLOYEE
        CHAMP
      )

      route(
        /^compliment\s+(.+)/i,
        :compliment,
        :command => true,
        :help    => {
          "compliment NAME" => "Will compliment NAME"
        }
      )

      def compliment(response)
        name   = response.matches.first.first
        name   = "<#{name}>" if name.start_with?("@")
        nice_thing = "#{FIRST.sample} #{SECOND.sample} #{THIRD.sample}"

        response.reply("#{name} you are a #{nice_thing}")
      end

      Lita.register_handler(self)
    end
  end
end
