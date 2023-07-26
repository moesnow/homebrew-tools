class AutoToggleVpn < Formula
  version "0.0.3"
  desc "Automatically toggle VPN according to Ethernet and Wi-Fi"
  homepage "https://github.com/moesnow/auto-toggle-vpn"
  url "https://github.com/moesnow/auto-toggle-vpn/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "ed5bbea91e33de70659e8c09e87b0c1d67600cf4e07a0899bde2b79d55bfeb67"

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
