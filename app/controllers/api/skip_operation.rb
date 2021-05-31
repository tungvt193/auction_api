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
        ]
      end

      def mobile
        %w[
          v1MobileCompanyList
          v1MobileProductList
          v1MobileAuctionList
          v1MobileProduct
          v1MobileCompany
          v1MobileAuction
          v1MobileNearestAuctionList
          v1MobileAuctionItemList
          v1MobileAuctionItem
          v1MobileAuctionItemNearestList
        ]
      end

      def web
        %w[
          v1WebAuctionList
          v1WebCompanyList
          v1WebProductList
        ]
      end
    end
  end
end
