module Mandrill
    class Error < Exception
    end
    class ValidationError < Error
    end
    class InvalidKeyError < Error
    end
    class UnknownTemplateError < Error
    end
    class InvalidTagNameError < Error
    end
    class InvalidRejectError < Error
    end
    class UnknownSenderError < Error
    end
    class UnknownUrlError < Error
    end
    class InvalidTemplateError < Error
    end
    class UnknownWebhookError < Error
    end
end

