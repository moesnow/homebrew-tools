class Hitokoto < Formula
  version "0.0.1"
  desc "Get a hitokoto in the terminal"
  homepage "https://github.com/moesnow/hitokoto"
  url "https://github.com/moesnow/hitokoto/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "2681707ad5b7fe3276e61fb6ab878af72d82ca42b0e3efa793afc9545afa1937"

  depends_on "json-c" => :build

  def install
    system "make"
    bin.install "./hitokoto"
  end

end