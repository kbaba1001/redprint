# テストの実行方法
#
# bundle exec ruby test/sample_test.rb

require 'test/unit'

class SampleTest < Test::Unit::TestCase
  class << self
    # テスト群の実行前に呼ばれる
    def startup
      p :_startup
    end

    # テスト群の実行後に呼ばれる
    def shutdown
      p :_shutdown
    end
  end

  # 毎回テスト実行前に呼ばれる
  setup do
    p :setup
  end

  # テストがpassedになっている場合に,テスト実行後に呼ばれる.テスト後の状態確認とかに使える
  cleanup do
    p :cleanup
  end

  # 毎回テスト実行後に呼ばれる
  teardown do
    p :treadown
  end

  test "the truth" do
    assert true
  end

  # test "power assert failure case" do
  #   coins = [1, 5, 50]
  #   target_coin = 10
  #   assert {
  #     coins.include?(target_coin)
  #   }

  #   # NOTE 他のアサーションは次を参照
  #   # https://test-unit.github.io/test-unit/ja/Test/Unit/Assertions.html#assert-instance_method
  # end

  def test_hoge
    assert true
  end

  # NOTE データ駆動テスト
  data(
    'test1' => [1, 1],
    'test2' => [2, 2])
  def test_equal(data)
    expected, actual = data
    assert_equal(expected, actual)
  end

  sub_test_case 'sub1' do
    setup do
      puts 'setup sub1'
    end

    cleanup do
      puts 'cleanup sub1'
    end

    teardown do
      puts 'treadown sub1'
    end

    test 'サブテストケースのテスト' do
      assert true
    end

    sub_test_case 'sub2' do
      setup do
        puts 'setup sub2'
      end

      cleanup do
        puts 'cleanup sub2'
      end

      teardown do
        puts 'treadown sub2'
      end

      test 'サブサブテストケースのテスト' do
        assert true
      end
    end
  end
end
