class AutoToggleVpn < Formula
  version "0.0.1"
  desc "Automatically toggle VPN according to Ethernet and Wi-Fi"
  homepage "https://github.com/moesnow/auto-toggle-vpn"
  url "https://github.com/moesnow/auto-toggle-vpn/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "486d2c359bbc5c7db03b1260d11d33efd7132f013fdd329190231d5333b2a631"

  depends_on "nlohmann-json" => :build

  def install
    inreplace "service.plist", "$HOMEBREW-PLIST-NAME$", "#{plist_name}"
    inreplace "service.plist", "$AUTO-TOGGLE-VPN-PATH$", "#{opt_bin}/auto-toggle-vpn"
    system "make"
    bin.install "./auto-toggle-vpn"
    prefix.install "service.plist"
    prefix.install_symlink "service.plist" => "#{plist_name}.plist"
  end

  service do
    run_type :interval
  end
  
  test do
    assert_match "Program" , shell_output("#{bin}/auto-toggle-vpn --version")
  end
end
