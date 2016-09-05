module Lita
  module Adapters
    class Telegram < Adapter
      # Telegram-specific features made available to +Lita::Robot+.
      class ChatService
        attr_accessor :client

        def initialize(client)
          @client = client
        end

        def send_keyboard(target, message, keyboard)
          markup = ::Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: keyboard, one_time_keyboard: true)
          client.api.sendMessage(chat_id: target.room.to_i, text: message, reply_markup: markup, parse_mode: 'Markdown', disable_web_page_preview: true)
        end
      end
    end
  end
end
