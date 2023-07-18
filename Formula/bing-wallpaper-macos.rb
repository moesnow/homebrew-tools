class BingWallpaperMacos < Formula
  version "0.0.7"
  desc "Automatically set bing wallpaper every day on macOS"
  homepage "https://github.com/moesnow/bing-wallpaper-macos"
  url "https://github.com/moesnow/bing-wallpaper-macos/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "c1e7c43e7539b11ceedec36386e45134102cb431b88b538c6bb95fa935f0d8ec"

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
