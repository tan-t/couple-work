require 'test_helper'

class AccountTermMstTest < ActiveSupport::TestCase
  test "2017年度9月度の次は2017年度10月度であること" do
    next_term = AccountTermMst.next_term
    assert next_term.year == 2017 && next_term.month == 10
  end

  test "2017年10月度の開始日は2017/10/1であり、終了日は2017/10/31であること" do
    next_term = AccountTermMst.next_term
    assert next_term.start_date == Date.new(2017,10,1) && next_term.end_date == Date.new(2017,10,31)
  end

  test "2017年8月度の次は2018年度9月度であること" do
    AccountTermMst.create(start_date: Date.new(2018,8,1),year:2017,month:8).save
    next_term = AccountTermMst.next_term
    assert next_term.year == 2018 && next_term.month == 9
  end

end
