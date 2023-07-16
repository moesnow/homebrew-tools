class BingWallpaperMacos < Formula
  version "0.0.6"
  desc "Automatically set bing wallpaper every day on macOS"
  homepage "https://github.com/moesnow/bing-wallpaper-macos"
  url "https://github.com/moesnow/bing-wallpaper-macos/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "589b79da105b6752e84b923e4545d000e567752f72087bad8a2ceb8b820773ab"

  depends_on "nlohmann-json" => :build

  def install
    system "make"
    bin.install "./bing-wallpaper-macos"
  end

  service do
    run [opt_bin/"bing-wallpaper-macos", "--auto"]
    run_type :interval
    interval 300
    log_path "/dev/null"
    error_log_path "/dev/null"
  end

  test do
    assert_match "Program" , shell_output("#{bin}/bing-wallpaper-macos --version")
  end
end
