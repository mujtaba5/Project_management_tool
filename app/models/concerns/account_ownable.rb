# frozen_string_literal: true

module AccountOwnable
  extend ActiveSupport::Concern

  included do
    # Account is NOT optional, but we don't do want
    # to generate a SELECT query to verify the account is
    # there every time. We get this protection for free
    # because of the `Current.account_or_raise!`     
    # and also through FK constraints.
    belongs_to :account, optional: true
    default_scope { where(account: Current.account_or_raise!) }
  end
end
