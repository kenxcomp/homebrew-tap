# Homebrew formula for kenseader
# This file should be placed in the homebrew-tap repository at:
#   kenxcomp/homebrew-tap/Formula/kenseader.rb
#
# The SHA256 hashes will be automatically updated by the release workflow.

class Kenseader < Formula
  desc "High-performance terminal RSS reader with AI-powered summarization"
  homepage "https://github.com/kenxcomp/kenseader"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kenxcomp/kenseader/releases/download/v#{version}/kenseader-macos-arm64.tar.gz"
      sha256 "edb1fd6570b8fc2fecaca7f3eeefaf3b94ba6183424b971616baf043b3a1bd70"
    end
    on_intel do
      url "https://github.com/kenxcomp/kenseader/releases/download/v#{version}/kenseader-macos-x86_64.tar.gz"
      sha256 "e4474aeb365d7d4ca7b5c550ebb5097c49a5db28642c8bf53dc66db4bb9508d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kenxcomp/kenseader/releases/download/v#{version}/kenseader-linux-x86_64.tar.gz"
      sha256 "33f4ae0133b4a479ed7de534cbdd30d8e926f56466aa12b3e445d8188c87c41f"
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
