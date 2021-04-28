module Api
  module V1
    class CrawlersController < BaseController
      before_action :load_resources

      def create
        repo.sync(normalize_params)

        render json: {
          errors: [],
          message: 'Tải lên thành công file',
          data: @resource
        }, status: :ok
      end

      private

      def normalize_params
        params.require(:crawler).permit(:file)
      end

      def repo
        @repo ||= ::CrawlerRepository.new(current_user, @resource)
      end

      def load_resources
        case params[:action].to_sym
        when :create
          @resource = ::Crawler.new
        end
      end
    end
  end
end
