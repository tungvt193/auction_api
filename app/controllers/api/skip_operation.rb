module Api
  class SkipOperation
    class << self
      def admin
        %w[
          v1AdminSignIn
          v1AdminForgotPassword
        ]
      end

      def common
        %w[
          v1CommonSignIn
          v1CommonForgotPassword
          v1CommonVerifyOtp
          v1CommonCategoryList
          v1CommonCategory
          v1CommonNewsList
          v1CommonNews
          v1CommonBannerList
          v1CommonBanner
          v1CommonVideoList
          v1CommonVideo
          v1CommonUserByUsername
          v1CommonAuctionList
          v1CommonAuction
          v1CommonCompany
          v1CommonCompanyList
          v1CommonProduct
          v1CommonProductList
          v1CommonNearestAuctionList
          v1CommonAuctionItemList
          v1CommonAuctionItem
          v1CommonAuctionItemNearestList
        ]
      end

      def mobile
        %w[
          v1MobileBookingList
          v1MobileBooking
          v1MobileRateList
          v1MobileRate
        ]
      end

      def web
        %w[]
      end
    end
  end
end
