module Api
  class SkipOperation
    class << self
      def admin
        %w[
          v1AdminSignIn
          v1AdminForgotPassword
          v1AdminResetPassword
        ]
      end

      def common
        %w[]
      end

      def mobile
        %w[
          v1MobileSignIn
          v1MobileForgotPassword
          v1MobileResetPassword
          v1MobileNewsList
          v1MobileCategoryList
          v1MobileCompanyList
          v1MobileProductList
          v1MobileAuctionList
          v1MobileProduct
          v1MobileCategory
          v1MobileCompany
          v1MobileNews
          v1MobileAuction
          v1MobileBannerList
          v1MobileNearestAuctionList
          v1MobileAuctionItemList
          v1MobileAuctionItem
          v1MobileAuctionItemNearestList
        ]
      end

      def web
        %w[
          v1WebSignIn
          v1WebForgotPassword
          v1WebResetPassword
        ]
      end
    end
  end
end