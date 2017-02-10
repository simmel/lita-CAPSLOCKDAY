require "lita"

module Lita
  module Handlers
    class CAPSLOCKDAY < Handler
      module ::Lita
        class Robot
          alias_method :orig_send_messages, :send_messages unless
          method_defined?(:orig_send_messages)

          def IT_IS_CAPSLOCKDAY?
            now = Time.now
            if (now.month == 6 && now.day == 28) or
              (now.month == 10 && now.day == 22)
              return true
            end
            return false
          end

          def APPLY_CRUISECONTROL_FOR_COOL(*strings)
              strings.map! { |s| s.upcase }
          end

          def send_messages(target, *strings)
            *strings = APPLY_CRUISECONTROL_FOR_COOL(*strings) if IT_IS_CAPSLOCKDAY?
            orig_send_messages(target, *strings)
          end
        end
      end
    end
  end
end
