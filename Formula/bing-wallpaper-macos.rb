class BingWallpaperMacos < Formula
  version "0.0.8"
  desc "Automatically set bing wallpaper every day on macOS"
  homepage "https://github.com/moesnow/bing-wallpaper-macos"
  url "https://github.com/moesnow/bing-wallpaper-macos/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "3df3cb23e046a73877a29426a26c96a7b858c9d26778c257ae6b8413e400d1d0"

  depends_on "nlohmann-json" => :build
  depends_on :macos

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
