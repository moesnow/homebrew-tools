class Hitokoto < Formula
  version "0.0.2"
  desc "Get a hitokoto in the terminal"
  homepage "https://github.com/moesnow/hitokoto"
  url "https://github.com/moesnow/hitokoto/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "371facd108c57aa3713bd3221483b1302be24d4c53c3aa326b6b40e1d96db0bd"

  depends_on "json-c" => :build

  def install
    system "make"
    bin.install "./hitokoto"
  end

end