module Mandrill
    class Error < Exception
    end
    class ValidationError < Error
    end
    class InvalidKeyError < Error
    end
    class PaymentRequiredError < Error
    end
    class UnknownTemplateError < Error
    end
    class ServiceUnavailableError < Error
    end
    class UnknownMessageError < Error
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
    class UnknownInboundDomainError < Error
    end
    class UnknownExportError < Error
    end
end

