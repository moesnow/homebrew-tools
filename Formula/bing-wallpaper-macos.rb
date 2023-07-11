class BingWallpaperMacos < Formula
  version "0.0.1"
  desc "Automatically set bing wallpaper every day on macOS"
  homepage "https://github.com/moesnow/bing-wallpaper-macos"
  url "https://github.com/moesnow/bing-wallpaper-macos/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "5531ec08d026108d7efbe4011651e409bdbed3f7948175fc7b338ef105f67029"

  depends_on "nlohmann-json" => :build

  def install
    system "make"
    bin.install "./bing-wallpaper-macos"
  end

  service do
    run [opt_bin/"bing-wallpaper-macos"]
    run_type :interval
    interval 300
    require_root false
  end
end