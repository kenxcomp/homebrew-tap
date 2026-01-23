# Homebrew formula for kenseader
# This file should be placed in the homebrew-tap repository at:
#   kenxcomp/homebrew-tap/Formula/kenseader.rb
#
# The SHA256 hashes will be automatically updated by the release workflow.

class Kenseader < Formula
  desc "High-performance terminal RSS reader with AI-powered summarization"
  homepage "https://github.com/kenxcomp/kenseader"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kenxcomp/kenseader/releases/download/v#{version}/kenseader-macos-arm64.tar.gz"
      sha256 "55b057457597f5a748e69590334b69c761ce24b1e0e687db174951d1447602d0"
    end
    on_intel do
      url "https://github.com/kenxcomp/kenseader/releases/download/v#{version}/kenseader-macos-x86_64.tar.gz"
      sha256 "157035b7879940ead247f72e542251871af6f9dbd6f0e21b90d16da494d7c6de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kenxcomp/kenseader/releases/download/v#{version}/kenseader-linux-x86_64.tar.gz"
      sha256 "f885fd5e0d1a6827126f56a9ff9b72e8528086563dbaed7fd220ab78e12ec1f3"
    end
  end

  def install
    bin.install "kenseader"
  end

  service do
    run [opt_bin/"kenseader", "daemon", "start", "--foreground"]
    keep_alive true
    log_path var/"log/kenseader.log"
    error_log_path var/"log/kenseader.log"
  end

  def caveats
    <<~EOS
      To start the daemon manually:
        kenseader daemon start

      To use as a background service (recommended):
        brew services start kenseader

      To run the TUI:
        kenseader run

      Configuration file location:
        ~/.config/kenseader/config.toml
    EOS
  end

  test do
    assert_match "kenseader", shell_output("#{bin}/kenseader --help")
  end
end
