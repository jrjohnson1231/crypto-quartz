require "./cryptoquartz/*"
require "cryptocompare"

# TODO: Write documentation for `Cryptoquartz`
module Cryptoquartz
  extend self

  def get_rate(curr1, curr2, opts = {} of Char => String)
    Cryptocompare::Price.find(curr1, curr2, opts)[curr1][curr2].as_f
  end

  def run
    btc_price = self.get_rate("BTC", "USD", {'e' => "Coinbase"})
    trx_price = self.get_rate("TRX", "BTC", {'e' => "Binance"}) * btc_price
    xvg_price = self.get_rate("XVG", "BTC", {'e' => "Binance"}) * btc_price
    puts "BTC: #{btc_price}"
    puts "TRX: #{trx_price}"
    puts "XVG: #{xvg_price}"
  end
end
