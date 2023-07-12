class BingWallpaperMacos < Formula
  version "0.0.2"
  desc "Automatically set bing wallpaper every day on macOS"
  homepage "https://github.com/moesnow/bing-wallpaper-macos"
  url "https://github.com/moesnow/bing-wallpaper-macos/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "c1bb0d07618cecb4dd0257d3d50eade708282082a54fae9f1cf4b0d22fdab26a"

  depends_on "nlohmann-json" => :build

  def install
    system "make"
    bin.install "./bing-wallpaper-macos"
  end

  service do
    run [opt_bin/"bing-wallpaper-macos", "--auto"]
    run_type :interval
    interval 300
    require_root false
  end

  test do
    assert_match "Program" , shell_output("#{bin}/bing-wallpaper-macos --version")
  end
end