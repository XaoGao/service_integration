# Create container
class MyContainer
  extend Dry::Container::Mixin
end

# TODO: add another services and repository in container

MyContainer.register "http_service", -> {
                                       HttpServiceRetryDecorator.new(
                                         HttpServiceLoggerDecorator.new(
                                           HttpService.new
                                         )
                                       )
                                     }

AutoInject = Dry::AutoInject(MyContainer)
