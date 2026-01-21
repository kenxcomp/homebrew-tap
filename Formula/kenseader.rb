# Homebrew formula for kenseader
# This file should be placed in the homebrew-tap repository at:
#   kenxcomp/homebrew-tap/Formula/kenseader.rb
#
# The SHA256 hashes will be automatically updated by the release workflow.

class Kenseader < Formula
  desc "High-performance terminal RSS reader with AI-powered summarization"
  homepage "https://github.com/kenxcomp/kenseader"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kenxcomp/kenseader/releases/download/v#{version}/kenseader-macos-arm64.tar.gz"
      sha256 "2418d8c032c008897f15983164772d0a4ec8c4c39fdbd3e733a87f9dc1c6c800"
    end
    on_intel do
      url "https://github.com/kenxcomp/kenseader/releases/download/v#{version}/kenseader-macos-x86_64.tar.gz"
      sha256 "ed6e8881c48b9e284989dbeadc1ff8c91405782dfd3ae9fd83bc9b27deb02817"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kenxcomp/kenseader/releases/download/v#{version}/kenseader-linux-x86_64.tar.gz"
      sha256 "5615e6f679ef61e37a1e2c484718c7f375d7b91765d1bcabcae2b00dd7899c2b"
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
