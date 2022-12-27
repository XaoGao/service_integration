# Create container
class MyContainer
  extend Dry::Container::Mixin
end

# TODO: add another services and repository in container

MyContainer.register "http_client", -> {
                                       Http::HttpClientRetryDecorator.new(
                                         Http::HttpClientLoggerDecorator.new(
                                           Http::HttpClient.new
                                         )
                                       )
                                     }

MyContainer.register "http_service", -> { Http::HttpService.new }
MyContainer.register "mail_service", -> { Mail::MailService.new }

AutoInject = Dry::AutoInject(MyContainer)
