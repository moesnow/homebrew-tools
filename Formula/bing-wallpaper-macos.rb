class BingWallpaperMacos < Formula
  version "0.0.5"
  desc "Automatically set bing wallpaper every day on macOS"
  homepage "https://github.com/moesnow/bing-wallpaper-macos"
  url "https://github.com/moesnow/bing-wallpaper-macos/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "52fb8195d9017c31520b3529856350e6834e6fe907046a25249d4a4d1e3f09b6"

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
