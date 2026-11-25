# Homebrew formula for otp-out, rendered by packaging/fill.mjs during the
# release and pushed to github.com/kevinkirsten/homebrew-tap (Formula/).
#
# A formula (not a cask) on purpose: Homebrew does not quarantine formula
# downloads, so the unsigned binary runs without a Gatekeeper prompt.
class OtpOut < Formula
  desc "Turn a Google Authenticator export QR code into otpauth:// URIs"
  homepage "https://github.com/kevinkirsten/otp-out"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kevinkirsten/otp-out/releases/download/v0.1.0/otp-out_0.1.0_darwin_arm64.tar.gz"
      sha256 "f7200dbb622ff8391e8c34469bb30d7d338c1c7ebec1479aac7e09294838244a"
    end
    on_intel do
      url "https://github.com/kevinkirsten/otp-out/releases/download/v0.1.0/otp-out_0.1.0_darwin_amd64.tar.gz"
      sha256 "efd5deb08d436aa44f230a15646f10bc121a30a1d6e4d1e19d45120ac8e9e4da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kevinkirsten/otp-out/releases/download/v0.1.0/otp-out_0.1.0_linux_arm64.tar.gz"
      sha256 "92e368e19dc929a4b5127e73142c205f3d6e366e29d59ed92dbc59dd9c6bdaa4"
    end
    on_intel do
      url "https://github.com/kevinkirsten/otp-out/releases/download/v0.1.0/otp-out_0.1.0_linux_amd64.tar.gz"
      sha256 "91c64297a8bd729d870d35672b4691f62b04aec4a8769397125a4c41431be203"
    end
  end

  def install
    bin.install "otp-out"
  end

  test do
    assert_match "otp-out #{version}", shell_output("#{bin}/otp-out --version")
    assert_match "Exemplo / ana@exemplo.com (TOTP)",
      pipe_output("#{bin}/otp-out --dry-run -",
        "otpauth-migration://offline?data=CiwKCkhlbGxvId6tvu8SD2FuYUBleGVtcGxvLmNvbRoHRXhlbXBsbyABKAEwAhABGAEgACiSIQ%3D%3D")
  end
end
