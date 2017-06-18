class AccountTermMst < ApplicationRecord
  TERM_START_MONTH = 9

 def self.next_term
    latest_account_term_mst = order('start_date DESC').take
    next_term_start_date = latest_account_term_mst[:start_date].next_month
    next_term_end_date = Date.new(next_term_start_date.year,next_term_start_date.month,Time.days_in_month(next_term_start_date.month,next_term_start_date.year))
    next_term_month = next_term_start_date.month
    next_term_year = latest_account_term_mst.year
    if next_term_month >= TERM_START_MONTH && latest_account_term_mst.month < TERM_START_MONTH
      next_term_year = next_term_year + 1
    end
    return self.new(year:next_term_year,month:next_term_month,start_date:next_term_start_date,end_date:next_term_end_date)
  end
end
