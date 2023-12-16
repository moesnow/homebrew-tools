class BingWallpaperMacos < Formula
  version "1.0.1"
  desc "Automatically set bing wallpaper every day on macOS"
  homepage "https://github.com/moesnow/bing-wallpaper-macos"
  url "https://github.com/moesnow/bing-wallpaper-macos/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "4a89d30ed203885d8fde4de7ed3c67036872e3993026a96ad2d76f8429ce255a"

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
